import 'package:flutter/material.dart';

class CWCommonCheckBox extends StatefulWidget {
  final String selectedImage;
  final String unselectedImage;
  final Function(bool) onChanged;

  CWCommonCheckBox({required this.selectedImage, required this.unselectedImage, required this.onChanged});

  @override
  _CWCommonCheckBoxState createState() => _CWCommonCheckBoxState();
}

class _CWCommonCheckBoxState extends State<CWCommonCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChanged(isChecked);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          image: DecorationImage(
            image: isChecked ? AssetImage(widget.selectedImage) : AssetImage(widget.unselectedImage),
            fit: BoxFit.cover,
          ),
        ),
        width: 16, // 设置宽度
        height: 16, // 设置高度
      ),
    );
  }
}
