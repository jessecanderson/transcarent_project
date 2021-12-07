import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcarent_project/models/search_model.dart';
import 'package:transcarent_project/views/detail_view.dart';

class ResultsWidget extends StatelessWidget {
  ResultsWidget({Key? key, required this.imagesResult}) : super(key: key);

  List<ImagesResult> imagesResult;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        ..._buildGrid(),
      ],
    );
  }

  List<Widget> _buildGrid() {
    var gridItems = imagesResult
        .map((result) => InkWell(
              child: Image.network(result.original),
              onTap: () => Get.to(
                () => DetailView(
                  result: result,
                ),
              ),
            ))
        .toList();
    return gridItems;
  }
}
