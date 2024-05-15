import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  final int movieId;
  const MovieScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Screen'),
      ),
      body: Center(
        child: Text('Movie ID: $movieId'),
      ),
    );
  }
}
