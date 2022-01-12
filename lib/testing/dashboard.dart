import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_practice/services/local_storage_service.dart';
import 'package:http_practice/testing/user.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  LocalStorageService? ls;
  User? user;

  @override
  void initState() {
    setupApplication();
    super.initState();
  }

  setupApplication() async {
    ls = await LocalStorageService.getInstance();
    var u = ls!.getFromDisk("user");
    user = User.fromJson(jsonDecode(u));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.blue,
                  ),
                ),
              ),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${user?.name}"),
                      Text("${user?.email}"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
