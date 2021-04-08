//to dummy discount
import 'dart:math';

// theme and colors
import '../../theme/theme.dart';

//widget used in product screens
import '../../widgets/appbar_widget.dart';
import '../../widgets/bage_widget.dart';
import '../../widgets/sheared_materials_widgets.dart';

//provider
import '../../providers/cart/cart_provider.dart';

//pub and core package
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  static final String routeNamed = "productDetailsScreen";

  @override
  Widget build(BuildContext context) {
    Map productData = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: appBarWidget(
          appCtx: context,
          title: Text(
            "Buy Product",
            style: Theme.of(context).textTheme.headline2,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<Cart>(
                builder: (_, cartProvider, child) {
                  return Badge(
                    child: child,
                    value: cartProvider.cartCounterByProduct.toString(),
                    color: CustomColors.verylowPriorityColor,
                  );
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.mainColor,
                  size: 30,
                ),
              ),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Image.asset(
                    productData["image"],
                    width: MediaQuery.of(context).size.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            giveHeightSpace(ctx: context, heightFactor: 0.02),
            Text(
              productData["title-en"],
              maxLines: 3,
              style: Theme.of(context).textTheme.headline3.copyWith(
                  color: CustomColors.titleBlackColor,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
            giveHeightSpace(ctx: context, heightFactor: 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Product MRP:",
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              color: CustomColors.titleBlackColor,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          " \$ ${productData["price"]}  ",
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              color: CustomColors.titleBlackColor,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: CustomColors.mainColor,
                              decorationThickness: 2,
                              decorationStyle: TextDecorationStyle.solid),
                        ),
                      ],
                    ),
                    giveHeightSpace(ctx: context, heightFactor: 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Selling Price:",
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                color: CustomColors.titleBlackColor,
                                fontWeight: FontWeight.w600,
                              ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          " \$ ${(productData["price"] - Random().nextDouble()).toStringAsFixed(2)} ",
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                color: CustomColors.titleBlackColor,
                                fontWeight: FontWeight.w600,
                              ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ), //add to cart
                Consumer<Cart>(builder: (
                  _,
                  cartProvider,
                  child,
                ) {
                  return cartProvider.isProductInCart(productData["id"])
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                color: CustomColors.mainColor,
                                icon: Icon(
                                  Icons.add,
                                ),
                                onPressed: () => cartProvider.addProductToOrder(
                                    productData["id"], productData, 1),
                              ),
                              giveWidthSpace(ctx: context, widthFactor: 0.01),
                              Text(
                                cartProvider
                                    .cartItems[productData["id"]].quentity
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              giveWidthSpace(ctx: context, widthFactor: 0.01),
                              IconButton(
                                color: CustomColors.mainColor,
                                icon: Icon(Icons.remove),
                                onPressed: () => cartProvider.addProductToOrder(
                                    productData["id"], productData, -1),
                              )
                            ],
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: roundedTextButton(
                                  ctx: context,
                                  childWidget: Text(
                                    "Add",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(
                                            color: CustomColors.whiteColor),
                                  ),
                                  onTapFun: () {
                                    cartProvider.addProductToOrder(
                                        productData["id"], productData, 1);
                                  },
                                  usedColor: CustomColors.mainColor,
                                  widthFactor: 0.15,
                                  heightFactor: 0.05),
                            ),
                          ],
                        );
                }),
              ],
            ),
            giveHeightSpace(ctx: context, heightFactor: 0.02),
            Row(
              children: [
                Text(
                  "unit",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      color: CustomColors.titleBlackColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    productData["offer_details"],
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: CustomColors.titleBlackColor.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Describtion:",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      color: CustomColors.titleBlackColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      productData["subtitle-en"],
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: CustomColors.titleBlackColor.withOpacity(0.7),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            giveHeightSpace(ctx: context, heightFactor: 0.02),
          ],
        ),
      ),
    );
  }
}
