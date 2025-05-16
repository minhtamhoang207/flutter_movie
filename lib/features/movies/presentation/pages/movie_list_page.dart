import 'package:flutter/material.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';
import 'package:flutter_movie/features/movies/presentation/pages/movie_detail_page.dart';

class MovieListPage extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  const MovieListPage({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold_background,
      appBar: AppBar(
        backgroundColor: AppColors.scaffold_background,
        iconTheme: const IconThemeData(
          color: AppColors.grey_light,
        ),
        title: Text(
          title,
          style: AppStyles.s20w700.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailPage(movie: movie),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: movie.posterPath != null
                  ? Image.network(
                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.broken_image, size: 50),
                        );
                      },
                    )
                  : const Center(
                      child: Icon(Icons.movie, size: 50),
                    ),
            ),
          );
        },
      ),
    );
  }
}
