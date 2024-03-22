import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/constants/themes.dart';
import 'package:store/controllers/product_controller.dart';
import 'package:store/widgets/ads_banner.dart';
import 'package:store/widgets/card_widget.dart';
import 'package:store/widgets/chip_widget.dart';
import 'package:store/widgets/test_widget.dart';

class HomePage extends ConsumerWidget {
  // ignore: use_super_parameters
  const HomePage({Key? key}) : super(key: key); // Fixed constructor syntax

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tSecondaryColor,
        title: Center(
          child: SvgPicture.asset(
            'assets/general/store_brand.svg',
            // ignore: deprecated_member_use
            color: tWhiteColor,
            width: 180,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Added const
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.local_mall),
            ),
          )
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Ads banner section
              const AdsBannerWidget(),
              const SizedBox(
                height: 10,
              ),
              // Chip section
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ChipWidget(
                      chipLabel: 'All',
                    ),
                    ChipWidget(
                      chipLabel: 'Computers',
                    ),
                    ChipWidget(chipLabel: 'Headsets'),
                    ChipWidget(chipLabel: 'Accessories'),
                    ChipWidget(chipLabel: 'Printing'),
                    ChipWidget(chipLabel: 'Cameras')
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // Hot sales section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hot Sales',
                    style: AppTheme
                        .tSubHeading, // Removed because AppTheme not defined
                  ),
                  Text(
                    'See all',
                    style: AppTheme
                        .seeAllText, // Removed because AppTheme not defined
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                // color: Colors.amber,
                height: 290,
                width: double.infinity,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => CardWidget(
                        productIndex: index,
                      )),
                ),
              ),
              // Featured products

              // Hot sales section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Products',
                    style: AppTheme
                        .tSubHeading, // Removed because AppTheme not defined
                  ),
                  Text(
                    'See all',
                    style: AppTheme
                        .seeAllText, // Removed because AppTheme not defined
                  )
                ],
              ),
              MasonryGridView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: ((context, index) => Container(
                        height: 200,
                        child: CardWidget(
                          productIndex: index,
                        ),
                      ))),
              TestWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: tSecondaryColor,
          selectedItemColor: tPrimaryColor,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                activeIcon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Home',
                activeIcon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                label: 'Home',
                activeIcon: Icon(Icons.location_on)),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'Home',
                activeIcon: Icon(Icons.notifications)),
          ]),
    );
  }
}
