import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: context.watch<CounterProvider>().height,
          color: context.watch<CounterProvider>().color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200,
                width: 200,
                child: Image.network(
                  context.watch<CounterProvider>().meals?.first.strMealThumb ??
                      '',
                ),
              ),
              Text(
                context.watch<CounterProvider>().meals?.first.strMeal ?? '',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Name: '),
                  Text(
                    context.watch<CounterProvider>().meals?.first.strCategory ??
                        '',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${context.watch<CounterProvider>().meals?.first.strIngredient1 ?? ''}:',
                  ),
                  Text(
                    context.watch<CounterProvider>().meals?.first.strMeasure1 ??
                        '',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Area :'),
                  Text(
                      '${context.watch<CounterProvider>().meals?.first.strArea ?? ''}')
                ],
              ),
              Text(
                '${context.watch<CounterProvider>().counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().incrementCounter();

              context.read<CounterProvider>().listMeal();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().decrementCounter();

              context.read<CounterProvider>().listMeal();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
