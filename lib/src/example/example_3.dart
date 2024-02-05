import 'package:flutter/material.dart';

class BuilderCase extends StatelessWidget {
  const BuilderCase({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilderExample(),
            StreamBuilderExample(),
            LayoutBuilderExample(),
          ],
        ),
      );
}

class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({super.key});

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  late final Future<String> _future;

  @override
  void initState() {
    super.initState();
    _future = Future<String>.delayed(
      const Duration(seconds: 2),
      () => 'Data Loaded',
    );
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<String>(
        future: _future,
        builder: (context, snapshot) {
          final data = snapshot.data;

          if (data != null) {
            return Text('Success: $data');
          }

          if (snapshot.hasError) {
            return const Text('Error');
          }

          return const CircularProgressIndicator();
        },
      );
}

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({super.key});

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  late final Stream<int?> _stream;

  @override
  void initState() {
    super.initState();
    _stream = Stream<int?>.periodic(
      const Duration(seconds: 1),
      (int count) {
        if (count == 0) {
          return null;
        }

        if (count % 5 == 0) {
          throw Exception();
        }

        return count;
      },
    );
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<int?>(
        stream: _stream,
        builder: (context, snapshot) {
          final data = snapshot.data;

          if (data != null) {
            return Text('Success: $data');
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      );
}

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          print('constraints: $constraints');

          if (constraints.maxWidth > 600) {
            return const Text('Horizontal');
          }

          return const Text('Vertical');
        },
      );
}
