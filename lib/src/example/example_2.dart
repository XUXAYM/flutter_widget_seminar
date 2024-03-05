import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatefulCase extends StatefulWidget {
  final String text;

  const StatefulCase({required this.text, super.key});

  @override
  State<StatefulCase> createState() => _StatefulCaseState();
}

class _StatefulCaseState extends State<StatefulCase> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    print('initState');

    _counter = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant StatefulCase oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget: ${oldWidget.text} -> ${widget.text}');
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(widget.text)),
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Click'),
        ),
        _Counter(count: 5),
        if (_counter < 10)
          _Notification(
            key: UniqueKey(),
          )
      ],
    );
  }
}

class _Counter extends StatefulWidget {
  final int count;

  const _Counter({
    required this.count,
    Key? key,
  }) : super(key: key);

  @override
  State<_Counter> createState() => _CounterState();
}

class _CounterState extends State<_Counter> {
  @override
  void didUpdateWidget(covariant _Counter oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget: ${oldWidget.count} -> ${widget.count}');
  }

  @override
  Widget build(BuildContext context) => Text('Count: ${widget.count}');
}

class _Notification extends StatefulWidget {
  const _Notification({super.key});
  static int count = 0;
  @override
  State<_Notification> createState() => _NotificationState();
}

class _NotificationState extends State<_Notification> {
  @override
  void initState() {
    super.initState();
    print('Instanse ${++_Notification.count}');
  }

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: _onTap,
        child: const Text('Send'),
      );

  Future<void> _onTap() async {
    print('Mounted: $mounted');

    await Future<void>.delayed(const Duration(seconds: 3));

    print('Mounted: $mounted');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Hi!')),
    );
  }
}
