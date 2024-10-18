// import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:com.morepos.morewin/app/util/url_helper.dart';
import 'package:com.morepos.morewin/presentation/widgets/common/rounded_button.dart';
import 'package:qr_bar_code/qr/qr.dart';
import 'package:qr_bar_code/qr_bar_code_web.dart';
import '../../app/constants/theme_provider.dart';
import '../../data/models/mngdata/QryTables.dart';
import '../blog/blog_controller.dart';
import '../home/home_controller.dart';
import '../widgets/common/dropdown_template.dart';
import '../widgets/common/hero_images.dart';
import '../widgets/common/home_background_painter.dart';
import '../widgets/common/nav_bar.dart';
import '../widgets/dropdown_search.dart';
import '../widgets/mobile/home_background_painter_for_mobile.dart';
import '../widgets/mobile/social_media_bar_for_mobile.dart';
// import 'information_controller.dart';
import '../widgets/common/social_media_bar.dart';
import '../widgets/common/typewriter.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage();
  //  final RxInt selectedIndex; // = 0.obs;
  // final RxInt navBarSelectedIndex; // = 0.obs;
  // final HomeController navCtrl = Get.find();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final dropDownAprodKeySearch = GlobalKey<DropdownSearchState<PrQryTables>>();
  String rightUser = '';

  Future<void> createUserWithEmailAndPassword() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      rightUser = emailController.text.trim();
      print(userCredential.user?.uid);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> loginUserWithEmailAndPassword() async {
    try {
      final UserCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      if (FirebaseAuth.instance.currentUser != null) {
        controller.navCtrl.selectedIndex.value = 1;
        controller.navCtrl.onIndexChanged(controller.navCtrl.selectedIndex);
        // controller.update();
      }
      print(UserCredential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Widget desktop(BuildContext context) {
    return Scaffold(
        body:
            // Obx(() =>

            SizedBox(
      width: Get.width,
      height: Get.height,
      child: Stack(children: [
        CustomPaint(
            painter: HomeBackgroundPainter(Colors.lightBlue),
            size: Size.infinite),
        Row(
          children: [
            Expanded(
              child: Center(
                child: SizedBox(
                  width: Get.width / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: Get.width / 10,
                          height: Get.height / 10,
                          child: QRCode(data: '12356.')),
                      DropdownSearch<PrQryTables>.multiSelection(
                        key: dropDownAprodKeySearch,
                        asyncItems: ((String? filter) {
                          return controller.getAboutProductTablesWith(
                              ((filter!.isEmpty)) ? 'xxx' : filter!);
                        }),
                        clearButtonProps: ClearButtonProps(
                            isVisible: true, color: mng_theme.primaryColor),
                        dropdownButtonProps: DropdownButtonProps(
                            icon: Icon(Icons.clear),
                            iconSize: 10,
                            color: mng_theme.secondaryColor),
                        popupProps: PopupPropsMultiSelection.menu(
                          fit: FlexFit.loose,
                          // showSelectedItems: true,
                          isFilterOnline: true,
                          itemBuilder: ItemBuilderPDGOfDropdown,
                          showSearchBox: true,
                          searchFieldProps: TextFieldProps(
                            textAlign: TextAlign.center,
                            // controller: controller.edtSku,
                            decoration: InputDecoration(
                              icon: null,
                              iconColor: mng_theme.secondaryColor,
                              prefix: null,
                              prefixIconColor: mng_theme.secondaryColor,
                              suffixIcon: IconButton(
                                color: mng_theme.secondaryColor,
                                icon: Icon(Icons.balcony),
                                onPressed: () {
                                  // controller.edtSku.text = '';
                                  // controller.update();
                                },
                              ),
                            ),
                          ),
                        ),
                        compareFn: (item, selectedItem) =>
                            item.code == selectedItem.code,
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              icon: null,
                              iconColor: mng_theme.secondaryColor,
                              prefix: null,
                              prefixIcon: null,
                              prefixIconColor: mng_theme.secondaryColor,
                              suffix: null,
                              // iconColor: secondaryColor,
                              // prefixIconColor:
                              //     secondaryColor,
                              labelText:
                                  'เลือกร้านค้า หรือแสกนคิวอาร์โค๊ด เพื่อล๊อกอินอัตโนมัติ*',
                              filled: true,
                              fillColor: mng_theme.secondaryColor,
                              border: InputBorder.none),
                        ),
                        dropdownBuilder: SelectionAPOfdropdown,
                        onChanged: (selectedValue) async {
                          selectedValue.clear();
                          //  if (selectedValue.isNotEmpty) {
                          //    controller.getAboutProduct(selectedValue.first);
                          //  }
                          // try {
                          //   controller.sku = selectedValue.first.code.split(',')[1];
                          // } catch (e) {
                          //   controller.sku = (controller.edtSku.text.isEmpty)
                          //       ? 'xxx'
                          //       : controller.edtSku.text;
                          // }
                        },
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Login"),
                          // style: GoogleFonts.roboto(
                          //     fontSize: 30, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // const Row(
                      //   children: [
                      //     CustomText(
                      //       text:
                      //           "Welcome back to the management system",
                      //       color: lightGrey,
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        // decoration: InputDecoration(labelText: 'User'),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,

                        // onEditingComplete: () => controller.focusNode2.requestFocus(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        // focusNode: controller.focusNode2,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        // decoration: InputDecoration(labelText: 'User'),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,

                        // onEditingComplete: () => controller.submitLogin(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // (controller.mc.wifiIPv4 == null)

                      const SizedBox(
                        height: 30,
                      ),
                      // (rightUser == emailController.text.trim())
                      //     ?
                      ElevatedButton(
                        onPressed: () async {
                          await loginUserWithEmailAndPassword();
                        },
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(
                            fontSize: 16,
                            color: mng_theme.primaryColor,
                          ),
                        ),
                      ),
                      // : Container(),
                      // const SizedBox(height: 15),
                      // (rightUser == emailController.text.trim())
                      //     ? Container()
                      //     :
                      ElevatedButton(
                        onPressed: () async {
                          await createUserWithEmailAndPassword();
                        },
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 16,
                            color: mng_theme.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          // controller.pages[selectedIndex.value];
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: Theme.of(context).textTheme.titleMedium,
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.fromLTRB(10, 3, 3, 10),
                      //   child: Column(
                      //     children: [
                      //       OutlinedButton(
                      //         onPressed: () {
                      //           // controller.mc.refreshServer(ApiPath.apiPath);
                      //         },
                      //         child: const Text(
                      //           'SUBMIT',
                      //           style: TextStyle(color: Colors.red),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      Get.width * 0.1, 0, Get.width * 0.1, 0),
                  child: Center(child: HeroImage())),
            ),
          ],
        ),
        // Align(alignment: Alignment.bottomCenter, child: SocialMediaBar()),
      ]),
      // )),
    ));
  }

  // @override
  Widget phone() {
    return Scaffold(
      body: Obx(() => SizedBox(
            width: Get.width,
            height: Get.height,
            child: Stack(
              children: [
                CustomPaint(
                    painter: HomeBackgroundPainterForMobile(Colors.lightBlue),
                    size: Size.infinite),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      Expanded(
                        flex: 4,
                        child: HeroImage(),
                      ),
                      // Expanded(
                      //   flex: 6,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(16.0),
                      //     child: SingleChildScrollView(
                      //       child: AnimatedSize(
                      //         // vsync: controller,
                      //         duration: kThemeAnimationDuration,
                      //         alignment: Alignment.topCenter,
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             Typewriter(
                      //               'Welcome to',
                      //               animate: !controller.helloSeen.value,
                      //               textStyle: TextStyle(
                      //                 color: Colors.lightBlue,
                      //                 fontSize: 24,
                      //                 fontWeight: FontWeight.w700,
                      //                 letterSpacing: 1.4,
                      //               ),
                      //               onEnd: () {
                      //                 controller.showName.value = true;
                      //                 controller.helloSeen.value = true;
                      //                 controller.update();
                      //               },
                      //             ),
                      //             if (controller.showName.value) ...[
                      //               SizedBox(height: 16),
                      //               Typewriter(
                      //                 'Morepos Store',
                      //                 animate: !controller.nameSeen.value,
                      //                 textStyle: TextStyle(
                      //                   color: Colors.blueGrey[900],
                      //                   fontSize: 40,
                      //                   fontWeight: FontWeight.w700,
                      //                 ),
                      //                 onEnd: () {
                      //                   controller.showPosition.value = true;
                      //                   controller.nameSeen.value = true;

                      //                   controller.update();
                      //                 },
                      //               ),
                      //             ],
                      //             if (controller.showPosition.value) ...[
                      //               SizedBox(height: 16),
                      //               Typewriter(
                      //                 'Super store to anyone who is member',
                      //                 animate: !controller.positionSeen.value,
                      //                 textStyle: TextStyle(
                      //                   color: Colors.blueGrey[900],
                      //                   fontSize: 20,
                      //                   fontWeight: FontWeight.w500,
                      //                 ),
                      //                 onEnd: () {
                      //                   controller.showAbstract.value = true;
                      //                   controller.positionSeen.value = true;
                      //                   controller.update();
                      //                 },
                      //               ),
                      //             ],
                      //             if (controller.showAbstract.value) ...[
                      //               SizedBox(height: 24),
                      //               Typewriter(
                      //                 "เราได้รวมเครื่องมือซื้อขาย ไว้ในระบบเดียวกันให้ภาคส่วนใช้งานอย่างสะดวกง่ายดาย\n"
                      //                 'เพียงท่านล๊อกอินเข้าสู่ระบบด้วยบัญชีแบบใด ท่านจะได้การทำงานตามบัญชีนั้นทันที.\n'
                      //                 'โดยแบ่งเป็นเป็นผู้จำหน่ายส่ง ร้านค้า หรือ สมาชิกร้านค้า.',
                      //                 animate: !controller.abstractSeen.value,
                      //                 textStyle: TextStyle(
                      //                   color: Colors.grey,
                      //                   fontSize: 16,
                      //                   letterSpacing: 1.2,
                      //                   height: 1.3,
                      //                 ),
                      //                 onEnd: () {
                      //                   Future.delayed(
                      //                       Duration(milliseconds: 500), () {
                      //                     controller.showHireMe.value = true;
                      //                     controller.abstractSeen.value = true;
                      //                     controller.update();
                      //                   });
                      //                 },
                      //               ),
                      //             ],
                      //             if (controller.showHireMe.value) ...[
                      //               SizedBox(height: 30),
                      //               SizedBox(
                      //                 width: 160,
                      //                 child: RoundedButton(
                      //                     "Send Me Email",
                      //                     Colors.orange,
                      //                     Colors.orange,
                      //                     Colors.white, () {
                      //                   UrlHelper.launchUrl(
                      //                       "mailto:pks.sonthichai@gmail.com");
                      //                 }),
                      //               ),
                      //             ],
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: SocialMediaBarForMobile()),
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: desktop(context),
          ),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Navbar(),
          // ),
        ],
      ),
    );
  }
}
