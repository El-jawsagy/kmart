//screen to navagete for it
import '../../../views/home/main_screen.dart';
//widget that is almost used in all screen
import '../../divider.dart';
import '../cart/cart_item-widget.dart';
import '../../sheared_materials_widgets.dart';

//theme and colors
import '../../../theme/theme.dart';

//providers
import '../../../providers/cart/cart_provider.dart';
import '../../../providers/order/order_provider.dart';

//pub and core package
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CartPageWidget extends StatelessWidget {
  const CartPageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (_, cartProvider, child) {
      return cartProvider.cartItems.length > 0
          ? cartWithItems(cartCtx: context, provider: cartProvider)
          : emptyCart(context);
    });
  }

  Widget cartWithItems({BuildContext cartCtx, Cart provider}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 6,
              child: Column(
                children: [
                  rowOfResetDetails(
                    title: "M.R.P",
                    titleStyle: Theme.of(cartCtx).textTheme.headline3.copyWith(
                          color: CustomColors.subTitleColor.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                    amount: "\$ ${provider.cartAmount.toStringAsFixed(2)}",
                    amountStyle: Theme.of(cartCtx).textTheme.headline3.copyWith(
                          color: CustomColors.subTitleColor.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  rowOfResetDetails(
                    title: "Discount Price",
                    titleStyle: Theme.of(cartCtx).textTheme.headline3.copyWith(
                          color: CustomColors.subTitleColor.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                    amount: "\$ 0",
                    amountStyle: Theme.of(cartCtx).textTheme.headline3.copyWith(
                          color: CustomColors.subTitleColor.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  rowOfResetDetails(
                    title: "Delivery Charge",
                    titleStyle: Theme.of(cartCtx).textTheme.headline3.copyWith(
                          color: CustomColors.subTitleColor.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                    amount: "\$ 2",
                    amountStyle: Theme.of(cartCtx).textTheme.headline3.copyWith(
                          color: CustomColors.subTitleColor.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  DividerWidget(),
                  rowOfResetDetails(
                    title: "SubTotal",
                    titleStyle: Theme.of(cartCtx).textTheme.headline2.copyWith(
                          color: CustomColors.titleBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                    amount:
                        "\$ ${(provider.cartAmount + 2).toStringAsFixed(2)}",
                    amountStyle: Theme.of(cartCtx).textTheme.headline3.copyWith(
                          color: CustomColors.subTitleColor.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return CartItemWidget(
                    productDetails: provider.cartItems.values.toList()[index],
                    cartProvider: provider,
                  );
                },
                itemCount: provider.cartItems.length,
              ),
            ),
            giveHeightSpace(
              ctx: cartCtx,
              heightFactor: 0.1,
            ),
            roundedTextButton(
              ctx: cartCtx,
              widthFactor: 0.3,
              heightFactor: 0.055,
              usedColor: CustomColors.mainColor.withOpacity(0.9),
              onTapFunc: () {
                // Navigator.pushNamed(cartCtx, RegisterScreen.routeNamed);
                print("your cart items : ${provider.cartItems}");
                Provider.of<Order>(cartCtx, listen: false).addOrderToList(
                  id: DateTime.now().toString(),
                  order: OrderItem(
                    product: provider.cartItems,
                    price: provider.cartAmount,
                  ),
                );
                provider.cartReset();
              },
              border: BorderSide(
                  color: CustomColors.titleBlackColor,
                  style: BorderStyle.solid,
                  width: 1.8),
              childWidget: Text(
                "CheckOut",
                style: Theme.of(cartCtx).textTheme.headline2.copyWith(
                      color: CustomColors.whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowOfResetDetails({
    String title,
    amount,
    TextStyle titleStyle,
    amountStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Text(
            amount,
            style: amountStyle,
          ),
        ],
      ),
    );
  }

  Widget emptyCart(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: anyImage(
            ctx: context,
            widthFactor: 0.4,
            heightFactor: .25,
            imagePath: "assets/images/empty_cart.png",
          ),
        ),
        Text(
          " Your cart is empty for now ",
          style: Theme.of(context).textTheme.headline3,
        ),
        giveHeightSpace(
          ctx: context,
          heightFactor: 0.03,
        ),
        roundedTextButton(
          ctx: context,
          onTapFunc: () =>
              Navigator.pushReplacementNamed(context, MainScreen.routeNamed),
          childWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "back to explore products",
              style: Theme.of(context).textTheme.headline3.copyWith(
                    color: CustomColors.whiteColor,
                  ),
            ),
          ),
          widthFactor: 0.3,
          heightFactor: .05,
        ),
      ],
    );
  }
}
