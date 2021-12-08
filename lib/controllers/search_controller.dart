import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcarent_project/models/search_model.dart';
import 'package:transcarent_project/services/api_base_helper.dart';

enum SearchStatus {
  searching,
  done,
}

class SearchController extends GetxController {
  String currentSearchTerm = '';

  List<ImagesResult> imageResults = <ImagesResult>[].obs;

  int pageNumber = 2;
  Rx<SearchStatus> searchStatus = Rx<SearchStatus>(SearchStatus.done);

  void getImages(String searchTerm) async {
    if (currentSearchTerm.isEmpty && currentSearchTerm != searchTerm) {
      currentSearchTerm = searchTerm;
    }
    searchStatus(SearchStatus.searching);
    update();
    SearchResults response = await ApiBase.getImages(searchTerm);
    if (response.imagesResults != null) {
      imageResults = response.imagesResults!;
      searchStatus(SearchStatus.done);
      update();
    }
  }

  void getMoreImages() async {
    SearchResults response = await ApiBase.getImages(currentSearchTerm, page: pageNumber);
    if (response.imagesResults != null) {
      imageResults.addAll(response.imagesResults!);
      update();
      pageNumber += 1;
    }
  }

  void onClear(TextEditingController controller) {
    pageNumber = 2;
    currentSearchTerm = '';
    imageResults.clear();
    controller.clear();
    searchStatus(SearchStatus.done);
    update();
  }
}
