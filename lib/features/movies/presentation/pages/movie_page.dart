import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';
import 'package:flutter_movie/core/config/env_config.dart';
import 'package:flutter_movie/core/di/injection.dart';
import 'package:flutter_movie/core/network/dio_client.dart';
import 'package:flutter_movie/features/movies/data/api/movie_api.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_state.dart';
import 'package:flutter_movie/features/movies/presentation/pages/movie_detail_page.dart';
import 'package:flutter_movie/features/movies/presentation/pages/movie_favorite_page.dart';
import 'package:flutter_movie/features/movies/presentation/pages/movie_list_page.dart';
import 'package:flutter_movie/features/movies/presentation/pages/movie_search_page.dart';
import 'package:flutter_movie/features/movies/presentation/pages/profile_page.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomePage> {
  final MovieApi apiService = MovieApi(getIt<DioClient>().dio);
  List<Movie> trendingMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> nowPlayingMovies = [];
  bool isLoading = true;
  String selectedGenre = 'All';

  final List<String> genres = [
    'All',
    'Action',
    'Comedy',
    'Drama',
    'Horror',
    'Romance',
    'Sci-Fi',
    'Thriller',
    'Adventure',
    'Fantasy',
    'Animation',
  ];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      final trending = await apiService.getTrendingMovies(EnvConfig.apiKey);
      final popular = await apiService.getPopularMovies(EnvConfig.apiKey);
      final nowPlaying = await apiService.getNowPlayingMovies(EnvConfig.apiKey);

      setState(() {
        trendingMovies = trending.results ?? [];
        popularMovies = popular.results ?? [];
        nowPlayingMovies = nowPlaying.results ?? [];
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error fetching movies: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        title: Text(
          'Movie App',
          style: AppStyles.s20w700.copyWith(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MovieSearchPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  _buildGenreChips(),
                  _buildSectionTitle("Trending Movies", trendingMovies),
                  _buildTrendingMoviesList(trendingMovies),
                  _buildSectionTitle("Popular Movies", popularMovies),
                  _buildMoviesList(popularMovies),
                  _buildSectionTitle("Now Playing Movies", nowPlayingMovies),
                  _buildMoviesList(nowPlayingMovies),
                ],
              ),
            ),
    );
  }

  Widget _buildGenreChips() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final genre = genres[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(genre),
              selected: selectedGenre == genre,
              onSelected: (selected) {
                setState(() {
                  selectedGenre = selected ? genre : 'All';
                });
              },
              selectedColor: AppColors.primary,
              labelStyle: TextStyle(
                color:
                    selectedGenre == genre ? AppColors.white : AppColors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title, List<Movie> movies) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.s20w700.copyWith(
              color: AppColors.primary,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieListPage(
                    title: title,
                    movies: movies,
                  ),
                ),
              );
            },
            child: Text(
              'show all',
              style: AppStyles.s14w400.copyWith(
                color: AppColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingMoviesList(List<Movie> movies) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _buildMovieCard(movie, 180, true);
        },
      ),
    );
  }

  Widget _buildMoviesList(List<Movie> movies) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _buildMovieCard(movie, 140, false);
        },
      ),
    );
  }

  Widget _buildMovieCard(Movie movie, double width, bool isTrending) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MovieDetailPage(movie: movie),
              ),
            );
          },
          child: Container(
            width: width,
            margin: const EdgeInsets.all(4),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
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
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
