import 'package:custom_card_module/sourav_modules/core/ui/widgets/api_loader_screen.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/custom_image_card_body.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomImageCardScreen extends StatelessWidget {
  const CustomImageCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomImageCardBody(),
        Selector<CustomCardVM, bool>(
          builder: (_, isLoading, child) => Visibility(
            visible: isLoading,
            child: const ApiLoaderScreen(),
          ),
          selector: (_, model) => model.isLoading == true,
        ),
      ],
    );
  }
}
