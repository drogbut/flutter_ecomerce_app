import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../routing/route_names.dart';
import '../../../../../../widgets/cards/vertical_image_card.dart';
import '../../../../../../widgets/texts/section_header.dart';
import '../../../data/repository/category_repository.dart';
import '../../cubit/categories_cubit.dart';
import '../../cubit/categories_state.dart';
import 'category_shimmer.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(context.read<CategoryRepository>())..fetchCategories(),
      child: BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error to fetch categories: ${state.errorMessage}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Header
              TSectionHeader(
                title: context.translate.homeCategoriesTitle,
                textColor: context.isDarkMode ? Colors.black : Colors.white,
              ).withPadding(TSizes.spaceBtwItems.bottomPadding),

              /// categories
              if (state.isLoading)
                const TCategoryShimmer()
              else if (state.featuredCategories.isEmpty)
                Center(
                  child: Text(
                    'No data Found!',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                )
              else
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    itemCount: state.featuredCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final category = state.featuredCategories[index];

                      return TVerticalImageCard(
                        imageUrl: category.image,
                        itemTitle: category.name ?? '',
                        onTap: () => context.pushNamed(RouteNames.subCategories),
                      );
                    },
                    separatorBuilder: (_, index) => TSizes.spaceBtwItems.sbs,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
