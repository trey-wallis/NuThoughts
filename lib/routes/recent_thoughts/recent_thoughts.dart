import 'package:nuthoughts/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuthoughts/models/thought.dart';

class RecentThoughtsRoute extends StatefulWidget {
  const RecentThoughtsRoute({super.key});

  @override
  State<RecentThoughtsRoute> createState() => _RecentThoughtsRouteState();
}

class _RecentThoughtsRouteState extends State<RecentThoughtsRoute> {
  final AppController controller = Get.find();

//TODO refresh all
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Thoughts'),
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(25),
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.recentThoughts.length,
                  itemBuilder: (context, index) {
                    Thought thought =
                        controller.recentThoughts.reversed.toList()[index];
                    return Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(thought.text,
                                      style: const TextStyle(height: 1.3)),
                                  if (!thought.hasBeenSavedOnServer()) ...[
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: const [
                                          Icon(Icons.sync_problem,
                                              color: Colors.red)
                                        ])
                                  ]
                                ])));
                  },
                ),
              ))),
    );
  }
}
