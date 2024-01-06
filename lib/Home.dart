import 'package:flutter/material.dart';
import 'Details.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Landing Page')
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Display 2 items in a row
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [
          _buildImageButton(context, 'Profile Details', 'images/iain.jpg'),
          _buildImageButton(context, 'MyWork', 'images/nick.jpg'),
          _buildImageButton(context, 'Line', 'images/iain.jpg'),
          _buildImageButton(context, 'Supoort', 'images/nick.jpg'),
          _buildImageButton(context, 'Settings', 'images/iain.jpg'),
          _buildImageButton(context, 'Logout', 'images/nick.jpg'),
        ],
      ),
    );
  }

  Widget _buildImageButton(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (title == 'Profile Details') {
          // Navigate to the Details page when Profile Details button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Details()),
          );
        } else {
          // Handle other button taps here
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey[300],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              width: 80,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
