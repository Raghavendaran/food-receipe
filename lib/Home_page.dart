import 'package:flutter/material.dart';
import 'package:learning_process/about.dart';
import 'package:learning_process/contact_us.dart';
import 'package:learning_process/fav.dart';
import 'package:learning_process/profile.dart';

// Model
class RecipeModel {
  final String name;
  final String image;
  final String category;
  final String duration;
  final String serving;
  final List<String> steps;

  RecipeModel({
    required this.name,
    required this.image,
    required this.category,
    required this.duration,
    required this.serving,
    required this.steps,
  });
}

// Sample data
final List<RecipeModel> trendingRecipes = [
  RecipeModel(
    name: "Idli",
    image: "assets/idli.jpeg",
    category: "South Indian",
    duration: "20 Minutes",
    serving: "2 Serving",
    steps: [
      "Step 1: Soak rice and urad dal overnight.",
      "Step 2: Grind them to a smooth batter.",
      "Step 3: Ferment the batter for 8 hours.",
      "Step 4: Pour batter into idli molds and steam for 10 minutes.",
    ],
  ),
  RecipeModel(
    name: "Dosa",
    image: "assets/dosa.jpeg",
    category: "South Indian",
    duration: "30 Minutes",
    serving: "2 Serving",
    steps: [
      "Step 1: Soak rice and urad dal overnight.",
      "Step 2: Grind them to a smooth batter.",
      "Step 3: Ferment the batter for 8 hours.",
      "Step 4: Spread the batter on a hot griddle to make dosa.",
    ],
  ),
  RecipeModel(
    name: "Sambar",
    image: "assets/sm.jpeg",
    category: "South Indian",
    duration: "40 Minutes",
    serving: "4 Serving",
    steps: [
      "Step 1: Cook toor dal until soft.",
      "Step 2: Sauté onions, tomatoes, and spices.",
      "Step 3: Add vegetables and cooked dal.",
      "Step 4: Simmer until vegetables are tender.",
    ],
  ),
];

final List<RecipeModel> latestRecipes = [
  RecipeModel(
    name: "Curd Rice",
    image: "assets/curd_rice.jpeg",
    category: "South Indian",
    duration: "15 Minutes",
    serving: "2 Serving",
    steps: [
      "Step 1: Cook rice until soft.",
      "Step 2: Mix rice with yogurt.",
      "Step 3: Temper with mustard seeds and curry leaves.",
      "Step 4: Serve chilled.",
    ],
  ),
  RecipeModel(
    name: "Upma",
    image: "assets/upma.jpeg",
    category: "South Indian",
    duration: "20 Minutes",
    serving: "2 Serving",
    steps: [
      "Step 1: Roast semolina until golden.",
      "Step 2: Sauté vegetables and spices.",
      "Step 3: Add water and bring to a boil.",
      "Step 4: Stir in roasted semolina and cook until thick.",
    ],
  ),
  RecipeModel(
    name: "Vada",
    image: "assets/vada.jpeg",
    category: "South Indian",
    duration: "30 Minutes",
    serving: "4 Serving",
    steps: [
      "Step 1: Soak urad dal for 4 hours.",
      "Step 2: Grind to a smooth batter.",
      "Step 3: Shape into vadas and deep fry.",
      "Step 4: Serve hot with chutney.",
    ],
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    // Combine and filter recipes from both lists
    final allRecipes = [...trendingRecipes, ...latestRecipes];
    final filteredRecipes = allRecipes.where((recipe) {
      return recipe.name.toLowerCase().startsWith(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Recipe App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoritesPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContactUsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Implement your logout functionality here
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Curved edge search bar
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Recipes',
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                ),
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: query.isEmpty
                  ? ListView(
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          'Trending Recipes',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: trendingRecipes.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child:
                                    RecipeItem(recipe: trendingRecipes[index]),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Latest Recipes',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: latestRecipes.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: RecipeItem(recipe: latestRecipes[index]),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: filteredRecipes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            title: Text(filteredRecipes[index].name),
                            leading: Image.asset(filteredRecipes[index].image),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetailScreen(
                                      recipe: filteredRecipes[index]),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// RecipeDetailScreen Widget
class RecipeDetailScreen extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailScreen({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(recipe.image),
            const SizedBox(height: 16),
            Text(
              recipe.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '${recipe.category} • ${recipe.duration} • ${recipe.serving}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Steps:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            for (var step in recipe.steps)
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// RecipeItem Widget
class RecipeItem extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeItem({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(recipe: recipe),
          ),
        );
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(recipe.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                recipe.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      backgroundColor: Colors.black54,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
