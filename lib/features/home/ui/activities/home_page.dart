import 'package:astro_tak/core/app_colors.dart';
import 'package:astro_tak/features/home/ui/fragments/my_profile.dart';
import 'package:astro_tak/features/home/ui/fragments/order_history.dart';
import 'package:astro_tak/widgets/alt_button.dart';
import 'package:astro_tak/widgets/standard_app_bar.dart';
import 'package:astro_tak/widgets/standard_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kTextTabBarHeight),
              child: StandardAppBar(
                leading: StandardIconButton(
                  icon: Icons.arrow_back_ios,
                  onPressed: () {
                    Get.back();
                  },
                ),
                trailing: AltButton(
                  text: 'Logout',
                  onPressed: () {},
                ),
                bottom: TabBar(
                  labelColor: AppColors.secondaryColor,
                  unselectedLabelColor: Colors.grey.shade700,
                  indicatorColor: AppColors.secondaryColor,
                  tabs: [
                    Tab(
                      text: 'My Profile',
                    ),
                    Tab(
                      text: 'Order History',
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(children: [
              MyProfile(),
              OrderHistory(),
            ]),
          ),
        ));
  }
}
