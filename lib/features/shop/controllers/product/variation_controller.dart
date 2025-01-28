
import 'package:ecom_store/features/shop/controllers/product/image_controller.dart';
import 'package:ecom_store/features/shop/models/product_model.dart';
import 'package:ecom_store/features/shop/models/product_vairation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController{
  static VariationController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;


  /// -- Select Attribute, and Variation
  void onAttributeSelected(ProductModel product, attributeName, attributeValue){
    // When attribute is selected , we will first add that attribute to the selectedAttributes
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;
    
    final selectedVariation = product.productVariations!.firstWhere((variation) => _isSameAttributeValue(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    // Show the Selected Variation image as a Main Image
    if(selectedVariation.image.isNotEmpty){
      ImageController.instance.selectedProductImage.value = selectedVariation.image;
    }

    // Assign the selected Variation
    this.selectedVariation.value =  selectedVariation;

    // Update selected product variation status
    getProductVariationStockStatus();

  }

  /// -- Check if selected attributes matches any variation attributes
  bool _isSameAttributeValue(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    // If selectedAttributes contain 3 attribtues and current variation contains 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    // If any of the attributes is different then return. e.g. [Red, Large] x [Red, Small]
    for (final key in variationAttributes.keys) {
      // Attributes[Key] = Value which could be [Green, Small, Cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }


  /// -- Check Attribute availability / Stock in Variation
  Set<String?> getAttributeAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName){
    // Pass the variations to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations
        .where((variation) =>
      // Check Empty / Out of Stock Attributes
      variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0).
    map((variation) => variation.attributeValues[attributeName])
    .toSet();

    return availableVariationAttributeValues;

  }

  String getVariationPrice(){
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }

  /// -- Check Product Variation Stock Status
  void getProductVariationStockStatus(){
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// -- Reset Selected Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }

}