import 'package:flutter/material.dart';
import 'package:flutter_movie/features/movies/presentation/pages/movie_page.dart';

class MovieDetailPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String director;
  final String genre;
  final String year;
  final String description;

  const MovieDetailPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.director,
    required this.genre,
    required this.year,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.home),
            ),
          ),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Center(
                child: Image.network(
                    imageUrl, width: 180,
                    height: 250,
                    fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Director: $director", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text("Genre: $genre", style: const TextStyle(fontSize: 16)),
                  Text("Year: $year", style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  // Text(description),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},

                      label: const Text(
                        "Play",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                      style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},

                      label: const Text(
                        "Download",
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},


                      label: const Text(
                        "Watchlist",
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.deepPurple),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text("About Movie", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
