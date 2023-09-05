import 'dart:io';

import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/middle_section.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.disableGesture = true});

  final bool disableGesture;

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
                  if (customCardVm.imagePath != null) {
                    return Opacity(
                      opacity: .7,
                      child: PhotoView(
                        disableGestures: disableGesture,
                        imageProvider: FileImage(File(customCardVm.imagePath!)),
                        // initialScale: .6,
                        initialScale: context.watch<CustomCardVM>().scale ??
                            PhotoViewComputedScale.covered,

                        onScaleEnd: (context, details, controllerValue) {
                          context
                              .read<CustomCardVM>()
                              .onScaleChange(controllerValue.scale);
                        },
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              const Center(
                child: MiddleSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
