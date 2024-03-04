import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/presentation/pages/detail_page/methods/background.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final Movie movie;

  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          ...background(),
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackNavigationBar(
                    movie.title,
                    onTap: () => ref.read(routerProvider).pop(),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
