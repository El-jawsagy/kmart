//theme and colors
import '../../../theme/theme.dart';
//widget that sheared in all
import '../../../widgets/sheared_materials_widgets.dart';
//pub and core package
import 'package:flutter/material.dart';

class ProfilePageWidget extends StatelessWidget {
  const ProfilePageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
              giveWidthSpace(
                ctx: context,
                widthFactor: 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "El-jawsagy",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        color: CustomColors.mainColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  giveHeightSpace(
                    ctx: context,
                    heightFactor: 0.01,
                  ),
                  Text(
                    "mahmoudragab0809@gmail.com",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        color: CustomColors.mainColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ),
        giveHeightSpace(
          ctx: context,
          heightFactor: 0.05,
        ),
        rowOfScreenRelatedWithUser(
          userCtx: context,
          image: "assets/images/candidate.png",
          title: "My Adderss",
        ),
        rowOfScreenRelatedWithUser(
          userCtx: context,
          image: "assets/images/add-to-favorites.png",
          title: "My Favorite",
        ),
        rowOfScreenRelatedWithUser(
          userCtx: context,
          image: "assets/images/conversation.png",
          title: "About Us",
        ),
        rowOfScreenRelatedWithUser(
          userCtx: context,
          image: "assets/images/call-center.png",
          title: "Customer Service",
        ),
        rowOfScreenRelatedWithUser(
          userCtx: context,
          image: "assets/images/exit.png",
          title: "Log Out",
        ),
      ],
    );
  }

  Padding rowOfScreenRelatedWithUser(
      {BuildContext userCtx, String image, title, screenShortCut}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        leading: anyImage(
          ctx: userCtx,
          imagePath: image,
          widthFactor: 0.075,
        ),
        title: Text(
          title,
          style: Theme.of(userCtx).textTheme.headline3.copyWith(
                color: CustomColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
