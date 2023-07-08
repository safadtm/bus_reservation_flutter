// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/helper_functions.dart';

class SearchBoxView extends StatefulWidget {
  final Function(String) onSubmit;
  const SearchBoxView({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<SearchBoxView> createState() => _SearchBoxViewState();
}

class _SearchBoxViewState extends State<SearchBoxView> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: _searchController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'Search with Mobile Number',
          suffix: IconButton(
            onPressed: () {
              if (_searchController.text.isEmpty) {
                showMsg(context, 'Nothing to search');
                return;
              }
              widget.onSubmit(_searchController.text);
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
