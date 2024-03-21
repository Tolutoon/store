import 'package:flutter/material.dart';
import 'package:store/constants/themes.dart';

class AdsBannerWidget extends StatelessWidget {
  const AdsBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
          color: tPrimaryColor,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Expanded(
              child: Container(
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Apple Store', style: AppTheme.tBigTitle),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Find the Apple product and accesories you are looking for',
                    style: AppTheme.tBodyText
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: tWhiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(0))),
                      child: const Text(
                        'Shop new year',
                        style: TextStyle(color: tPrimaryColor),
                      ))
                ],
              ),
            ),
          )),
          Image.asset('assets/general/landing.png'),
        ],
      ),
    );
  }
}
