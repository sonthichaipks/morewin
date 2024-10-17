 import 'dart:io';

import 'package:path_provider/path_provider.dart';

var encryptionKey ='RaXR3U7Xj1zeJbvGWWgYcAoM0XlIWQ2F5Zfq/GDR9x+8FvV4mFGB/ilgafnQfbDoE5DEXRKHDu3yAwnB1lrJWg';
   String encrypt(String data) {
    var charCount = data.length;
    var encrypted = [];
    var kp = 0;
    var kl = encryptionKey.length - 1;

    for (var i = 0; i < charCount; i++) {
      var other = data[i].codeUnits[0] ^ encryptionKey[kp].codeUnits[0];
      encrypted.insert(i, other);
      kp = (kp < kl) ? (++kp) : (0);
    }
    return dataToString(encrypted);
  }

  String decrypt(data) {
    return encrypt(data);
  }

  String dataToString(data) {
    var s = "";
    for (var i = 0; i < data.length; i++) {
      s += String.fromCharCode(data[i]);
    }
    return s;
  }

   Future<String> get _localPath async {
    var directory = await getExternalStorageDirectory();
    directory ??= await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/sample.txt');
  }

  Future<File> write(String data) async {
    final file = await _localFile;
    // Write the file in append mode so it would append the data to existing file
    // if it already exists
    return file.writeAsString('$data\n', mode: FileMode.append);
  }