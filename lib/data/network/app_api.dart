import 'package:dio/dio.dart';
import 'package:movies_app/data/models/box_office.dart';
import 'package:movies_app/data/models/coming_soon.dart';
import 'package:movies_app/data/models/genre.dart';
import 'package:movies_app/data/models/genre_data_details.dart';
import 'package:movies_app/data/models/most_popular.dart';
import 'package:movies_app/data/models/movie_details.dart';
import 'package:movies_app/data/models/search.dart';
import 'package:movies_app/data/models/trending_movies.dart';
import 'package:movies_app/data/network/api_constant.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("trending/all/day")
  Future<Trending> getTrendingMovies(
    @Query("api_key") String apiKey,
  );

  @GET("trending/all/week")
  Future<Trending> getTopWeekMovies(
    @Query("api_key") String apiKey,
  );
  @GET("genre/movie/list")
  Future<Genre> getGeners(
    @Query("api_key") String apiKey,
  );
  @GET("discover/movie/")
  Future<Trending> getGenreData(
    @Query("api_key") String apiKey,
    @Query("with_genres") int id,
  );

  @GET("movie/{id}")
  Future<GenreDataDetails> getGenreDataDetails(
    @Path("id") int id,
    @Query("api_key") String apiKey,
  );
}

@RestApi(baseUrl: ApiConstant.baseUrl1)
abstract class AppServiceClient1 {
  factory AppServiceClient1(Dio dio, {String baseUrl}) = _AppServiceClient1;

  @GET("ComingSoon/{apiKey}")
  Future<ComingSoon> getComingSoon(@Path("apiKey") String apiKey);

  @GET("BoxOffice/{apiKey}")
  Future<BoxOffice> getBoxOffice(@Path("apiKey") String apiKey);

  @GET("MostPopularTVs/{apiKey}")
  Future<MostPopular> getMostPopularTvs(@Path("apiKey") String apiKey);

  @GET("MostPopularMovies/{apiKey}")
  Future<MostPopular> getMostPopularMovies(@Path("apiKey") String apiKey);

  @GET("Search/{apiKey}/{exprission}")
  Future<Search> search(
      @Path("exprission") String exprission, @Path("apiKey") String apiKey);

  @GET("Title/{apiKey}/{id}/Trailer")
  Future<MovieDetails> getMovieDetails(
      @Path("id") String id, @Path("apiKey") String apiKey);
}
