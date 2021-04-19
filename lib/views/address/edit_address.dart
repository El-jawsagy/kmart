//screens that navigate for it
import '../../views/address/address_screen.dart';
import '../../views/home/main_screen.dart';

//theme and colors
import '../../theme/theme.dart';

//widget that use in screen
import '../../widgets/appbar_widget.dart';
import '../../widgets/sheared_materials_widgets.dart';

//provider
import '../../providers/address/address_provider.dart';
//pun and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditAddressScreen extends StatelessWidget {
  static final String routeNamed = "editAddressScreen";

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
    Map oldAddress = ModalRoute.of(context).settings.arguments as Map;
    lineOneController.text = oldAddress["address"]["title"];
    lineTwoController.text = oldAddress["address"]["title_two"];
    lineCityController.text = oldAddress["address"]["city"];
    lineStateController.text = oldAddress["address"]["state"];
    linePostalCodeController.text = oldAddress["address"]["postal_code"];
    lineCountryController.text = oldAddress["address"]["country"];
    linePhoneController.text = oldAddress["address"]["phone"];

    return Scaffold(
      appBar: appBarWidget(
        appCtx: context,
        title: Text(
          "Edit Address",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Edit your address",
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.015,
              ),
              Text(
                "please change value ftom the form below and save",
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
              Consumer<Address>(
                builder: (_, addressProvider, child) {
                  return roundedTextButton(
                    ctx: context,
                    heightFactor: 0.05,
                    widthFactor: 0.3,
                    onTapFunc: () {
                      if (lineOneController.text !=
                              oldAddress["address"]["title"] ||
                          lineTwoController.text !=
                              oldAddress["address"]["title_two"] ||
                          lineCityController.text !=
                              oldAddress["address"]["city"] ||
                          lineStateController.text !=
                              oldAddress["address"]["state"] ||
                          linePostalCodeController.text !=
                              oldAddress["address"]["postal_code"] ||
                          lineCountryController.text !=
                              oldAddress["address"]["country"] ||
                          linePhoneController.text !=
                              oldAddress["address"]["phone"]) {
                        addressProvider.updateAddressToList(
                            id: oldAddress["id"],
                            address: {
                              "title": lineOneController.text,
                              "title_two": lineTwoController.text,
                              "city": lineCityController.text,
                              "state": lineStateController.text,
                              "postal_code": linePostalCodeController.text,
                              "country": lineCountryController.text,
                              "phone": linePhoneController.text,
                            });
                        lineOneController.clear();
                        lineOneController.clear();
                        lineCityController.clear();
                        lineStateController.clear();
                        linePostalCodeController.clear();
                        lineCountryController.clear();
                        linePhoneController.clear();
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            AddressScreen.routeNamed,
                            ModalRoute.withName(MainScreen.routeNamed));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "you need to modify your address to be able for save ",
                            ),
                          ),
                        );
                      }
                    },
                    childWidget: Text(
                      "Save",
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            fontWeight: FontWeight.w400,
                            color: CustomColors.whiteColor,
                          ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
