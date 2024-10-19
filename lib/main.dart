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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}
