
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


  }

  /// -- Check if selected attributes matches any variation attributes
  bool _isSameAttributeValue(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes){
    // If selectedAttributes contain 3 attribtues and current variation contains 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    // If any of the attributes is different then return. e.g. [Red, Large] x [Red, Small]
    for (final key in variationAttributes.keys) {
      // Attributes[Key] = Value which could be [Green, Small, Cotton] etc.
      if(variationAttributes[key] != selectedAttributes[key]) return false;
    }
  }


  /// -- Check Attribute availability / Stock in Variation
  Set<String> getAttributeAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName){}

  /// -- Check Product Variation Stock Status
  void getProductVariationStatus(){
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// -- Reset Selected Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }

}