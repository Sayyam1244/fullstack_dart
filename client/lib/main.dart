// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:protos/protos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ClientChannel clientChannel;
  late TodoServiceClient todoServiceClient;

  List<Todo> todos = [];
  TextEditingController controller = TextEditingController();
  int nextId = 0;
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) => ListTile(
              leading: Text(
                todos[index].id.toString(),
                style: TextStyle(fontSize: 10),
              ),
              title: Text(todos[index].title),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await todoServiceClient.addTodo(Todo(
                id: nextId++,
                title: controller.text,
                description: controller.text));
          } catch (e) {
            print(e.toString());
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  init() async {
    try {
      print('Starting');
      // HttpClient
      clientChannel = ClientChannel(
        '192.168.1.4',
        port: 8080,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      );
      todoServiceClient = TodoServiceClient(clientChannel);
      print('Inited');
      todoServiceClient
          .streamTodo(TodoQuery())
          .asBroadcastStream()
          .listen((value) {
        todos!.add(value);
        setState(() {});
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
