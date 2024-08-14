import 'package:flutter/material.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import 'widgets/article_item.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Top Selling', style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {},
              child: const Text('See All'),
            )
          ],
        ),
        SizedBox(
          height: 282,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              //final categoryItem = state.categories.categories![index];

              return const ArticleItem(
                imageUrl: null,
                title: "mens's harigston",
                price: '€148,00',
                isFavorite: true,
              );
            },
            separatorBuilder: (_, index) => 16.sbs,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
