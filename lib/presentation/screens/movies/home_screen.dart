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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
            centerTitle: false,
            titlePadding: EdgeInsets.all(0.0),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  MoviesSlideshow(movies: slideShowMovies),
                  MovieHorizontalListview(
                    movie: nowPlayingMovies,
                    title: 'En cines',
                    subtitle: 'Estrenos de la semana',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieHorizontalListview(
                    movie: popularMovies,
                    title: 'Populares',
                    subtitle: 'De la semana',
                    loadNextPage: () =>
                        ref.read(popularMoviesProvider.notifier).loadNextPage(),
                  ),
                  MovieHorizontalListview(
                    movie: topRatedMovies,
                    title: 'Top Rated',
                    subtitle: 'Desde siempre',
                    loadNextPage: () => ref
                        .read(topRatedMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieHorizontalListview(
                    movie: upcomingMovies,
                    title: 'Proximos',
                    subtitle: 'Estrenos del año',
                    loadNextPage: () => ref
                        .read(upcomingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  const SizedBox(height: 10.0),
                ],
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
