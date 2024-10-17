import 'package:either_dart/either.dart';
import 'package:morewin/app/core/usecases/pram_usecase.dart';
import 'package:morewin/domain/entities/medium_posts_response.dart';
import 'package:morewin/domain/entities/paging.dart';
import 'package:morewin/domain/entities/unsplash_search_response.dart';
import 'package:morewin/domain/repositories/images_repository.dart';
import 'package:morewin/domain/repositories/medium_posts_repository.dart';
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
