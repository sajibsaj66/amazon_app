import 'package:amazon/utils/constants.dart';
import 'package:amazon/widgets/categories_more_widget.dart';
import 'package:amazon/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBar(isOnlyRead: true, hasBackButton: false),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.2 / 3.5,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15),
            itemCount: categoriesList.length,
            itemBuilder: (context, index) => CategoriesMoreWidget(index: index),
          ),
        ));
  }
}
