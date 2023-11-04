import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:multi_vendor_app_admin_panel_web/views/screens/side_bar_screens/categories_screen.dart';
import 'package:multi_vendor_app_admin_panel_web/views/screens/side_bar_screens/dashboard_screen.dart';
import 'package:multi_vendor_app_admin_panel_web/views/screens/side_bar_screens/orders_screen.dart';
import 'package:multi_vendor_app_admin_panel_web/views/screens/side_bar_screens/products_screen.dart';
import 'package:multi_vendor_app_admin_panel_web/views/screens/side_bar_screens/upload_banners.dart';
import 'package:multi_vendor_app_admin_panel_web/views/screens/side_bar_screens/vendors_screen.dart';
import 'package:multi_vendor_app_admin_panel_web/views/screens/side_bar_screens/withdrawl_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedScreen = DashboardScreen();

  selectedScreen(item) {
    switch (item.route) {
      case DashboardScreen.routname:
        setState(() {
          _selectedScreen = DashboardScreen();
        });
        break;

      case VendorsScreen.routname:
        setState(() {
          _selectedScreen = VendorsScreen();
        });
        break;

      case WithdrawScreen.routname:
        setState(() {
          _selectedScreen = WithdrawScreen();
        });
        break;

      case OrdersScren.routname:
        setState(() {
          _selectedScreen = OrdersScren();
        });
        break;

      case CategoriesScreen.routname:
        setState(() {
          _selectedScreen = CategoriesScreen();
        });
        break;

      case ProductsScreen.routname:
        setState(() {
          _selectedScreen = ProductsScreen();
        });
        break;

      case UploadBannersScreen.routname:
        setState(() {
          _selectedScreen = UploadBannersScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[900],
          title: Text('Management'),
        ),
        sideBar: SideBar(
          items: [
            AdminMenuItem(
                title: 'Dashboard',
                icon: Icons.dashboard,
                route: DashboardScreen.routname),
            AdminMenuItem(
                title: 'Vendors', icon: Icons.people, route: VendorsScreen.routname),
            AdminMenuItem(
                title: 'Withdrawl',
                icon: Icons.attach_money_outlined,
                route: WithdrawScreen.routname),
            AdminMenuItem(
                title: 'Orders',
                icon: Icons.shopping_cart,
                route: OrdersScren.routname),
            AdminMenuItem(
                title: 'Categories',
                icon: Icons.category,
                route: CategoriesScreen.routname),
            AdminMenuItem(
                title: 'Products', icon: Icons.shop, route: ProductsScreen.routname),
            AdminMenuItem(
                title: 'Upload Banners',
                icon: Icons.add,
                route: UploadBannersScreen.routname),
          ],
          selectedRoute: '',
          onSelected: selectedScreen,
          header: Container(
            height: 50,
            width: double.infinity,
            color: Colors.grey[700],
            child: Center(
                child: Text(
              'Admin Panel',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
          footer: Container(
            height: 50,
            width: double.infinity,
            color: Colors.grey[700],
            child: Center(
                child: Text(
              '',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
        ),
        body: _selectedScreen);
  }
}
