//theme and colors
import '../../theme/theme.dart';
//widget that use in screen
import '../../widgets/appbar_widget.dart';
import '../../widgets/sheared_materials_widgets.dart';

//pun and core package
import 'package:flutter/material.dart';

class AddNewAddressScreen extends StatelessWidget {
  static final String routeNamed = "addNewAddressScreen";

  final TextEditingController lineOneController = TextEditingController();
  final TextEditingController lineTwoController = TextEditingController();
  final TextEditingController lineCityController = TextEditingController();
  final TextEditingController lineStateController = TextEditingController();
  final TextEditingController linePostalCodeController =
      TextEditingController();
  final TextEditingController lineCountryController = TextEditingController();
  final TextEditingController linePhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
          appCtx: context,
          title: Text(
            "New Address",
            style: Theme.of(context).textTheme.headline2,
          ),
          actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Add Address",
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.015,
              ),
              Text(
                "please fill the form below",
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.02,
              ),
              roundedTextContainer(
                ctx: context,
                controller: lineOneController,
                hintTxt: "line 1",
                widthFactor: 0.85,
                usedColor: CustomColors.subTitleColor.withOpacity(
                  .15,
                ),
              ),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.015,
              ),
              roundedTextContainer(
                ctx: context,
                controller: lineTwoController,
                hintTxt: "line 2",
                widthFactor: 0.85,
                usedColor: CustomColors.subTitleColor.withOpacity(
                  .15,
                ),
              ),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.015,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    roundedTextContainer(
                      ctx: context,
                      controller: lineCityController,
                      hintTxt: "city",
                      widthFactor: 0.4,
                      usedColor: CustomColors.subTitleColor.withOpacity(
                        .15,
                      ),
                    ),
                    giveHeightSpace(
                      ctx: context,
                      heightFactor: 0.015,
                    ),
                    roundedTextContainer(
                      ctx: context,
                      controller: lineStateController,
                      hintTxt: "state",
                      widthFactor: 0.4,
                      usedColor: CustomColors.subTitleColor.withOpacity(
                        .15,
                      ),
                    ),
                  ],
                ),
              ),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.015,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    roundedTextContainer(
                      ctx: context,
                      controller: linePostalCodeController,
                      hintTxt: "postal code",
                      widthFactor: 0.4,
                      usedColor: CustomColors.subTitleColor.withOpacity(
                        .15,
                      ),
                    ),
                    giveHeightSpace(
                      ctx: context,
                      heightFactor: 0.015,
                    ),
                    roundedTextContainer(
                      ctx: context,
                      controller: lineCountryController,
                      hintTxt: "country",
                      widthFactor: 0.4,
                      usedColor: CustomColors.subTitleColor.withOpacity(
                        .15,
                      ),
                    ),
                  ],
                ),
              ),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.015,
              ),
              roundedTextContainer(
                ctx: context,
                controller: linePhoneController,
                hintTxt: "phone",
                widthFactor: 0.85,
                usedColor: CustomColors.subTitleColor.withOpacity(
                  .15,
                ),
              ),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.035,
              ),
              roundedTextButton(
                ctx: context,
                heightFactor: 0.05,
                widthFactor: 0.3,
                childWidget: Text(
                  "Add",
                  style: Theme.of(context).textTheme.headline2.copyWith(
                        fontWeight: FontWeight.w400,
                        color: CustomColors.whiteColor,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
