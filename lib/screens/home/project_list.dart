import 'package:flutter/material.dart';
import 'package:pdm/models/project.dart';

class ProjectList extends StatelessWidget {
  final List<Project> projects;

  const ProjectList({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('项目列表'),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return ListTile(
            title: Text(project.name),
            subtitle: Text(project.description),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, '/project-details', arguments: {'projectId': project.id});
            },
          );
        },
      ),
    );
  }
}