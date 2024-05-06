import 'package:flutter/material.dart';

abstract class BaseColors {
  const BaseColors();

  /// 固定色
  Color get alwaysBlack;
  Color get alwaysWhite;

  /// 背景色
  Color get backgroundPrimary;// 默认页面底层背景
  Color get backgroundSecondary;// 主要容器背景,次要层级页面背景
  Color get backgroundTertiary;// 三级容器背景, 下拉框选中背景
  Color get brand;// 品牌色背景
  Color get brandLight;// 品牌色背景
  Color get backgroundMask;// 蒙层

  /// 文字/图标颜色
  Color get textPrimary;
  Color get textSecondary;
  Color get textTertiary;
  Color get textQuarterary;
  Color get textWhite;
  Color get textBrand;

  Color get iconPrimary;
  Color get iconSecondary;
  Color get iconTertiary;
  Color get iconWhite;
  Color get iconBrand;

  Color get btnBgPrimary;
  Color get btnBgSecondary;
  Color get btnBgTertiary;
  Color get btnBgQuarterary;
  Color get btnBgWhite;

  Color get btnTextPrimary;
  Color get btnTextSecondary;
  Color get btnTextTertiary;
  Color get btnTextQuarterary;

  /// Stroke 描边
  Color get strokePrimary;
  Color get strokeSecondary;

  /// Function 功能/品牌色
  Color get functionBuy;
  Color get functionSell;

  Color get success;
  Color get warning;
  Color get negative;
  Color get info;



}
