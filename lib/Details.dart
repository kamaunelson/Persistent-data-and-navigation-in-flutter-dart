import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('User Details')
        ),
      ),
      body: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            SharedPreferences prefs = snapshot.data!;
            String name = prefs.getString('name') ?? '';
            String email = prefs.getString('email') ?? '';
            String phone = prefs.getString('phone') ?? '';

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: $name'),
                  Text('Email: $email'),
                  Text('Phone Number: $phone'),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear(); // Clear stored user data

          // Navigate back to the login page after logout
          Navigator.pushReplacementNamed(context, '/register');
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
