import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcarent_project/controllers/search_controller.dart';
import 'package:transcarent_project/widgets/results_widget.dart';
import 'package:transcarent_project/widgets/search_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final _searchController = Get.put(SearchController());

  final formKey = GlobalKey<FormState>();
  final TextEditingController _searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: SearchWidget(searchFieldController: _searchFieldController, formKey: formKey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: onSearchPress, child: const Text('Search')),
                ElevatedButton(
                    onPressed: () => _searchController.onClear(_searchFieldController), child: const Text('Clear')),
              ],
            ),
            Expanded(
              child: GetBuilder<SearchController>(
                builder: (_) {
                  return ResultsWidget(imagesResult: _.imageResults);
                },
              ),
            )
          ],
        ));
  }

  void onSearchPress() async {
    if (formKey.currentState!.validate()) {
      var searchTerm = _searchFieldController.text;
      _searchController.getImages(searchTerm);
    }
  }
}
