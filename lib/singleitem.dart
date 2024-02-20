import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_discount/model.list.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ComplicatedImageDemo(
                image: previewImage,
                collectionId: collectionId,
                itemsId: itemId,
                index: index,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(model.items![index].title!),
                    ),
                    ListTile(
                      title: TextButton(
                        onPressed: () async {
                          if (await canLaunchUrl(
                              Uri.parse(model.items![index].link!))) {
                            launchUrlString(model.items![index].link!);
                          }
                        },
                        child: const Text("Source"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
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
                ),
              ),
            ))
        .toList();
    if (image.length == 1) {
      return Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Image.network(
            "http://127.0.0.1:8090/api/files/$collectionId/$itemsId/${image[0]}",
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
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
}
