import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  int _selectedIndex = 0;

  final List<Widget> pages = [];

  final List<String> featuredMovieImage = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsD-naLZVYTj25Ra8-pSQFLoPEtbEtvjGzQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-8RVVOlllmjxYh_HLxrV4w58DGpmxQt1URg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFF0BW_56nfhWiPwEohlSewF7QdqEiIE90OA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIBqs1ma9yYGUAECqYKpl-Pza1LPJOEAo52w&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsRbSnyqlS1qHLiMBQNBLY0aLEG1SOboAWRg&s',
  ];

  final List<String> trendingMovieImage = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsRbSnyqlS1qHLiMBQNBLY0aLEG1SOboAWRg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFF0BW_56nfhWiPwEohlSewF7QdqEiIE90OA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIBqs1ma9yYGUAECqYKpl-Pza1LPJOEAo52w&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsD-naLZVYTj25Ra8-pSQFLoPEtbEtvjGzQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-8RVVOlllmjxYh_HLxrV4w58DGpmxQt1URg&s',

  ];

  final List<String> newMovieImage = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsRbSnyqlS1qHLiMBQNBLY0aLEG1SOboAWRg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFF0BW_56nfhWiPwEohlSewF7QdqEiIE90OA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIBqs1ma9yYGUAECqYKpl-Pza1LPJOEAo52w&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsD-naLZVYTj25Ra8-pSQFLoPEtbEtvjGzQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-8RVVOlllmjxYh_HLxrV4w58DGpmxQt1URg&s',
  ];



  final List<String> genres = [
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
    pages.addAll([
      _buildHomePage(),
      const Center(child: Text('Downloads')),
      const AccountPage(),
    ]);
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
          )
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Downloads'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Account'),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          SizedBox(
            height: 45,
            child: ListView.builder(
              itemCount: genres.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      genres[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          _buildSectionHeader('Featured Movies'),
          _buildHorizontalMovieList(featuredMovieImage, height: 250, width: 170),

          const SizedBox(height: 20),
          _buildSectionHeader('Trending Movies'),
          _buildHorizontalMovieList(trendingMovieImage, height: 160, width: 110),

          const SizedBox(height: 20),
          _buildSectionHeader('New Movies'),
          _buildHorizontalMovieList(newMovieImage, height: 160, width: 110),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const Text(
          'Show all',
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalMovieList(List<String> images,
      {required double height, required double width}) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}


class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAnZO-HbYIOIzEYS_uNiCS2YtyAn53nJeWbw&s'),
              ),
              SizedBox(height: 20),

              Column(
                children: [
                  Text(
                    'Jeon Jungkook',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),

                  SizedBox(height: 8),

                  // Email
                  Text(
                    'jeonJk@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 30),

          const Divider(),

          _buildInfoTile(Icons.movie, 'My Watchlist'),
          _buildInfoTile(Icons.settings, 'Account Settings'),
          _buildInfoTile(Icons.help_outline, 'Help & Support'),
          _buildInfoTile(Icons.privacy_tip, 'Privacy Policy'),
          _buildInfoTile(Icons.logout, 'Log Out'),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
      },
    );
  }
}