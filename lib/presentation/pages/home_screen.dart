import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/network_service.dart';
import '../../di/injector.dart';
import '../../domain/entities/cat.dart';
import '../cubits/home_cubit.dart';
import '../cubits/liked_cats_cubit.dart';
import 'loading_screen.dart';
import 'detail_screen.dart';
import 'liked_cats_screen.dart';
import '../widgets/reaction_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final NetworkService _networkService = getIt<NetworkService>();
  late AnimationController _animationController;
  double _dragPosition = 0.0;
  late StreamSubscription<bool> _networkSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final isOnline = await _networkService.isOnline();
      _showNetworkStatusSnackBar(isOnline);
    });

    _networkSubscription = _networkService.networkStatus.listen((isOnline) {
      _showNetworkStatusSnackBar(isOnline);
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    context.read<HomeCubit>().loadCat();
  }

  void _showNetworkStatusSnackBar(bool isOnline) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    if (isOnline) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Online mode'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.wifi_off, color: Colors.white),
              const SizedBox(width: 8),
              const Text('Offline mode'),
              const Spacer(),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: const Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          backgroundColor: Colors.red,
          duration: const Duration(days: 1),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _networkSubscription.cancel();
    _animationController.dispose();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    super.dispose();
  }

  void _handleLike() {
    final state = context.read<HomeCubit>().state;
    if (state is HomeLoaded) {
      final likedCat = state.currentCat!.copyWithLike();
      context.read<LikedCatsCubit>().addLikedCat(likedCat);
      _animateAndLoad(const Offset(1.0, 0.0));
    }
  }

  void _handleDislike() {
    _animateAndLoad(const Offset(-1.0, 0.0));
    context.read<HomeCubit>().dislikeCat();
  }

  void _animateAndLoad(Offset endOffset) {
    _animationController.forward().then((_) {
      context.read<HomeCubit>().loadCat();
      _animationController.reset();
      setState(() {
        _dragPosition = 0.0;
      });
    });
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragPosition += details.delta.dx;
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    const threshold = 100;
    if (_dragPosition.abs() > threshold) {
      _dragPosition > 0 ? _handleLike() : _handleDislike();
    } else {
      setState(() {
        _dragPosition = 0.0;
      });
    }
  }

  void _navigateToDetail(Cat cat) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(cat: cat)),
    );
  }

  void _navigateToLikedCats() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LikedCatsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final likedCount = context.watch<LikedCatsCubit>().totalLikedCats;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Tinder'),
        leading: StreamBuilder<bool>(
          stream: _networkService.networkStatus,
          builder: (context, snapshot) {
            final isOnline = snapshot.data ?? false;
            return Icon(
              isOnline ? Icons.wifi : Icons.wifi_off,
              color: isOnline ? Colors.green : Colors.red,
            );
          },
        ),
        actions: [
          TextButton.icon(
            onPressed: _navigateToLikedCats,
            icon: const Icon(Icons.favorite, color: Colors.red),
            label: Text(
              'Favorites ($likedCount)',
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const LoadingScreen();
          } else if (state is HomeError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: const Text(
                        'Network Error',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.read<HomeCubit>().loadCat();
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
              );
            });
            return _buildErrorState(state.message);
          } else if (state is HomeLoaded) {
            final cat = state.currentCat;
            return GestureDetector(
              onHorizontalDragUpdate: _onHorizontalDragUpdate,
              onHorizontalDragEnd: _onHorizontalDragEnd,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _navigateToDetail(cat),
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(_dragPosition, 0),
                            child: child,
                          );
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CachedNetworkImage(
                                key: ValueKey(cat!.imageUrl),
                                imageUrl: cat.imageUrl,
                                fit: BoxFit.cover,
                                height: 400,
                                placeholder:
                                    (context, url) => Container(
                                      height: 400,
                                      color: Colors.grey[200],
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                errorWidget:
                                    (context, url, error) => Container(
                                      height: 400,
                                      color: Colors.grey[200],
                                      child: const Icon(
                                        Icons.error,
                                        size: 48,
                                        color: Colors.red,
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      cat.breed,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReactionButton(
              icon: Icons.close,
              color: Colors.red,
              onPressed: _handleDislike,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder:
                  (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
              child: Text(
                'Likes: $likedCount',
                key: ValueKey('likes_$likedCount'),
                // likedCount.toString(),
                // key: ValueKey(likedCount),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            ReactionButton(
              icon: Icons.favorite,
              color: Colors.green,
              onPressed: _handleLike,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.1 * 255).round()),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Error: $message',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.read<HomeCubit>().loadCat(),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Try Again', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
