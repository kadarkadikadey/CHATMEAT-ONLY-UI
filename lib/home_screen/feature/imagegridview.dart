import 'package:flutter/material.dart';

class Imagegridview extends StatefulWidget {
  const Imagegridview({super.key});

  @override
  State<Imagegridview> createState() => _ImagegridviewState();
}

class _ImagegridviewState extends State<Imagegridview> {
  // Generating 30 unique image URLs for demonstration
  final List<String> _images = List.generate(
    30,
    (index) => 'https://picsum.photos/id/${index + 10}/500/500',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GridView.builder(
        // Instagram uses 3 columns
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2, // Small gap between images
          mainAxisSpacing: 2,
        ),
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Image.network(
              _images[index],
              fit: BoxFit.cover, // Ensures the image fills the square
              // Loading state to keep the UI smooth
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
              // Error handling for broken links
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}