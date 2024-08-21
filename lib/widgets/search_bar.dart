import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const SearchBarWidget({super.key,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              textInputAction: TextInputAction.search,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search News",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding / 2,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (controller.text.isNotEmpty) {
                onSubmitted(controller.text);
              }
            },
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: const Icon(
                Icons.search,
                color: kSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}