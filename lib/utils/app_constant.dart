import 'package:flutter/cupertino.dart';
import 'app_colors.dart';
import 'package:intl/intl.dart';
import 'my_size.dart';

class AppConstant {
  static String saveUserToken = 'saveUserToken';
  static String saveUserID = 'saveUserID';
  static String saveUserEmail = 'saveUserEmail';
  static String saveUserPassword = 'saveUserPassword';
  static String getUserToken = '';
  static String getUserID = '';
  static String getUserEmail = '';
  static String getUserPassword = '';
  ///variables


  static const String login = '';


  static  Image halfSpotifyLogo1 = Image(image: const AssetImage('assets/icons/halfspotifylogo.png'), height:MySize.scaleFactorHeight*95, );
  static  Image halfOneDriveLogo1 = Image(image: const AssetImage('assets/icons/halfonedrivelogo.png'),height:MySize.scaleFactorHeight*95, );
  static  Image subtract = Image(image: const AssetImage('assets/icons/subtract.png'),height:MySize.scaleFactorHeight*4,width: MySize.size24,color: AppColors.grey61, );
  static  Image addition = Image(image: const AssetImage('assets/icons/add.png'),height:MySize.scaleFactorHeight*4,width: MySize.size24, );
  static String  faceID = 'assets/icons/faceid.png';
  ///images
  static  Image hboImage = Image(image: const AssetImage('assets/images/hbo.png'), height:MySize.scaleFactorHeight*40, width: MySize.scaleFactorWidth*50);
  static  Image spotifyImage = Image(image: const AssetImage('assets/images/Vector.png'), height:MySize.scaleFactorHeight*70, width: MySize.scaleFactorWidth*70);
  static  Image indeedImage = Image(image: const AssetImage('assets/images/indeed.png'), height:MySize.scaleFactorHeight*70, width: MySize.scaleFactorWidth*70);
  static  Image personImage = Image(image: const AssetImage('assets/images/person.png'), height:MySize.scaleFactorHeight*72, width: MySize.scaleFactorWidth*72);
  static  Image googleImage = Image(image: const AssetImage('assets/images/google.png'), height:MySize.scaleFactorHeight*27, width: MySize.scaleFactorWidth*27);


  static const String paypalIcon  = 'assets/images/paypal.png';
  static const String credit_cardIcon  = 'assets/images/debit_card.png';
  static const String debit_cardIcon  = 'assets/icons/debit.png';
  static const String three_dotsIcon  = 'assets/images/three_dots.png';
  static const String master_cardIcon  = 'assets/images/mastercard.png';






  static  Image half_SpotifyLogo1 = Image(image: const AssetImage('android/assets_h/icons/halfspotifylogo.png'), height:MySize.scaleFactorHeight*95, );
  static  Image half_OneDriveLogo1 = Image(image: const AssetImage('android/assets_h/icons/halfonedrivelogo.png'),height:MySize.scaleFactorHeight*95, );
  static  Image subtract_Image = Image(image: const AssetImage('android/assets_h/icons/subtract.png'),height:MySize.scaleFactorHeight*4,width: MySize.size24,color: AppColors.grey61, );
  static  Image addition_Image = Image(image: const AssetImage('assets/icons/add.png'),height:MySize.scaleFactorHeight*4,width: MySize.size24, );


  static String  faceID_Image = 'android/assets_h/faceid/Group.png';
  static String  trash = 'android/assets_h/icons/Trash.png';
  static String  notify = 'android/assets_h/icons/notify.png';
  static String  person = 'android/assets_h/icons/person.png';
  static String  language = 'android/assets_h/icons/language.png';
  static String  currency = 'android/assets_h/icons/currency.png';
  static String  password = 'android/assets_h/icons/password.png';
  static String  factor = 'android/assets_h/icons/factor.png';
  static String  email = 'android/assets_h/icons/email.png';
  static String  delete = 'android/assets_h/icons/delete.png';
  static String  darkmode = 'android/assets_h/icons/darkmode.png';
  static String  payment = 'android/assets_h/icons/payment.png';
  static String  plan = 'android/assets_h/icons/plan.png';
  static String  faqs = 'android/assets_h/icons/faqs.png';
  static String  contsupport = 'android/assets_h/icons/contact.png';
  static String  terms = 'android/assets_h/icons/terms.png';
  static String  privpolicy = 'android/assets_h/icons/privpolicy.png';
  static String  logout = 'android/assets_h/icons/logout.png';
  static String  chart = 'android/assets_h/icons/Chart.png';
  static String  analytics = 'android/assets_h/icons/analytics.png';
  static String  backArrow = 'android/assets_h/icons/backArrow.png';
  static String  downwardArrow = 'android/assets_h/icons/downwardArrow.png';

  ///images

  static  Image hbo_Image = Image(image: const AssetImage('android/assets_h/images/hbo.png'), height:MySize.scaleFactorHeight*40, width: MySize.scaleFactorWidth*50);
  static  Image tresorlyImage = Image(image: const AssetImage('assets/icons/tresorly.png'), height: 25,);
  static  Image spotify_Image = Image(image: const AssetImage('android/assets_h/images/Vector.png'), height:MySize.scaleFactorHeight*70, width: MySize.scaleFactorWidth*70);
  static  Image indeed_Image = Image(image: const AssetImage('android/assets_h/images/indeed.png'), height:MySize.scaleFactorHeight*70, width: MySize.scaleFactorWidth*70);
  static  Image person_Image = Image(image: const AssetImage('android/assets_h/images/person.png'), height:MySize.scaleFactorHeight*72, width: MySize.scaleFactorWidth*72);
  static  Image google_Image = Image(image: const AssetImage('android/assets_h/images/google.png'), height:MySize.scaleFactorHeight*27, width: MySize.scaleFactorWidth*27);



  static String  arrowLeft = 'android/assets_h/icons/arrowleft.png';
  static String  editImage = 'assets/icons/editimage.png';
  static String exclMark = 'assets/icons/mark.png';

  ///


  static const String privText = 'Lorem ipsum dolor sit amet consectetur. Auctor\n'
      'urna et at faucibus cras. Consectetur sed lorem\naliquet adipiscing sit in porttitor viverra. Erat'
      '\nmaecenas euismod a dictum. Interdum massa\nsenectus ultricies malesuada scelerisque sed.';


  static String validatePrice({double? price, String? currencyCode}) {
    // Use intl package to format the price according to international standards
    final format = NumberFormat.simpleCurrency(name: currencyCode);

    // If the price is zero or negative, format "0" with the correct currency symbol
    if (price! <= 0) {
      return format.format(0); // This will return something like "$0.00" or "₨0.00"
    }

    // Otherwise, format the actual price
    String formattedPrice = format.format(price);

    return formattedPrice;
  }



}