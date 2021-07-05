import 'package:campskuy/utils/color_utils.dart';
import 'package:flutter/material.dart';

class SearchBarReverse extends StatelessWidget {
  const SearchBarReverse({
    Key? key,
    required this.searchController,
    required this.onSubmit,
    this.query,
  }) : super(key: key);
  final TextEditingController searchController;
  final Function(String) onSubmit;
  final String? query;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: ColorsUtil.accentGreen,
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorsUtil.accentGreen,
                  ),
                  hintText: "",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: ColorsUtil.accentGreen,
              onSubmitted: onSubmit,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Searching for "${query}"',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
