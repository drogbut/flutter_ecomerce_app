import 'package:flutter/material.dart';
import 'appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: HomeAppBar(),
    );
  }
}
