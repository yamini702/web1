import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  bool _userIdEmpty = false;
  bool _emailEmpty = false;
  bool _invalidEmail = false;
  bool _passwordEmpty = false;
  bool _passwordLess = false;
  bool _phoneEmpty = false;
  bool _invalidPhone = false;

  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _validateAll() {
    setState(() {
      _userIdEmpty = _userIdController.text.isEmpty;

      _emailEmpty = _emailController.text.isEmpty;
      _invalidEmail = !(_emailController.text.contains("@") &&
          _emailController.text.contains("."));

      _passwordEmpty = _passwordController.text.isEmpty;
      _passwordLess =
          _passwordController.text.isNotEmpty &&
              _passwordController.text.length < 8;

      _phoneEmpty = _phoneController.text.isEmpty;
      _invalidPhone =
          _phoneController.text.length != 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // USER ID
                TextFormField(
                  controller: _userIdController,
                  decoration: const InputDecoration(
                    labelText: "User ID",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) {
                    setState(() => _userIdEmpty = v.isEmpty);
                  },
                ),
                if (_userIdEmpty)
                  const Text("User ID cannot be empty",
                      style: TextStyle(color: Colors.red)),

                const SizedBox(height: 20),

                // EMAIL
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) {
                    setState(() {
                      _emailEmpty = v.isEmpty;
                      _invalidEmail =
                      !(v.contains("@") && v.contains("."));
                    });
                  },
                ),
                if (_emailEmpty)
                  const Text("Email cannot be empty",
                      style: TextStyle(color: Colors.red)),
                if (_invalidEmail)
                  const Text("Invalid email format",
                      style: TextStyle(color: Colors.red)),

                const SizedBox(height: 20),

                // PHONE
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) {
                    setState(() {
                      _phoneEmpty = v.isEmpty;
                      _invalidPhone = v.length != 10;
                    });
                  },
                ),
                if (_phoneEmpty)
                  const Text("Phone number cannot be empty",
                      style: TextStyle(color: Colors.red)),
                if (_invalidPhone)
                  const Text("Phone must be 10 digits",
                      style: TextStyle(color: Colors.red)),

                const SizedBox(height: 20),

                // PASSWORD
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  onChanged: (v) {
                    setState(() {
                      _passwordEmpty = v.isEmpty;
                      _passwordLess =
                          v.isNotEmpty && v.length < 8;
                    });
                  },
                ),
                if (_passwordEmpty)
                  const Text("Password cannot be empty",
                      style: TextStyle(color: Colors.red)),
                if (_passwordLess)
                  const Text("Minimum 8 characters required",
                      style: TextStyle(color: Colors.red)),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      _validateAll();

                      if (!_userIdEmpty &&
                          !_emailEmpty &&
                          !_invalidEmail &&
                          !_phoneEmpty &&
                          !_invalidPhone &&
                          !_passwordEmpty &&
                          !_passwordLess) {

                        Fluttertoast.showToast(
                          msg: "Login Successful",
                          backgroundColor: Colors.blueAccent,
                          textColor: Colors.white,
                        );

                        Navigator.pushNamed(context, '/dashboard');
                      }
                    },
                    child: const Text("Login"),
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


