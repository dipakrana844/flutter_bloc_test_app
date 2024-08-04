import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_test_app/counter_app/counter/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    "CounterCubit",
    () {
      test('initial state is 0', () {
        expect(CounterCubit().state, 0);
      });
      group(
        "increment",
        () {
          blocTest<CounterCubit, int>(
            'emits [1] when state is 0',
            build: CounterCubit.new,
            act: (cubit) => cubit.increment(),
            expect: () => <int>[1],
          );
          blocTest(
            "emits [1, 2] when state is 0 and invoked twice",
            build: CounterCubit.new,
            act: (cubit) => cubit
              ..increment()
              ..increment(),
            expect: () => <int>[1, 2],
          );
          blocTest(
            "emits [1, 2, 3] when state is 0 and invoked trice",
            build: CounterCubit.new,
            act: (cubit) => cubit
              ..increment()
              ..increment()
              ..increment(),
            expect: () => <int>[1, 2, 3],
          );
          blocTest(
            'emits [42] when state is 41',
            build: CounterCubit.new,
            seed: () => 41,
            act: (cubit) => cubit.increment(),
            expect: () => <int>[42],
          );
        },
      );
    },
  );
}
