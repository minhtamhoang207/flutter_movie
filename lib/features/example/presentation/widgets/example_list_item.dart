import 'package:flutter/material.dart';
import 'package:flutter_movie/features/example/data/models/example_model.dart';

class ExampleListItem extends StatelessWidget {
  final ExampleModel example;

  const ExampleListItem({super.key, required this.example});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(example.title),
        subtitle: Text(example.description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Handle item tap
        },
      ),
    );
  }
}
