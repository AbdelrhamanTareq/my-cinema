import 'package:movies_app/data/models/box_office.dart';
import 'package:movies_app/data/models/coming_soon.dart';
import 'package:movies_app/data/models/genre.dart';
import 'package:movies_app/data/models/genre_data_details.dart';
import 'package:movies_app/data/models/most_popular.dart';
import 'package:movies_app/data/models/movie_details.dart';
import 'package:movies_app/data/models/search.dart';
import 'package:movies_app/data/models/trending_movies.dart';
import 'package:movies_app/data/network/app_api.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';


abstract class RemoteDataSourec {
  Future<Trending> getTrendingMovies();
  Future<Trending> getTopWeekMovies();
  Future<ComingSoon> getComingSoon();
  Future<BoxOffice> getBoxOffice();
  Future<MostPopular> getMostPopukarTvs();
  Future<MostPopular> getMostPopukarMovies();
  Future<Genre> getGenre();
  Future<Search> search(String exprission);
  Future<MovieDetails> getMovieDetails(String id);
  Future<Trending> getGenreData(int id);
  Future<GenreDataDetails> getGenreDataDetails(int id);
}

class RemoteDataSourecImpl implements RemoteDataSourec {
  final AppServiceClient _appServiceClient;
  final AppServiceClient1 _appServiceClient1;

  final tmdbKey = dotenv.get("TMDB_API_KEY");
  final imdKey = dotenv.get("IMBD_API_KEY");

  RemoteDataSourecImpl(this._appServiceClient, this._appServiceClient1);

  @override
  Future<Trending> getTrendingMovies() async {
    return await _appServiceClient.getTrendingMovies(tmdbKey);
  }

  @override
  Future<Trending> getTopWeekMovies() async {
    return await _appServiceClient.getTopWeekMovies(tmdbKey);
  }

  @override
  Future<Genre> getGenre() async {
    return await _appServiceClient.getGeners(tmdbKey);
  }

  @override
  Future<ComingSoon> getComingSoon() async {
    return await _appServiceClient1.getComingSoon(imdKey);
  }

  @override
  Future<BoxOffice> getBoxOffice() async {
    return await _appServiceClient1.getBoxOffice(imdKey);
  }

  @override
  Future<MostPopular> getMostPopukarTvs() async {
    return await _appServiceClient1.getMostPopularTvs(imdKey);
  }

  @override
  Future<MostPopular> getMostPopukarMovies() async {
    return await _appServiceClient1.getMostPopularMovies(imdKey);
  }

  @override
  Future<Search> search(String exprission) async {
    return await _appServiceClient1.search(exprission,imdKey);
  }

  @override
  Future<MovieDetails> getMovieDetails(String id) async {
    return await _appServiceClient1.getMovieDetails(id,imdKey);
  }

  @override
  Future<Trending> getGenreData(int id) async {
    return await _appServiceClient.getGenreData(tmdbKey, id);
  }

  @override
  Future<GenreDataDetails> getGenreDataDetails(int id) async {
    return await _appServiceClient.getGenreDataDetails(id, tmdbKey);
  }
}
