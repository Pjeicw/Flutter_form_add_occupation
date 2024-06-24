import 'package:flutter/material.dart';
import 'package:myproject/main.dart';
import 'package:myproject/models/person.dart';

class Addform extends StatefulWidget {
  const Addform({Key? key}) : super(key: key);

  @override
  State<Addform> createState() => _AddformState();
}

class _AddformState extends State<Addform> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _age = 20;
  Job _job = Job.police;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Title",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Form Record Data"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: "Name: ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please input your name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value ?? "";
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Age: ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please input your age";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _age = int.parse(value.toString());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: _job,
                  decoration: const InputDecoration(
                    labelText: "Occupation: ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  items: Job.values.map((key) {
                    return DropdownMenuItem(
                      value: key,
                      child: Text(key.title),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _job = value!;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      data.add(Person(name: _name, age: _age, job: _job));
                      _formKey.currentState!.reset();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (ctx) => const MyApp()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
