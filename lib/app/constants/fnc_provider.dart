import 'package:com.morepos.morewin/app/constants/core_package.dart';
// import 'package:com.morepos.morewin/utils/core_package.dart';

final oCc1 = NumberFormat("###0", "en_US");
final oCcy = NumberFormat("#,##0.00", "en_US");
final oCc4 = NumberFormat("#,##0.0000", "en_US");
final oCc0 = NumberFormat("#,##0", "en_US");
final cno = NumberFormat("##0.", "en_US");
final oCcP = NumberFormat("#0%", "en_US");
final dFc2 = NumberFormat("##0.00", "en_US");
final df = DateFormat('dd-MM-yyyy hh:mm');
final dfE = DateFormat('dd-MM-yyyy');
final dfYYMMDDHHmm = DateFormat('yyMMddHHmm');
final dfYYMMDD = DateFormat('yyMMdd');
final dfMMDDYYYY = DateFormat('MM/dd/yyyy');
final dayFormat = DateFormat('dd/MM/yyyy');
Color getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  } else {
    return Color(int.parse("0xffffffff"));
  }
}

String display_status(int orderStatus) {
  if (orderStatus == 0) {
    return 'New';
  } else if (orderStatus == 1) {
    return 'Receiving';
  } else {
    return 'Finished';
  }
}

DateTime getDateFromString(String datetimeStr) {
  DateTime dt = DateTime.parse(datetimeStr);
  return dt;
}

DateTime getDateFromStringDate(String sdate) {
  DateTime dt = DateTime.now();
  DateFormat format = new DateFormat("MM/dd/yyyy");

  try {
    dt = format.parse(sdate);
  } catch (e) {}
  return dt;
}

String getDayThaiFormat(String? dt) {
  String dts = '';
  var dtv = dt.toString().split(' ')[0].split('-');
  dts = dtv[2] + '/' + dtv[1] + '/' + dtv[0];
  return dts;
}

String getImgUrl(String Url) {
  String result = Url.replaceAll('[[', 'https://')
      .replaceAll('[', 'http://')
      .replaceAll('=', '/');
  if (result.split('/http://127.0.0.1/').length > 1) {
    result = result.replaceAll('http://127.0.0.1/', '');
  }
  return result;
}

double rof(double number) {
  return double.parse(number.toStringAsFixed(2));
}

double rupint(double number) {
  double result1 = double.parse(number.toStringAsFixed(2));
  double result0 = double.parse(number.toStringAsFixed(0));
  if (result1 > result0) {
    return result0 + 1;
  } else {
    return result0;
  }
}
