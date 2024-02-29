import 'dart:developer';

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
  int _counter = 0;
  late ClientChannel clientChannel;
  late TodoServiceClient todoServiceClient;

  List<Todo>? todos;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    try {
      print('Starting');

      clientChannel = ClientChannel(
        '192.168.1.4',
        port: 8080,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      );
      todoServiceClient = TodoServiceClient(clientChannel);
      print('Inited');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (todos != null)
              ...todos!
                  .map((e) => ListTile(
                        leading: Text(e!.id.toString()),
                        title: Text(e!.title),
                        subtitle: Text(e!.description),
                      ))
                  .toList()
            else
              Text('Try adding todo')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await todoServiceClient.addTodo(Todo(
                id: 1,
                title: 'My second todo',
                description: 'My first descroption'));
            await todoServiceClient.getAllTodos(TodoQuery()).then((v) {
              todos = v.todos;
            });

            setState(() {});
          } catch (e) {
            print(e.toString());
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
