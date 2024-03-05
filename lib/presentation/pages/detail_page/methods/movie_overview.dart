import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> movieOverview(AsyncValue<MovieDetail?> asyncMovieDetail) => [
      const Text(
        'Overview',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      asyncMovieDetail.when(
          data: (movieDetail) =>
              Text(movieDetail != null ? movieDetail.overview : '-'),
          error: (error, stackTrace) => const Text(
              "failed to load movie's overview, Please try again later"),
          loading: () => const CircularProgressIndicator()),
    ];
