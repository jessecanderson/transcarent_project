import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcarent_project/controllers/search_controller.dart';

class SearchActions extends StatelessWidget {
  SearchActions({
    Key? key,
    required TextEditingController searchFieldController,
    required GlobalKey<FormState> formKey,
  })  : _searchFieldController = searchFieldController,
        _formKey = formKey,
        super(key: key);

  final _searchController = Get.put(SearchController());

  final GlobalKey<FormState> _formKey;
  final TextEditingController _searchFieldController;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GetBuilder<SearchController>(builder: (_) {
              switch (_.searchStatus.value) {
                case SearchStatus.searching:
                  return const CircularProgressIndicator();

                case SearchStatus.done:
                  return ElevatedButton(
                    onPressed: onSearchPress,
                    child: const Text('Search'),
                  );
              }
            }),
            ElevatedButton(
                onPressed: () => _searchController.onClear(_searchFieldController), child: const Text('Clear')),
          ],
        ),
      );

  void onSearchPress() async {
    if (_formKey.currentState!.validate()) {
      var searchTerm = _searchFieldController.text;
      _searchController.getImages(searchTerm);
    }
  }
}
