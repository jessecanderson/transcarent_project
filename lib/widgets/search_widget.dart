import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    Key? key,
    required TextEditingController searchFieldController,
    required GlobalKey formKey,
  })  : _searchFieldController = searchFieldController,
        _formKey = formKey,
        super(key: key);

  final TextEditingController _searchFieldController;
  final GlobalKey _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _searchFieldController,
        decoration: const InputDecoration(hintText: 'Image Search'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
