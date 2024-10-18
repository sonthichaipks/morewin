import 'package:either_dart/either.dart';
import 'package:com.morepos.morewin/app/util/util.dart';
import 'package:com.morepos.morewin/data/providers/network/api_endpoint.dart';
import 'package:com.morepos.morewin/data/providers/network/api_provider.dart';
import 'package:com.morepos.morewin/data/providers/network/api_request_representable.dart';

class MediumAPI implements APIRequestRepresentable {
  String tagName;

  MediumAPI._({required this.tagName});

  MediumAPI.fetchUserPosts(username) : this._(tagName: username);

  @override
  String get endpoint => APIEndpoint.mediumUserPostsFromRss;

  String get path {
    return "/v1/api.json";
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  Map<String, String> get headers => {};

  Map<String, String> get query {
    return {
      "rss_url": "https://medium.com/feed/tag/$tagName",
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
