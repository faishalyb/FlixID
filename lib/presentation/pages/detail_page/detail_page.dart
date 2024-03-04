import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/presentation/misc/constants.dart';
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
          ...background(movie),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackNavigationBar(
                      movie.title,
                      onTap: () => ref.read(routerProvider).pop(),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    // backdrop
                    SizedBox(height: 24),
                    // ...movieShortInfo(),
                    SizedBox(height: 20),
                    // ...movieOverview(),
                    SizedBox(height: 40),
                  ],
                ),
              ),
              // ...castAndCrew(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Book this movie'),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: backgroundColor,
                      backgroundColor: saffron,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
