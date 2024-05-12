import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.menu,
              color: colors.primary,
            ),
            const SizedBox(width: 16.0),
            Text('Cinemapedia', style: titleStyle),
            const Spacer(),
            const Icon(Icons.search),
          ],
        ),
      ),
    );
  }
}
