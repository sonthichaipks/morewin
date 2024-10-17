import 'package:either_dart/either.dart';
import 'package:morewin/data/providers/network/apis/images_api.dart';
import 'package:morewin/domain/entities/medium_posts_response.dart';
import 'package:morewin/domain/entities/paging.dart';
import 'package:morewin/domain/entities/unsplash_search_response.dart';
import 'package:morewin/domain/repositories/images_repository.dart';

import '../../domain/repositories/medium_posts_repository.dart';
import '../models/unsplash_search_response_model.dart';
import '../providers/network/apis/medium_api.dart';

class MediumPostsRepositoryIml extends MediumPostsRepository {
  @override
  Future<Either<Exception, MediumPostsResponse>> fetchUserPosts(
      String username) async {
    Either response = await MediumAPI.fetchUserPosts(username).request();
    if (response.isLeft)
      return Left(response.left);
    else
      return Right(MediumPostsResponse.fromJson(response.right));
  }
}
