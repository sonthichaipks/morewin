import 'package:either_dart/either.dart';
import 'package:com.morepos.morewin/domain/entities/unsplash_search_response.dart';

abstract class ImagesRepository {
  Future<Either<Exception, UnsplashSearchResponse>> fetchPersonImages(
      int page, int pageSize);
}
