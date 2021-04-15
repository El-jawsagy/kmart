//to dummy discount
import 'dart:math';

//Screen to navigate for it
import '../../views/product/product_details_screen.dart';

//widget that sheared in almost all screen

import '../../widgets/sheared_materials_widgets.dart';

//theme and colors
import '../../theme/theme.dart';

//providers
import '../../providers/cart/cart_provider.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductcategoryItem extends StatelessWidget {
  final Map productdata;
  const ProductcategoryItem({
    Key key,
    this.productdata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          ProductDetailsScreen.routeNamed,
          arguments: productdata,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: CustomColors.whiteColor,
          ),
          child: Row(
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
                      productdata["image"],
                      width: MediaQuery.of(context).size.width * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          " \$ ${(productdata["price"] - Random().nextDouble()).toStringAsFixed(2)} ",
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              color: CustomColors.titleBlackColor,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          " \$ ${productdata["price"]} ",
                          style: Theme.of(context).textTheme.headline4.copyWith(
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
                    FittedBox(
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            productdata["title-en"],
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    color: CustomColors.titleBlackColor,
                                    fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            productdata["offer_details"],
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    color: CustomColors.titleBlackColor
                                        .withOpacity(0.7),
                                    fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Consumer<Cart>(builder: (
                      _,
                      cartProvider,
                      child,
                    ) {
                      return cartProvider.isProductInCart(productdata["id"])
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
                                            productdata["id"], productdata, 1),
                                  ),
                                  giveWidthSpace(
                                      ctx: context, widthFactor: 0.01),
                                  Text(
                                    cartProvider
                                        .cartItems[productdata["id"]].quentity
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  giveWidthSpace(
                                      ctx: context, widthFactor: 0.01),
                                  IconButton(
                                    color: CustomColors.mainColor,
                                    icon: Icon(Icons.remove),
                                    onPressed: () =>
                                        cartProvider.addProductToOrder(
                                            productdata["id"], productdata, -1),
                                  )
                                ],
                              ),
                            )
                          : Align(
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
                                        productdata["id"], productdata, 1);
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
      ),
    );
  }
}
