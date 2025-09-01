import 'package:flutter/material.dart';
import 'home.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text("Booking confirmed",
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(   // ✅ scrollable page
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFFFFE4E1),
                child: Icon(Icons.check, size: 50, color: Colors.red),
              ),
              const SizedBox(height: 20),
              const Text("Booking confirmed!",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(height: 8),
              const Text(
                "Your reservation has been successfully processed.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // Booking ID
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE4E1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Booking # RES-2023-7845",
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),

              // Reservation Details
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Reservation Details",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),

              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                    NetworkImage("https://via.placeholder.com/150"),
                    radius: 24,
                  ),
                  title: const Text("Jerome Bell",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Row(
                    children: const [
                      Icon(Icons.location_on, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text("China", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Restaurant",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text("\$125.00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text("9:00 AM, 11/06/25"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.people, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text("04 People"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Next Steps
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Next Steps",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "• A confirmation email has been sent to your email address.\n"
                      "• You can modify your reservation up to 24 hours before the scheduled time.\n"
                      "• Please arrive at the point 5 minutes before the scheduled time.",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 30),

              // Buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                child: const Text("View Booking",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HomePage()));
                },
                child: const Text("Back to Home",
                    style: TextStyle(color: Colors.red, fontSize: 16)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
