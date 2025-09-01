import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'booking_con.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const FeedTab(), // ✅ Home feed with design
      const BookingPage(),
      ProfileTab(),
    ];

    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Booking"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

//
// -------- FEED TAB (UI + API data) --------
//
class FeedTab extends StatelessWidget {
  const FeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);

    return provider.isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔍 Search bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Explore like a local",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // 🔝 Categories
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: const [
                CategoryIcon(icon: Icons.fastfood, label: "Food"),
                CategoryIcon(icon: Icons.explore, label: "Experience"),
                CategoryIcon(icon: Icons.directions_bus, label: "Transport"),
                CategoryIcon(icon: Icons.camera_alt, label: "Photography"),
                CategoryIcon(icon: Icons.music_note, label: "Culture"),
                CategoryIcon(icon: Icons.sports_soccer, label: "Sport"),
              ],
            ),
          ),

          // 🌍 Top destination
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text("Top destination",
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Wrap(
              spacing: 8,
              children: [
                _chip("Paris"),
                _chip("London"),
                _chip("Tokyo"),
                _chip("New York"),
              ],
            ),
          ),

          // 🔥 Super Hatch
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Super Hatch",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text("See All",
                    style: TextStyle(color: Colors.red, fontSize: 14)),
              ],
            ),
          ),

          // 👤 Card List from API
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: provider.posts.length,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              final post = provider.posts[index];
              return HatchCard(
                name: "Jerome Bell",
                role: "Tourist",
                description: post["body"],
                rating: "4.8",
                price: "from 12€/person",
                imageUrl: "https://via.placeholder.com/150",
              );
            },
          )
        ],
      ),
    );
  }
}

//
// -------- PROFILE TAB --------
//
class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
          );
        },
        child: const Text("Logout",
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}

//
// -------- Widgets --------
//
class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const CategoryIcon({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

Widget _chip(String text) {
  return Chip(
    label: Text(text),
    backgroundColor: Colors.grey.shade200,
  );
}

class HatchCard extends StatelessWidget {
  final String name;
  final String role;
  final String description;
  final String rating;
  final String price;
  final String imageUrl;

  const HatchCard({
    super.key,
    required this.name,
    required this.role,
    required this.description,
    required this.rating,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: 28,
        ),
        title: Text("$name - $role",
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 16),
                Text(rating),
              ],
            ),
            const SizedBox(height: 4),
            Text(price, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
