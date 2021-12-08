import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:transcarent_project/models/search_model.dart';

class DetailView extends StatelessWidget {
  DetailView({Key? key, required this.result}) : super(key: key);

  ImagesResult result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Hero(
                tag: result.position,
                child: Image(
                  image: CachedNetworkImageProvider(result.original),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                iconSize: 35.0,
                onPressed: () async => {
                  GallerySaver.saveImage(result.original),
                },
                icon: const Icon(Icons.save_alt),
              ),
            ],
          )
        ],
      ),
    );
  }
}
