import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail_screen.dart';
import 'widgets/like_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _imageUrl = '';
  String _breedName = '';
  int _likeCount = 0;
  Map<String, dynamic>? _breedInfo;

  Future<void> _fetchCat() async {
    final response = await http.get(Uri.parse('https://api.thecatapi.com/v1/images/search?has_breeds=true'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)[0];
      setState(() {
        _imageUrl = data['url'];
        _breedName = data['breeds'][0]['name'];
        _breedInfo = data['breeds'][0];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCat();
  }

  void _onLike() {
    setState(() {
      _likeCount++;
      _fetchCat();
    });
  }

  void _onDislike() {
    setState(() {
      _fetchCat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  _onLike();
                } else if (details.primaryVelocity! < 0) {
                  _onDislike();
                }
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      imageUrl: _imageUrl,
                      breedName: _breedName,
                      breedInfo: _breedInfo,
                    ),
                  ),
                );
              },
              child: Image.network(_imageUrl),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LikeButton(icon: Icons.thumb_down, onPressed: _onDislike),
              Text('Likes: $_likeCount'),
              LikeButton(icon: Icons.thumb_up, onPressed: _onLike),
            ],
          ),
        ],
      ),
    );
  }
}