import 'dart:io';

import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/middle_section.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key, this.disableGesture = true, this.screenshotController});

  final bool disableGesture;

  final ScreenshotController? screenshotController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.3,
          width: MediaQuery.of(context).size.width / 1.3,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Consumer<CustomCardVM>(
                builder: (context, customCardVm, child) {
                  return Opacity(
                    opacity: .7,
                    child: Screenshot(
                      controller:
                          screenshotController ?? ScreenshotController(),
                      child: Consumer<CustomCardVM>(
                        builder: (context, customCardVm, child) {
                          if (customCardVm.image != null) {
                            return PhotoView(
                              disableGestures: disableGesture,
                              imageProvider: FileImage(customCardVm.tempImage ??
                                  customCardVm.image!),
                              initialScale: PhotoViewComputedScale.covered,
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
              const MiddleSection(),
            ],
          ),
        ),
      ),
    );
  }
}
