import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:yoga_app/utils/widgets/app_button.dart';

import 'package:yoga_app/utils/widgets/app_subheading.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 15.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Choose your ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Gender',
                        style: TextStyle(
                            color: Color(0xffC91471),
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                height: 10.h,
                width: 35.h,
                decoration: BoxDecoration(
                    color: const Color(0xffEDEDED),
                    borderRadius: BorderRadius.circular(1.h)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/images/Vector.png"),
                    const AppSubHeading(
                      text:
                          'It help to calculate your\n Metabolic Rate and Plan',
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/male.png'),
                  Image.asset('assets/images/female.png'),
                ],
              ),
              SizedBox(
                height: 90,
                width: 300,
                child: Row(
                  children: [
                    Radio(
                      value: 'male',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    const AppSubHeading(text: 'Male'),
                    const SizedBox(
                      width: 90,
                    ),
                    Radio(
                      value: 'female',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    const AppSubHeading(
                      text: 'Female',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            child: const Row(
              children: [
                Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 34,
                  color: Color(0xffC8C8C8),
                ),
                Text(
                  'Previous',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(
                        0xffC8C8C8,
                      )),
                )
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 16),
          appButton(
            height: 45,
            width: 110,
            text: 'Next',
            onPressed: () {
              Navigator.pushNamed(context, '/ManAim');
            },
          )
        ],
      ),
    ));
  }
}
