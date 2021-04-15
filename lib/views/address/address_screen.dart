//theme and colors
import 'package:kmarket/views/address/add_new_address.dart';

import '../../theme/theme.dart';
//widget that use in screen
import '../../widgets/appbar_widget.dart';
import '../../widgets/sheared_materials_widgets.dart';

//pun and core package
import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
