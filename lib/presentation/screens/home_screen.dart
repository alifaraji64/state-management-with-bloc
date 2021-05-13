import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_test/logic/cubit/counter_cubit.dart';
import 'package:state_management_test/logic/cubit/internet_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);
  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state is InternetConnected &&
              state.connectionType == ConnectionType.Wifi) {
            BlocProvider.of<CounterCubit>(context).increment();
          } else if (state is InternetConnected &&
              state.connectionType == ConnectionType.Mobile) {
            BlocProvider.of<CounterCubit>(context).decrement();
          }
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              backgroundColor: widget.color,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BlocBuilder<InternetCubit, InternetState>(
                      builder: (context, state) {
                    //in theinternetState we have multiple objects and for indicating that which object we are currently working in we have to use state is [.,
                    //)..] method
                    if (state is InternetConnected &&
                        state.connectionType == ConnectionType.Wifi) {
                      return Text('wifi');
                    } else if (state is InternetConnected &&
                        state.connectionType == ConnectionType.Mobile) {
                      return Text('mobile');
                    } else if (state is InternetDisconnected) {
                      return Text('disconnected');
                    }
                    return CircularProgressIndicator();
                  }),
                  SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/second');
                    },
                    color: Colors.redAccent,
                    child: Text('go to the second screen'),
                  ),
                  SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/third');
                    },
                    color: Colors.greenAccent,
                    child: Text('go to the third screen'),
                  )
                ],
              ),
            )));
  }
}
