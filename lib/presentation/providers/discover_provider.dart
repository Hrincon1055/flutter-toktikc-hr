import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepository videosRepository;
  bool initilLoading = true;
  List<VideoPost> videos = [];
  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    print("1");
    final newVideos = await videosRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initilLoading = false;
    notifyListeners();
  }
}
