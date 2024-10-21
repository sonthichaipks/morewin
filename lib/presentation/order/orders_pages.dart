import 'package:com.morepos.morewin/data/models/mngdata/prFormula.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../app/constants/responsive.dart';
import '../../app/constants/theme_provider.dart';
import '../widgets/common/home_background_painter.dart';
import '../widgets/common/nav_bar.dart';
import '../widgets/dropdown_search.dart';
import 'orders_controller.dart';
import 'orders_prodlist.dart';

class OrderPage extends GetView<OrderController> {
  OrderPage();

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: mng_theme.secondaryColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: GetBuilder<OrderController>(
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

  Widget _restbody(OrderController controller, bool isDesktop) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        const SizedBox(height: 50),
        Container(
            margin: const EdgeInsets.fromLTRB(10, 3, 3, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 4,
                  child: DropdownSearch<PrFormula>.multiSelection(
                    key: controller.dropDownAprodKeySearch,
                    asyncItems: (String? filter) =>
                        controller.getPrFormulaSku(filter!),
                    clearButtonProps: const ClearButtonProps(isVisible: true),
                    popupProps: PopupPropsMultiSelection.menu(
                      showSelectedItems: false,
                      isFilterOnline: true,
                      itemBuilder: ItemBuilderPRFDropdown,
                      showSearchBox: true,
                      searchFieldProps: TextFieldProps(
                        // controller: controller.edtSku,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              // controller.edtSku.text = '';
                            },
                          ),
                        ),
                      ),
                    ),
                    compareFn: (item, selectedItem) =>
                        item.skuCode == selectedItem.skuCode,
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: 'หรือ เลือกลุ่มสินค้า  *',
                        filled: true,
                        fillColor: mng_theme.secondaryColor,
                      ),
                    ),
                    dropdownBuilder: SelectionPRFdropdown,
                    onChanged: (selectedValue) async {
                      if (selectedValue.isEmpty) {
                        // controller.edtSku.text = '';
                      } else {
                        // controller.modeList =
                        //     0; //when add new this PO will be trial
                        // await controller.addPOlist(selectedValue);
                        // Future.delayed(Duration.zero).whenComplete(() {
                        //   controller.edtSku.text = '';
                        // });
                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    width: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('เลือกสินค้า แล้ว => '),
                        SizedBox(width: 3),
                        OutlinedButton(
                          onPressed: controller.addBasket,
                          child: const Text(
                            'หยิบใส่ตะกร้า',
                            style: TextStyle(color: mng_theme.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        ProdListCard(),
      ],
    ));
  }

  Widget SelectionPRFdropdown(
      BuildContext context, List<PrFormula> selectedItems) {
    if (selectedItems.isEmpty) {
      return const ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(),
        title: Text("ทำการเลือกใหม่"),
      );
    }

    return Wrap(
      children: selectedItems.map((e) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            alignment: Alignment.topCenter,
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              // leading: CircleAvatar(
              //   backgroundImage: NetworkImage(e.avatar),
              // ),
              title: Text('${e.skuDesc!} ,${e.skuCode!}'),
              subtitle: const Text(''),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget ItemBuilderPRFDropdown(
      BuildContext context, PrFormula item, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      // decoration: !isSelected
      //     ? null
      //     : BoxDecoration(
      //         border: Border.all(color: Theme.of(context).primaryColor),
      //         borderRadius: BorderRadius.circular(5),
      //         color: Colors.white,
      //       ),
      child: ListTile(
        selected: isSelected,
        title: Text('${item.skuDesc!} ,${item.skuCode!}'),
        subtitle: const Text(''),
        // leading: CircleAvatar(
        //   backgroundImage: NetworkImage(item.avatar),
        // ),
      ),
    );
  }
}
