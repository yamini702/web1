import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/api_service.dart';


class Form1 extends StatefulWidget {
  const Form1({super.key});

  @override
  State<StatefulWidget> createState() => _Form1State();
}


class _Form1State extends State<Form1> {


  final userIdController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Registration"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [

              /// USER ID
              TextFormField(
                controller: userIdController,
                decoration: const InputDecoration(
                  labelText: "User ID",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "User ID is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              /// EMAIL
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              /// PASSWORD
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              /// PHONE NUMBER
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length != 10) {
                    return "Enter valid 10-digit phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              /// SUBMIT BUTTON
              ElevatedButton(
                onPressed: () {
                   {
                    debugPrint("UserID: ${userIdController.text}");
                    debugPrint("Email: ${emailController.text}");
                    debugPrint("Password: ${passwordController.text}");
                    debugPrint("Phone: ${phoneController.text}");
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

