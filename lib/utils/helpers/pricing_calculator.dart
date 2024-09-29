
class ecomPricingCalculator {

  /// -- Calculate Price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// -- Calculate shipping cost
  static String calculateShippingCost(double productPrice, String location){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// -- Calculate Tax
  static String caculateTax ( double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location){
    //Use a tax rate by location database or an API
    //return the appropriate tax rate.
    return 0.10; //Example tax rate of 10%
  }

  static double getShippingCost (String location){
    //Use a shipping cost by location database or an API
    //return the shipping cost based on various factors like distance, weight, etc.
    return 5.00; //Example tax rate of 5%
  }

  /// -- Sum all cart values and return total amount
  // static double calculateCartTotal(CartModel cart){
  //   return cart.items.map((e) => e.price).fold(0, (previousPrice , currentPrice) => previousPrice + (currentPrice ?? 0));
  // }


}