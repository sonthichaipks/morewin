import '../../data/models/login_byuser.dart';
import 'medium_feed.dart';
import 'medium_post_item.dart';

class MngDbPostsResponse {
  String? status;
  MediumFeed? feed;
  List<Login>? items;

  MngDbPostsResponse({this.status, this.feed, this.items});

  MngDbPostsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    feed = json['feed'] != null ? new MediumFeed.fromJson(json['feed']) : null;
    if (json['items'] != null) {
      items = <Login>[];
      json['items'].forEach((v) {
        items!.add(new Login.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['status'] = this.status;
    // if (this.feed != null) {
    //   data['feed'] = this.feed!.toJson();
    // }
    // if (this.items != null) {
    //   data['items'] = this.items!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
