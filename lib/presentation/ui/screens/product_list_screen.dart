import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/product_card_item.dart';

class productListScreen extends StatefulWidget {
  const productListScreen({super.key, this.category});

  final String? category;

  @override
  State<productListScreen> createState() => _productListScreenState();
}

class _productListScreenState extends State<productListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category??"Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 40,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: .98,
            mainAxisSpacing: 8,
            crossAxisSpacing: 4,
          ),
          itemBuilder: (context, index) => FittedBox(
              child: ProductCardItem(
                card_width: 145,
              )),
        ),
      ),
    );
  }
}
