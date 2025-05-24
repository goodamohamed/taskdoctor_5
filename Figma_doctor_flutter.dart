import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Doctor Figma', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: DoctorAppointmentScreen(),
      ),
    );
  }
}

class DoctorAppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello,', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              SizedBox(height: 4),
              Text('Hi James 👋', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                color: Colors.blue[100],
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. GOODA MOHAMED',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'General Doctor',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Monday, 14 June', style: TextStyle(fontSize: 12)),
                          Text('8:00 - 8:00 AM', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  hintText: 'Search doctor or health issue',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryIcon(icon: Icons.coronavirus, label: 'Covid 19'),
                    SizedBox(width: 12),
                    CategoryIcon(icon: Icons.person, label: 'Doctor'),
                    SizedBox(width: 12),
                    CategoryIcon(icon: Icons.medical_services, label: 'Medicine'),
                    SizedBox(width: 12),
                    CategoryIcon(icon: Icons.local_hospital, label: 'Hospital'),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Text('Nearby Doctors', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              DoctorCard(
                name: 'Dr. Saad Eldien',
                specialty: 'Dental Specialist',
                rating: 4.8,
                reviews: 120,
                distance: 1.2,
                openTime: '17:00',
              ),
              DoctorCard(
                name: 'Dr. Morad Adham',
                specialty: 'General Doctor',
                rating: 4.8,
                reviews: 98,
                distance: 2.5,
                openTime: '9:00',
              ),
            ],
          ),
        );
      },
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          padding: EdgeInsets.all(12),
          child: Icon(icon, size: 28, color: Colors.blue),
        ),
        SizedBox(height: 8),
        Container(
          width: 60,
          child: Text(
            label,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final double rating;
  final int reviews;
  final double distance;
  final String openTime;

  DoctorCard({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.openTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    specialty,
                    style: TextStyle(color: Colors.grey[700]),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text('$rating ($reviews)', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Opens at $openTime', style: TextStyle(fontSize: 12)),
                Text('${distance.toStringAsFixed(1)} km', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
