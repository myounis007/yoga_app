import 'package:flutter/material.dart';

import '../../utils/widgets/container_two.dart';
import '../bottom_bar_page/statistic_page.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const WorkoutContainerWidget(
            text: 'Beginner Yoga \n Plan',
          ),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return StatisticPage();
                    },
                  ));
                },
                leading: Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                ),
                title: const Text('Name'),
                subtitle: Text('10 s'),
              );
            },
          )
        ],
      ),
    );
  }
}
