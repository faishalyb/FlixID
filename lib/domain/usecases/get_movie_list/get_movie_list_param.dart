enum MovieListCategories {nowPlaying, upcoming}

class GetMovieListParam {
  final int page;
  final MovieListCategories category;

  GetMovieListParam({required this.category, this.page = 1});
}