import 'package:flutter/material.dart';
import 'package:flutter_auth/models/produit.dart';
import 'package:flutter_auth/helper/heper.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Produit product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.photos.length,
                (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: (48 / 375.0) * MediaQuery.of(context).size.width,
        width: (48 / 812.0) * MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.orange.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.network(
            Helper.imageFormatter(widget.product.photos[index].photo)),
      ),
    );
  }
}
