import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:com.morepos.morewin/presentation/home/home_page.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:com.morepos.morewin/domain/entities/medium_posts_response.dart';
// import 'package:com.morepos.morewin/domain/usecases/fetch_user_posts_use_case.dart';

// import '../../app/constants/themes.dart';
import '../../data/models/mngdata/QryTables.dart';
import '../../data/repositories/mngdb_repository_impl.dart';
import '../../domain/entities/mngdb_posts_response.dart';
import '../../domain/usecases/mng_db_use_case.dart';
// import '../about/about_binding.dart';
// import '../about/about_page.dart';
// import '../blog/blog_binding.dart';
// import '../blog/blog_page.dart';
// import '../experiences/experiences_binding.dart';
// import '../experiences/experiences_page.dart';
// import '../home/home_binding.dart';
// import '../home/home_ dart';
// import '../information/information_binding.dart';
// import '../information/information_page.dart';
// import '../projects/projects_page.dart';
// import '../projects/projets_binding.dart';
// import '../route/routes_ dart';
import '../home/home_controller.dart';
import '../widgets/custom_snackbar.dart';
// import 'login_bindng.dart';
// import 'login_pages.dart';

class LoginController extends GetxController with GetTickerProviderStateMixin {
  LoginController();

  init(BuildContext context) {
    tcontext = context;
  }

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

  Future<void> loginUserWithEmailAndPassword() async {
    try {
      final UserCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      if (FirebaseAuth.instance.currentUser != null) {
        navCtrl.selectedIndex.value = 0;
        navCtrl.onIndexChanged(navCtrl.selectedIndex);
        //  update();
      }
      rightUser = '1';
    } on FirebaseAuthException catch (e) {
      rightUser = 'not found or please create new user, SIGNUP before login';
    }
    update();
  }
}
