import 'package:pet_pass/features/home/data/models/category_model.dart';

class OfferModel {
  final int id;
  final String name;
  final String slug;
  final String permalink;
  final String description;
  final String shortDescription;
  final String buttonText;
  final String externalUrl;
  final String ribbonText;
  final String discountCode;
  final LocationModel? location;
  final List<CategoryModel> categories;
  final List<BrandModel> brands;
  final List<OfferImage> images;

  OfferModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.description,
    required this.shortDescription,
    required this.buttonText,
    required this.externalUrl,
    required this.ribbonText,
    required this.discountCode,
    required this.images,
    required this.categories,
    required this.brands,
    this.location,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      permalink: json['permalink'] ?? '',
      description: json['description'] ?? '',
      shortDescription: json['short_description'] ?? '',
      buttonText: json['button_text'] ?? '',
      externalUrl: json['external_url'] ?? '',
      ribbonText: _getMetaValue(json['meta_data'], 'ribbon_text'),
      discountCode: _getMetaValue(json['meta_data'], 'discount_code'),
      location: _getLocation(json['meta_data']),
      images:
          (json['images'] as List<dynamic>? ?? [])
              .map((e) => OfferImage.fromJson(e))
              .toList(),
      categories:
          (json['categories'] as List<dynamic>? ?? [])
              .map((e) => CategoryModel.fromJson(e))
              .toList(),
      brands:
          (json['brands'] as List<dynamic>? ?? [])
              .map((e) => BrandModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'permalink': permalink,
      'description': description,
      'short_description': shortDescription,
      'button_text': buttonText,
      'external_url': externalUrl,
      'ribbon_text': ribbonText,
      'discount_code': discountCode,
      'images': images.map((e) => e.toJson()).toList(),
      'categories': categories.map((e) => e.toJson()).toList(),
      'brands': brands.map((e) => e.toJson()).toList(),
      'location': location?.toJson(),
    };
  }

  static String _getMetaValue(List<dynamic>? metaData, String key) {
    if (metaData == null) return '';
    final match = metaData.firstWhere(
      (item) => item['key'] == key,
      orElse: () => {'value': ''},
    );
    return match['value']?.toString() ?? '';
  }

  static LocationModel? _getLocation(List<dynamic>? metaData) {
    if (metaData == null) return null;

    final match = metaData.firstWhere(
      (item) => item['key'] == 'location',
      orElse: () => {'value': null},
    );

    final value = match['value'];

    if (value is Map<String, dynamic>) {
      return LocationModel.fromJson(value);
    } else {
      return null;
    }
  }
}

class OfferImage {
  final int id;
  final String src;
  final String name;
  final String alt;

  OfferImage({
    required this.id,
    required this.src,
    required this.name,
    required this.alt,
  });

  factory OfferImage.fromJson(Map<String, dynamic> json) {
    return OfferImage(
      id: json['id'] ?? 0,
      src: json['src'] ?? '',
      name: json['name'] ?? '',
      alt: json['alt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'src': src, 'name': name, 'alt': alt};
  }
}

class BrandModel {
  final int id;
  final String name;
  final String slug;

  BrandModel({required this.id, required this.name, required this.slug});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'slug': slug};
  }
}

class LocationModel {
  final String address;
  final double lat;
  final double lng;
  final String city;
  final String country;

  LocationModel({
    required this.address,
    required this.lat,
    required this.lng,
    required this.city,
    required this.country,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      address: json['address'] ?? '',
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
      city: json['city'] ?? '',
      country: json['country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'lat': lat,
      'lng': lng,
      'city': city,
      'country': country,
    };
  }
}
