import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_2/bloc/news_bloc.dart';
import 'package:mini_project_2/routers.dart';
import 'package:mini_project_2/services/news_services.dart';

void main() {
  runApp(const MyApp());
}

// MultiBlocProvider(
//       providers: [
//       BlocProvider(create: (context) => NewsBloc(NewsServices()))
//     ], child: const NewsOrgPage());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NewsBloc(NewsServices()))
        ],
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          routerConfig: Routers.router,
        ));
  }
}
