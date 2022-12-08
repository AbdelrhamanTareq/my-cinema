import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstant {
  static const String baseUrl1 = "https://imdb-api.com/en/API/";
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const int timeOut = 6000;
  static final imbdKey = dotenv.get("IMBD_API_KEY");


}
