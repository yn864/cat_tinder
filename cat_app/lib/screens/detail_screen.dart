import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String imageUrl;
  final String breedName;
  final Map<String, dynamic>? breedInfo;

  DetailScreen({required this.imageUrl, required this.breedName, this.breedInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breedName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Breed: $breedName', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  if (breedInfo != null) ...[
                    Text('Description: ${breedInfo!['description']}'),
                    SizedBox(height: 10),
                    Text('Temperament: ${breedInfo!['temperament']}'),
                    SizedBox(height: 10),
                    Text('Origin: ${breedInfo!['origin']}'),
                    SizedBox(height: 10),
                    Text('Life Span: ${breedInfo!['life_span']}'),
                    SizedBox(height: 10),
                    Text('Weight: ${breedInfo!['weight']['metric']} kg'),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}