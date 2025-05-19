import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';
import 'package:flutter_movie/core/di/injection.dart';
import 'package:flutter_movie/features/movies/data/api/movie_api.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';
import 'package:flutter_movie/features/movies/data/models/user_model.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_state.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_state.dart';
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

  UserProfile _currentUser = UserProfile(
    name: 'Sweety',
    email: 'Sweety123@gmail.com',
    password: '12345678',
    location: 'Seoul, Korea',
    profileImage: null,
  );

  void _updateUser(UserProfile updatedUser) {
    setState(() {
      _currentUser = updatedUser;
    });
  }
    @override
    Widget build(BuildContext context) {
      final pages = [
        const HomePage(),
        const FavoritePage(),
        ProfilePage(
          initialUser: _currentUser,
          onUserUpdate: _updateUser,
        ),
      ];
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.scaffold_background,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MovieBloc(getIt<MovieApi>())..add(const FetchMovies()),
      child: _HomeContent(),
    );
  }
}

class _HomeContent extends StatelessWidget {
   _HomeContent();

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold_background,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primary),
        title: Text(
          'Movie',
          style: AppStyles.s30w700.copyWith(color: AppColors.primary),
        ),
        backgroundColor: AppColors.scaffold_background,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MovieSearchPage()),
            ),
          ),
        ],
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator(color: AppColors.primary,)),
            loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary,)),
            error: (message) => Center(child: Text(message)),
            loaded: (
              trendingMovies,
              popularMovies,
              nowPlayingMovies,
              selectedGenre,
              filteredMovies,
            ) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),

                      _buildGenreChips(context, selectedGenre),
                    if (selectedGenre == 'All') ...[
                      _buildSectionTitle(
                        context,
                        "Trending Movies",
                        trendingMovies,
                      ),
                      _buildTrendingMoviesList(trendingMovies),
                      _buildSectionTitle(
                        context,
                        "Popular Movies",
                        popularMovies,
                      ),
                      _buildMoviesList(popularMovies),
                      _buildSectionTitle(
                        context,
                        "Now Playing Movies",
                        nowPlayingMovies,
                      ),
                      _buildMoviesList(nowPlayingMovies),
                    ] else if (filteredMovies.isNotEmpty) ...[
                      _buildSectionTitle(context, "$selectedGenre Movies", filteredMovies),
                      _buildMoviesList(filteredMovies),
                    ] else ...[
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("No movies found for this genre"),
                      ),
                    ],
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildGenreChips(BuildContext context, String selectedGenre) {
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
                context.read<MovieBloc>().add(
                      ChangeGenre(genre),
                    );
              },
              selectedColor: AppColors.primary,
              checkmarkColor: AppColors.scaffold_background,
              backgroundColor: AppColors.scaffold_background,
              labelStyle: TextStyle(
                color:
                    selectedGenre == genre ? AppColors.scaffold_background : AppColors.grey_light,
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

  Widget _buildSectionTitle(
    BuildContext context,
    String title,
    List<Movie> movies,
  ) {
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
            child:
            Stack(
              children: [
                Text(
                  'show all',
                  style: AppStyles.s14w400.copyWith(
                    color: AppColors.primary, // Your text color
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 1.5,
                    color: AppColors.primary, // Red underline
                  ),
                ),
              ],
            ),

            // Text(
            //   'show all',
            //   style: AppStyles.s14w400.copyWith(
            //     color: AppColors.primary,
            //     decoration: TextDecoration.underline,
            //   ),
            // ),
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
    return BlocBuilder<FavoriteBloc, FavoriteState>(
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