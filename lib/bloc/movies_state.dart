part of 'movies_bloc.dart';

abstract class MoviesState {}

class InitialLoadingMoviesState extends MoviesState {}

class LoadingMoviesState extends MoviesState {}

class SuccessMoviesState extends MoviesState {
  final List<Movie> movies;

  SuccessMoviesState(this.movies);
}

class ErrorMoviesState extends MoviesState {
  final String errorMessage;

  ErrorMoviesState(this.errorMessage);
}
