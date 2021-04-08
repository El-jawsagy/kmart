//theme and colors
import '../../../theme/theme.dart';

//screen for navigate to it
import '../../../views/category/category_product_details_screen.dart';

//providers
import '../../../providers/products/products_provider.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final BuildContext categoryItemCtx;
  final Map categorydata;
  const CategoryItem({
    Key key,
    this.categoryItemCtx,
    this.categorydata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: InkWell(
        onTap: () {
          Provider.of<Product>(context, listen: false)
              .changeSelectedCategoryIdToGetProducts(categorydata["id"]);
          Navigator.pushNamed(
            context,
            ProductOfCategoryScreen.routeNamed,
          );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(11),
              ),
              border: Border.all(color: CustomColors.mainColor)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                  // (
                  //   topLeft: Radius.circular(7),
                  //   topRight: Radius.circular(7),
                  // ),
                  child: Image.asset(
                    categorydata["image"],
                    // width: MediaQuery.of(ctx).size.width ,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    categorydata["title-en"],
                    style: Theme.of(categoryItemCtx)
                        .textTheme
                        .headline4
                        .copyWith(
                            color: CustomColors.titleBlackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
