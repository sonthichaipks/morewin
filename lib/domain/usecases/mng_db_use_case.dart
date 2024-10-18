import 'package:either_dart/either.dart';
import 'package:com.morepos.morewin/app/core/usecases/pram_usecase.dart';
import 'package:com.morepos.morewin/domain/entities/medium_posts_response.dart';
import 'package:com.morepos.morewin/domain/entities/paging.dart';
import 'package:com.morepos.morewin/domain/entities/unsplash_search_response.dart';
import 'package:com.morepos.morewin/domain/repositories/images_repository.dart';
import 'package:com.morepos.morewin/domain/repositories/medium_posts_repository.dart';
import 'package:tuple/tuple.dart';

import '../entities/mngdb_posts_response.dart';
import '../repositories/mngdb_repository.dart';

class FetchMngdbUseCase
    extends ParamUseCase<Either<Exception, MngDbPostsResponse>, String> {
  final MngdbPostsRepository _repo;

  FetchMngdbUseCase(this._repo);

  @override
  Future<Either<Exception, MngDbPostsResponse>> execute(String params) {
    // TODO: implement execute
    _repo.fetchMngdbPosts(params);
    throw UnimplementedError();
  }
}
