import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Loading...',
      'Please wait...',
      'Fetching data...',
      'Almost there...',
      'Just a moment...',
    ];

    return Stream.periodic(
      const Duration(seconds: 1),
      (index) => messages[index],
    ).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(strokeWidth: 2.0),
          const SizedBox(height: 10.0),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('loading...');

              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}
