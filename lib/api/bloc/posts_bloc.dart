import 'dart:async';

import 'package:bloc_pattern/api/model/post_data_ui_model.dart';
import 'package:bloc_pattern/api/repository/posts_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadingState());
    List<PostDataUiModel> posts = await PostsRepo.fetchPosts();
    if (posts.isNotEmpty) {
      emit(PostFetchingSuccessfulState(posts: posts));
    } else {
      emit(PostsFetchingErrorState());
    }
  }

  FutureOr<void> postAddEvent(
      PostAddEvent event, Emitter<PostsState> emit) async {
    bool success = await PostsRepo.addPost();

    print(success);
    if (success) {
      emit(PostsAdditionSuccessState());
    } else {
      emit(PostsAdditionErrorState());
    }
  }
}
