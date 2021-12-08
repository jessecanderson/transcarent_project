import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:transcarent_project/controllers/save_controller.dart';
import 'package:transcarent_project/models/search_model.dart';
import 'package:transcarent_project/widgets/lottie_widget.dart';

class DetailView extends StatelessWidget {
  DetailView({Key? key, required this.result}) : super(key: key);

  ImagesResult result;

  final _saveController = Get.put(SaveController());

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
              GetBuilder<SaveController>(builder: (_) {
                if (_saveController.isSaving.value) {
                  return const SizedBox(
                    height: 50,
                    width: 50,
                    child: LottieAnimation(animation: 'loading_success'),
                  );
                } else {
                  return IconButton(
                    iconSize: 35.0,
                    onPressed: () => _saveController.savePhoto(result),
                    icon: const Icon(Icons.save_alt),
                  );
                }
              }),
            ],
          )
        ],
      ),
    );
  }
}
