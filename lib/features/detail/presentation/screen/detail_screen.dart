import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../home/domain/entity/movie_entity.dart';

class DetailScreen extends StatelessWidget {
  final MovieEntity movie;

  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              imageUrl: movie.bannerUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
              errorWidget: (_, __, ___) => Container(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 10),

                // жанр + рейтинг
                Row(
                  children: [
                    Chip(label: Text(movie.genre)),
                    const SizedBox(width: 12),
                    const Icon(Icons.star, size: 18),
                    const SizedBox(width: 6),
                    Text(movie.rating.toStringAsFixed(1)),
                  ],
                ),

                const SizedBox(height: 16),

                Text(
                  'Overview',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  movie.overview.isEmpty ? 'No description' : movie.overview,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


