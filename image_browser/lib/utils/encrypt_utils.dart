import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:encrypt/encrypt.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:image_browser/constant/value_const.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

const int SIZE_50M = 50 * 1024 * 1024;

class EncryptUtils {
  ///  加密
  static encryption(content) {
    final parser = RSAKeyParser();
    RSAPublicKey publicKey =
        parser.parse(CommonConst.COINW_PUBLIC_KEY1) as RSAPublicKey;
    final encrypter = Encrypter(RSA(publicKey: publicKey));

    return encrypter.encrypt(content).base64;
  }

  static encryptionWeb(content) {
    final parser = RSAKeyParser();
    RSAPublicKey publicKey =
    parser.parse(CommonConst.COINW_PUBLIC_KEY2) as RSAPublicKey;
    final encrypter = Encrypter(RSA(publicKey: publicKey));

    return encrypter.encrypt(content).base64;
  }

  static decode(content) {
    final parser = RSAKeyParser();
    RSAPrivateKey publicKey =
    parser.parse(CommonConst.NET_RSA_KEY1) as RSAPrivateKey;
    final encrypter = Encrypter(RSA(privateKey: publicKey));

    return encrypter.encrypt(content).base64;
  }

  ///Generate MD5 hash
  static String generateMd5(String url) {
    var content = const Utf8Encoder().convert(url);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  static Future<String> toMD5(String filePath) async {
    final file = File(filePath);
    final fileLength = file.lengthSync();

    final sFile = await file.open();
    try {
      final output = AccumulatorSink<Digest>();
      final input = md5.startChunkedConversion(output);
      int x = 0;
      const chunkSize = SIZE_50M;
      while (x < fileLength) {
        final tmpLen = fileLength - x > chunkSize ? chunkSize : fileLength - x;
        input.add(sFile.readSync(tmpLen));
        x += tmpLen;
      }
      input.close();

      final hash = output.events.single;
      return hash.toString();
    } finally {
      unawaited(sFile.close());
    }
  }
}
