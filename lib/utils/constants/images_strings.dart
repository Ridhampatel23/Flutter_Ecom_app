
///This class contains all Images in String format. Basically when we
///have to use images in our main files, we have to type their whole
///address which is not efficicent. So, in this class we would define
///those image in a String (for example : static const String pfp =
///"assets/logos/pfp.png". This would let us use those images in other
///files without typing the whole address again and again.This also makes
/// it easier incase we have to change an image/logo at multiple locations
/// as it makes the process less repetitive.
class ecomImages{

  //-- App Logos
  static const String lightAppLogo =  "assets/logos/splash_screen_logos/FlyBuy_logo_light.jpg";
  static const String darkAppLogo =  "assets/logos/splash_screen_logos/FlyBuy_logo_dark.jpg";

  //Footer icons
  static const String GoogleLogo = "assets/images/Footer_icons/google.jpg";
  static const String FacebookLogo = "assets/images/Footer_icons/facebook.png";
  static const String EmailLogo = "assets/images/login_images/Email_Verification.gif";
  static const String AccountCreated = "assets/images/login_images/account_created_successfully.gif";
  //-- Social Logos

  // -- OnBoarding Images
  static const String onBoardingImage1 = "assets/images/onboarding_screen_images/Welcome.gif";
  static const String onBoardingImage3 = "assets/images/onboarding_screen_images/Delivery_package.gif";
  static const String onBoardingImage2 = "assets/images/onboarding_screen_images/Credit_card.gif";

  // -- Home Screen Banners
  static const String newArrivals = "assets/images/home_screeen_carousal_images/new_Arrivals.webp";
  static const String sneakerOfTheWeek = "assets/images/home_screeen_carousal_images/sneaker_of_the_week.webp";
  static const String snkrsRestock = "assets/images/home_screeen_carousal_images/snkrs_restock.webp";

  // -- Products
  static const String nikeDunkGreen = "assets/images/products_images/nikeDunkGreen.jpg";

  // -- loading animations
  static const String decoderAnimation = "assets/images/loading_animations/searching_file.json";

  // -- categories logo
  static const String cosmeticsIcon = "assets/icons/Categories/Cosmetics.png";
  static const String sportsIcon = "assets/icons/Categories/Sports.png";
  static const String shoesIcon = "assets/icons/Categories/Shoes.png";
  static const String furnitureIcon = "assets/icons/Categories/Furniture.png";
  static const String petsIcon = "assets/icons/Categories/Pets.png";
  static const String electronicsIcon = "assets/icons/Categories/Electronics.png";
  static const String clothingIcon  = "assets/icons/clothingIcon.png";

}