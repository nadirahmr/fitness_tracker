import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_tracker/providers/workout_provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final workoutProvider = Provider.of<WorkoutProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Tracker'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter Workout',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                workoutProvider.addWorkout(_controller.text);
                _controller.clear();
              }
            },
            child: Text('Add Workout'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: workoutProvider.workouts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(workoutProvider.workouts[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => workoutProvider.removeWorkout(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
