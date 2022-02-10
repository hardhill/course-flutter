import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class MyHomePage extends StatelessWidget {
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
  bool _hidePass = true;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
 // final _scaffKey = GlobalKey<ScaffoldState>();

  List<String> _countries = ['Russia', 'Germany', 'France', 'Italy'];
  late String _selectedCountry;
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: "Label text*",
              hintText: "What do people call you?",
              prefixIcon: Icon(Icons.person),
              suffixIcon: Icon(
                Icons.delete_outline,
                color: Colors.red.shade300,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide()),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blueAccent)),
            ),
            validator: _validateName,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
                labelText: "Phone number*",
                hintText: "Where can we reach you?",
                helperText: "Phone format (XXX)XXX-XXXX",
                prefixIcon: Icon(Icons.phone),
                suffixIcon: Icon(
                  Icons.delete_outline,
                  color: Colors.red[300],
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(20))),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter(RegExp(r"^[()\d -]{1,15}$"),
                  allow: true)
            ],
            validator: (value) =>
                _phoneNumberValidator(value!) ? null : "Phone form incorrect",
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: "Email adress",
              hintText: "Enter email address",
              icon: Icon(Icons.mail),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
          ),
          SizedBox(
            height: 10,
          ),
          DropdownButtonFormField(
            items: _countries.map((element) {
              return DropdownMenuItem(
                child: Text(element),
                value: element,
              );
            }).toList(),
            onChanged: (data){ setState(() {
              print(data);
              _selectedCountry = data.toString();
            });},
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.golf_course),
                labelText: "Country?"),
            value: _selectedCountry,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _storyController,
            decoration: InputDecoration(
                labelText: "Life story",
                hintText: "Tell us about your self",
                helperText: "Keep it short. This is a demo",
                border: OutlineInputBorder()),
            maxLines: 3,
            inputFormatters: [LengthLimitingTextInputFormatter(100)],
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: _hidePass,
            maxLength: 8,
            decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter the password",
                icon: Icon(Icons.security),
                suffixIcon: IconButton(
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                )),
            validator: _validatePassword,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _confirmController,
            obscureText: _hidePass,
            maxLength: 8,
            decoration: InputDecoration(
              labelText: "Confirm Password",
              hintText: "Confirm the password",
              icon: Icon(Icons.border_color),
            ),
            validator: _validatePassword,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: _submitForm, child: Text("Submit Form"))
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      print("Name ${_nameController.text}");
      print("Phone ${_phoneController.text}");
    } else {
      _showMessage(message:"Form is not valid");
    }
  }
  void _showMessage({String? message}){

  }
  String? _validateName(String? value) {
    final _nameExp = RegExp(r"^[A-Za-z ]+$");
    if (value!.isEmpty) {
      return "Name is required";
    } else if (!_nameExp.hasMatch(value)) {
      return "Please input alphabetical characters";
    } else {
      return null;
    }
  }

  bool _phoneNumberValidator(String input) {
    final _phoneExp = RegExp(r"^\(\d\d\d\)\d\d\d\-\d\d\d\d$");
    return _phoneExp.hasMatch(input);
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email cannot be empry';
    } else if (!_emailController.text.contains("@")) {
      return "Invalid email addres";
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Password is empty";
    } else if (value.length < 8) {
      return "Password less then 8 characters";
    } else if (_passwordController.text == _confirmController.text) {
      return null;
    }
  }
}
