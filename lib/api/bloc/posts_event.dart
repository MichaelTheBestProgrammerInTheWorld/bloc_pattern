part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {
  const PostsEvent();
}

class PostsInitialFetchEvent extends PostsEvent {}

class PostAddEvent extends PostsEvent {}
