//widget tha is shared on almost all screen
import '../../widgets/sheared_materials_widgets.dart';

//theme and colors
import '../../theme/theme.dart';

//screen to navagit for it
import '../../views/auth/login_screen.dart';
import '../home/main_screen.dart';

// pub and core package
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const routeNamed = "registerScreen";

  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.05,
              ),
              anyImage(
                ctx: context,
                widthFactor: 0.4,
                heightFactor: 0.05,
              ),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.05,
              ),
              roundedTextContainerWithSvgIcon(
                  ctx: context,
                  widthFactor: 0.85,
                  usedColor: CustomColors.whiteColor,
                  imagePath: "assets/images/profile.png",
                  controller: email,
                  hintTxt: "Full Name"),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.025,
              ),
              roundedTextContainerWithSvgIcon(
                  ctx: context,
                  widthFactor: 0.85,
                  usedColor: CustomColors.whiteColor,
                  imagePath: "assets/images/telephone.png",
                  controller: email,
                  hintTxt: "Phone Number"),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.025,
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
                  imagePath: "assets/images/candidate.png",
                  controller: email,
                  hintTxt: "Set Location"),
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
                heightFactor: 0.075,
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
                  " REGISTER ",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: CustomColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.14,
              ),
              _questionToSignIn(signInCtx: context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _questionToSignIn({
    BuildContext signInCtx,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: Theme.of(signInCtx).textTheme.headline3.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            giveWidthSpace(ctx: signInCtx, widthFactor: 0.01),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.routeNamed);
              },
              child: Text(
                "Login",
                style: Theme.of(signInCtx).textTheme.headline3.copyWith(
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
