import 'dart:convert';
import 'package:flutter_application_1/model/taskModel.dart';
import 'package:http/http.dart' as http;

class TaskService {
  
  static Future<List<TaskModel>> fetchUsers() async {
    print("llamada al servicio");
    const url = 'http://localhost:5000/tasks';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['tasks'] as List<dynamic>;
    final tasks = results.map((e){
        return TaskModel(
          title: e['title'],
          description: e['description']
        );
      }).toList();
    // setState(() {
    //   tasks = transformed;
    // });
    print('datos listos');
    return tasks;
  }
}