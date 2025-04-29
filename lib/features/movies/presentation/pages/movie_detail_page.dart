import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_state.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    final imageUrl = movie.backdropPath ?? movie.posterPath;
    final fullImageUrl =
        imageUrl != null ? 'https://image.tmdb.org/t/p/w500$imageUrl' : null;
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        final isFavorite = state.favorites.any((m) => m.id == movie.id);

        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: AppColors.white),
            title: Text(
              movie.title ?? 'Movie Detail',
              style: AppStyles.s18w700.copyWith(
                color: AppColors.white,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  onPressed: () {
                    if (isFavorite) {
                      context.read<FavoritesBloc>().add(RemoveFavorite(movie));
                    } else {
                      context.read<FavoritesBloc>().add(AddFavorite(movie));
                    }
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? AppColors.favorite : AppColors.white,
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.deepPurple,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (imageUrl != null)
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        fullImageUrl!,
                        width: 180,
                        height: 250,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 180);
                        },
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Year: ${movie.releaseDate?.split('-').first ?? 'N/A'}",
                        style: AppStyles.s16w400,
                      ),
                      Text(
                        "Rating: ${movie.voteAverage?.toStringAsFixed(1) ?? 'N/A'}",
                        style: AppStyles.s16w400,
                      ),
                      const SizedBox(height: 10),
                      RatingBarIndicator(
                        rating: movie.voteAverage != null
                            ? (movie.voteAverage! / 2)
                            : 0,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: AppColors.yellow,
                        ),
                        itemCount: 5,
                        itemSize: 24.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow,
                            color: AppColors.white),
                        label: const Text(
                          "Play",
                          style: TextStyle(color: AppColors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.download,
                          color: AppColors.primary,
                        ),
                        label: const Text("Download"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          side: const BorderSide(color: AppColors.primary),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_border,
                          color: AppColors.primary,
                        ),
                        label: const Text("Watchlist"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          side: const BorderSide(color: AppColors.primary),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "About Movie",
                  style: AppStyles.s20w700.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  movie.overview ?? "No description available.",
                  textAlign: TextAlign.justify,
                  style: AppStyles.s16w400,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
