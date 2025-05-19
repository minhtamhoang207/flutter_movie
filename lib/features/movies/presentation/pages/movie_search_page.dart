import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/search_bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/search_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/search_state.dart';
import 'package:flutter_movie/features/movies/presentation/pages/movie_detail_page.dart';

class MovieSearchPage extends StatelessWidget {
  const MovieSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Scaffold(
        backgroundColor: AppColors.scaffold_background,
        appBar: AppBar(
          backgroundColor: AppColors.scaffold_background,
          iconTheme: const IconThemeData(color: AppColors.grey_light),
          title: Text(
            'Search Movies',
            style: AppStyles.s18w700.copyWith(color: AppColors.primary),
          ),
        ),
        body: Column(
          children: [
            _SearchField(),
            const Expanded(child: _SearchResults()),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _controller,
        cursorColor: AppColors.primary,
        style: AppStyles.s16w400.copyWith(color: AppColors.grey_light),
        decoration: InputDecoration(
          hintText: 'Search for a movie...',
          hintStyle: AppStyles.s16w400.copyWith(color: AppColors.grey_light),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search, color: AppColors.primary),
            onPressed: () {
              context.read<SearchBloc>().add(
                    SearchEvent.searchMovies(_controller.text.trim()),
                  );
            },
          ),
          focusedBorder: OutlineInputBorder(
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
          context.read<SearchBloc>().add(
                SearchEvent.searchMovies(value.trim()),
              );
        },
        onChanged: (value) {
          if (value.isEmpty) {
            context.read<SearchBloc>().add(const SearchEvent.clearSearch());
          }
        },
      ),
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.when(
          initial: () => Center(
            child: Text(
              'Enter a movie title to search',
              style: AppStyles.s16w400.copyWith(color: AppColors.grey_light),
            ),
          ),
          loading: () => const Center(
              child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
          ),
          loaded: (movies) => _MovieList(movies: movies),
          error: (message) => Center(child: Text(message)),
          empty: () => Center(
            child: Text(
              'No results found',
              style: AppStyles.s16w400.copyWith(color: AppColors.grey_light),
            ),
          ),
        );
      },
    );
  }
}

class _MovieList extends StatelessWidget {
  final List<Movie> movies;

  const _MovieList({required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
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
            color: AppColors.surface_cards,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
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
                              const Icon(
                            Icons.movie,
                            color: AppColors.grey,
                          ),
                        )
                      : const Icon(
                          Icons.movie,
                          size: 50,
                          color: AppColors.grey,
                        ),
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
                          style: AppStyles.s18w700.copyWith(
                            color: AppColors.primary,
                          ),
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
                            color: AppColors.grey_light,
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
