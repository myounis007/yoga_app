import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/services/profile_service.dart';
import 'package:yoga_app/services/workout_service.dart';
import 'package:yoga_app/utils/widgets/app_appbar.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';
import 'package:yoga_app/utils/widgets/app_subheading.dart';

import '../../models/workout_model.dart';

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
              text: 'Totals',
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 1,
              color: Colors.orangeAccent,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          FutureBuilder(
            future: WorkoutService()
                .getWorkoutsByUserId(FirebaseAuth.instance.currentUser!.uid),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<Workout> workouts = snapshot.data!;

              int totalWorkouts = workouts.length;
              int totalMinutes =
                  workouts.fold(0, (sum, workout) => sum + workout.minutes) ~/
                      60;
              int totalCalories =
                  workouts.fold(0, (sum, workout) => sum + workout.calories);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      AppHeading(
                        text: totalWorkouts.toString(),
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const AppSubHeading(
                        text: 'Workouts',
                      )
                    ],
                  ),
                  Column(
                    children: [
                      AppHeading(
                        text: totalMinutes.toString(),
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const AppSubHeading(
                        text: 'Minutes',
                      )
                    ],
                  ),
                  Column(
                    children: [
                      AppHeading(
                        text: totalCalories.toString(),
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const AppSubHeading(
                        text: 'Calories',
                      )
                    ],
                  ),
                ],
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AppHeading(
              text: 'Weight(lbs)',
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 1,
              color: Colors.orangeAccent,
            ),
          ),
          FutureBuilder(
            future: ProfileService()
                .getUserProfile(FirebaseAuth.instance.currentUser!.uid),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      AppHeading(
                        text: snapshot.data!.weight,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const AppSubHeading(
                        text: 'Current',
                      )
                    ],
                  ),
                  Column(
                    children: [
                      AppHeading(
                        text: snapshot.data!.goalWeight.toString(),
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const AppSubHeading(
                        text: 'Goal',
                      )
                    ],
                  ),
                ],
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AppHeading(
              text: 'Workout History',
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 1,
              color: Colors.orangeAccent,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.star,
              color: Colors.amber,
            ),
            title: Text(
              'Your current streaks',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              '7 Days',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.wb_incandescent_rounded,
              color: Colors.amber,
            ),
            title: Text(
              'Your highest streaks',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              '19 Days',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
