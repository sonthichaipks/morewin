import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../app/constants/responsive.dart';
import '../../data/models/promoion_model.dart';
import '../../domain/entities/promo_details.dart';
import '../home/home_controller.dart';

class PromoSlidesCard extends StatelessWidget {
  PromoSlidesCard({super.key});
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    PromoDetails promoDetails = PromoDetails();
  final isDesktop = Responsive.isDesktop(context);

    return CarouselSlider(
      items: [
        SizedBox(
          width: Get.width,
          child: MasonryGridView.count(
              // physics: NeverScrollableScrollPhysics(), // it can use scollable if upper widget dont cause any issue
              shrinkWrap: true,
              crossAxisCount: (isDesktop)?4:2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              itemCount: promoDetails.promoData.length,
              itemBuilder: (context, index) {
                PromotionModel prf = promoDetails.promoData[index];
                return Card(
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
                      prf.icon!,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }),
        ),
        Container(
          color: Colors.deepPurple,
        ),
        Container(
          color: Colors.deepOrange,
        ),
      ],
      options: CarouselOptions(aspectRatio: 1, viewportFraction: 1),
    );
  }
}
