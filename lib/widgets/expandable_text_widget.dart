import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licores_app/utils/colors.dart';
import 'package:licores_app/widgets/small_text.dart';

import '../utils/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  // late type is to init later
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight/6.1;

  @override
  void initState() {
    super.initState();
    if(widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color: AppColors.paraColor, size: Dimensions.font16, text: firstHalf):
      Column(
          children: [
            SmallText(height: 1.8, color: AppColors.paraColor, size: Dimensions.font16, text: hiddenText?(firstHalf+"..."): (firstHalf+ secondHalf)),
            InkWell(
              onTap: () {
                setState(() {
                  hiddenText= !hiddenText;
                });
              },
              child: Row(
                children: [
                  SmallText( text: "Mostrar mas", color: AppColors.paraColor),
                  Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.mainColor,)
                ],
              ),
            )
          ],
      ),
    );
  }
}
