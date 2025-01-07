
class BrandModel{
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({required this.id, required this.image, required this.name, this.isFeatured, this.productsCount});

  ///Empty Helper Function
 static BrandModel empty() => BrandModel(id: '', image: '', name: '');

 /// Convert model to Json so that you can store data in Firebase
 toJson() {
   return{
     'Id' : id,
     'Name' : name,
     'Image' : image,
     'ProductsCount' : productsCount,
     'IsFeatured' : isFeatured,
   };
 }

}