import 'package:fe_challenge/presentation/router/app_router.dart';
import 'package:fe_challenge/presentation/screens/home_screen.dart';
import 'package:fe_challenge/presentation/screens/vehicles_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
      // home: const VehiclesListScreen(title: 'Vehicle'),
    );
  }
}
