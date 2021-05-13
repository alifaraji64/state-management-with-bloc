import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_test/logic/cubit/counter_cubit.dart';
import 'package:state_management_test/presentation/screens/home_screen.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key, this.title, this.color}) : super(key: key);
  final String title;
  final Color color;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: widget.color,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.isIncremented) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('inceremnted clicked'),
                      duration: Duration(milliseconds: 350),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('decremnted clicked'),
                      duration: Duration(milliseconds: 350),
                    ));
                  }
                },
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      'negative ' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue == 5) {
                    return Text(
                      'five five',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else {
                    return Text(
                      'zero or positive ' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: Icon(Icons.minimize_outlined),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 30),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<CounterCubit>(context),
                      child: HomeScreen(
                        title: 'home screen',
                        color: Colors.redAccent,
                      ),
                    ),
                  ));
                },
                color: widget.color,
                child: Text('go to the home screen'),
              )
            ],
          ),
        ));
  }
}
