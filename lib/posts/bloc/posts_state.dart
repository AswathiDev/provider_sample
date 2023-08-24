part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}
abstract class PostsActionState extends PostsState{}


final class PostLoadingState extends PostsState{}
final class PostFetchErrorState extends PostsState{}

final class PostsLoadingSuccessState extends PostsState {
  final List<PostModel> posts;

  PostsLoadingSuccessState({required this.posts});
}

