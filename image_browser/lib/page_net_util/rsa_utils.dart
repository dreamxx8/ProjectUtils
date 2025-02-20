
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:pointycastle/export.dart';
import 'package:encrypt/encrypt.dart';

class RSAUtils{

  static String rsaParse(String encryptedDataString){
    String privateKeyString = CommonConst.NET_RSA_KEY1;
    // 解析私钥
    RSAPrivateKey privateKey = RSAKeyParser().parse(privateKeyString) as RSAPrivateKey;

    // 创建解密器
    final decryptor = Encrypter(RSA(privateKey: privateKey));

    // 解码 Base64 密文
    final encrypted = Encrypted.fromBase64(encryptedDataString);

    // 分段解密
    final decryptedBytes = rsaDecryptInBlocks(encrypted.bytes, privateKey);

    // 将解密后的字节转换为字符串
    final decryptedText = utf8.decode(decryptedBytes);


    return decryptedText;
  }

  /// 分段解密函数
  static List<int> rsaDecryptInBlocks(List<int> encryptedBytes, RSAPrivateKey privateKey) {

    final blockSize = (privateKey.modulus?.bitLength ?? 0) ~/ 8; // 计算每块的大小
    final decryptor = Encrypter(RSA(privateKey: privateKey));
    final decryptedBytes = <int>[];

    // 逐块解密
    for (var i = 0; i < encryptedBytes.length; i += blockSize) {
      final block = encryptedBytes.sublist(i, i + blockSize > encryptedBytes.length ? encryptedBytes.length : i + blockSize);
      final decryptedBlock = decryptor.decryptBytes(Encrypted(Uint8List.fromList(block)));
      decryptedBytes.addAll(decryptedBlock);
    }

    return decryptedBytes;
  }



}