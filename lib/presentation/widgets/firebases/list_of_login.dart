import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com.morepos.morewin/presentation/login/login_controller.dart';
// import 'package:com.morepos.morewin/utils/fnc_provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// import 'package:com.morepos.morewin/controllers/sigin_controller.dart';
// import 'package:com.morepos.morewin/dashboard/const/constant.dart';
import 'package:uuid/uuid.dart';

import '../../../app/constants/fnc_provider.dart';
import '../../../app/constants/theme_provider.dart';
import '../../../app/util/styles.dart';

// import '../../utils/route/route_page.dart';
// import '../../utils/style.dart';
// import 'package:com.morepos.morewin/dashboard/const/constant.dart';
// import 'package:com.morepos.morewin/utils/fnc_provider.dart';
// import 'package:frontend/add_new_task.dart';
// import 'package:frontend/utils.dart';
// import 'package:frontend/widgets/date_selector.dart';
// import 'package:frontend/widgets/task_card.dart';

class LoginList extends StatefulWidget {
  const LoginList({super.key});

  @override
  State<LoginList> createState() => _LoginListState();
}

class _LoginListState extends State<LoginList> {
  bool mapToggle = false;

  var currentLocation;
  void iniState() {
    super.initState();
    currentLocation = Geolocator.getCurrentPosition();
  }

  final LoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.getClientIp();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    // if (controller.mc.userLogin.userId == 1) {
                    await controller.deleteLoginLog();
                    // }
                  },
                  child: const CircleAvatar(
                    // backgroundColor: Get.theme.accentColor,
                    radius: 13,
                    child: Text(
                      '@',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // const SizedBox(width: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'MOMOSHOP:ประวัติผู้ใช้งาน:',
                    style: Styles.navBarTextStyle.copyWith(
                      color: Colors.black.withOpacity(0.75),
                      fontSize: 11,
                      fontFamily: 'Leelawadee',
                    ),
                    children: [
                      TextSpan(
                        text: ':${cno.format(controller.usercounts)}',
                        style: Styles.navBarTextStyle.copyWith(
                          // color: Get.theme.accentColor,
                          fontSize: 13,
                          fontFamily: 'Leelawadee',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            StreamBuilder(
              stream: (controller.firebase_color == 1)
                  ? FirebaseFirestore.instance
                      .collection("login_entry_monitor")
                      // .where('color',
                      //     isEqualTo: controller
                      //         .firebase_color) //color - is present to status - login = momo-login = 0, momo-logout=1;
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection("login_entry_monitor")
                      .where('color',
                          isEqualTo: controller
                              .firebase_color) //color - is present to status - login = momo-login = 0, momo-logout=1;
                      .snapshots(), // const DateSelector(),
              // FutureBuilder(
              //   future:
              // FirebaseFirestore.instance
              //       .collection("login_entry_monitor")
              //       .where('color',
              //           isEqualTo:
              //               0) //color - is present to status - login = momo-login = 0, momo-logout=1;
              //       .get(),
              builder: (context, snapshot) {
                List<QueryDocumentSnapshot<Object?>> posts;
                // builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {  },: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  var snapList =
                      snapshot.data!.docs.toList(); // <-- Mutable List object
                  posts = sortSnapshot(snapList); // <-- Function that sorts
                }
                if (!snapshot.hasData) {
                  return const Text('ไม่มีรายการ');
                } else {
                  controller.updateLogin(snapshot.data!.docs.length);
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: posts.length, //snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      // var location = snapshot.data!.docs[index]
                      //     .data()[('wherelogin.geopoint')];
                      return Dismissible(
                        key: ValueKey(index),
                        // onUpdate: (a) async {
                        //   await FirebaseFirestore.instance
                        //       .collection('login_entry_monitor')
                        //       .doc(snapshot.data!.docs[index].id)
                        //       .update({'loginip': controller.ipv4});
                        // },
                        onDismissed: (direction) async {
                          if (direction == DismissDirection.endToStart) {
                            // await FirebaseFirestore.instance
                            //     .collection('login_entry_monitor')
                            //     .doc(snapshot.data!.docs[index].id)
                            //     .update({'id': Uuid().v4()});
                            await FirebaseFirestore.instance
                                .collection('login_entry_monitor')
                                .doc(snapshot.data!.docs[index].id)
                                .delete();
                          }
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: LoginCard(
                                whologin: posts[index]
                                    //snapshot.data!.docs[index]
                                    // .data()
                                    ['whologin'],
                                logintime: posts[index]
                                        //snapshot.data!.docs[index]
                                        // .data()
                                        ['logintime']
                                    .toString(),
                                loginip: controller.ipv4,
                              ),
                              // wherelogin: location ?? _currentPosition),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<QueryDocumentSnapshot<Object?>> sortSnapshot(
      List<QueryDocumentSnapshot<Object?>> snapList) {
    String sortString = 'Sort by: logintime desc';
    if (sortString == 'Sort by: logintime desc') {
      snapList.sort((a, b) => compareCondition(
          b['logintime'].toString(), a['logintime'].toString()));
    } else if (sortString == 'Sort by: logintime') {
      snapList.sort((a, b) => compareCondition(
          a['logintime'].toString(), b['logintime'].toString()));
    }
    return snapList;
  }

  int compareCondition(String a, String b) {
    // Order: Excellent, Great, Good, Fair, Poor, Totaled
    if (a == b) return 0;
    switch (a) {
      case "Excellent":
        return -1;
      case "Great":
        if (b == 'Excellent') return 1;
        return -1;
      case "Good":
        if ((b == 'Excellent') || (b == 'Great')) return 1;
        return -1;
      case "Fair":
        if ((b == 'Excellent') || (b == 'Great') || (b == 'Great')) return 1;
        return -1;
      case "Poor":
        if ((b == 'Excellent') ||
            (b == 'Great') ||
            (b == 'Great') ||
            (b == 'Fair')) return 1;
        return -1;
      case "Totaled":
        if ((b == 'Excellent') ||
            (b == 'Great') ||
            (b == 'Great') ||
            (b == 'Fair') ||
            (b == 'Poor')) return 1;
        return -1;
    }
    return -1;
  }
}

class LoginCard extends StatelessWidget {
  // final int color;
  final String whologin;
  final String logintime;
  final String loginip;
  // final GeoPoint wherelogin;
  const LoginCard({
    super.key,
    // required this.color,
    required this.whologin,
    required this.logintime,
    required this.loginip,
    // required this.wherelogin,
  });

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    try {
      final String preConverted = logintime;

      final int seconds =
          int.parse(preConverted.substring(18, 28)); // 1621176915
      final int nanoseconds = int.parse(preConverted.substring(
          42, preConverted.lastIndexOf(')'))); // 276147000
      final Timestamp postConverted = Timestamp(seconds, nanoseconds);
      date = postConverted.toDate();
    } catch (e) {}
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20.0).copyWith(
          left: 15,
        ),
        decoration: BoxDecoration(
          color: mng_theme.secondaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 220,
            // height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  whologin,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: mng_theme.secondaryColor,
                  ),
                ),
                Text(
                  df.format(date),
                  style: const TextStyle(
                    fontSize: 12,
                    color: mng_theme.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
