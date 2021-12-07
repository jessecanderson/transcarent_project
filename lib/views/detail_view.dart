import 'package:flutter/material.dart';
import 'package:transcarent_project/models/search_model.dart';

class DetailView extends StatelessWidget {
  DetailView({Key? key, required this.result}) : super(key: key);

  ImagesResult result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Hero(
              tag: result.title,
              child: Image.network(result.original),
            ),
          ),
        ),
      ),
    );
  }
}
