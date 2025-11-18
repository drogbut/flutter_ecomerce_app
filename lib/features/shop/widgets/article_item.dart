import 'package:flutter/material.dart';

import '../../../core/extensions/context.dart';
import '../../../core/extensions/widget.dart';

class ArticleItem extends StatelessWidget {
  final String title;
  final String price;
  final String? imageUrl;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  const ArticleItem({
    required this.title,
    required this.price,
    this.imageUrl,
    this.isFavorite = false,
    this.onFavoriteToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox(
        width: 160,
        height: 282,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: imageUrl == null ? context.colorScheme.surfaceContainer : Colors.transparent,
                      image: imageUrl != null
                          ? DecorationImage(
                              image: NetworkImage(imageUrl!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: context.colorScheme.secondary,
                  padding: 8.allPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      Text(
                        price,
                        style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: GestureDetector(
                onTap: onFavoriteToggle,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? context.colorScheme.primary : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
