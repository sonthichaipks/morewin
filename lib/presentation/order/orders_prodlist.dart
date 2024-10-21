import 'package:carousel_slider/carousel_slider.dart';
// import 'package:momoOrder/utils/fnc_provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../app/constants/core_package.dart';
import '../../app/constants/fnc_provider.dart';
import '../../app/constants/responsive.dart';
import '../../data/models/promoion_model.dart';
import '../../domain/entities/promo_details.dart';
import '../widgets/common/common_inputs.dart';
import 'orders_controller.dart';

// import '../../../dashboard/data/promo_details.dart';
// import '../../../dashboard/model/promo_model.dart';
// import '../../../utils/core_package.dart';
// import '../../../utils/responsive.dart';
// import '../../../widgets/posbtns/numinput.dart';

class ProdListCard extends StatefulWidget {
  const ProdListCard({super.key});
  // final ProdListModel prf ;

  @override
  // ignore: library_private_types_in_public_api
  _ProdListCardState createState() => _ProdListCardState();
}

class _ProdListCardState extends State<ProdListCard> {
// class ProdListCard extends StatelessWidget {
  // ProdListCard({super.key});
  final OrderController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    // ProdSamples prodList = ProdSamples();
    controller.prodList = ProdSamples();
    return CarouselSlider(
      items: [
        SizedBox(
          width: Get.width,
          child: MasonryGridView.count(
              // physics: NeverScrollableScrollPhysics(), // it can use scollable if upper widget dont cause any issue
              shrinkWrap: true,
              crossAxisCount: (isDesktop) ? 8 : 4,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              itemCount: controller.prodList.prodData.length,
              itemBuilder: (context, index) {
                ProdListModel prf = controller.prodList.prodData[index];
                return Card(
                  elevation: 1.0,
                  shadowColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        child: Image.asset(
                          prf.icon!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      (prf.favorite == 1)
                          ? IconButton(
                              onPressed: () {
                                prf.favorite = 0;
                                setState(() {});
                                // controller.update();
                              },
                              icon: Image.asset(
                                'assets/redheart.png',
                                fit: BoxFit.fill,
                                width: 10,
                                height: 10,
                              ))
                          : IconButton(
                              onPressed: () {
                                prf.favorite = 1;
                                setState(() {});
                                // controller.update();
                              },
                              icon: Image.asset(
                                'assets/blnkheart.png',
                                fit: BoxFit.fill,
                                width: 10,
                                height: 10,
                              )),
                      Text(
                        prf.pludesc!,
                        style: TextStyle(fontSize: (isDesktop) ? 12 : 9),
                      ),
                      Text(
                        'รหัสสินค้า ${prf.plucode!}',
                        style: TextStyle(fontSize: (isDesktop) ? 12 : 9),
                      ),
                      Text(
                        '${oCcy.format(prf.price)}บาท/${prf.pluunit!}',
                        style: TextStyle(fontSize: (isDesktop) ? 12 : 9),
                      ),
                      NumberInput(
                        prf: prf,
                      ),
                    ],
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
