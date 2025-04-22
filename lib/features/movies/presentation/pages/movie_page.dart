
import 'package:flutter/material.dart';
import 'package:flutter_movie/core/di/injection.dart';
import 'package:flutter_movie/core/network/api_service.dart';
import 'package:flutter_movie/core/network/dio_client.dart';
import 'package:flutter_movie/features/movies/data/models/movie.dart';
import 'package:flutter_movie/features/movies/presentation/pages/movie_detail_page.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {

  final ApiService apiService = ApiService(getIt<DioClient>().dio);
  List<Movie> trendingMovies = [];


  // int _selectedIndex = 0;
  //
  // final List<Widget> pages = [];
  //
  // final List<String> movieImage = [
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsD-naLZVYTj25Ra8-pSQFLoPEtbEtvjGzQ&s',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-8RVVOlllmjxYh_HLxrV4w58DGpmxQt1URg&s',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFF0BW_56nfhWiPwEohlSewF7QdqEiIE90OA&s',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIBqs1ma9yYGUAECqYKpl-Pza1LPJOEAo52w&s',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsRbSnyqlS1qHLiMBQNBLY0aLEG1SOboAWRg&s',
  // ];

  // final List<String> trendingMovieImage = [
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsRbSnyqlS1qHLiMBQNBLY0aLEG1SOboAWRg&s',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFF0BW_56nfhWiPwEohlSewF7QdqEiIE90OA&s',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIBqs1ma9yYGUAECqYKpl-Pza1LPJOEAo52w&s',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsD-naLZVYTj25Ra8-pSQFLoPEtbEtvjGzQ&s',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-8RVVOlllmjxYh_HLxrV4w58DGpmxQt1URg&s',
  //
  // ];
  //
  // final List<String> newMovieImage = [
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsRbSnyqlS1qHLiMBQNBLY0aLEG1SOboAWRg&s',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFF0BW_56nfhWiPwEohlSewF7QdqEiIE90OA&s',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIBqs1ma9yYGUAECqYKpl-Pza1LPJOEAo52w&s',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsD-naLZVYTj25Ra8-pSQFLoPEtbEtvjGzQ&s',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-8RVVOlllmjxYh_HLxrV4w58DGpmxQt1URg&s',
  // ];

  //
  //
  // final List<String> genres = [
  //   'Action',
  //   'Comedy',
  //   'Drama',
  //   'Horror',
  //   'Romance',
  //   'Sci-Fi',
  //   'Thriller',
  //   'Adventure',
  //   'Fantasy',
  //   'Animation',
  // ];
  //
  //
  // final List<Map<String, String>> movieData = [
  //   {
  //     "title": "Moon Lovers: Scarlet Heart Ryeo",
  //     "director": "Christopher Nolan",
  //     "genre": "Drama",
  //     "year": "2016",
  //     "description": "A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.",
  //   },
  //   {
  //     "title": "My Demon",
  //     "director": "Bong Joon-ho",
  //     "genre": "Romance",
  //     "year": "2023",
  //     "description": "Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.",
  //   },
  //   {
  //     "title": "Interstellar",
  //     "director": "Christopher Nolan",
  //     "genre": "Sci-Fi",
  //     "year": "2014",
  //     "description": "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
  //   },
  //   {
  //     "title": "All of us are Dead",
  //     "director": "Todd Phillips",
  //     "genre": "Horror",
  //     "year": "2020",
  //     "description": "In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society, causing his descent into madness.",
  //   },
  //   {
  //     "title": "Strong Girl Do Bong Soon",
  //     "director": "Anthony and Joe Russo",
  //     "genre": "Action",
  //     "year": "2019",
  //     "description": "After the devastating events of Infinity War, the Avengers assemble once more to reverse Thanos' actions and restore balance to the universe.",
  //   },
  // ];


  @override
  void initState() {
    super.initState();
    fetchTrendingMovies();
    // pages.addAll([
    //   _buildHomePage(),
    //   const Center(child: Text('Downloads')),
    //   const AccountPage(),
    // ]);
  }

  Future<void> fetchTrendingMovies() async {
    try {
      final response = await apiService.getTrendingMovies("de981511d8d2f3632ce9bef447cec089");
      setState(() {
        trendingMovies = response.results;
      });
    } catch (e) {
      debugPrint('Error fetching trending movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: trendingMovies.isEmpty ? const Center(child: CircularProgressIndicator()) : _buildTrendingMoviesList(),
      // pages[_selectedIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.deepPurple,
      //   unselectedItemColor: Colors.grey,
      //   onTap: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     }
        );
        }
  //       items: const [
  //         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  //         BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Downloads'),
  //         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Account'),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildTrendingMoviesList() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trendingMovies.length,
        itemBuilder: (context, index) {
          final movie = trendingMovies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailPage(
                    imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                    title: movie.title,
                    director: "Unknown",
                    genre: "Genre",
                    year: movie.releaseDate?.split('-').first ?? "N/A",
                    description: movie.overview,
                  ),
                ),
              );
            },
            child: Container(
              width: 130,
              margin: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}




// Widget _buildHomePage() {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: ListView(
//         children: [
//           SizedBox(
//             height: 45,
//             child: ListView.builder(
//               itemCount: genres.length,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 6.0),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     decoration: BoxDecoration(
//                       color: Colors.deepPurple,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(
//                       genres[index],
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 20),
//           _buildSectionHeader('Featured Movies'),
//           _buildHorizontalMovieList(movieImage, height: 250, width: 170),
//
//           const SizedBox(height: 20),
//           _buildSectionHeader('Trending Movies'),
//           _buildHorizontalMovieList(movieImage, height: 160, width: 110),
//
//           const SizedBox(height: 20),
//           _buildSectionHeader('New Movies'),
//           _buildHorizontalMovieList(movieImage, height: 160, width: 110),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSectionHeader(String title) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             color: Colors.deepPurple,
//             fontWeight: FontWeight.w600,
//             fontSize: 20,
//           ),
//         ),
//         const Text(
//           'Show all',
//           style: TextStyle(
//             color: Colors.deepPurple,
//             fontSize: 16,
//             decoration: TextDecoration.underline,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildHorizontalMovieList(List<String> images,
//       {required double height, required double width}) {
//     return SizedBox(
//       height: height,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: images.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               final movie = movieData[index];
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) =>
//                       MovieDetailPage(
//                         imageUrl: movieImage[index],
//                         title: movie['title']!,
//                         director: movie['director']!,
//                         genre: movie['genre']!,
//                         year: movie['year']!,
//                         description: movie['description']!,
//                       ),
//                 ),
//               );
//             },
//             child: Container(
//               width: width,
//               margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//               child: Card(
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 clipBehavior: Clip.antiAlias,
//                 child: Image.network(
//                   movieImage[index],
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
