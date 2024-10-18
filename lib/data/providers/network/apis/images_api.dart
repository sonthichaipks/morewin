import 'package:either_dart/either.dart';
import 'package:com.morepos.morewin/app/util/util.dart';
import 'package:com.morepos.morewin/data/providers/network/api_endpoint.dart';
import 'package:com.morepos.morewin/data/providers/network/api_provider.dart';
import 'package:com.morepos.morewin/data/providers/network/api_request_representable.dart';

class ImagesAPI implements APIRequestRepresentable {
  int? page;
  int? pageSize;

  ImagesAPI._({this.page, this.pageSize});

  ImagesAPI.getPersonalImages(page, pageSize)
      : this._(page: page, pageSize: pageSize);

  @override
  String get endpoint => APIEndpoint.unsplashApi;

  String get path {
    return "/search/photos";
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  Map<String, String> get headers => {};

  Map<String, String> get query {
    return {
      "client_id": "jQJvABfDdHT7-S56KViqMSzeyd_f5CnWxVaIaeiweqc",
      "page": "$page",
      "per_page": "$pageSize",
      "query": "store, shop",
      "color": "black_and_white"
    };
  }

  @override
  get body => null;

  Future<Either> request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url {
    return endpoint + path;
  }
}
