import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_provider_sample/models/post_model.dart';
import 'package:bloc_provider_sample/respos/post_repo.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
       on<PostInitialFetchEvent>(postInitialFetchEvent);

  }

  FutureOr<void> postInitialFetchEvent(PostInitialFetchEvent event, Emitter<PostsState> emit)async {
     emit(PostLoadingState());
    List<PostModel> postList = await PostRepo.fetchPost();
    // try {

    // } catch (e) {
    //   emit(PostFetchErrorState());
    // }
    emit(PostsLoadingSuccessState(posts: postList));
  }
}
