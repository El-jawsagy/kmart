// theme and colors
import '../../theme/theme.dart';

//widget used in category screens
import '../../widgets/appbar_widget.dart';
import '../../widgets/bage_widget.dart';
import '../../widgets/Iitem_of_product_for_category/product_of_category_item_widget.dart';
import '../../widgets/sheared_materials_widgets.dart';

//providers
import '../../providers/cart/cart_provider.dart';
import '../../providers/products/products_provider.dart';

//pub and core packages
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProductOfCategoryScreen extends StatelessWidget {
  static final String routeNamed = "categoryScreen";

  const ProductOfCategoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<Product>(
        builder: (_, productsProvider, child) {
          print(productsProvider.categoryProductItems.length);
          return productsProvider.categoryProductItems.length > 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return ProductcategoryItem(
                      productdata: productsProvider.categoryProductItems[index],
                    );
                  },
                  itemCount: productsProvider.categoryProductItems.length,
                )
              : emptyProducts(context);
        },
      ),
    );
  }

  Widget emptyProducts(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: anyImage(
            ctx: context,
            widthFactor: 0.4,
            heightFactor: .25,
            imagePath: "assets/images/empty_products.png",
          ),
        ),
        Text(
          " This category has no product for now ",
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
