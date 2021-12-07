import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcarent_project/models/search_model.dart';
import 'package:transcarent_project/services/api_base_helper.dart';
import 'package:transcarent_project/widgets/results_widget.dart';
import 'package:transcarent_project/widgets/search_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool hasResults = false;
  List<ImagesResult>? results = [];

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
                ElevatedButton(onPressed: willSearch, child: const Text('Search')),
                ElevatedButton(onPressed: onClear, child: const Text('Clear')),
              ],
            ),
            hasResults
                ? Expanded(
                    child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: ResultsWidget(
                      imagesResult: results ?? [],
                    ),
                  ))
                : Container(),
          ],
        ));
  }

  void willSearch() async {
    if (formKey.currentState!.validate()) {
      var searchTerm = _searchFieldController.text;
      SearchResults response = await ApiBase.getImages(searchTerm);
      results = response.imagesResults;
      setState(() {
        hasResults = true;
      });
    }
  }

  void onClear() {
    _searchFieldController.clear();
    results = [];
    setState(() {
      hasResults = false;
    });
  }
}
