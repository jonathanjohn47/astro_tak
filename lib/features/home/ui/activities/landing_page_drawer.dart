import 'package:astro_tak/features/home/getxcontrollers/landing_page_get_controller.dart';
import 'package:astro_tak/features/home/ui/activities/my_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPageDrawer extends StatelessWidget {
  const LandingPageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LandingPageGetController landingPageGetController =
        Get.put(LandingPageGetController());
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            DrawerHeader(child: Image.asset('assets/images/icon.png')),
            Divider(
              thickness: 2,
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                    itemCount:
                        landingPageGetController.landingPageDrawerItems.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Obx(() {
                            return ListTile(
                              title: Text(
                                landingPageGetController
                                    .landingPageDrawerItems[index],
                              ),
                              onTap: () {
                                Get.to(HomePage());
                              },
                            );
                          }),
                          Divider(
                            color: Colors.black,
                          ),
                        ],
                      );
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
