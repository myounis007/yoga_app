import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:yoga_app/utils/widgets/app_button.dart';

class UserName extends StatefulWidget {
  const UserName({super.key});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 13.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Whats Your ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Name?',
                          style: TextStyle(
                              color: Color(0xffC91471),
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/username.jpeg'),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            right: 150, left: 30, top: 50),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            right: 150, left: 30, top: 30),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Second Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
              Navigator.pushNamed(context, '/LetsGo');
            },
          )
        ],
      ),
    ));
  }
}
