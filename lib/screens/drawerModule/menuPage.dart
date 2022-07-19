// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
//Application Root

class MenuPage extends StatelessWidget {
  final MenuItem cuurentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuPage(
      {Key? key, required this.cuurentItem, required this.onSelectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(7, 36, 81, 0),
        body: SafeArea(
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
            CircleAvatar(
              backgroundColor: Color.fromRGBO(7, 36, 81, 0),
              radius: 60,
              child: Image(
                image: AssetImage(
                  'assets/icons/hearticon.png',
                ),
                fit: BoxFit.fill,
                height: 150,
              ),
            ),
            Divider(
              color: Colors.white38,
              height: 5,
            ),
            ...MenuItems.all.map(buildMenuItem).toList(),
            Spacer(),
                    ],
                  )),
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) {
    return ListTileTheme(
      selectedColor: Colors.white,
      child: ListTile(
        selectedTileColor: Colors.black26,
        selected: cuurentItem == item,
        minLeadingWidth: 20,
        onTap: () => onSelectedItem(item),
        title: Text(item.item),
        leading: Icon(item.icon),
      ),
    );
  }
}

class MenuItem {
  final String item;
  final IconData icon;

  const MenuItem(this.icon, this.item);
}

class MenuItems {
  static const home = MenuItem(Icons.home, 'Home');
  static const payment = MenuItem(Icons.payment, 'Payment');
  static const promos = MenuItem(Icons.card_giftcard, 'Promos');
  static const notifications =
      MenuItem(Icons.notifications_active, 'Notifications');
  static const help = MenuItem(Icons.help, 'Help');
  static const aboutUs = MenuItem(Icons.info_outline, 'About Us');
  static const rateUs = MenuItem(Icons.star_border, 'Rate Us');
  static const all = <MenuItem>[
    home,
    payment,
    help,
    notifications,
    promos,
    aboutUs,
    rateUs,
  ];
}

class MenuWidget extends StatelessWidget {
  @override
  Widget build(context) {
    return Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          ZoomDrawer.of(context)!.toggle();
        },
        icon: ZoomDrawer.of(context)!.isOpen()
            ? Icon(Icons.arrow_back)
            : Icon(
                Icons.menu,
              ),
      );
    });
  }
}
