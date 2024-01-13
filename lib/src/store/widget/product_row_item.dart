import 'package:flutter/material.dart';

import '../model/product.dart';
import 'hide_price_scope.dart';

class ProductRowItem extends StatelessWidget {
  final Product product;

  const ProductRowItem(
    this.product, {
    super.key,
  });

  // Start padding + avatar width + padding to text
  static const double indent = 20 + 68 + 16;

  // End padding
  static const double endIndent = 14.0;

  @override
  Widget build(BuildContext context) => SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 14, 8),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _Avatar(product),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Title(product.name),
                    const SizedBox(height: 3),
                    _Subtitle(product.price),
                  ],
                ),
              ),
              const _IconButton(),
            ],
          ),
        ),
      );
}

class _Avatar extends StatelessWidget {
  final Product product;

  const _Avatar(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox.square(
        dimension: 68,
        child: Image.asset(
          product.assetName,
          package: product.assetPackage,
          fit: BoxFit.cover,
          width: 68,
          height: 68,
          errorBuilder: (context, error, sk) => const Icon(Icons.warning),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;

  const _Title(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.8),
          fontSize: 18,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}

class _Subtitle extends StatelessWidget {
  final int price;

  const _Subtitle(this.price, {super.key});

  @override
  Widget build(BuildContext context) => HidePriceBuilder(
        builder: (context, isVisible) => Text(
          '$price \$',
          style: TextStyle(
            color: const Color(0xFF8E8E93),
            fontSize: 13,
            fontWeight: FontWeight.w300,
            decoration: isVisible ? null : TextDecoration.lineThrough,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
}

class _IconButton extends StatelessWidget {
  const _IconButton({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.add),
      );
}
