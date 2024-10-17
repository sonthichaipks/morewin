import 'package:either_dart/either.dart';
// import 'package:morewin/app/util/util.dart';
import 'package:morewin/data/providers/network/api_endpoint.dart';
import 'package:morewin/data/providers/network/api_provider.dart';
import 'package:morewin/data/providers/network/api_request_representable.dart';

class MngdbAPI implements APIRequestRepresentable {
  String params;
  HTTPMethod methods;

  MngdbAPI._({required this.methods, required this.params});

  MngdbAPI.FetchMngData(method, para) : this._(methods: method, params: para);

  @override
  String get endpoint => APIEndpoint.mngDbApi;

  String get path {
    return params;
    //"getLogin = /login/[UNAME]";
  }

  @override
  HTTPMethod get method {
    return method;
     //HTTPMethod.get;
  }

  Map<String, String> get headers => {};

  Map<String, String> get query {
    return {
      "query": "/$params",
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
