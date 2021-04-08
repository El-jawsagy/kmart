import 'dart:math';

//screen to navigate for it
import '../../../views/product/product_details_screen.dart';

//theme and colors

import '../../../theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';

class ProductOfferItem extends StatelessWidget {
  final BuildContext productItemCtx;
  final Map productdata;
  const ProductOfferItem({
    Key key,
    this.productItemCtx,
    this.productdata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, ProductDetailsScreen.routeNamed,arguments: productdata),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: CustomColors.whiteColor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CustomColors.subTitleColor.withOpacity(0.4),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        child: Image.asset(
                          productdata["image"],
                          width: MediaQuery.of(context).size.width * 0.175,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        " \$ ${(productdata["price"] - Random().nextDouble()).toStringAsFixed(2)} ",
                        style: Theme.of(productItemCtx)
                            .textTheme
                            .headline3
                            .copyWith(
                                color: CustomColors.titleBlackColor,
                                fontWeight: FontWeight.w600),
                      ),
                      Text(
                        " \$ ${productdata["price"]} ",
                        style: Theme.of(productItemCtx)
                            .textTheme
                            .headline4
                            .copyWith(
                                color: CustomColors.titleBlackColor,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: CustomColors.mainColor,
                                decorationThickness: 2,
                                decorationStyle: TextDecorationStyle.solid),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Center(
                  child: Text(
                    productdata["title-en"],
                    style: Theme.of(productItemCtx)
                        .textTheme
                        .headline4
                        .copyWith(
                            color: CustomColors.titleBlackColor,
                            fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      productdata["offer_details"],
                      style: Theme.of(productItemCtx)
                          .textTheme
                          .headline4
                          .copyWith(
                              color:
                                  CustomColors.titleBlackColor.withOpacity(0.7),
                              fontWeight: FontWeight.w600),
                    ),
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
