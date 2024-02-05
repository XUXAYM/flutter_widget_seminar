import 'package:flutter/material.dart';
import 'package:flutter_widget_seminar/src/store/widget/hide_price_scope.dart';
import 'package:flutter_widget_seminar/src/store/widget/product_grid_item.dart';
import 'package:flutter_widget_seminar/src/store/widget/product_row_item.dart';

import '../model/product.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) => HidePriceScope(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Store'),
            centerTitle: true,
            actions: const [_ActionButton()],
          ),
          body: const BodyLayout(),
        ),
      );
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({super.key});

  @override
  Widget build(BuildContext context) => HidePriceBuilder(
        builder: (context, isVisible) => IconButton(
          onPressed: () => _onChange(context, isVisible),
          icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
        ),
      );

  void _onChange(BuildContext context, bool isVisible) {
    final notifier = HidePriceScope.notifierOf(context);
    isVisible ? notifier.hide() : notifier.show();
  }
}

class BodyLayout extends StatelessWidget {
  const BodyLayout({super.key});

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemBuilder: (context, index) => ProductRowItem(
          Product.products[index],
        ),
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          thickness: 1,
          indent: ProductRowItem.indent,
          endIndent: ProductRowItem.endIndent,
        ),
        itemCount: Product.products.length,
      );
}
