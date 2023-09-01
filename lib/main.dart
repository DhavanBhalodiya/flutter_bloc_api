import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/bloc/home/home_bloc.dart';
import 'package:flutter_bloc_api/bloc/homeDetails/home_details_bloc.dart';
import 'package:flutter_bloc_api/di/servicelocator.dart';
import 'package:flutter_bloc_api/ui/screens/home.dart';

void main() {
  getItsetUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(
          create: (context) => HomeDetailBloc(),
        )
      ],
      child: MaterialApp(
        navigatorKey: getNavigation.globalKey,
        title: 'Flutter Bloc Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
      ),
    );
  }
}
