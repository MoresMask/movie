import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies2/api/client.dart';
import 'package:movies2/bloc/movies_bloc.dart';

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
        BlocProvider(create: (context) => MoviesBloc(api: sl<ApiClient>())),
      ], child: child!),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MoviesBloc>(context);

    return BlocProvider(
      create: (context) => MoviesBloc(api: sl<ApiClient>()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is LoadingMoviesState)
            Center(
              child: CircularProgressIndicator(),
            );
          if (state is SuccessMoviesState) {
            ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [Text(state.movies[index].image.toString())],
                );
              },
            );
          }
          return Container(color: Colors.red);
        },
      ),
    );
  }
}
