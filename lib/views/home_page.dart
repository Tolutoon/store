import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/constants/themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tSecondaryColor,
        title: Center(
          child: SvgPicture.asset(
            'assets/general/store_brand.svg',
            color: tWhiteColor,
            width: 180,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.local_mall)),
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
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                    color: tPrimaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          Text('Apple Store'),
                          Text(
                              'Find the Apple product and accesories you are looking for'),
                          ElevatedButton(
                              onPressed: () {},
                              child: const Text('Shop new year'))
                        ],
                      ),
                    )),
                    Image.asset('assets/general/landing.png'),
                  ],
                ),
              )
              // Chip section
              // Hot sales section
              // Featured products
            ],
          ),
        ),
      ),
    );
  }
}
