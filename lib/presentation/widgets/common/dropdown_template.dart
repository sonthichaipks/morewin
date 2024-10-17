import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:morewin/data/models/mngdata/QryTables.dart';

import '../../../app/constants/core_package.dart';
import '../../../app/constants/theme_provider.dart';

Widget ItemBuilderPDGOfDropdown(
    BuildContext context, PrQryTables item, bool isSelected) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: !isSelected
        ? null
        : BoxDecoration(
            border: Border.all(color: mng_theme.secondaryColor),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
    child: ListTile(
      iconColor: mng_theme.secondaryColor,
      selected: isSelected,
      title: Text(item.code),
      subtitle: Text(''),
      // leading: CircleAvatar(
      //   backgroundImage: NetworkImage(item.avatar),
      // ),
    ),
  );
}

Widget SelectionAPOfdropdown(
    BuildContext context, List<PrQryTables> selectedItems) {
  if (selectedItems.isEmpty) {
    return ListTile(
      tileColor: mng_theme.secondaryColor,
      iconColor: mng_theme.secondaryColor,
      selectedTileColor: mng_theme.primaryColor,
      splashColor: mng_theme.secondaryColor,
      contentPadding: const EdgeInsets.all(0),
      leading: Icon(
        Icons.person_2_outlined,
        color: mng_theme.primaryColor,
      ),
      title: Text("ทำการเลือกใหม่"),
    );
  }

  return Wrap(
    children: selectedItems.map((e) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(color: mng_theme.secondaryColor),
          alignment: Alignment.topCenter,
          child: ListTile(
            tileColor: mng_theme.secondaryColor,
            iconColor: mng_theme.secondaryColor,
            selectedTileColor: mng_theme.primaryColor,
            splashColor: mng_theme.secondaryColor,
            contentPadding: EdgeInsets.all(0),
            leading: Icon(
              Icons.person_2_outlined,
              // FontAwesomeIcons.groupArrowsRotate,
              color: mng_theme.primaryColor,
            ),
            title: Text(e.code),
            subtitle: Text(''),
          ),
        ),
      );
    }).toList(),
  );
}
