
class ProductVariationModel{
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;


  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this .stock = 0,
    required this.attributeValues,
});

  /// Create Empty func for clean code
  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});

  /// Json Format
 toJson(){
   return{
     'Id' : id,
     'Image' : image,
     'Description' : description,
     'SKU' : sku,
     'Price' : price,
     'SalePrice' : salePrice,
     'Stock' : stock,
     'AttributeValue' : attributeValues,
   };
 }
}