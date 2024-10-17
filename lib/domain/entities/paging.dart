import 'package:morewin/domain/entities/unsplash_search_response.dart';

class Paging {
  Paging({
    required this.total,
    required this.response,
  });

  int total;
  UnsplashSearchResponse response;
}
