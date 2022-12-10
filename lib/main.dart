import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies2/api/client.dart';
import 'package:movies2/bloc/movies_bloc.dart';
import 'package:movies2/models/movie.dart';

import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locator.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      builder: (context, child) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => MoviesBloc(api: sl<ApiClient>()),
        )
      ], child: child!),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final movieBloc = MoviesBloc(api: sl<ApiClient>());
    return Scaffold(
        body: BlocProvider(
      create: (context) => movieBloc..add(LoadMovieEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is LoadingMoviesState)
            return Center(child: CircularProgressIndicator());

          if (state is SuccessMoviesState) {
            return ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  Movie movieList = state.movies[index];
                  return ListTile(
                    title:
                        Image(image: NetworkImage(movieList.image.toString())),
                  );
                });
          }
          return Container(
            color: Colors.amber,
            child: Text('ERROR'),
          );
        },
      ),
    ));
  }
}
