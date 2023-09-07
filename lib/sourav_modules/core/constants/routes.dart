import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/screens/category_screen.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/screens/custom_image_card_screen.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/screens/custom_image_card_with_fields_screen.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/screens/customize_card_screen.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/screens/upload_picture_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const initalRoute = '/';
  static const uploadScreen = '/upload-screen';
  static const customCardScreen = '/custom-card-screen';
  static const customCardFieldsScreen = '/custom-card-fields-screen';
  static const customizeCardScreen = '/customize-card-screen';

  static Map<String, Widget Function(BuildContext)> routesMap = {
    initalRoute: (context) => const CategoryScreen(),
    uploadScreen: (context) => const UploadPictureScreen(),
    customCardScreen: (context) => const CustomImageCardScreen(),
    customCardFieldsScreen: (context) => const CustomImageCardWithFields(),
    customizeCardScreen: (context) => const CustomizeCardScreen(),
  };
}
