import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../widgets/indicators/loading_indicator.dart';
import '../providers/categories/category_cubit.dart';
import '../providers/categories/category_state.dart';
import 'widgets/categories_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..displayCategories(),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is CategoryFailure) {
            var snackBar = SnackBar(content: Text(state.errorMessage), behavior: SnackBarBehavior.floating);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const LoadingIndicator();
          }

          if (state is CategoryLoaded) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Categories', style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () {},
                      child: const Text('See All'),
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final categoryItem = state.categories.categories![index];

                      return CategoriesItem(imageUrl: categoryItem.imagePfad, label: categoryItem.title ?? '');
                    },
                    separatorBuilder: (_, index) => 16.sbs,
                    itemCount: state.categories.categories!.length,
                  ),
                ),
              ],
            );
          }

          return 0.sbs;
        },
      ),
    );
  }
}
