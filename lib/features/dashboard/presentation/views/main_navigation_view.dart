import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';

class MainNavigationView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigationView({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.surfaceDark
              : Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: Icons.home_rounded,
                  outlinedIcon: Icons.home_outlined,
                  label: 'Home',
                  index: 0,
                  currentIndex: navigationShell.currentIndex,
                  onTap: () => _onTap(0),
                ),
                _NavItem(
                  icon: Icons.menu_book_rounded,
                  outlinedIcon: Icons.menu_book_outlined,
                  label: 'My Courses',
                  index: 1,
                  currentIndex: navigationShell.currentIndex,
                  onTap: () => _onTap(1),
                ),
                _NavItem(
                  icon: Icons.search_rounded,
                  outlinedIcon: Icons.search_outlined,
                  label: 'Explore',
                  index: 2,
                  currentIndex: navigationShell.currentIndex,
                  onTap: () => _onTap(2),
                ),
                _NavItem(
                  icon: Icons.person_rounded,
                  outlinedIcon: Icons.person_outline_rounded,
                  label: 'Profile',
                  index: 3,
                  currentIndex: navigationShell.currentIndex,
                  onTap: () => _onTap(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData outlinedIcon;
  final String label;
  final int index;
  final int currentIndex;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.outlinedIcon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == currentIndex;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                isSelected ? icon : outlinedIcon,
                key: ValueKey(isSelected),
                color: isSelected ? AppColors.primary : AppColors.textSecondaryLight,
                size: 24,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.textSecondaryLight,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 11,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
