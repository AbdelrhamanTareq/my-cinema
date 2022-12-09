import 'package:dartz/dartz.dart';
import 'package:movies_app/data/data_source/local_data_source.dart';
import 'package:movies_app/data/data_source/remote_data_source.dart';
import 'package:movies_app/data/models/box_office.dart';
import 'package:movies_app/data/models/coming_soon.dart';
import 'package:movies_app/data/models/genre.dart';
import 'package:movies_app/data/models/genre_data_details.dart';
import 'package:movies_app/data/models/most_popular.dart';
import 'package:movies_app/data/models/movie_details.dart';
import 'package:movies_app/data/models/search.dart';
import 'package:movies_app/data/models/trending_movies.dart';
import 'package:movies_app/data/network/error_handler.dart';
import 'package:movies_app/data/network/faliure.dart';
import 'package:movies_app/data/network/network_info.dart';

abstract class Repoistory {
  Future<Either<Failure, Trending>> getTrendingMovies();
  Future<Either<Failure, Trending>> getTopWeekMovies();
  Future<Either<Failure, Genre>> getGenre();
  Future<Either<Failure, ComingSoon>> getComingSoon();
  Future<Either<Failure, BoxOffice>> getBoxOffice();
  Future<Either<Failure, MostPopular>> getMostPopukarTvs();
  Future<Either<Failure, MostPopular>> getMostPopukarMovies();
  Future<Either<Failure, Search>> search(String exprission);
  Future<Either<Failure, MovieDetails>> getMovieDetails(String id);
  Future<Either<Failure, Trending>> getGenreData(int id);
  Future<Either<Failure, GenreDataDetails>> getGenreDataDetails(int id);
}

class RepoistoryImpl implements Repoistory {
  final RemoteDataSourec _remoteDataSourec;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  RepoistoryImpl(
      this._remoteDataSourec, this._networkInfo, this._localDataSource);

  @override
  Future<Either<Failure, Trending>> getTrendingMovies() async {
    try {
      final response =  _localDataSource.getTrendingData();
      return Right(response);
    } catch (e) {
      if (await _networkInfo.isConnected) {
        try {
          final response = await _remoteDataSourec.getTrendingMovies();
          _localDataSource.setTrendingData(response);
          return Right(response);
        } catch (error) {
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        return Left(DataMessage.noInternetConnection.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Trending>> getTopWeekMovies() async {
    try {
      final response =  _localDataSource.getTopWeekData();
      return right(response);
    } catch (e) {
      if (await _networkInfo.isConnected) {
        try {
          final response = await _remoteDataSourec.getTopWeekMovies();
          _localDataSource.setTopWeekData(response);
          return Right(response);
        } catch (error) {
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        return Left(DataMessage.noInternetConnection.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Genre>> getGenre() async {
    try {
      final response =  _localDataSource.getGenreData();
      return Right(response);
    } catch (e) {
      if (await _networkInfo.isConnected) {
        try {
          final response = await _remoteDataSourec.getGenre();
          _localDataSource.setGenreData(response);
          return Right(response);
        } catch (error) {
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        return Left(DataMessage.noInternetConnection.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, ComingSoon>> getComingSoon() async {
    try {
      final respose =  _localDataSource.getCommingSoonData();
      return Right(respose);
    } catch (e) {
      if (await _networkInfo.isConnected) {
        try {
          final response = await _remoteDataSourec.getComingSoon();
          if (response.errorMessage!.isEmpty) {
            _localDataSource.setComingSoonData(response);
            return Right(response);
          } else {
            return Left(Failure(AppInternalCode.error, response.errorMessage!));
          }
        } catch (error) {
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        return Left(DataMessage.noInternetConnection.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, BoxOffice>> getBoxOffice() async {
    try {
      final response =  _localDataSource.getBoxOfficeData();
      return Right(response);
    } catch (e) {
      if (await _networkInfo.isConnected) {
        try {
          final response = await _remoteDataSourec.getBoxOffice();
          if (response.errorMessage!.isEmpty) {
            _localDataSource.setBoxOfficeData(response);
            return Right(response);
          } else {
            return Left(Failure(AppInternalCode.error, response.errorMessage!));
          }
        } catch (error) {
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        return Left(DataMessage.noInternetConnection.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, MostPopular>> getMostPopukarTvs() async {
    try {
      final response =  _localDataSource.getMostPopulatTvsData();
      return Right(response);
    } catch (e) {
      if (await _networkInfo.isConnected) {
        try {
          final response = await _remoteDataSourec.getMostPopukarTvs();
          if (response.errorMessage!.isEmpty) {
            _localDataSource.setMostPopulatTvsData(response);
            return Right(response);
          } else {
            return Left(Failure(AppInternalCode.error, response.errorMessage!));
          }
        } catch (error) {
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        return Left(DataMessage.noInternetConnection.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, MostPopular>> getMostPopukarMovies() async {
    try {
      final response =  _localDataSource.getMostPopulatMoviesData();
      return Right(response);
    } catch (e) {
      if (await _networkInfo.isConnected) {
        try {
          final response = await _remoteDataSourec.getMostPopukarMovies();
          if (response.errorMessage!.isEmpty) {
            _localDataSource.setMostPopulatMoviesData(response);
            return Right(response);
          } else {
            return Left(Failure(AppInternalCode.error, response.errorMessage!));
          }
        } catch (error) {
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        return Left(DataMessage.noInternetConnection.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Search>> search(String exprission) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSourec.search(exprission);
        if (response.errorMessage.isEmpty) {
          return Right(response);
        } else {
          return Left(Failure(AppInternalCode.error, response.errorMessage));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataMessage.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSourec.getMovieDetails(id);
        if (response.errorMessage == null) {
          return Right(response);
        } else {
          return Left(Failure(AppInternalCode.error,
              response.errorMessage ?? ResponseMessage.defalut));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataMessage.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, Trending>> getGenreData(int id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSourec.getGenreData(id);
        if (response.results != null) {
          return Right(response);
        } else {
          return Left(Failure(AppInternalCode.error, ResponseMessage.defalut));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataMessage.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, GenreDataDetails>> getGenreDataDetails(int id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSourec.getGenreDataDetails(id);
        if (response.toString().isNotEmpty) {
          return Right(response);
        } else {
          return Left(Failure(AppInternalCode.error, ResponseMessage.defalut));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataMessage.noInternetConnection.getFailure());
    }
  }
}
