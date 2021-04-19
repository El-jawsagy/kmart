//theme and colors
import 'package:kmarket/views/address/edit_address.dart';

import '../../theme/theme.dart';

//screen that we navigator for it
import '../../views/address/add_new_address.dart';

//widget that use in screen
import '../../widgets/appbar_widget.dart';
import '../../widgets/sheared_materials_widgets.dart';

//providers
import '../../providers/address/address_provider.dart';
//pun and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatelessWidget {
  static final String routeNamed = "addressScreen";

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
            "My Addresses",
            style: Theme.of(context).textTheme.headline2,
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, AddNewAddressScreen.routeNamed);
                })
          ]),
      body: Consumer<Address>(
        builder: (_, addressProvider, child) {
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: addressProvider.addressItems.length > 0
                  ? ListView.builder(
                      itemBuilder: (ctx, index) {
                        Map address =
                            addressProvider.addressItems[index]["address"];
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      address["title"],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          .copyWith(
                                            color: CustomColors.subTitleColor,
                                          ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            EditAddressScreen.routeNamed,
                                            arguments: addressProvider
                                                .addressItems[index]);
                                      },
                                    )
                                  ],
                                ),
                                Text(
                                  address["title_two"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
                                        color: CustomColors.subTitleColor,
                                      ),
                                ),
                                Text(
                                  "${address["city"]} , ${address["state"]}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
                                        color: CustomColors.subTitleColor,
                                      ),
                                ),
                                Text(
                                  "${address["country"]} ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
                                        color: CustomColors.subTitleColor,
                                      ),
                                ),
                                Text(
                                  "${address["postal_code"]} ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
                                        color: CustomColors.subTitleColor,
                                      ),
                                ),
                                Text(
                                  "${address["phone"]}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
                                        color: CustomColors.subTitleColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: addressProvider.addressItems.length,
                    )
                  : emptyScreenAddress(
                      context,
                    ));
        },
      ),
    );
  }

  Widget emptyScreenAddress(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: anyImage(
            ctx: context,
            widthFactor: 0.4,
            heightFactor: .25,
            imagePath: "assets/images/candidate.png",
          ),
        ),
        Text(
          " You haven't any address till now ",
          style: Theme.of(context).textTheme.headline3,
        ),
        giveHeightSpace(
          ctx: context,
          heightFactor: 0.03,
        ),
        // roundedTextButton(
        //   ctx: context,
        //   // onTapFun: () =>
        //   // Navigator.pushReplacementNamed(context, MainScreen.routeNamed),
        //   childWidget: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 4.0),
        //     child: Text(
        //       "back to explore products",
        //       style: Theme.of(context).textTheme.headline3.copyWith(
        //             color: CustomColors.whiteColor,
        //           ),
        //     ),
        //   ),
        //   widthFactor: 0.3,
        //   heightFactor: .05,
        // ),
      ],
    );
  }
}
