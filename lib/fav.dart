import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/curd_rice.jpeg'), // Placeholder image for Curd Rice
            ),
            title: Text('Curd Rice'),
            subtitle: Text('A comforting South Indian dish'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/dosa.jpeg'), // Placeholder image for Dosa
            ),
            title: Text('Dosa'),
            subtitle: Text('Crispy and delicious Indian pancake'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/karaikudi_chicken.jpeg'), // Placeholder image for Karaikudi Chicken
            ),
            title: Text('Karaikudi Chicken'),
            subtitle: Text('Spicy and flavorful chicken dish'),
          ),
          // Add more ListTiles for additional favorite recipes
        ],
      ),
    );
  }
}
