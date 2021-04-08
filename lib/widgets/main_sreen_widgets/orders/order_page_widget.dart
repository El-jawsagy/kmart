//widget that sheared in almost all screen
import '../../sheared_materials_widgets.dart';

//providers
import '../../../providers/favorite/order_provider.dart';

//pub and core package
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class OrderPageWidget extends StatelessWidget {
  const OrderPageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Order>(builder: (_, orderProvider, child) {
      print(orderProvider.orderItems);
      return orderProvider.orderItems.length > 0
          ? cartWithItems(cartCtx: context, provider: orderProvider)
          : emptyOrder(context);
    });
  }

  Widget cartWithItems({BuildContext cartCtx, Order provider}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx, index) {},
              itemCount: provider.orderItems.length,
            ),
          ),
          giveHeightSpace(
            ctx: cartCtx,
            heightFactor: 0.1,
          ),
        ],
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

  Widget emptyOrder(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: anyImage(
            ctx: context,
            widthFactor: 0.4,
            heightFactor: .25,
            imagePath: "assets/images/empty_orders.png",
          ),
        ),
        Text(
          " Your Order is empty for now ",
          style: Theme.of(context).textTheme.headline3,
        ),
        giveHeightSpace(
          ctx: context,
          heightFactor: 0.03,
        ),
        // roundedTextButton(
        //   ctx: context,
        //   childWidget: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 4.0),
        //     child: Text(
        //       "back to explore products and make your orders",
        //       style: Theme.of(context).textTheme.headline3.copyWith(
        //             color: CustomColors.whiteColor,
        //           ),
        //     ),
        //   ),
        //   widthFactor: 0.3,
        //   heightFactor: .05,
        // ),
      ],
    );
  }
}
