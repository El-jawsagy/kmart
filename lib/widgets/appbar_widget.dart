// this is widget shared in almost all screen in app=
// import './bottons_and_text_fields_materials.dart';

//theme and colors
import '../theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';

PreferredSizeWidget appBarWidget({
  BuildContext appCtx,
  final Widget title,
  final bool centertitle = true,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: CustomColors.transparentColor,
    elevation: 0,
    iconTheme: Theme.of(appCtx).iconTheme,
    centerTitle: centertitle,
    title: title,
    actions: actions,
  );
}
//  Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               size: 28,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           giveWidthSpace(
//             ctx: context,
//             widthFactor: 0.09,
//           ),
//           Expanded(
//             child: Text(
//               title,
//               style: Theme.of(context).textTheme.headline1.copyWith(
//                     color: CustomColors.titleBlackColor,
//                   ),
//               textAlign: TextAlign.start,
//             ),
//           ),
//         ],
//       ),
//     );