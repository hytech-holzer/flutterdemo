import 'package:flutter/material.dart';
import 'package:flutterdemo/model/wish_model.dart';
import 'package:flutterdemo/pages/new_wish_page.dart';
import 'package:flutterdemo/repository/wish_repository.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  final WishRepository wishRepository = JsonWishRepository();
  List<WishModel> _wishList = [];

  void _initWishList() {
    wishRepository.getWishList().then((wishes) => {
          setState(() => {_wishList = wishes})
        });
  }

  @override
  void initState() {
    super.initState();
    _initWishList();
  }

  Widget _buildListItem(BuildContext context, int index) {
    WishModel wish = _wishList[index];
    var price = wish.price ?? "0,00";

    return ListTile(
      title: Text(wish.name),
      subtitle: Text(price),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
        itemBuilder: _buildListItem, itemCount: _wishList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wish List')),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_navigateTo(page: WishFormPage(), context: context)},
        tooltip: 'Add new Item',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _navigateTo({required Widget page, required BuildContext context}) {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}
