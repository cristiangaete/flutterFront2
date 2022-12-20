


import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/task_services.dart';

import '../model/taskModel.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [];

  @override
  void initState(){
    super.initState();
    fetchUsers();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hola'),
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            final title = task.title;
            final description = task.description;
            return ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(title!),
              subtitle: Text(description!),
            );
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchUsers,
      // ),
    );
  }

  Future<void> fetchUsers() async {
   final response = await TaskService.fetchUsers();
   setState(() {
     tasks = response;
   });
  }

  
}
