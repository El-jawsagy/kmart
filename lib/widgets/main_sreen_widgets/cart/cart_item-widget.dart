//theme and colors
import '../../../theme/theme.dart';

//widgets that sheared with almost all screen
import '../../../widgets/sheared_materials_widgets.dart';

//providers
import '../../../providers/cart/cart_provider.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem productDetails;
  final Cart cartProvider;
  const CartItemWidget({Key key, this.productDetails, this.cartProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              productDetails.product["title-en"],
              maxLines: 3,
              style: Theme.of(context).textTheme.headline4.copyWith(
                  color: CustomColors.subTitleColor,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
          ),
          giveHeightSpace(ctx: context, heightFactor: 0.005),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " \$ ${productDetails.product["price"]} ",
                style: Theme.of(context).textTheme.headline4.copyWith(
                    color: CustomColors.subTitleColor,
                    fontWeight: FontWeight.w600,
                    decorationStyle: TextDecorationStyle.solid),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      color: CustomColors.mainColor,
                      icon: Icon(Icons.remove),
                      onPressed: () => cartProvider.addProductToOrder(
                          productDetails.product["id"],
                          productDetails.product,
                          -1),
                    ),
                    giveWidthSpace(ctx: context, widthFactor: 0.01),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: CustomColors.mainColor.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cartProvider
                            .cartItems[productDetails.product["id"]].quentity
                            .toString(),
                        style: Theme.of(context).textTheme.headline3.copyWith(
                            fontWeight: FontWeight.bold,
                            color: CustomColors.whiteColor),
                      ),
                    ),
                    giveWidthSpace(ctx: context, widthFactor: 0.01),
                    IconButton(
                      color: CustomColors.mainColor,
                      icon: Icon(
                        Icons.add,
                      ),
                      onPressed: () => cartProvider.addProductToOrder(
                          productDetails.product["id"],
                          productDetails.product,
                          1),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
