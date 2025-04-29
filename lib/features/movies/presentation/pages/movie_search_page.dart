import 'package:flutter/material.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';
import 'package:flutter_movie/core/config/env_config.dart';
import 'package:flutter_movie/core/di/injection.dart';
import 'package:flutter_movie/core/network/dio_client.dart';
import 'package:flutter_movie/features/movies/data/api/movie_api.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';
import 'package:flutter_movie/features/movies/presentation/pages/movie_detail_page.dart';

class MovieSearchPage extends StatefulWidget {
  const MovieSearchPage({super.key});

  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  final TextEditingController _controller = TextEditingController();
  final MovieApi apiService = MovieApi(getIt<DioClient>().dio);

  List<Movie> searchResults = [];
  bool isLoading = false;
  String _currentQuery = '';

  void _searchMovies(String query) async {
    if (query.isEmpty || query == _currentQuery) return;

    setState(() {
      isLoading = true;
      _currentQuery = query;
    });

    try {
      final response =
          await apiService.getSearchMovies(EnvConfig.apiKey, query);
      setState(() {
        searchResults = response.results ?? [];
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Search error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        title: Text(
          'Search Movies',
          style: AppStyles.s18w700.copyWith(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search for a movie...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: AppColors.primary),
                  onPressed: () {
                    _searchMovies(_controller.text.trim());
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
                filled: false,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                _searchMovies(value.trim());
              },
            ),
          ),
          Expanded(
            child: _buildSearchResult(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResult() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_currentQuery.isEmpty) {
      return const Center(
        child: Text(
          'Enter a movie title to search',
          style: AppStyles.s16w400,
        ),
      );
    }

    if (searchResults.isEmpty) {
      return Center(
        child: Text(
          'No results for "$_currentQuery"',
          style: AppStyles.s16w400,
        ),
      );
    }

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        if (index >= searchResults.length) {
          return const SizedBox.shrink();
        }
        final movie = searchResults[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MovieDetailPage(movie: movie),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                ClipRRect(
                  child: movie.posterPath != null
                      ? Image.network(
                          "https://image.tmdb.org/t/p/w92${movie.posterPath}",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.movie),
                        )
                      : const Icon(Icons.movie, size: 50),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          movie.title ?? 'No title',
                          style: AppStyles.s18w700,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          (movie.releaseDate != null &&
                                  movie.releaseDate!.length >= 4)
                              ? movie.releaseDate!.substring(0, 4)
                              : 'Unknown Year',
                          style: AppStyles.s14w400.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
