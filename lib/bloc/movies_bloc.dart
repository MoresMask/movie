import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies2/api/client.dart';
import 'package:movies2/locator.dart';
import 'package:movies2/models/movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final ApiClient api;
  MoviesBloc({required this.api}) : super(InitialLoadingMoviesState()) {
    on<LoadMovieEvent>(
      (event, emit) async {
        emit(LoadingMoviesState());
        try {
          List<Movie> movie = await api.getMovie();
          emit(SuccessMoviesState(movie));
        } catch (e) {
          print(e);
        }
      },
    );
  }
}
