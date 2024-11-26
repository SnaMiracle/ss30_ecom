//
// class ProductAttributeModel {
//   String? name;
//   final List<String>? values;
//
//   ProductAttributeModel({this.name, this.values});
//
//   Map<String, dynamic>toJson() {
//     return {'Name': name, 'Values': values ?? []};
//   }
//
//   factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
//     if (document.isEmpty) return ProductAttributeModel();
//
//     return ProductAttributeModel(
//       name: document['Name'] ?? '',
//       values: document['Values'] != null
//           ? List<String>.from(document['Values'])
//           : [],
//     );
//   }
// }

class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  toJson() {
    return {'Name': name, 'Values': values};
  }

  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );
  }
}