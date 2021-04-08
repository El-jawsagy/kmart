//theme and colors
import '../theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Divider(
          height: 10,
          color: CustomColors.titleBlackColor,
        ),
      ),
    );
  }
}
