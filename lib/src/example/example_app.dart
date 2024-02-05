import 'package:flutter/material.dart';
import 'package:flutter_widget_seminar/src/example/example_4.dart';

import 'example_1.dart';
import 'example_2.dart';
import 'example_3.dart';

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: const _Home(),
    );
  }
}

enum ExampleCase {
  stless,
  stful,
  inherited,
  builder,
}

class _Home extends StatelessWidget {
  const _Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Example'),
        ),
        body: switch (ExampleCase.stless) {
          ExampleCase.stless => const StatelessCase(),
          ExampleCase.stful => const StatefulCase(text: 'StatefulWidget'),
          ExampleCase.inherited => const InheritedCase(),
          ExampleCase.builder => const BuilderCase(),
        },
      );
}
