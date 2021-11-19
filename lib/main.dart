import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/wish_list_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Wish List App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('Welcome to Wish List'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            _buildMenuHeader(),
            _buildMenuItem(
                caption: 'Wish List',
                icon: Icons.list,
                onTap: () =>
                    _navigateTo(page: const WishListPage(), context: context)),
            _buildMenuItem(caption: 'Add new Item', icon: Icons.new_label),
            _buildMenuItem(caption: 'Settings', icon: Icons.settings),
          ],
        ),
      ),
    );
  }

  void _navigateTo({required Widget page, required BuildContext context}) {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  Widget _buildMenuHeader() {
    return SafeArea(
        child: Row(
      children: const [
        FlutterLogo(size: 48),
        Text(
          'Wish List',
          style: TextStyle(fontSize: 26),
        )
      ],
    ));
    /*
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Text('Drawer Header'),
    );
    */
  }

  Widget _buildMenuItem(
      {required String caption, IconData? icon, VoidCallback? onTap}) {
    return ListTile(
      title: Text(caption),
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}
