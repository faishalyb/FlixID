import 'package:flix_id/presentation/pages/movie_page/methods/movie_list.dart';
import 'package:flix_id/presentation/pages/movie_page/methods/search_bar.dart';
import 'package:flix_id/presentation/providers/movie/now_playing_provider.dart';
import 'package:flutter/material.dart';
import 'methods/user_info.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviePage extends ConsumerWidget {
  final List<String> promotionImageFileNames = const [
    'popcorn.jpg',
    'buy1get1.jpg'
  ];

  const MoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Column(
          children: [
            userInfo(ref),
            searchBar(context),
            ...movieList(
                title: 'Now Playing',
                movies: ref.watch(nowPlayingProvider),
                onTap: (movie) {
                  // Move to movie detail page
                }),
            ...promotionList(promotionImageFileNames),
          ],
        )
      ],
    );
  }
}
