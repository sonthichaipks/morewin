import 'package:either_dart/either.dart';
import 'package:morewin/data/providers/network/api_request_representable.dart';
// import 'package:morewin/data/providers/network/apis/images_api.dart';
// import 'package:morewin/domain/entities/medium_posts_response.dart';
// import 'package:morewin/domain/entities/paging.dart';
// import 'package:morewin/domain/entities/unsplash_search_response.dart';
// import 'package:morewin/domain/repositories/images_repository.dart';

import '../../app/constants/route_apipath.dart';
import '../../domain/entities/mngdb_posts_response.dart';
// import '../../domain/repositories/medium_posts_repository.dart';
// import '../models/unsplash_search_response_model.dart';
import '../../domain/repositories/mngdb_repository.dart';
// import '../providers/network/apis/medium_api.dart';
import '../models/mngdata/QryTables.dart';
// import '../providers/network/api_provider.dart';
import '../providers/network/apis/mngdb_api.dart';
import '../providers/network/้http_api_privider.dart';

class MngdbRepositoryIml extends MngdbPostsRepository {
  @override
  Future<Either<Exception, MngDbPostsResponse>> FetchMngData(
      String username) async {
    Either response =
        await MngdbAPI.FetchMngData(HTTPMethod.get, username).request();
    if (response.isLeft)
      return Left(response.left);
    else
      return Right(MngDbPostsResponse.fromJson(response.right));
  }

  Future<List<PrQryTables>> getPrQryTablesWithFilter(
      String query, String qrynumber, String filter) async {
    // String loginurl = '${ApiPath.getprQryTable}/$qrynumber/$filter';

    String loginurl = '${ApiPath.getprQryTable}/$qrynumber/$filter';
    // loginurl = loginurl.replaceAll('[qid]', '-');
    // loginurl = loginurl.replaceAll('[i]', qrynumber);
    var temp = await HTTPAPIProvider.instance.get(loginurl);
    // var temp = await APIProvider.instance.wsList(loginurl);
    final List<dynamic> res = (temp != null) ? temp : [];
    // await APIProvider.instance.get(ApiPath.posStation);
    List<PrQryTables> data = [];

    for (var element in res) {
      PrQryTables _data = PrQryTables.fromJson(element);
      // if (_data.code.contains(filter)) {
      data.add(_data);
      // }
    }
    return data;
  }
}
