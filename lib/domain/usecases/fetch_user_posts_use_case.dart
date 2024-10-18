import 'package:either_dart/either.dart';
import 'package:com.morepos.morewin/app/core/usecases/pram_usecase.dart';
import 'package:com.morepos.morewin/domain/entities/medium_posts_response.dart';
import 'package:com.morepos.morewin/domain/entities/paging.dart';
import 'package:com.morepos.morewin/domain/entities/unsplash_search_response.dart';
import 'package:com.morepos.morewin/domain/repositories/images_repository.dart';
import 'package:com.morepos.morewin/domain/repositories/medium_posts_repository.dart';
import 'package:tuple/tuple.dart';

class FetchUserPostsUseCase
    extends ParamUseCase<Either<Exception, MediumPostsResponse>, String> {
  final MediumPostsRepository _repo;

  FetchUserPostsUseCase(this._repo);

  @override
  Future<Either<Exception, MediumPostsResponse>> execute(String param) {
    return _repo.fetchUserPosts(param);
  }
}
