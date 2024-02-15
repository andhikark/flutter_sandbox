import 'package:flutter/material.dart';

class DisplayArguments {
  final String name;
  final String studentId;
  final String email;

  DisplayArguments(this.name, this.studentId, this.email);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Page App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Info Input Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _studentIdController,
                decoration: const InputDecoration(labelText: 'Student ID'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your student ID';
                  }
                  if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
                    return 'Only numbers are allowed';
                  }
                  if (value.length != 11) {
                    return 'Student ID must be 11 digits';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DisplayPage(),
                        settings: RouteSettings(
                          arguments: DisplayArguments(
                            _nameController.text,
                            _studentIdController.text,
                            _emailController.text,
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayPage extends StatelessWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DisplayArguments? args =
        ModalRoute.of(context)?.settings.arguments as DisplayArguments?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Name: ${args!.name}'),
            Text('Student ID: ${args.studentId}'),
            Text('Email: ${args.email}'),
          ],
        ),
      ),
    );
  }
}
