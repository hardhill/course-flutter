import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course app"),
        centerTitle: true,
      ),
      body: _bodyPage(),
    );
  }

}
class _bodyPage extends StatefulWidget {
  @override
  State<_bodyPage> createState() => _bodyPageState();
}

class _bodyPageState extends State<_bodyPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        TextField(
          decoration: InputDecoration(labelText: "Label text"),
        ),
        SizedBox(height: 10,),
        TextFormField(decoration: InputDecoration(labelText: "Phone number"),),
        SizedBox(height: 10,),
        TextFormField(decoration: InputDecoration(labelText: "Email adress"),),
        SizedBox(height: 10,),
        TextFormField(decoration: InputDecoration(labelText: "Life story"),),
        SizedBox(height: 10,),
        TextFormField(decoration: InputDecoration(labelText: "Password"),),
        SizedBox(height: 10,),
        TextFormField(decoration: InputDecoration(labelText: "Confirm Password"),),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: (){},
            child: Text("Submit Form"))
      ],
    );
  }
}
