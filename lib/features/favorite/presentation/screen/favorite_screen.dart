import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/favorite/presentation/bloc/bloc/favorite_bloc.dart';
import '../../../detail/presentation/screen/detail_screen.dart';
import '../../../home/presentation/widget/movie_card.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite')),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state.status == FavoriteStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.movies.isEmpty) {
            return const Center(child: Text('No favorites yet'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.movies.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, i) {
              final m = state.movies[i];
              return SizedBox(
                height: 140,
                child: MovieCard(
                  movie: m,
                  isFavorite: true,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => DetailScreen(movie: m)),
                  ),
                  onFavoriteTap: () =>
                      context.read<FavoriteBloc>().add(FavoriteToggled(m)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
