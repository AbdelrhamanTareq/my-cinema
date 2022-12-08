// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies_app/data/models/box_office.dart';
import 'package:movies_app/data/models/coming_soon.dart';
import 'package:movies_app/data/models/genre.dart';
import 'package:movies_app/data/models/most_popular.dart';

class Home {
  ComingSoon? comingSoon;
  MostPopular? mostPopularMovies;
  MostPopular? mostPopularTvs;
  BoxOffice? boxOffice;
  Genre? genre;
  Home({
    this.comingSoon,
    this.mostPopularMovies,
    this.mostPopularTvs,
    this.boxOffice,
    this.genre,
  });
}
