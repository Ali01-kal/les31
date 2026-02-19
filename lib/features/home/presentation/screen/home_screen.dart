import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/favorite/presentation/bloc/bloc/favorite_bloc.dart';

import '../../domain/entity/movie_entity.dart';
import '../widget/genre_section.dart';
import '../../../detail/presentation/screen/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Map<String, List<MovieEntity>> byGenre = {
    'Action': [
      MovieEntity(
        id: 1,
        title: 'Action One',
        bannerUrl: 'https://picsum.photos/seed/a1/900/500',
        genre: 'Action',
        overview:
            'A retired soldier must stop a cyber attack threatening the entire city.',
        rating: 7.8,
      ),
      MovieEntity(
        id: 2,
        title: 'Action Two',
        bannerUrl: 'https://picsum.photos/seed/a2/900/500',
        genre: 'Action',
        overview:
            'An undercover agent infiltrates a criminal empire and risks everything.',
        rating: 7.2,
      ),
    ],
    'Comedy': [
      MovieEntity(
        id: 11,
        title: 'Comedy One',
        bannerUrl: 'https://picsum.photos/seed/c1/900/500',
        genre: 'Comedy',
        overview:
            'Two friends accidentally become viral stars and try to handle fame.',
        rating: 7.1,
      ),
      MovieEntity(
        id: 12,
        title: 'Comedy Two',
        bannerUrl: 'https://picsum.photos/seed/c2/900/500',
        genre: 'Comedy',
        overview:
            'A family vacation turns into a hilarious disaster.',
        rating: 6.9,
      ),
    ],
    'Drama': [
      MovieEntity(
        id: 21,
        title: 'Drama One',
        bannerUrl: 'https://picsum.photos/seed/d1/900/500',
        genre: 'Drama',
        overview:
            'A young musician returns home to confront his past.',
        rating: 8.2,
      ),
      MovieEntity(
        id: 22,
        title: 'Drama Two',
        bannerUrl: 'https://picsum.photos/seed/d2/900/500',
        genre: 'Drama',
        overview:
            'A teacher helps a troubled student change his life.',
        rating: 7.9,
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final favState = context.watch<FavoriteBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 12),

          for (final entry in byGenre.entries)
            GenreSection(
              genreTitle: entry.key,
              movies: entry.value,

              // ❤️ favorite логика
              isFavorite: (id) => favState.contains(id),
              onFavoriteTap: (movie) {
                context.read<FavoriteBloc>().add(
                      FavoriteToggled(movie),
                    );
              },

              onMovieTap: (movie) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(movie: movie),
                  ),
                );
              },
            ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
