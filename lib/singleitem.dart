import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_discount/model.list.dart';

class SingleItemPage extends StatelessWidget {
  const SingleItemPage({
    super.key,
    required this.model,
    required this.index,
  });

  final ModelListDiscount model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final String collectionId = model.items![index].collectionId!;
    final String itemId = model.items![index].id!;
    final List<String> previewImage = model.items![index].previewImg!;
    return Scaffold(
      body: Center(
        child: ComplicatedImageDemo(
          image: previewImage,
          collectionId: collectionId,
          itemsId: itemId,
          index: index,
        ),
      ),
    );
  }
}

class ComplicatedImageDemo extends StatelessWidget {
  const ComplicatedImageDemo(
      {super.key,
      required this.image,
      required this.collectionId,
      required this.itemsId,
      required this.index});

  final List<String> image;
  final String collectionId;
  final String itemsId;
  final int index;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = image
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  "http://127.0.0.1:8090/api/files/$collectionId/$itemsId/$item",
                  fit: BoxFit.cover,
                  // width: 1000.0,
                ),
              ),
            ))
        .toList();
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        aspectRatio: 1.0,
        enlargeCenterPage: true,
      ),
      items: imageSliders,
    );
  }
}
