import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    if (slideShowMovies.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2.0),
      );
    }

    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlideshow(movies: slideShowMovies),
        MovieHorizontalListview(
          movie: nowPlayingMovies,
          title: 'En cines',
          subtitle: 'Estrenos de la semana',
          loadNextPage: () {
            ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
          },
        ),
      ],
    );
  }
}
