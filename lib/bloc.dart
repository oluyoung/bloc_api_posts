// import 'app_events.dart'
import 'package:flutter_bloc/flutter_bloc.dart';
import './state.dart';
import './repo.dart';
import './events.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc(this._postRepository) : super(PostLoadingState()) {
    on<LoadPostEvent>((event, emit) async {
      emit(PostLoadingState());

      try {
        final posts = await _postRepository.getPosts();
        emit(PostLoadedState(posts));
      } catch (e) {
        emit(PostErrorState(e.toString()));
        throw Exception(e.toString());
      }
    });
  }
}
