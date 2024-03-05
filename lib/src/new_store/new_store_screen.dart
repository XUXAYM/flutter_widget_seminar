import 'package:flutter/material.dart';
import 'package:flutter_widget_seminar/src/new_store/model/constants.dart';
import 'package:flutter_widget_seminar/src/new_store/model/product.dart';

import 'list_item.dart';
import 'visibility_inherited.dart';

class NewStoreScreen extends StatefulWidget {
  const NewStoreScreen({super.key});

  @override
  State<NewStoreScreen> createState() => _NewStoreScreenState();
}

class _NewStoreScreenState extends State<NewStoreScreen> {
  late bool isPriceVisible;

  @override
  void initState() {
    super.initState();
    isPriceVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityInherited(
      isVisible: isPriceVisible,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Store'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                isPriceVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  isPriceVisible = !isPriceVisible;
                });
              },
            )
          ],
        ),
        body: ListView.separated(
          itemCount: Product.products.length,
          itemBuilder: (context, index) => ProductListItem(
            product: Product.products[index],
          ),
          separatorBuilder: (context, index) => const Divider(
            indent: Constants.indent,
            endIndent: Constants.endIndent,
          ),
        ),
      ),
    );
  }
}
