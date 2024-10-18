import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:com.morepos.morewin/app/util/dependency.dart';
import 'package:com.morepos.morewin/presentation/app.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DenpendencyCreator.init();
  runApp(App());
}
