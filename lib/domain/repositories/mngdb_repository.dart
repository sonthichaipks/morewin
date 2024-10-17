import 'package:either_dart/either.dart';
import 'package:morewin/domain/entities/medium_posts_response.dart';
// import 'package:morewin/domain/entities/unsplash_search_response.dart';

// import '../entities/medium_posts_response.dart';
import '../entities/mngdb_posts_response.dart';

abstract class MngdbPostsRepository {
  // Future<Either<Exception, MngDbPostsResponse>> fetchMngdbPosts(String tagName);
  // Future<Either<Exception, MngDbPostsResponse>> fetchPersonImages(
  //     int page, int pageSize);

  Future<Either<Exception, MediumPostsResponse>> fetchMngdbPosts(item1) {
    throw UnimplementedError();
  }
}
