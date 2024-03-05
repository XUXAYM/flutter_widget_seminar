import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_seminar/src/new_store/visibility_inherited.dart';

import 'model/constants.dart';
import 'model/product.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isPriceVisible = VisibilityInherited.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: Constants.startListItemPadding,
        right: Constants.endListItemPadding,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              Constants.imageBorderRadiusValue,
            ),
            child: Image.asset(
              product.assetName,
              package: product.assetPackage,
              width: Constants.imageSize,
              height: Constants.imageSize,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          const SizedBox(
            width: Constants.imageAndTextSpace,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${product.price} \$',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Constants.subtitleColor,
                    decoration:
                        isPriceVisible ? null : TextDecoration.lineThrough,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
