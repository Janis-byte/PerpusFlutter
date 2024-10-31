import 'package:navigasi_flutter/models/movie.dart';

class MovieController {
  final List<Movie> movie = [
    Movie(
        id: 10,
        title: 'Pergi',
        vote: 8.0,
        penulis: "Tere Liye",
        posterPath: 'assets/pergi.jpg'),
    Movie(
        id: 11,
        title: 'Anthala',
        vote: 7.1,
        penulis: "Rohanah Lestari",
        posterPath: 'assets/anthala.jpg'),
  ];
}
