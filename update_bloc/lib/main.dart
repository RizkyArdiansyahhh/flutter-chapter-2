import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_bloc/bloc/counter_bloc.dart';
import 'package:update_bloc/number_card.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CounterBloc(),
      child: const MainApp(), // <--- Bungkus MainApp, bukan sebaliknya
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      return NumberCard(
                        number: (state is CounterValue) ? state.value : null,
                        text: "Bloc Builder",
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  NumberCard(number: 0, text: "Watch"),
                  SizedBox(width: 10),
                  NumberCard(number: 0, text: "Select"),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncrementPressed());
                },

                child: Text(
                  "Increment",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
