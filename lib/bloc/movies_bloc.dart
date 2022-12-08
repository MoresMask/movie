import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies2/api/client.dart';
import 'package:movies2/locator.dart';
import 'package:movies2/models/movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final ApiClient api;
  MoviesBloc({required this.api}) : super(MoviesState()) {
    on<LoadMovieEvent>((event, emit) => _loadMovies);
  }

  void _loadMovies(
      LoadMovieEvent event, Emitter<LoadingMoviesState> emitter) async {
    try {
      final _apiClient = sl<ApiClient>();
      List response = await _apiClient.getMovie();
      List<Movie> listmovie = [];
      for (int i = 0; i < response.length; i++) {
        listmovie.add(Movie.fromJson(response[i]));
        emit(SuccessMoviesState(listmovie));
      }
    } catch (e) {
      emit(ErrorMoviesState('e'));
    }
  }
}
