// theme and colors
import 'dart:math';

import '../../theme/theme.dart';

//widget used in product screens
import '../../widgets/appbar_widget.dart';
import '../../widgets/sheared_materials_widgets.dart';

//providers
import '../../providers/favorite/favorite_provider.dart';
import '../../providers/cart/cart_provider.dart';

//pub and core package
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  static final String routeNamed = "favoriteScreen";

  const FavoriteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        appCtx: context,
        title: Text(
          "WishList",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "to remove product from list swip right or left ",
                style: Theme.of(context).textTheme.headline3.copyWith(
                    color: CustomColors.titleBlackColor,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            Consumer<Favorite>(
              builder: (_, favoriteProvider, Widget child) {
                return favoriteProvider.favoriteItems.length > 0
                    ? _buildFavoriteItems(
                        provider: favoriteProvider, favoriteCtx: context)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          giveHeightSpace(ctx: context, heightFactor: 0.1),
                          Image.asset(
                            "assets/images/add-to-favorites.png",
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                          giveHeightSpace(ctx: context, heightFactor: 0.09),
                          Text(
                            "No product in wishlist",
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(
                                    color: CustomColors.titleBlackColor,
                                    fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildFavoriteItems({Favorite provider, BuildContext favoriteCtx}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) {
        Map singleFavoriteItem =
            provider.favoriteItems[index].values.toList().first;
        return Dismissible(
          key: ValueKey(
            singleFavoriteItem["id"],
          ),
          onDismissed: (val) {
            provider.addOrRemoveFavoritItem(
              favoriteItem: singleFavoriteItem,
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Image.asset(
                  singleFavoriteItem["image"],
                  width: MediaQuery.of(ctx).size.width * 0.35,
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  width: MediaQuery.of(ctx).size.width * 0.65,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            " \$ ${(singleFavoriteItem["price"] - Random().nextDouble() + 0.2).toStringAsFixed(2)} ",
                            style: Theme.of(ctx).textTheme.headline3.copyWith(
                                color: CustomColors.titleBlackColor,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            " \$ ${singleFavoriteItem["price"]} ",
                            style: Theme.of(ctx).textTheme.headline4.copyWith(
                                color: CustomColors.titleBlackColor,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: CustomColors.mainColor,
                                decorationThickness: 2,
                                decorationStyle: TextDecorationStyle.solid),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          singleFavoriteItem["title-en"],
                          maxLines: 2,
                          style: Theme.of(ctx).textTheme.headline4.copyWith(
                              color: CustomColors.titleBlackColor,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Consumer<Cart>(builder: (
                        _,
                        cartProvider,
                        child,
                      ) {
                        return cartProvider
                                .isProductInCart(singleFavoriteItem["id"])
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    IconButton(
                                      color: CustomColors.mainColor,
                                      icon: Icon(
                                        Icons.add,
                                      ),
                                      onPressed: () =>
                                          cartProvider.addProductToOrder(
                                              singleFavoriteItem["id"],
                                              singleFavoriteItem,
                                              1),
                                    ),
                                    giveWidthSpace(ctx: ctx, widthFactor: 0.01),
                                    Text(
                                      cartProvider
                                          .cartItems[singleFavoriteItem["id"]]
                                          .quentity
                                          .toString(),
                                      style: Theme.of(ctx)
                                          .textTheme
                                          .headline2
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    giveWidthSpace(ctx: ctx, widthFactor: 0.01),
                                    IconButton(
                                      color: CustomColors.mainColor,
                                      icon: Icon(Icons.remove),
                                      onPressed: () =>
                                          cartProvider.addProductToOrder(
                                              singleFavoriteItem["id"],
                                              singleFavoriteItem,
                                              -1),
                                    )
                                  ],
                                ),
                              )
                            : Align(
                                alignment: Alignment.centerLeft,
                                child: roundedTextButton(
                                    ctx: ctx,
                                    childWidget: Text(
                                      "Add",
                                      style: Theme.of(ctx)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                              color: CustomColors.whiteColor),
                                    ),
                                    onTapFun: () {
                                      cartProvider.addProductToOrder(
                                          singleFavoriteItem["id"],
                                          singleFavoriteItem,
                                          1);
                                    },
                                    usedColor: CustomColors.mainColor,
                                    widthFactor: 0.15,
                                    heightFactor: 0.05),
                              );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: provider.favoriteItems.length,
    );
  }
}
