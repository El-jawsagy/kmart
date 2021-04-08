//widget used in this screen only
import '../../widgets/main_sreen_widgets/cart/cart_page_widget.dart';
import '../../widgets/main_sreen_widgets/home/home_Page_widget.dart';
import '../../widgets/main_sreen_widgets/orders/order_page_widget.dart';
import '../../widgets/main_sreen_widgets/profile/profile_page_widget.dart';

//widget shared in almost all screen
import '../../widgets/appbar_widget.dart';
import '../../widgets/sheared_materials_widgets.dart';



//pub and core package
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static final String routeNamed = "mainScreen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pos;
  @override
  void initState() {
    super.initState();
    pos = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        appCtx: context,
        title: anyImage(
          ctx: context,
          widthFactor: .25,
          heightFactor: 0.05,
        ),
      ),
      body: pos == 0
          ? HomePageWidget()
          : (pos == 1
              ? CartPageWidget()
              : (pos == 2 ? OrderPageWidget() : ProfilePageWidget())),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pos,
        onTap: (newIndex) {
          setState(() {
            pos = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
            ),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.face,
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }

  // BottomNavigationBar bottomSheetWidget() {
  //   return;
  // }
}
