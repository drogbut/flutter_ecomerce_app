import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/data/models/preset/card.dart';
import '../../core/extensions/color.dart';
import '../../core/extensions/widget.dart';
import '../../core/utilities/color.dart';
import '../../locator.dart';

class TwAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PresetCardClass presetCardClass;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? customHeight;

  const TwAppBar({
    required this.presetCardClass,
    this.leading,
    this.actions,
    this.bottom,
    this.customHeight,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(customHeight ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    UtilityColor colorUtil = sl.get<UtilityColor>();

    return AppBar(
      leading: leading,
      titleSpacing: 0,
      title: Container(
        padding: (h: 16, v: 8).symmetricPadding,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              HexColor.fromHex(presetCardClass.color).withOpacity(0.9),
              HexColor.fromHex(presetCardClass.color).withOpacity(0.4),
            ],
          ),
        ),
        child: Row(
          children: [
            FaIcon(
              IconDataSolid(colorUtil.getHexFromStr(presetCardClass.symbol!)),
              color: colorUtil.getBlackOrWhiteColor(
                HexColor.fromHex(presetCardClass.color).withOpacity(0.4),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                presetCardClass.text,
                style: TextStyle(
                  fontSize: 20,
                  color: colorUtil.getBlackOrWhiteColor(HexColor.fromHex(presetCardClass.color).withOpacity(0.9)),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: actions ??
          [
            const SizedBox(width: 15),
          ],
      bottom: bottom,
    );
  }
}
