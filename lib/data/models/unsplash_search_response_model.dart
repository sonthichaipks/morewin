import 'package:com.morepos.morewin/data/models/unsplash_image_model.dart';
import 'package:com.morepos.morewin/domain/entities/unsplash_search_response.dart';

class UnsplashSearchResponseModel extends UnsplashSearchResponse {
  final int? total;
  final int? totalPages;
  final List<UnsplashImageModel>? results;

  UnsplashSearchResponseModel({this.total, this.totalPages, this.results});

  @override
  factory UnsplashSearchResponseModel.fromJson(Map<String, dynamic> json) =>
      UnsplashSearchResponseModel(
          total: json['total'],
          totalPages: json['total_pages'],
          results: json['results'] != null
              ? List.from(
                  json["results"].map((x) => UnsplashImageModel.fromJson(x)))
              : null);
}
