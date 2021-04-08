//dummy data
import '../../../data/dummy_data.dart';

//widget that is used in home page
import 'category_item_widget.dart';
import 'last_product_offer_item_widget.dart';

//theme and colors
import '../../../theme/theme.dart';

//providers
import '../../../providers/category/catergory_provider.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          offerPanerImage(
            offerCtx: context,
          ),
          categoriesCardWithGridView(
            categoriesCtx: context,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Last Products",
                  style: Theme.of(context).textTheme.headline2.copyWith(
                        color: CustomColors.mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          productsCardWithGridView(
            productsCtx: context,
          ),
        ],
      ),
    );
  }

  Widget offerPanerImage({BuildContext offerCtx}) {
    return Container(
      width: MediaQuery.of(offerCtx).size.width,
      height: MediaQuery.of(offerCtx).size.height * .25,
      child: PageView.builder(
        // controller: offerCotroller,
        itemBuilder: (ctx, index) {
          return Image.asset(
            DUMMY_OFFER_IMAGES[index],
            fit: BoxFit.cover,
          );
        },
        itemCount: DUMMY_OFFER_IMAGES.length,
      ),
    );
  }

  Widget categoriesCardWithGridView({BuildContext categoriesCtx}) {
    return Consumer<Category>(
      builder: (BuildContext context, categoryProvider, Widget child) {
        return Card(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 2.2 / 3),
            itemBuilder: (ctx, index) {
              return CategoryItem(
                categoryItemCtx: categoriesCtx,
                categorydata: categoryProvider.categoryItems[index],
              );
            },
            itemCount: DUMMY_CATEGORIES.length,
          ),
        );
      },
    );
  }

  Widget productsCardWithGridView({BuildContext productsCtx}) {
    return Card(
      color: CustomColors.mainColor,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 3.1 / 3),
        itemBuilder: (ctx, index) {
          return ProductOfferItem(
            productItemCtx: productsCtx,
            productdata: DUMMY_PRODUCTS[index],
          );
        },
        itemCount: DUMMY_PRODUCTS.length,
      ),
    );
  }
}
