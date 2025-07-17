import 'package:flutter/material.dart';

class GridMenuItem {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isDisabled;

  GridMenuItem({
    required this.icon,
    required this.label,
    this.onTap,
    this.isDisabled = false,
  });
}

class GridMenuIconComponent extends StatelessWidget {
  final List<GridMenuItem> menuItems;
  final VoidCallback? onLihatSemua;

  const GridMenuIconComponent({Key? key, required this.menuItems, this.onLihatSemua})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List<GridMenuItem>.from(menuItems);
    Widget menuContent;

    if (items.length <= 4) {
      menuContent = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items
            .map(
              (menu) => _GridMenuIcon(
            icon: menu.icon,
            label: menu.label,
            onTap: menu.onTap,
            isDisabled: menu.isDisabled || menu.label.isEmpty,
          ),
        )
            .toList(),
      );
    } else {
      final gridItems = items.length > 7
          ? [
        ...items.take(7),
        GridMenuItem(
          icon: Icons.more_horiz,
          label: 'Lihat\nSemua',
          onTap: onLihatSemua,
        ),
      ]
          : items;

      while (gridItems.length < 8) {
        gridItems.add(
          GridMenuItem(icon: Icons.circle, label: '', isDisabled: true),
        );
      }

      menuContent = GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        childAspectRatio: 0.92,
        children: gridItems
            .map(
              (menu) => _GridMenuIcon(
            icon: menu.icon,
            label: menu.label,
            onTap: menu.onTap,
            isDisabled: menu.isDisabled || menu.label.isEmpty,
          ),
        )
            .toList(),
      );
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: menuContent,
      ),
    );
  }
}

class _GridMenuIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isDisabled;

  const _GridMenuIcon({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = isDisabled
        ? theme.disabledColor
        : theme.colorScheme.secondary.withOpacity(0.93);

    return InkWell(
      onTap: isDisabled || label.isEmpty ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Opacity(
        opacity: isDisabled ? 0.2 : 1.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.13),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(9),
                child: Icon(icon, size: 20, color: iconColor),
              ),
              if (label.isNotEmpty) ...[
                const SizedBox(height: 7),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.5,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
