import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';

class CWCommonExpansionTile extends StatefulWidget {
  final String title;
  final String subTitle;
  final String? trailingDefaultTitle;
  final String? trailingSeletcedTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final TextStyle? trailingTitleStyle;
  final bool initiallyExpanded;

  CWCommonExpansionTile(
      {required this.title,
      required this.subTitle,
      this.trailingDefaultTitle,
      this.trailingSeletcedTitle,
      this.initiallyExpanded = false,
      this.titleStyle,
      this.subTitleStyle,
      this.trailingTitleStyle});

  @override
  _CWCommonExpansionTileState createState() => _CWCommonExpansionTileState();
}

class _CWCommonExpansionTileState extends State<CWCommonExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
          title: Text(
            widget.title ?? "",
            style: widget.titleStyle ??
                bfGlobal.themeColors.textPrimary.f16W700//TextStyle(fontSize: 14, color: bfGlobal.themeColors.textPrimary),
          ),
          trailing: Text(
            _isExpanded
                ? widget.trailingSeletcedTitle ?? '收起'
                : widget.trailingSeletcedTitle ?? '全部',
            style: widget.trailingTitleStyle ??
                bfGlobal.themeColors.textSecondary.f14W500//TextStyle(fontSize: 14, color: Color(0xFF949494)),
          ),
          initiallyExpanded: widget.initiallyExpanded,
          children: [
            Container(
              child: ListTile(
                title: Text(
                  widget.subTitle ?? "",
                  style: widget.subTitleStyle ??
                      bfGlobal.themeColors.textSecondary.f14W400,
                ),
              ),
            ),
          ],
          onExpansionChanged: (isExpanded) {
            setState(() {
              _isExpanded = isExpanded;
            });
          },
      ),

    );
  }
}
