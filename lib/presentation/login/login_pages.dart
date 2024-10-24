// import 'package:dropdown_search/dropdown_search.dart';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:com.morepos.morewin/app/util/url_helper.dart';
import 'package:com.morepos.morewin/presentation/widgets/common/rounded_button.dart';
import 'package:qr_bar_code/qr/qr.dart';
import 'package:qr_bar_code/qr_bar_code_web.dart';
import '../../app/constants/theme_provider.dart';
import '../../data/models/mngdata/QryTables.dart';
import '../../data/providers/network/firestore_services.dart';
import '../blog/blog_controller.dart';
import '../home/home_controller.dart';
import '../widgets/common/dropdown_template.dart';
import '../widgets/common/hero_images.dart';
import '../widgets/common/home_background_painter.dart';
import '../widgets/common/nav_bar.dart';
import '../widgets/dropdown_search.dart';
import '../widgets/mobile/home_background_painter_for_mobile.dart';
import '../widgets/mobile/social_media_bar_for_mobile.dart';
// import 'information_c.dart';
import '../widgets/common/social_media_bar.dart';
import '../widgets/common/typewriter.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key}){
    
    // locationStreamSubscription =
    //     StreamLocationService.onLocationChanged?.listen(
    //   (position) async {
    //     controller.loginlocation = new GeoPoint(position.altitude, position.longitude);
    //   },
    // );
  }
  // late StreamSubscription<Position>? locationStreamSubscription;
  final formKey = GlobalKey<FormState>();
  final dropDownAprodKeySearch = GlobalKey<DropdownSearchState<PrQryTables>>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: null,
            body: GetBuilder<LoginController>(
                initState: controller.init(context),
                init: controller,
                builder: (context) {
                  return desktop(controller);
                })));
  }
  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build

  //   return Scaffold(
  //     body: Stack(
  //       children: [
  //         SizedBox(
  //           width: Get.width,
  //           height: Get.height,
  //           child: desktop(context),
  //         ),
  //         // Align(
  //         //   alignment: Alignment.topCenter,
  //         //   child: Navbar(),
  //         // ),
  //       ],
  //     ),
  //   );
  // }
  Widget desktop(LoginController c) {
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
                          return c.getAboutProductTablesWith(
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
                            // controller: c.edtSku,
                            decoration: InputDecoration(
                              icon: null,
                              iconColor: mng_theme.secondaryColor,
                              prefix: null,
                              prefixIconColor: mng_theme.secondaryColor,
                              suffixIcon: IconButton(
                                color: mng_theme.secondaryColor,
                                icon: Icon(Icons.balcony),
                                onPressed: () {
                                  // c.edtSku.text = '';
                                  // c.update();
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

                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: c.emailController,
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        // decoration: InputDecoration(labelText: 'User'),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,

                        // onEditingComplete: () => c.focusNode2.requestFocus(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      TextFormField(
                        controller: c.passwordController,
                        obscureText: true,
                        // focusNode: c.focusNode2,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        // decoration: InputDecoration(labelText: 'User'),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,

                        // onEditingComplete: () => c.submitLogin(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          (c.rightUser == '' || c.rightUser == '1')
                              ? ElevatedButton(
                                  onPressed: () async {
                                    await controller
                                        .loginUserWithEmailAndPassword();
                                  },
                                  child: const Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: mng_theme.primaryColor,
                                    ),
                                  ),
                                )
                              : Container(),
                          (c.rightUser == '' || c.rightUser == '0')
                              ? ElevatedButton(
                                  onPressed: () async {
                                    await controller
                                        .createUserWithEmailAndPassword();
                                  },
                                  child: const Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: mng_theme.primaryColor,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),

                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          await controller.createUserWithEmailAndPassword();
                        },
                        child: RichText(
                          text: TextSpan(
                            text: (c.rightUser == '')
                                ? 'Already have an account? '
                                : c.rightUser,
                            style: Theme.of(c.tcontext).textTheme.titleMedium,
                            children: [
                              TextSpan(
                                text: (c.rightUser == '')
                                    ? 'Please sign In'
                                    : ' SIGNUP by click here!',
                                style: Theme.of(c.tcontext)
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
                      //           // c.mc.refreshServer(ApiPath.apiPath);
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
                      //               animate: !c.helloSeen.value,
                      //               textStyle: TextStyle(
                      //                 color: Colors.lightBlue,
                      //                 fontSize: 24,
                      //                 fontWeight: FontWeight.w700,
                      //                 letterSpacing: 1.4,
                      //               ),
                      //               onEnd: () {
                      //                 c.showName.value = true;
                      //                 c.helloSeen.value = true;
                      //                 c.update();
                      //               },
                      //             ),
                      //             if (c.showName.value) ...[
                      //               SizedBox(height: 16),
                      //               Typewriter(
                      //                 'Morepos Store',
                      //                 animate: !c.nameSeen.value,
                      //                 textStyle: TextStyle(
                      //                   color: Colors.blueGrey[900],
                      //                   fontSize: 40,
                      //                   fontWeight: FontWeight.w700,
                      //                 ),
                      //                 onEnd: () {
                      //                   c.showPosition.value = true;
                      //                   c.nameSeen.value = true;

                      //                   c.update();
                      //                 },
                      //               ),
                      //             ],
                      //             if (c.showPosition.value) ...[
                      //               SizedBox(height: 16),
                      //               Typewriter(
                      //                 'Super store to anyone who is member',
                      //                 animate: !c.positionSeen.value,
                      //                 textStyle: TextStyle(
                      //                   color: Colors.blueGrey[900],
                      //                   fontSize: 20,
                      //                   fontWeight: FontWeight.w500,
                      //                 ),
                      //                 onEnd: () {
                      //                   c.showAbstract.value = true;
                      //                   c.positionSeen.value = true;
                      //                   c.update();
                      //                 },
                      //               ),
                      //             ],
                      //             if (c.showAbstract.value) ...[
                      //               SizedBox(height: 24),
                      //               Typewriter(
                      //                 "เราได้รวมเครื่องมือซื้อขาย ไว้ในระบบเดียวกันให้ภาคส่วนใช้งานอย่างสะดวกง่ายดาย\n"
                      //                 'เพียงท่านล๊อกอินเข้าสู่ระบบด้วยบัญชีแบบใด ท่านจะได้การทำงานตามบัญชีนั้นทันที.\n'
                      //                 'โดยแบ่งเป็นเป็นผู้จำหน่ายส่ง ร้านค้า หรือ สมาชิกร้านค้า.',
                      //                 animate: !c.abstractSeen.value,
                      //                 textStyle: TextStyle(
                      //                   color: Colors.grey,
                      //                   fontSize: 16,
                      //                   letterSpacing: 1.2,
                      //                   height: 1.3,
                      //                 ),
                      //                 onEnd: () {
                      //                   Future.delayed(
                      //                       Duration(milliseconds: 500), () {
                      //                     c.showHireMe.value = true;
                      //                     c.abstractSeen.value = true;
                      //                     c.update();
                      //                   });
                      //                 },
                      //               ),
                      //             ],
                      //             if (c.showHireMe.value) ...[
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
}
