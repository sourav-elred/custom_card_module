import 'package:custom_card_module/sourav_modules/core/ui/widgets/api_loader_screen.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/upload_screen_body.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadPictureScreen extends StatelessWidget {
  const UploadPictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const UploadPictureBody(),
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
