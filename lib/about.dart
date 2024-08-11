import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Us',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Welcome to our Food Recipe App! We are passionate about bringing you a diverse range of recipes from around the world. Our app is designed to make cooking enjoyable and accessible for everyone, with a special focus on South Indian cuisine.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Our Mission',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Our mission is to inspire and support home cooks by providing a vast collection of recipes, cooking tips, and nutritional information. We believe that good food brings people together, and we are committed to helping you create delicious meals for yourself and your loved ones.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Our Team',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Our team consists of experienced chefs, food enthusiasts, and technology experts who work together to curate and share the best recipes. We are dedicated to continuous improvement and always looking for ways to enhance your cooking experience.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Community Engagement',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'We value our community and encourage you to share your cooking experiences with us. Join our social media channels, participate in cooking challenges, and provide feedback to help us improve. Your input is invaluable in making our app the best it can be.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Thank you for choosing our app. We look forward to being a part of your culinary journey!',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
