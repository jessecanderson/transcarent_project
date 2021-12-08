import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcarent_project/controllers/search_controller.dart';
import 'package:transcarent_project/models/search_model.dart';
import 'package:transcarent_project/views/detail_view.dart';
import 'package:transcarent_project/widgets/lottie_widget.dart';

class ResultsWidget extends StatelessWidget {
  ResultsWidget({Key? key, required this.imagesResult}) : super(key: key);

  final searchController = Get.put(SearchController());

  List<ImagesResult> imagesResult;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: GridView.count(
        crossAxisCount: 3,
        children: _buildGrid(),
      ),
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          searchController.getMoreImages();
          return true;
        }
        return false;
      },
    );
  }

  List<Widget> _buildGrid() {
    if (imagesResult.isNotEmpty) {
      return imagesResult
          .map((result) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Hero(
                      tag: result.position,
                      child: CachedNetworkImage(
                        imageUrl: result.original,
                        placeholder: (context, url) => const SizedBox(
                          height: 50,
                          width: 50,
                          child: LottieAnimation(animation: 'spinning_dots'),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.cloud_off),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () => Get.to(
                    () => DetailView(
                      result: result,
                    ),
                    transition: Transition.noTransition,
                  ),
                ),
              ))
          .toList();
    } else {
      return [];
    }
  }
}
