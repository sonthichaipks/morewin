import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:com.morepos.morewin/presentation/home/home_controller.dart';
import '../../app/constants/responsive.dart';
import '../../app/constants/theme_provider.dart';
import '../widgets/common/home_background_painter.dart';
import '../widgets/common/nav_bar.dart';
import '../widgets/promo_slide.dart';

class HomePage extends GetView<HomeController> {
  HomePage();

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: mng_theme.secondaryColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: GetBuilder<HomeController>(
              // initState: controller.init(context),
              init: controller,
              builder: (context) {
                return Scaffold(
                  body: Stack(
                    children: [
                      CustomPaint(
                          painter: HomeBackgroundPainter(Colors.lightBlue),
                          size: Size.infinite),
                      Container(
                        // width: Get.width,
                        // height: Get.height,
                        child: _restbody(controller,
                            isDesktop), //controller.pages[controller.selectedIndex.value],
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Navbar(),
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}

Widget _restbody(HomeController controller, bool isDesktop) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          // HeaderWidget(controller),
          croseeslides(isDesktop),
          PromoSlidesCard(),
          const SizedBox(height: 2),
        ],
      ),
    ),
  );
}

Widget croseeslides(bool isDesktop) {
  List imageList = [
    'assets/proimgs/proBig1.png',
    'assets/proimgs/proBig2.png',
    'assets/icons/momo_logo.jpg',
    'assets/proimgs/proBig3.png',
  ];
  return Center(
    child: CarouselSlider(
      options: CarouselOptions(
        height: (isDesktop) ? Get.height * 0.5 : Get.height * 0.3,
        initialPage: 0,
        autoPlay: true,
        reverse: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 2000),
        // onPageChanged: (index, reason) => _currentIndex = index,
        // pauseAutoPlayOnTouch: Duration(seconds: 10),
        // scrollDirection: Axis.horizontal,
      ),
      items: imageList
          .map(
            (item) => SizedBox(
              width: (isDesktop) ? Get.width * 0.45 : Get.width * 0.9,
              height: (isDesktop) ? Get.width * 0.4 : Get.height * 0.5,
              child: Card(
                elevation: 1.0,
                shadowColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    item,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
}

Widget HeaderWidget(HomeController c, bool isDesktop) {
  return Row(
    children: [
      Expanded(
        flex: 4,
        child: SizedBox(
          // width: 10.w,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: mng_theme.backgroundColor,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: mng_theme.primaryColor),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              hintText: 'ค้นหาสินค้า',
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
                size: 21,
              ),
            ),
          ),
        ),
      ),
      // Expanded(
      // flex: 5,
      // child: frmTitle(c),
      // ),
    ],
  );
}
