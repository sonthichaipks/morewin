import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:morewin/data/providers/network/apis/images_api.dart';
import 'package:morewin/domain/entities/paging.dart';
import 'package:morewin/domain/entities/unsplash_search_response.dart';
import 'package:morewin/domain/repositories/images_repository.dart';
import '../models/unsplash_search_response_model.dart';

class ImagesRepositoryIml extends ImagesRepository {
  @override
  Future<Either<Exception, UnsplashSearchResponse>> fetchPersonImages(
      int page, int pageSize) async {
    Either response =
        await ImagesAPI.getPersonalImages(page, pageSize).request();
    if (response.isLeft)
      return Left(response.left);
    else
      return Right(UnsplashSearchResponseModel.fromJson(response.right));
  }
}
