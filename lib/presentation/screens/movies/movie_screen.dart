import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_povider.dart';
import 'package:cinemapedia/presentation/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';
  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];

    if (movie == null) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(movie: movie),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _MovieDetails(movie: movie);
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;

  const _MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(movie.posterPath, width: size.width * 0.3),
              ),

              SizedBox(width: 10),

              SizedBox(
                width: (size.width - 40) * 0.6,
                child: Column(children: [Text(movie.overview)]),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.all(8),
          child: Wrap(
            children: [
              ...movie.genreIds.map(
                (gender) => Container(
                  margin: EdgeInsets.only(right: 25),
                  child: Chip(
                    label: Text(gender),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        //Mostrar todos los actores
        _ActorsByMovie(movieId: (movie.id).toString()),
      ],
    );
  }
}

class _ActorsByMovie extends ConsumerWidget {
  final String movieId;

  const _ActorsByMovie({required this.movieId});

  @override
  Widget build(BuildContext context, ref) {
    final actorsByMovie = ref.watch(actorsByMovieProvider);

    if (actorsByMovie[movieId] == null) {
      return CircularProgressIndicator(strokeWidth: 5);
    }

    final actors = actorsByMovie[movieId]!;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 300,
        child: ListView.builder(
          itemCount: actors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final actor = actors[index];

            return Container(
              padding: EdgeInsets.all(8),
              width: 135,
              child: Column(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(40),
                        child: Image.network(
                          actor.profilePath,
                          height: 180,
                          width: 135,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(actor.name, maxLines: 2),
                      Text(
                        actor.character ?? '',
                        maxLines: 2,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomSliverAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      shadowColor: Colors.amber,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) return const SizedBox();
                  return FadeIn(child: child);
                },
              ),
            ),
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 0.9],
                    colors: [Colors.transparent, Colors.black45],
                  ),
                ),
              ),
            ),

            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    stops: [0, 0.6],
                    colors: [Colors.black45, Colors.transparent],
                  ),
                ),
              ),
            ),
          ],
        ),
        titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // title: Text(
        //   movie.title,
        //   style: TextStyle(fontSize: 20, color: Colors.white),
        //   textAlign: TextAlign.start,
        // ),
      ),
    );
  }
}
