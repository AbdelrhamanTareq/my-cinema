import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/routes_manger.dart';

void navToDetalisPage(BuildContext context, String id, {bool? isGenreDetails}) {
  Navigator.pushNamed(context, Routes.movieDetails, arguments: {
    "id": id,
    "isGenreDetails": isGenreDetails,
  });
}

String getImagePath(String path) {
  return "https://image.tmdb.org/t/p/w500/$path";
}

String getImagePath1(String path) {
  return "https://imdb-api.com/API/ResizeImage?apiKey=${dotenv.get("IMBD_API_KEY")}&size=300x528&url=$path";
}
