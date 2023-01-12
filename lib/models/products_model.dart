class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Product({required totalSize, required typeId,  required offset, required products}){
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }

  factory Product.fromJson(Map<String, dynamic> json) {

    var list = json['products'] as List;
    List<ProductModel> productsList = list.map((e) => ProductModel.fromJson(e as Map<String, dynamic>)).toList();

    return Product(
        totalSize : json['total_size'] as int,
        typeId : json['type_id'] as int,
        offset : json['offset'] as int,
        products: productsList
    );
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel(
      {required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.stars,
        required this.img,
        required this.location,
        required this.createdAt,
        required this.updatedAt,
        required this.typeId});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        price: json['price'] as int,
        stars: json['stars'] as int,
        img: json['img'] as String,
        location: json['location'] as String,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
        typeId: json['typeId'] as int
    );
  }
}
