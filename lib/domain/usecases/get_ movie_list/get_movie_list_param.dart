enum MovieListCategories {nowPlaying, upcoming}

class GetMovieListParam {
  final int page;
  final MovieListCategories categories;

  GetMovieListParam({required this.categories, this.page = 1});
}