import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

/// Enum for the navigation bar items
enum NavBarItems {
  /// Home item
  home(
    route: '/home',
    labelEN: 'Home',
    labelES: 'Home',
  ),

  /// Notes item
  notes(
    route: '/notes',
    labelEN: 'Notes',
    labelES: 'Notas',
  ),

  /// Calendar item
  calendar(
    route: '/calendar',
    labelEN: 'Calendar',
    labelES: 'Calendario',
  ),

  /// Settings item
  settings(
    route: '/settings',
    labelEN: 'Settings',
    labelES: 'Ajustes',
  );

  const NavBarItems({
    required this.route,
    required this.labelEN,
    required this.labelES,
  });

  /// Route of the page
  final String route;

  /// English label of the item
  final String labelEN;

  /// Spanish label of the item
  final String labelES;
}

/// Custom navigation bar for the app
class CustomNavBar extends StatelessWidget {
  /// Custom navigation bar for the app
  const CustomNavBar({
    this.selectedItem,
    super.key,
  });

  /// The selected item of the navigation bar
  final NavBarItems? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.sp),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(3, 0),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavBarItem(
            item: NavBarItems.home,
            selectedItem: selectedItem,
            voidIcon: Icons.home_outlined,
            filledIcon: Icons.home,
          ),
          _NavBarItem(
            item: NavBarItems.notes,
            selectedItem: selectedItem,
            voidIcon: Icons.notes_rounded,
            filledIcon: Icons.notes_rounded,
          ),
          _NavBarItem(
            item: NavBarItems.calendar,
            selectedItem: selectedItem,
            voidIcon: Icons.calendar_month_outlined,
            filledIcon: Icons.calendar_month_rounded,
          ),
          _NavBarItem(
            item: NavBarItems.settings,
            selectedItem: selectedItem,
            voidIcon: Icons.settings_outlined,
            filledIcon: Icons.settings_rounded,
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    required this.item,
    required this.filledIcon,
    required this.voidIcon,
    this.selectedItem,
  });

  final NavBarItems item;
  final NavBarItems? selectedItem;
  final IconData filledIcon;
  final IconData voidIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final locale = Localizations.localeOf(context);
    final isSelected = item == selectedItem;

    return InkWell(
      splashColor: theme.primaryColor.withAlpha(128),
      onTap: () {
        if (!isSelected) context.replaceNamed(item.route);
      },
      child: SizedBox(
        width: 19.w,
        height: 5.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              isSelected ? filledIcon : voidIcon,
              size: 9.w,
              color: isSelected ? theme.primaryColor : Colors.grey,
            ),
            // Text(
            //   locale.languageCode == 'es' ? item.labelES : item.labelEN,
            //   overflow: TextOverflow.ellipsis,
            //   style: TextStyle(
            //     color: theme.primaryColor,
            //     fontSize: 6.sp,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
