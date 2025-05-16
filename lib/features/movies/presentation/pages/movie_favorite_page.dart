import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_state.dart';
import 'package:flutter_movie/features/movies/presentation/pages/movie_detail_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override

  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.scaffold_background,
          appBar: AppBar(
            backgroundColor: AppColors.scaffold_background,
            title: Text(
              'Favorites',
              style: AppStyles.s20w700.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          body: state.favorites.isEmpty
              ? Center(
                  child: Text(
                    'No favorite movies yet',
                    style: AppStyles.s16w400.copyWith(
                      color: AppColors.grey_light,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: state.favorites.length,
                  itemBuilder: (context, index) {
                    final movie = state.favorites[index];
                    final imageUrl = movie.posterPath != null
                        ? 'https://image.tmdb.org/t/p/w200${movie.posterPath}'
                        : null;

                    return Card(
                      color: AppColors.surface_cards,
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailPage(movie: movie),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                height: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.grey_light,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: imageUrl != null
                                      ? Image.network(
                                          imageUrl,
                                          width: 120,
                                          height: 180,
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, __, ___) => const Center(
                                            child: Icon(
                                              Icons.broken_image,
                                              size: 50,
                                              color: AppColors.grey_light,
                                            ),
                                          ),
                                        )
                                      : const Center(
                                          child: Icon(
                                            Icons.movie,
                                            size: 50,
                                            color: AppColors.grey_light,
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title ?? 'Untitled Movie',
                                      style: AppStyles.s18w700.copyWith(
                                        color: AppColors.primary,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_today,
                                          size: 16,
                                          color: AppColors.grey_light,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          movie.releaseDate?.substring(0, 4) ??
                                              'Year unknown',
                                          style: AppStyles.s14w400.copyWith(
                                            color: AppColors.grey_light,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: AppColors.yellow,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          movie.voteAverage
                                                  ?.toStringAsFixed(1) ??
                                              'N/A',
                                          style: AppStyles.s14w400.copyWith(
                                            color: AppColors.grey_light,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.favorite,
                                            color: AppColors.favorite,
                                          ),
                                          onPressed: () => context
                                              .read<FavoriteBloc>()
                                              .add(RemoveFromFavorites(movie)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      movie.overview ??
                                          'No description available',
                                      style: AppStyles.s14w400
                                          .copyWith(color: AppColors.grey_light,),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
