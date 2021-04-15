//widget tha is shared on almost all screen
import '../../widgets/sheared_materials_widgets.dart';

//theme and colors
import '../../theme/theme.dart';

//screen to navagit for it
import '../../views/auth/register_screen.dart';
import '../home/main_screen.dart';

// pub and core package
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeNamed = "loginScreen";

  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      backgroundColor: CustomColors.greyColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            giveHeightSpace(
              ctx: context,
              heightFactor: 0.2,
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    anyImage(
                      ctx: context,
                      widthFactor: 0.4,
                      heightFactor: 0.1,
                    ),
                    roundedTextContainerWithSvgIcon(
                        ctx: context,
                        widthFactor: 0.85,
                        usedColor: CustomColors.whiteColor,
                        imagePath: "assets/images/email.png",
                        controller: email,
                        hintTxt: "Email"),
                    giveHeightSpace(
                      ctx: context,
                      heightFactor: 0.025,
                    ),
                    roundedTextContainerWithSvgIcon(
                        ctx: context,
                        widthFactor: 0.85,
                        usedColor: CustomColors.whiteColor,
                        imagePath: "assets/images/password.png",
                        controller: password,
                        hintTxt: "Password"),
                    giveHeightSpace(
                      ctx: context,
                      heightFactor: 0.025,
                    ),
                    roundedTextButton(
                      ctx: context,
                      heightFactor: 0.06,
                      widthFactor: 0.25,
                      onTapFun: () {
                        Navigator.pushReplacementNamed(
                            context, MainScreen.routeNamed);
                      },
                      childWidget: Text(
                        " LOGIN ",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _forgetPassword(
                          ctx: context,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            giveHeightSpace(
              ctx: context,
              heightFactor: 0.1,
            ),
            _questionToSignUp(signUpCtx: context)
          ],
        ),
      ),
    );
  }

  Widget _forgetPassword({
    BuildContext ctx,
  }) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Text(
            "Forget Password ?",
            style: Theme.of(ctx).textTheme.headline3.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }

  Widget _questionToSignUp({
    BuildContext signUpCtx,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an acoount?",
              style: Theme.of(signUpCtx).textTheme.headline3.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            giveWidthSpace(ctx: signUpCtx, widthFactor: 0.01),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, RegisterScreen.routeNamed);
              },
              child: Text(
                "Register",
                style: Theme.of(signUpCtx).textTheme.headline3.copyWith(
                      fontWeight: FontWeight.bold,
                      color: CustomColors.mainColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
