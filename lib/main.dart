import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_test/logic/cubit/internet_cubit.dart';
import 'package:state_management_test/presentation/screens/second_screen.dart';
import 'package:state_management_test/presentation/screens/third_screen.dart';

import './logic/cubit/counter_cubit.dart';
import './presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(
            connectivity: connectivity,
          ),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => HomeScreen(
                title: 'HomeScreen',
                color: Colors.blueAccent,
              ),
          '/second': (context) => SecondScreen(
                title: "SecondScreen",
                color: Colors.redAccent,
              ),
          '/third': (context) => ThirdScreen(
                title: 'ThirdScreen',
                color: Colors.greenAccent,
              )
        },
      ),
    );
  }

//dispose method use to release the memory allocated to variables when state object is removed

}
