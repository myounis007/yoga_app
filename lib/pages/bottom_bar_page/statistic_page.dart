import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/utils/widgets/app_appbar.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';
import 'package:yoga_app/utils/widgets/app_subheading.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AppHeading(
              text: 'Total Kacl',
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const AppHeading(
                    text: '23444',
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const AppSubHeading(
                    text: 'Kcl',
                  )
                ],
              ),
              Column(
                children: [
                  const AppHeading(
                    text: '23444',
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const AppSubHeading(
                    text: 'Kcl',
                  )
                ],
              ),
              Column(
                children: [
                  const AppHeading(
                    text: '23444',
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const AppSubHeading(
                    text: 'Kcl',
                  )
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AppHeading(
              text: 'Total Weight(lbs)',
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const AppHeading(
                    text: '23444',
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const AppSubHeading(
                    text: 'Kcl',
                  )
                ],
              ),
              Column(
                children: [
                  const AppHeading(
                    text: '23444',
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const AppSubHeading(
                    text: 'Kcl',
                  )
                ],
              ),
              Column(
                children: [
                  const AppHeading(
                    text: '23444',
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const AppSubHeading(
                    text: 'Kcl',
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
