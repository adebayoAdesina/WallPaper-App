class WallPaperModel {
  String? photographer;
  // ignore: non_constant_identifier_names
  String? photographer_url;
  // ignore: non_constant_identifier_names
  int? photographer_id;
  srcModel? src;

  // ignore: non_constant_identifier_names
  WallPaperModel(
      {this.photographer,
      // ignore: non_constant_identifier_names
      this.photographer_id,
      // ignore: non_constant_identifier_names
      this.photographer_url,
      this.src});

  factory WallPaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallPaperModel(
        src: srcModel.fromMap(jsonData['src']),
        photographer: jsonData['photographer'],
        photographer_url: jsonData['photographer_url'],
        photographer_id: jsonData['photographer_id']);
  }
}

// ignore: camel_case_types
class srcModel {
  String? original;
  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;

  srcModel(
      {this.original,
      this.large,
      this.medium,
      this.small,
      this.portrait,
      this.landscape,
      this.tiny});

  factory srcModel.fromMap(Map<String, dynamic> jsonData) {
    return srcModel(
      original: jsonData['original'],
      large: jsonData['large'],
      medium: jsonData['medium'],
      small: jsonData['small'],
      portrait: jsonData['portrait'],
      landscape: jsonData['landscape'],
      tiny: jsonData['tiny'],
    );
  }
}
