import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TwDoubledValueListenableBuilder<A, B> extends StatelessWidget {
  final ValueListenable<A> firstListenable;
  final ValueListenable<B> secondListenable;
  final Widget? child;
  final Function(BuildContext context, A a, B b, Widget? child) builder;

  const TwDoubledValueListenableBuilder({
    required this.firstListenable,
    required this.secondListenable,
    required this.builder,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: firstListenable,
      builder: (_, a, __) {
        return ValueListenableBuilder<B>(
          valueListenable: secondListenable,
          builder: (context, b, __) {
            return builder(context, a, b, child);
          },
        );
      },
    );
  }
}
