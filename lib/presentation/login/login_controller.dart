import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com.morepos.morewin/data/models/login_byuser.dart';
// import 'package:com.morepos.morewin/presentation/home/home_page.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import '../../app/constants/core_package.dart';
import '../../data/models/mngdata/QryTables.dart';
import '../../data/providers/network/firestore_services.dart';
import '../../data/repositories/mngdb_repository_impl.dart';
import '../../domain/entities/mngdb_posts_response.dart';
import '../../domain/usecases/mng_db_use_case.dart';
import 'package:geolocator/geolocator.dart';
import '../home/home_controller.dart';
import '../route/routes_controller.dart';
import '../widgets/custom_snackbar.dart';

class LoginController extends GetxController with GetTickerProviderStateMixin {
  LoginController();

  init(BuildContext context) {
    tcontext = context;

    // _loginlocation.onLocationChanged.listen((LocationData currentLocation) {
    //   _loginlocation = new Location();

    // locationStreamSubscription =
    //     StreamLocationService.onLocationChanged?.listen(
    //   (position) async {
    //     _loginlocation = new GeoPoint(position.altitude, position.longitude);
    //   },
    // );
    // locationStreamSubscription?.init();
  }

  // late StreamSubscription<Position>? locationStreamSubscription;

// final homeTabPageStreamSubscription = Geolocator (Position position) {
// currentPosition = position;
// Geofire.setLocation(currentfirebaseUser.uid, position.latitude, position.longitude);};
//   }

  late GeoPoint loginlocation;
  late BuildContext tcontext;
  final totalRepo = MngdbRepositoryIml();

  final HomeController navCtrl = HomeController();
  List<PrQryTables> listQryAboutProductModel = [];
  String _tagName = "flutter";
  String rightUser = '';
  late FetchMngdbUseCase _fetchmngdbUseCase;
  Rx<MngDbPostsResponse?>? mngDbResponse = Rx<MngDbPostsResponse?>(null);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchMngdbPosts();
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetchMngdbPosts() async {
    Either response = await _fetchmngdbUseCase.execute(_tagName);
    response.fold((left) {
      CustomSnackBar.show(Get.context!, left.message, ContentType.failure);
    }, (right) {
      mngDbResponse!.value = right;
      update();
    });
  }

  Future<List<PrQryTables>> getAboutProductTablesWith(String filter) async {
    listQryAboutProductModel =
        await totalRepo.getPrQryTablesWithFilter(filter, '3', filter);
    return listQryAboutProductModel;
  }

  //-------firebase
  Future<void> createUserWithEmailAndPassword() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      rightUser = '';
    } on FirebaseAuthException catch (e) {
      rightUser = '${emailController.text.trim()} already exits';
    }
    update();
  }

  late List<Login> listUser;
  late Login userLogin;
  Future<void> loginUserWithEmailAndPassword() async {
    try {
      final UserCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
      listUser = [];
      if (FirebaseAuth.instance.currentUser != null) {
        getClientIp();

        listUser.add(Login(
            userId: 1,
            username: emailController.text,
            shopId: '',
            displayName: emailController.text,
            source: '',
            passwordHash: '',
            passwordSalt: '',
            isActive: 1));
        userLogin = listUser[0];
        //selectedIndex = 0;
        // try {
        //   await locationStreamSubscription?.init();
        // } catch (e) {}

        update();

        uploadWhoLogin(userLogin.displayName);
        Future.delayed(Duration(seconds: 15));

        Get.toNamed(Routes.homepage);
      } else {
        await askConfirmDialog(() async {
          createUserWithEmailAndPassword();
        }, () {}, 'ต้องการ SIGNUP email นี้ หรือไม่');
      }
      rightUser = '1';
    } on FirebaseAuthException catch (e) {
      await askConfirmDialog(() async {
        createUserWithEmailAndPassword();
      }, () {}, 'ต้องการ SIGNUP email นี้ หรือไม่');
      // rightUser = 'not found or please create new user, SIGNUP before login';
    }
    update();
  }

  // Future<void> loginUserWithEmailAndPassword() async {
  //   try {
  //     final UserCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(
  //             email: emailController.text.trim(),
  //             password: passwordController.text.trim());

  //     if (FirebaseAuth.instance.currentUser != null) {
  //       navCtrl.selectedIndex.value = 0;
  //       navCtrl.onIndexChanged(navCtrl.selectedIndex);
  //       //  update();
  //     }
  //     rightUser = '1';
  //   } on FirebaseAuthException catch (e) {
  //     rightUser = 'not found or please create new user, SIGNUP before login';
  //   }
  //   update();
  // }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  // late GeoPoint currentPosition;
  // late Geolocator curLocation;
  // Future<void> getCurrentPosition() async {
  //   final hasPermission = await _handleLocationPermission();
  //   if (!hasPermission) return;
  //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //       .then((Position position) {
  //     // setState(() =>
  //     currentPosition = GeoPoint(position.latitude, position.longitude);
  //   }).catchError((e) {
  //     currentPosition = const GeoPoint(0, 0);
  //     // debugPrint(e);
  //   });
  // }

  Future<void> getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // currentPosition = position;
    // currentPosition = GeoPoint(position.latitude, position.longitude);
    loginlocation = GeoPoint(position.latitude, position.longitude);
    // return position;
  }

  Future<void> uploadWhoLogin(String loginname) async {
    try {
      // locationStreamSubscription?.init();
      await getClientIp();
      await getCurrentPosition();
      final id = const Uuid().v4();

      // var currentLocation = Geolocator.getCurrentPosition();
      // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      await FirebaseFirestore.instance
          .collection("login_entry_monitor")
          .doc(id)
          .set({
        "color": firebase_color,
        "favoriteratio": 5,
        "logintime": FieldValue.serverTimestamp(),
        "logouttime": FieldValue.serverTimestamp(),
        "wherelogin": loginlocation,
        "wherelogout": loginlocation,
        "whologin": loginname,
        "loginip": ipv4,
        "id": id,
      });
    } catch (e) {}
  }

  askConfirmDialog(Function ok, Function cancel, String msg) {
    Get.dialog(
      AlertDialog(
        title: Text(''),
        content: Text(msg),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: const Text("ตกลง", style: TextStyle(color: Colors.blue)),
                onPressed: () async {
                  ok();
                  Get.back();
                },
              ),
              TextButton(
                child:
                    const Text("ยกเลิก", style: TextStyle(color: Colors.red)),
                onPressed: () async {
                  cancel();
                  Get.back();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  int usercounts = 0;
  void updateLogin(int ucount) {
    usercounts = ucount;
    update();
  }

  Future<void> deleteLoginLog() async {
    try {
      if (firebase_color == 1) {
        delelteAllLogin();
      } else {
        delelteLoginByColor();
      }
      update();
    } catch (e) {
      print(e);
    }
  }

  delelteAllLogin() async {
    await askConfirmDialog(() async {
      await FirebaseFirestore.instance
          .collection('login_entry_monitor')
          //.where('color', isEqualTo: firebase_color)
          .get()
          .then((querySnapshot) => {
                querySnapshot.docs.forEach((snapshot) {
                  snapshot.reference.delete();
                })
              });
    }, () {}, 'ต้องการลบประวัติการเข้าระบบ ใช่หรือไม่');
  }

  delelteLoginByColor() async {
    await askConfirmDialog(() async {
      await FirebaseFirestore.instance
          .collection('login_entry_monitor')
          .where('color', isEqualTo: firebase_color)
          .get()
          .then((querySnapshot) => {
                querySnapshot.docs.forEach((snapshot) {
                  snapshot.reference.delete();
                })
              });
    }, () {}, 'ต้องการลบประวัติการเข้าระบบ ใช่หรือไม่');
  }

  set_firbasecolor() {
    firebase_color = (ipv4 == '49.0.84.79' ||
            ipv4 ==
                '213.246.133.193') //run internal / vpn //213.246.133.193-CAMBRIGE ENGLAND
        ? 10
        : (ipv4 == '124.120.94.255') //my morepos home
            ? 11
            : 30; //run on cloud anywhere //--morewin or momoorder
    update();
  }

  int firebase_color = 0;
  late String ipv4, ipv6;

  Future<void> getClientIp() async {
    try {
      // load();
      ipv4 = await Ipify.ipv4();
      // print(ipv4); // 98.207.254.136

      ipv6 = await Ipify.ipv64();
      // mc.checkPop('[' + ipv4 + '],[ ' + ipv6 + ']');

//       192-local ip 49.0.84.79  color = 0
// 202-cloud ip 202.44.229.165 color = 1
// home ip 124.120.94.255 color=3
      update();
      set_firbasecolor();
    } catch (e) {}
    // print(ipv6); // 98.207.254.136 or 2a00:1450:400f:80d::200e

    // final ipv4json = await Ipify.ipv64(format: Format.JSON);
    // print(
    //     ipv4json); //{"ip":"98.207.254.136"} or {"ip":"2a00:1450:400f:80d::200e"}
  }
}

extension on StreamSubscription<Position>? {
  static const LocationSettings _locationSettings =
      LocationSettings(distanceFilter: 1);
  static bool _isLocationGranted = false;
  Future<void> init() async {
    if (askLocationPermission == true) {
      Geolocator.getPositionStream(locationSettings: _locationSettings);
    }
  }

  static Future<bool> askLocationPermission() async {
    _isLocationGranted = await Permission.location.request().isGranted;
    return _isLocationGranted;
  }
}
