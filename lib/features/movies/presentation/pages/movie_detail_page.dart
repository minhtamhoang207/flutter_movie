import 'package:flutter/material.dart';

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
                  Text(description),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow, color: Colors.white,),
                  label: const Text(
                    "Play",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download, color: Colors.white,),
                  label: const Text(
                    "Download",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark, color: Colors.white,),
                  label: const Text(
                    "Watchlist",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                ),
              ],
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
