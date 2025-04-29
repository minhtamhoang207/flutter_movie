import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_state.dart';
import 'package:flutter_movie/features/movies/presentation/pages/movie_detail_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text(
              'Favorites',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: state.favorites.isEmpty
              ? const Center(
                  child: Text('No favorite movies yet'),
                )
              : ListView.builder(
                  itemCount: state.favorites.length,
                  itemBuilder: (context, index) {
                    final movie = state.favorites[index];
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
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SizedBox(
                          height: 130,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                child: movie.posterPath != null
                                    ? Image.network(
                                        "https://image.tmdb.org/t/p/w185${movie.posterPath}",
                                        width: 100,
                                        height: 130,
                                        fit: BoxFit.cover,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) =>
                                            const Icon(Icons.movie, size: 50),
                                      )
                                    : const Icon(Icons.movie, size: 100),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        movie.title ?? 'No title',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
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
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  context
                                      .read<FavoritesBloc>()
                                      .add(RemoveFavorite(movie));
                                },
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
