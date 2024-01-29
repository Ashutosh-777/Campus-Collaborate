import 'package:campus_collaborate/constants/themes.dart';
import 'package:flutter/material.dart';

PreferredSize customAppBar(String title, Function onBackTap) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      backgroundColor: Themes.getColors(ColorsValues.DARK_GREY_COLOR),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: false,
      leading: GestureDetector(
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onTap: () {
          onBackTap();
        },
      ),
      leadingWidth: 30,
      elevation: 0,
    ),
  );
}
