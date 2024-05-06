import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_browser/theme/base_colors.dart';
import 'package:image_browser/theme/colors_dark.dart';
import 'package:image_browser/theme/colors_light.dart';


/// 主题数据
/// 样式命名规范：控件名称+样式名称，默认样式不用加样式名称
class BaseThemeData {
  BaseThemeData(this.brightness);

  final Brightness brightness;

  BaseColors get colors =>
      brightness == Brightness.light ? colorsLight : colorsDark;

  BaseColors get colorsLight => const ColorsLight();

  BaseColors get colorsDark => const ColorsDark();

  SystemUiOverlayStyle get systemOverlay => brightness == Brightness.dark
      ? SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: colors.backgroundSecondary,
  )
      : SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: colors.backgroundSecondary,
  );

  ThemeData get systemTheme => ThemeData(
      primaryColor: colors.brand,
      fontFamily: familySatoshi,
      scaffoldBackgroundColor: colors.backgroundPrimary,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.backgroundPrimary,
        iconTheme: iconTheme,
        elevation: 0,
        systemOverlayStyle: systemOverlay,
        toolbarHeight: 64,
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: colors.backgroundMask,
        elevation: 0,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ));

  IconThemeData get iconTheme =>
      IconThemeData(color: colors.textTertiary, size: 24);


  static const String familySatoshi = 'Satoshi';

  /// 备用字体库
  static const List<String> familyFallback = [familySatoshi, 'PingFang SC'];

  TextStyle get f10W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f10W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f10W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 10,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f10W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f11W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f11W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f11W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 11,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f11W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 11,
      fontWeight: FontWeight.w700,
      height: 1.2);


  TextStyle get f12W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f12W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f12W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f12W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      height: 1.2);


  TextStyle get f13W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f13W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f13W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 13,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f13W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 13,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f14W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f14W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f14W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f14W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f15W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f15W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f15W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f15W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f16W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f16W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f16W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f16W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f17W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 17,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f17W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 17,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f17W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f17W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 17,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f18W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f18W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f18W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f18W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f20W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f20W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f20W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f20W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f22W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 22,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f22W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 22,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f22W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f22W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 22,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f24W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f24W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f24W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f24W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f25W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 25,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f25W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 25,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f25W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 25,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f25W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 25,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f26W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 26,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f26W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 26,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f26W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 26,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f26W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 26,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f28W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 28,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f28W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 28,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f28W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 28,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f28W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 28,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f32W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 32,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f32W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 32,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f32W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f32W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f36W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 36,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f36W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 36,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f36W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 36,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f36W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 36,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f45W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 45,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f45W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 45,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f45W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 45,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f45W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 45,
      fontWeight: FontWeight.w700,
      height: 1.2);

  TextStyle get f57W400 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 57,
      fontWeight: FontWeight.w400,
      height: 1.2);

  TextStyle get f57W500 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 57,
      fontWeight: FontWeight.w500,
      height: 1.2);

  TextStyle get f57W600 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 57,
      fontWeight: FontWeight.w600,
      height: 1.2);

  TextStyle get f57W700 => const TextStyle(
      fontFamilyFallback: familyFallback,
      fontSize: 57,
      fontWeight: FontWeight.w700,
      height: 1.2);
}
