import 'package:flutter/material.dart';
import 'package:flutter_bloc_test_app/counter_app/counter/view/counter_page.dart';

class CounterApp extends MaterialApp {
  const CounterApp({super.key})
      : super(
          home: const CounterPage(),
        );
}
