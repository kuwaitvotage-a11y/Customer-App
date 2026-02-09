import 'package:cabme/core/themes/constant_colors.dart';
import 'package:cabme/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeAppBar extends StatelessWidget {
  final HomeController controller;
  final bool isDarkMode;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeAppBar({
    super.key,
    required this.controller,
    required this.isDarkMode,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        scaffoldKey.currentState?.openDrawer();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: isDarkMode ? AppThemeData.grey800 : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: Row(
              children: [
                // Drawer Icon Button
                Icon(
                  Iconsax.menu_1,
                  color: AppThemeData.primary200,
                  size: 25,
                ),

                const SizedBox(width: 10),
                // Location Text

                Expanded(
                  child: IgnorePointer(
                    child: TextField(
                      controller: controller.currentLocationController,
                      readOnly: true,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? AppThemeData.grey900Dark
                            : AppThemeData.grey900,
                        fontFamily: AppThemeData.medium,
                      ),
                      decoration: InputDecoration(
                        hintText: 'your_current_location'.tr,
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: isDarkMode
                              ? AppThemeData.grey500Dark
                              : AppThemeData.grey500,
                          fontFamily: AppThemeData.regular,
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 12),
                        isDense: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
