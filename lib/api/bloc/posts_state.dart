part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostFetchingSuccessfulState extends PostsState {
  final List<PostDataUiModel> posts;

  PostFetchingSuccessfulState({
    required this.posts,
  });
}

class PostsFetchingLoadingState extends PostsState {}

class PostsFetchingErrorState extends PostsState {}

//states to add a new post in http post request
abstract class PostsActionState extends PostsState {}

class PostsAdditionSuccessState extends PostsActionState {}

class PostsAdditionErrorState extends PostsActionState {}
