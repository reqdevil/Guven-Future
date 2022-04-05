// ignore_for_file: file_names
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:guven_future/Utilities/AppColors.dart';
import 'package:guven_future/Utilities/Constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    required this.automaticallyImplyLeading,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(
        window.viewPadding.top > 0 ? 55.0 : 75.0 - statusBarHeight,
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: !automaticallyImplyLeading
          ? IconButton(
              iconSize: 25,
              icon: const Icon(
                Icons.menu_rounded,
              ),
              onPressed: () {
                ScaffoldState? scaffoldState =
                    context.findRootAncestorStateOfType<ScaffoldState>();
                scaffoldState!.openDrawer();
              },
            )
          : IconButton(
              iconSize: 20,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
      actions: actions,
      centerTitle: true,
      toolbarHeight: preferredSize.height,
      title: const SizedBox(
        height: 35,
        child: Image(image: ExactAssetImage('assets/GuvenFutureLogo.png')),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: AppColors.black,
          gradient: LinearGradient(
            colors: [
              AppColors.mainColor,
              AppColors.menuGradientTop,
              AppColors.menuGradientBottom,
            ],
          ),
        ),
      ),
    );
  }
}
