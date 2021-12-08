import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcarent_project/controllers/search_controller.dart';
import 'package:transcarent_project/widgets/results_widget.dart';
import 'package:transcarent_project/widgets/search_actions_widgets.dart';
import 'package:transcarent_project/widgets/search_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

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
            SearchActions(
              formKey: formKey,
              searchFieldController: _searchFieldController,
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
}
