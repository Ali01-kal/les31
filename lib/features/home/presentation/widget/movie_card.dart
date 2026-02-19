import 'package:flutter/material.dart';
import '../../domain/entity/movie_entity.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const MovieCard({
    super.key,
    required this.movie,
    this.onTap,
    this.onFavoriteTap, required bool isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                movie.bannerUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton.filledTonal(
                onPressed: onFavoriteTap,
                icon: const Icon(Icons.favorite_border),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black54, Colors.black87],
                  ),
                ),
                child: Text(
                  movie.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
