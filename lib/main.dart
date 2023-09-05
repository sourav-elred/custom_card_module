import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/screens/category_screen.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/screens/custom_image_card_screen.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/screens/custom_image_card_with_fields_screen.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/screens/customize_card_screen.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/screens/upload_picture_screen.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CustomCardVM())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const CategoryScreen(),
          '/upload-screen': (context) => const UploadPictureScreen(),
          '/custom-card-screen': (context) => const CustomImageCardScreen(),
          '/custom-card-fields-screen': (context) =>
              const CustomImageCardWithFields(),
          '/customize-card-screen': (context) => const CustomizeCardScreen(),
        },
      ),
    );
  }
}
