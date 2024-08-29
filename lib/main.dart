import 'package:flutter/material.dart';

// This is the main entry point of the app.
void main() {
  runApp(MyApp());
}

// This is the main widget that runs the app.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // Set the HomePage as the starting page
    );
  }
}

// The HomePage where login and registration happens.
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // These are the text fields for capturing input.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  // A boolean variable to keep track of whether the user is in login or registration mode.
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? 'Login' : 'Register'),
        backgroundColor: Colors.red[700],
        centerTitle: true, // Change title based on mode
      ),
      body: SingleChildScrollView(
        // Allows scrolling in case of overflow
        padding: EdgeInsets.all(16), // Add some padding to the content
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Make the buttons full-width
          children: [
            if (!isLogin)
              TextField(
                controller: nameController, // Capture the name when registering
                decoration: InputDecoration(labelText: 'Name'),
              ),
            TextField(
              controller: emailController, // Capture the email
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress, // Email input type
            ),
            TextField(
              controller: passwordController, // Capture the password
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true, // Hide password text for security
            ),
            SizedBox(
                height:
                    20), // Add some space between the text fields and the button
            ElevatedButton(
              onPressed: () {
                if (isLogin) {
                  // Handle login
                  print(
                      "Logging in with email: ${emailController.text} and password: ${passwordController.text}");
                } else {
                  // Handle registration
                  print(
                      "Registering with name: ${nameController.text}, email: ${emailController.text}, password: ${passwordController.text}");
                }
              },
              child: Text(isLogin
                  ? 'Login'
                  : 'Register'), // Change button text based on mode
            ),
            SizedBox(height: 10), // Space between buttons
            TextButton(
              onPressed: () {
                // Toggle between login and registration modes
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text(isLogin
                  ? "SIGNUP INSTEAD"
                  : "LOGIN INSTEAD"), // Toggle link text
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//
//   bool isLogin = true;
//   bool isPasswordVisible = false; // For toggling password visibility
//   bool isConfirmPasswordVisible =
//       false; // For toggling confirm password visibility
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(isLogin ? 'Login' : 'Register'),
//         backgroundColor: Colors.blue[700],
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             if (!isLogin)
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       isPasswordVisible = !isPasswordVisible;
//                     });
//                   },
//                 ),
//               ),
//               obscureText: !isPasswordVisible,
//             ),
//             if (!isLogin)
//               TextField(
//                 controller:
//                     confirmPasswordController, // Capture confirmation password
//                 decoration: InputDecoration(
//                   labelText: 'Confirm Password',
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       isConfirmPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         isConfirmPasswordVisible = !isConfirmPasswordVisible;
//                       });
//                     },
//                   ),
//                 ),
//                 obscureText:
//                     !isConfirmPasswordVisible, // Hide confirm password if not visible
//               ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 if (isLogin) {
//                   print(
//                       "Logging in with email: ${emailController.text} and password: ${passwordController.text}");
//                 } else {
//                   if (passwordController.text ==
//                       confirmPasswordController.text) {
//                     print(
//                         "Registering with name: ${nameController.text}, email: ${emailController.text}, password: ${passwordController.text}");
//                   } else {
//                     print(
//                         "Passwords do not match!"); // Handle password mismatch case
//                   }
//                 }
//               },
//               child: Text(isLogin ? 'Login' : 'Register'),
//             ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   isLogin = !isLogin;
//                   passwordController
//                       .clear(); // Clear password field when switching mode
//                   confirmPasswordController
//                       .clear(); // Clear confirm password field when switching mode
//                 });
//               },
//               child: Text(isLogin ? "SIGNUP INSTEAD" : "LOGIN INSTEAD"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
