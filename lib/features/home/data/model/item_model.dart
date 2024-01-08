import 'package:dreamsoft/features/home/domain/entities/item.dart';

// ignore: must_be_immutable
class ItemModel extends Item {
  ItemModel({
    required id,
    required title,
    required description,
    required store,
    required images,
    required price,
    required colors,
    required sizes,
    required rate,
    required review,
    required available,
    required favorite,
    required quntity,
  }) : super(
          id: id,
          title: title,
          description: description,
          store: store,
          images: images,
          price: price,
          colors: colors,
          sizes: sizes,
          rate: rate,
          review: review,
          available: available,
          favorite: favorite,
          quntity: quntity,
        );

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        store: json["store"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["price"],
        colors: List<String>.from(json["colors"].map((x) => x)),
        sizes: List<String>.from(json["sizes"].map((x) => x)),
        rate: json["rate"],
        review: json["review"],
        available: json["available"],
        favorite: json["favorite"],
        quntity: json["quntity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "store": store,
        "images": List<dynamic>.from(images.map((x) => x)),
        "price": price,
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "sizes": List<dynamic>.from(sizes.map((x) => x)),
        "rate": rate,
        "review": review,
        "available": available,
        "favorite": favorite,
        'quntity': quntity,
      };
}
