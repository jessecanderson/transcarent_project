import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required TextEditingController searchFieldController,
  })  : _searchFieldController = searchFieldController,
        super(key: key);

  final TextEditingController _searchFieldController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: _searchFieldController,
        decoration: const InputDecoration(hintText: 'Image Search'),
      ),
    );
  }
}
