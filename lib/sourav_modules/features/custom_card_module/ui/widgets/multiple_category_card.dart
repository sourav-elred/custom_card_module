import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/single_category_card.dart';
import 'package:flutter/material.dart';

class MultipleCategoriesCard extends StatelessWidget {
  const MultipleCategoriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: GridView(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          childAspectRatio: 1.5,
        ),
        children: const [
          SingleCategoryCard(
            imageUrl: 'assets/images/photography.jpeg',
            label: 'Cricket',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/music.jpeg',
            label: 'Music',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/luxury.jpeg',
            label: 'Luxury',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/landscaping.jpeg',
            label: 'Landscape',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/teacher.jpeg',
            label: 'Teacher',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/cute.jpeg',
            label: 'Cute',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/fitness.jpeg',
            label: 'Fitness',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/artist.jpeg',
            label: 'Artist',
          ),
        ],
      ),
    );
  }
}
