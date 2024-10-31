import 'package:flutter/material.dart';

class Movie {
  int id;
  String title;
  String penulis;
  double vote;
  String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.vote,
    required this.posterPath,
    required this.penulis,
  });
}
