import 'package:custom_card_module/sourav_modules/core/constants/colors.dart';
import 'package:custom_card_module/sourav_modules/core/ui/widgets/api_loader_screen.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/customized_card_body.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomizeCardScreen extends StatelessWidget {
  const CustomizeCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Text(
              'Customize your card',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  context.read<CustomCardVM>().setTempImage = null;
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                color: ColorConstants.elRed.withOpacity(.2),
                child: const Icon(Icons.close, color: ColorConstants.elRed),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          const CustomizedCardBody(),
          Selector<CustomCardVM, bool>(
            builder: (_, isLoading, child) => Visibility(
              visible: isLoading,
              child: const ApiLoaderScreen(),
            ),
            selector: (_, model) => model.isLoading == true,
          ),
        ],
      ),
    );
  }
}
