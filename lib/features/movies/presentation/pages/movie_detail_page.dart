import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';
import 'package:flutter_movie/features/movies/data/repository/movie_repository.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_state.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/watchlist_bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/watchlist_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/watchlist_state.dart';
import 'package:flutter_movie/features/movies/presentation/pages/youtube_player_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class MovieDetailPage extends StatefulWidget {
  final Movie movie;
  const MovieDetailPage({super.key, required this.movie});
  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}
class _MovieDetailPageState extends State<MovieDetailPage> {
  late String? _videoKey;
  @override
  void initState() {
    super.initState();
    _videoKey = widget.movie.videoKey;
    context.read<WatchlistBloc>().add(
      WatchlistEvent.checkIfAdded(widget.movie.id),
    );
    if (_videoKey == null) {
      _loadVideoKey();
    }
  }
  Future<void> _loadVideoKey() async {
    try {
      final repository = MovieRepository.internal();
      final key = await repository.fetchMovieVideoKey(widget.movie.id);
      setState(() => _videoKey = key);
    } catch (e) {
      debugPrint('Error loading video: $e');
    }
  }
  void _onPlayPressed(BuildContext context) {
    context.read<WatchlistBloc>().add(WatchlistEvent.add(widget.movie));
    if (_videoKey == null || _videoKey!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No trailer available'),
        ),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubePlayerScreen(videoKey: _videoKey!),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.movie.backdropPath ?? widget.movie.posterPath;
    final fullImageUrl =
    imageUrl != null ? 'https://image.tmdb.org/t/p/w500$imageUrl' : null;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: context.read<FavoriteBloc>()),
        BlocProvider.value(value: context.read<WatchlistBloc>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.white),
          title: Text(
            widget.movie.title ?? 'Movie Detail',
            style: AppStyles.s18w700.copyWith(
              color: AppColors.white,
            ),
          ),
          backgroundColor: AppColors.primary,
          actions: [
            BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                final isFavorite = state.maybeMap(
                  loaded: (loadedState) => loadedState.movies.any((m) => m.id == widget.movie.id),
                  isAdded: (isAddedState) => isAddedState.isAdded,
                  orElse: () => false,
                );
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? AppColors.favorite : AppColors.white,
                  ),
                  onPressed: () {
                    if (isFavorite) {
                      context
                          .read<FavoriteBloc>()
                          .add(RemoveFromFavorites(widget.movie));
                    } else {
                      context
                          .read<FavoriteBloc>()
                          .add(AddToFavorites(widget.movie));
                    }
                  },
                );
              },
            ),
          ],
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
                      "Year: ${widget.movie.releaseDate?.split('-').first ?? 'N/A'}",
                      style: AppStyles.s16w400,
                    ),
                    Text(
                      "Rating: ${widget.movie.voteAverage?.toStringAsFixed(1) ?? 'N/A'}",
                      style: AppStyles.s16w400,
                    ),
                    const SizedBox(height: 10),
                    RatingBarIndicator(
                      rating: widget.movie.voteAverage != null
                          ? (widget.movie.voteAverage! / 2)
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
                      onPressed: () => _onPlayPressed(context),
                      icon: const Icon(
                        Icons.play_arrow,
                        color: AppColors.white,
                      ),
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
                  _buildWatchlistButton(context),
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
                widget.movie.overview ?? "No description available.",
                textAlign: TextAlign.justify,
                style: AppStyles.s16w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildWatchlistButton(BuildContext context) {
    return BlocConsumer<WatchlistBloc, WatchlistState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => _buildWatchlistButtonContent(context, false, false),
          loading: () => _buildWatchlistButtonContent(context, false, true),
          loaded: (movies) {
            final isInWatchlist = movies.any((m) => m.id == widget.movie.id);
            return _buildWatchlistButtonContent(context, isInWatchlist, false);
          },
          error: (message) {
            final lastValidState = context.read<WatchlistBloc>().state;
            if (lastValidState is Loaded) {
              final isInWatchlist = lastValidState.movies.any(
                    (m) => m.id == widget.movie.id,
              );
              return _buildWatchlistButtonContent(
                context,
                isInWatchlist,
                false,
              );
            }
            return _buildWatchlistButtonContent(context, false, false);
          },
          isAdded: (isAdded) =>
              _buildWatchlistButtonContent(context, isAdded, false),
        );
      },
    );
  }
  Widget _buildWatchlistButtonContent(
      BuildContext context,
      bool isInWatchlist,
      bool isLoading,
      ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: isLoading
            ? null
            : () {
          debugPrint(
            'Watchlist button pressed - isInWatchlist: $isInWatchlist',
          );
          _handleWatchlistAction(context, isInWatchlist);
        },
        icon: isLoading
            ? const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.primary,
          ),
        )
            : Icon(
          isInWatchlist ? Icons.bookmark : Icons.bookmark_border,
          color: AppColors.primary,
        ),
        label: isLoading
            ? const Text("Processing...")
            : Text(isInWatchlist ? "In Watchlist" : "Add to Watchlist"),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          side: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
  void _handleWatchlistAction(BuildContext context, bool isInWatchlist) {
    final movie = widget.movie;
    debugPrint('Handling watchlist action for movie: ${movie.title}');
    if (isInWatchlist) {
      context.read<WatchlistBloc>().add(Remove(movie));
    } else {
      context.read<WatchlistBloc>().add(Add(movie));
    }
  }
}