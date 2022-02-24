import 'package:flutter/material.dart';

class PlaceModle {
  final String title;
  final String location;
  final String imageUrl;
  final Color stateColor;

  PlaceModle(
      {required this.location,
      required this.title,
      required this.imageUrl,
      required this.stateColor});
}
