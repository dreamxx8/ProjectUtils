import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/utils/lc_styles.dart';


class KeyBoardInputDoneView extends StatelessWidget {

  const KeyBoardInputDoneView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          CupertinoButton(
            padding: const EdgeInsets.only(right: 12.0, top: 10.0, bottom: 8.0),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Text("Done",
                style: StRegular(
                    15, text_main,

                )
            ),
          )
        ],
      )
    );
  }
}