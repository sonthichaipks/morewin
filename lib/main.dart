import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:com.morepos.morewin/app/util/dependency.dart';
// import 'package:com.morepos.morewin/presentation/app.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/constants/theme_provider.dart';
import 'firebase_options.dart';
import 'presentation/app.dart';
import 'presentation/route/routes_controller.dart';

// Future<void> main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp() {
//     // final script = html.document.createElement('script') as html.ScriptElement;
//     // script.src = "https://cdn.jsdelivr.net/g/filesaver.js";
//     // html.document.body?.nodes.add(script);
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       // theme: new ThemeData(scaffoldBackgroundColor: mng_theme.secondaryColor),
//       theme: ThemeData(
//         primaryColor: mng_theme.primaryColor,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         dialogBackgroundColor: mng_theme.secondaryColor,
//         dividerColor: mng_theme.secondaryColor,
//       ),
//       getPages: Pages.routes,
//       defaultTransition: Transition.native,
//       initialRoute: Routes.homepage,
//     );
//   }
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // DenpendencyCreator.init();
  runApp(App());
}
