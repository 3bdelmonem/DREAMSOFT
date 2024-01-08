// ignore_for_file: file_names
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Item extends Equatable {
  int id;
  String title;
  String store;
  String description;
  String rate;
  String price;
  String review;
  String available;
  bool favorite;
  List<String> images;
  List<String> colors;
  List<String> sizes;
  int quntity;
  Item(
      {required this.id,
      required this.title,
      required this.store,
      required this.description,
      required this.rate,
      required this.price,
      required this.review,
      required this.available,
      required this.favorite,
      required this.images,
      required this.colors,
      required this.quntity,
      required this.sizes});

  @override
  List<Object?> get props => [
        id,
        title,
        store,
        description,
        rate,
        price,
        review,
        available,
        favorite,
        images,
        sizes,
        colors,
        quntity,
      ];
}
