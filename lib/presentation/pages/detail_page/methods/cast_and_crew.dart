import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/presentation/providers/movie/actors_provider.dart';
import 'package:flix_id/presentation/widgets/network_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> castAndCrew({
  required Movie movie,
  required WidgetRef ref,
}) =>
    [
      Padding(
        padding: const EdgeInsets.only(left: 24),
        child: const Text(
          'Cast and Crew',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 10),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 24),
            ...(ref.watch(actorsProvider(movieId: movie.id)).whenOrNull(
                    data: (actors) => actors
                        .where((element) => element.profilePath != null)
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                children: [
                                  NetworkImageCard(
                                    width: 100,
                                    height: 152,
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/w185/${e.profilePath}',
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      e.name,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ))) ??
                []),
            SizedBox(width: 14)
          ],
        ),
      ),
    ];
