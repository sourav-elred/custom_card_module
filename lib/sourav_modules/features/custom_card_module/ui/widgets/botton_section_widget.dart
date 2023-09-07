import 'package:custom_card_module/sourav_modules/core/ui/widgets/custom_red_button.dart';
import 'package:custom_card_module/sourav_modules/core/constants/routes.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(1.0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomRedButton(
                invert: true,
                labelText: 'Edit Card',
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(Routes.customCardFieldsScreen);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomRedButton(
                labelText: 'Continue',
                onTap: () {
                  context.read<CustomCardVM>().postImage(onSuccess: () {
                    // Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Successfully uploaded'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
