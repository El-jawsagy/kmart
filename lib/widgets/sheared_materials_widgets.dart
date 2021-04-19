//theme and colors
import '../theme/theme.dart';

//pub and core package

import 'package:flutter/material.dart';

Widget anyImage({
  BuildContext ctx,
  String imagePath = "assets/images/logo.png",
  double widthFactor = .6,
  double heightFactor = 0.2,
}) {
  return Image.asset(
    imagePath,
    width: MediaQuery.of(ctx).size.width * widthFactor,
    height: MediaQuery.of(ctx).size.height * heightFactor,
    fit: BoxFit.contain,
  );
}

Widget roundedTextButton({
  BuildContext ctx,
  Widget childWidget,
  Color usedColor = CustomColors.mainColor,
  Function onTapFunc,
  BorderSide border,
  double widthFactor = .9,
  double heightFactor = .07,
  double radiusValue = 7,
}) {
  return TextButton(
    onPressed: () => onTapFunc(),
    style: TextButton.styleFrom(
      shadowColor: CustomColors.subTitleColor,
      backgroundColor: usedColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radiusValue,
          ),
        ),
      ),
      side: border,
      minimumSize: Size(
        MediaQuery.of(ctx).size.width * widthFactor,
        MediaQuery.of(ctx).size.height * heightFactor,
      ),
    ),
    child: childWidget,
  );
}

// Text(
//           "title",
//           style: Theme.of(context).textTheme.headline1.copyWith(
//                 color: CustomColors.titleBlackColor,
//               ),
//           textAlign: TextAlign.start,
//         ),
Widget roundedTextContainerWithSvgIcon({
  BuildContext ctx,
  Color usedColor,
  double widthFactor = .8,
  TextEditingController controller,
  String imagePath,
  String hintTxt,
}) {
  return Container(
    width: MediaQuery.of(ctx).size.width * widthFactor,
    height: MediaQuery.of(ctx).size.height * .07,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
        color: usedColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: MediaQuery.of(ctx).size.width * 0.065,
          height: MediaQuery.of(ctx).size.height * .04,
          fit: BoxFit.contain,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4),
          width: MediaQuery.of(ctx).size.width * 0.75,
          child: Center(
            child: TextField(
              //controller
              controller: controller,
              style: TextStyle(
                color: CustomColors.titleBlackColor,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
              decoration: InputDecoration(
                //text hint
                hintText: hintTxt,
                hintStyle: TextStyle(
                  color: CustomColors.titleBlackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
                //edit color and shap of text
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget roundedTextContainer({
  BuildContext ctx,
  Color usedColor,
  double widthFactor = .8,
  TextEditingController controller,
  String hintTxt,
}) {
  return Container(
    width: MediaQuery.of(ctx).size.width * widthFactor,
    height: MediaQuery.of(ctx).size.height * .07,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      color: usedColor,
    ),
    child: Center(
      child: TextField(
        //controller
        controller: controller,
        decoration: InputDecoration(
          //text hint
          hintText: hintTxt,
          hintStyle: TextStyle(
            color: CustomColors.titleBlackColor,
            fontWeight: FontWeight.w500,
          ),
          //edit color and shap of text
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget giveHeightSpace({
  BuildContext ctx,
  double heightFactor = .05,
}) {
  return SizedBox(
    height: MediaQuery.of(ctx).size.height * heightFactor,
  );
}

Widget giveWidthSpace({
  BuildContext ctx,
  double widthFactor = .05,
}) {
  return SizedBox(
    width: MediaQuery.of(ctx).size.height * widthFactor,
  );
}
