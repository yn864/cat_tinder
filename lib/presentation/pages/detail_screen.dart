import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/cat.dart';

class DetailScreen extends StatelessWidget {
  final Cat cat;

  const DetailScreen({required this.cat, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cat.breed)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CachedNetworkImage(
            key: ValueKey(cat.imageUrl),
            imageUrl: cat.imageUrl,
            placeholder:
                (context, url) =>
                    const Center(child: CircularProgressIndicator()),
            errorWidget:
                (context, url, error) => Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.error, size: 64),
                ),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
          ),
          const SizedBox(height: 24),
          _buildSection('Description', cat.description),
          _buildSection('Temperament', cat.temperament),
          _buildSection('Origin', cat.origin),
          _buildSection('Lifespan', cat.lifeSpan),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(content),
        const Divider(height: 24),
      ],
    );
  }
}
