import 'package:movies_app/data/models/box_office.dart';
import 'package:movies_app/data/models/coming_soon.dart';
import 'package:movies_app/data/models/genre.dart';
import 'package:movies_app/data/models/genre_data_details.dart';
import 'package:movies_app/data/models/most_popular.dart';
import 'package:movies_app/data/models/movie_details.dart';
import 'package:movies_app/data/models/trending_movies.dart';
import 'package:movies_app/data/network/error_handler.dart';

const String cachedBoxOfficeKey = "CACHED_BOX_OFFICE_KEY";
const String cachedComingSoonKey = "CACHED_COMING_KEY";
const String cachedGenreKey = "CACHED_GENRE_KEY";
const String cachedMostTVsKey = "CACHED_MOST_TVS_KEY";
const String cachedMostMoviesKey = "CACHED_MOST_MOVIES_KEY";
const String cachedTrendingKey = "CACHED_TRENDING_KEY";
const String cachedTopWeekKey = "CACHED_TOP_WEEK_KEY";
const String cachedMoviesDetailsKey = "CACHED_MOVIES_DETAILS_KEY";
const String cachedGenreDataKey = "CACHED_GENRE_DATA_KEY";
const String cachedGenreDataDetailsKey = "CACHED_GENRE_DATA_DETAILS_KEY";
const int cachedHomeTime = 600 * 1000;

abstract class LocalDataSource {
  Future<void> setBoxOfficeData(BoxOffice boxOfficeData);
  BoxOffice getBoxOfficeData();
  Future<void> setComingSoonData(ComingSoon commingSoonData);
  ComingSoon getCommingSoonData();
  Future<void> setGenreData(Genre genreData);
  Genre getGenreData();
  Future<void> setMostPopulatTvsData(MostPopular mostPopualrTvsData);
  MostPopular getMostPopulatTvsData();
  Future<void> setMostPopulatMoviesData(MostPopular mostPopularMoviesData);
  MostPopular getMostPopulatMoviesData();
  Future<void> setTrendingData(Trending trendingData);
  Trending getTrendingData();
  Future<void> setTopWeekData(Trending topWeekData);
  Trending getTopWeekData();
  /*
  Future<void> setMoviesDetailsData(MovieDetails movieDetailsData);
  MovieDetails getMoviesDetailsData();
  Future<void> setGenreDataData(Trending genreData);
  Trending getGenreDataData();
  Future<void> setGenreDataDetailsData(GenreDataDetails genreDataDetailsData);
  GenreDataDetails getGenreDataDetailsData();
  */
}

class LocalDataSourceImpl implements LocalDataSource {
  Map<String, dynamic> cachedMap = {};
  @override
  BoxOffice getBoxOfficeData() {
    CachedItem? cachedItem = cachedMap[cachedBoxOfficeKey];
    if (cachedItem != null && cachedItem.isValid(cachedHomeTime)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(ResponseCode.cacheError);
    }
  }

  @override
  Future<void> setBoxOfficeData(BoxOffice boxOfficeData) async {
    cachedMap[cachedBoxOfficeKey] = CachedItem(boxOfficeData);
  }

  @override
  ComingSoon getCommingSoonData() {
    CachedItem? cachedItem = cachedMap[cachedComingSoonKey];
    if (cachedItem != null && cachedItem.isValid(cachedHomeTime)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(ResponseCode.cacheError);
    }
  }

  @override
  Genre getGenreData() {
    CachedItem? cachedItem = cachedMap[cachedGenreKey];
    if (cachedItem != null && cachedItem.isValid(cachedHomeTime)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(ResponseCode.cacheError);
    }
  }

  @override
  MostPopular getMostPopulatMoviesData() {
    CachedItem? cachedItem = cachedMap[cachedMostMoviesKey];
    if (cachedItem != null && cachedItem.isValid(cachedHomeTime)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(ResponseCode.cacheError);
    }
  }

  @override
  MostPopular getMostPopulatTvsData() {
    CachedItem? cachedItem = cachedMap[cachedMostTVsKey];
    if (cachedItem != null && cachedItem.isValid(cachedHomeTime)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(ResponseCode.cacheError);
    }
  }

  @override
  Future<void> setComingSoonData(ComingSoon commingSoonData) async {
    cachedMap[cachedComingSoonKey] = CachedItem(commingSoonData);
  }

  @override
  Future<void> setGenreData(Genre genreData) async {
    cachedMap[cachedGenreKey] = CachedItem(genreData);
  }

  @override
  Future<void> setMostPopulatMoviesData(
      MostPopular mostPopularMoviesData) async {
    cachedMap[cachedMostMoviesKey] = CachedItem(mostPopularMoviesData);
  }

  @override
  Future<void> setMostPopulatTvsData(MostPopular mostPopualrTvsData) async {
    cachedMap[cachedMostTVsKey] = CachedItem(mostPopualrTvsData);
  }

  @override
  Trending getTopWeekData() {
    CachedItem? cachedItem = cachedMap[cachedTopWeekKey];
    if (cachedItem != null && cachedItem.isValid(cachedHomeTime)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(ResponseCode.cacheError);
    }
  }

  @override
  Trending getTrendingData() {
    CachedItem? cachedItem = cachedMap[cachedTrendingKey];
    if (cachedItem != null && cachedItem.isValid(cachedHomeTime)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(ResponseCode.cacheError);
    }
  }

  @override
  Future<void> setTopWeekData(Trending topWeekData) async {
    cachedMap[cachedTopWeekKey] = CachedItem(topWeekData);
  }

  @override
  Future<void> setTrendingData(Trending trendingData) async {
    cachedMap[cachedTrendingKey] = CachedItem(trendingData);
  }

  /*
  @override
  Trending getGenreDataData() {
    CachedItem? cachedItem = cachedMap[cachedGenreDataKey];
    if (cachedItem != null && cachedItem.isValid(cachedHomeTime)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(ResponseCode.cacheError);
    }
  }

  @override
  GenreDataDetails getGenreDataDetailsData() {
    CachedItem? cachedItem = cachedMap[cachedGenreDataDetailsKey];
    if (cachedItem != null && cachedItem.isValid(cachedHomeTime)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(ResponseCode.cacheError);
    }
  }

  @override
  MovieDetails getMoviesDetailsData() {
    CachedItem? cachedItem = cachedMap[cachedMoviesDetailsKey];
    if (cachedItem != null && cachedItem.isValid(cachedHomeTime)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(ResponseCode.cacheError);
    }
  }

  @override
  Future<void> setGenreDataData(Trending genreData) async {
    cachedMap[cachedGenreDataKey] = CachedItem(genreData);
  }

  @override
  Future<void> setGenreDataDetailsData(
      GenreDataDetails genreDataDetailsData) async {
    cachedMap[cachedGenreDataDetailsKey] = CachedItem(genreDataDetailsData);
  }

  @override
  Future<void> setMoviesDetailsData(MovieDetails movieDetailsData) async {
    cachedMap[cachedMoviesDetailsKey] = CachedItem(movieDetailsData);
  }
  */
}

class CachedItem {
  dynamic data;
  int cachedTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);

  bool isValid(int expiryTime) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    bool isValid = currentTime - cachedTime <= expiryTime;

    return isValid;
  }
}
