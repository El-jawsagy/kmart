//screen to navagit for it
import '../views/auth/login_screen.dart';
import '../views/auth/register_screen.dart';

//widget that is used in all almost sreen
import '../widgets/sheared_materials_widgets.dart';

//theme and colors
import '../theme/theme.dart';

//pub and core package

import 'package:flutter/material.dart';

class OnbardingScreen extends StatelessWidget {
  static const namedroute = "onbardingScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.greyColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // giveHeightSpace(
            //   ctx: context,
            //   heightFactor: 0.25,
            // ),
            anyImage(
              ctx: context,
            ),
            giveHeightSpace(
              ctx: context,
              heightFactor: 0.02,
            ),
            roundedTextButton(
              ctx: context,
              onTapFun: () {
                Navigator.pushReplacementNamed(context, LoginScreen.routeNamed);
              },
              childWidget: Text(
                "LOGIN ",
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: CustomColors.whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            giveHeightSpace(
              ctx: context,
              heightFactor: 0.015,
            ),
            roundedTextButton(
              ctx: context,
              usedColor: CustomColors.whiteColor,
              onTapFun: () {
                Navigator.pushNamed(context, RegisterScreen.routeNamed);
              },
              border: BorderSide(
                  color: CustomColors.titleBlackColor,
                  style: BorderStyle.solid,
                  width: 1.8),
              childWidget: Text(
                "REGISTER",
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: CustomColors.titleBlackColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
