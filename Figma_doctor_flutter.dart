import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Doctor figma'),
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
        double width = constraints.maxWidth;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Hi James',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Card(
                color: Colors.blue[100],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  ),
                  title: Text('Dr. GOODA MOHAMED'),
                  subtitle: Text('General Doctr'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('MONday, 14 June'),
                      Text('8:00 - 8:00 AM'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search doctor or health issue',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryIcon(icon: Icons.coronavirus, label: 'Covid 19'),
                  CategoryIcon(icon: Icons.person, label: 'Doctor'),
                  CategoryIcon(icon: Icons.medical_services, label: 'Medicine'),
                  CategoryIcon(icon: Icons.local_hospital, label: 'Hospital'),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Near Doctor',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView(
                  children: [
                    DoctorCard(
                      name: 'Dr. saad eldien',
                      specialty: 'Dental Specialist',
                      rating: 4.8,
                      reviews: 120,
                      distance: 1.2,
                      openTime: '17:00',
                    ),
                    DoctorCard(
                      name: 'Dr. morad adham',
                      specialty: 'General
                       Doctor',
                      rating: 4.8,
                      reviews: 120,
                      distance: 1.2,
                      openTime: '9:00',
                    ),
                  ],
                ),
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
        Icon(icon, size: 40),
        SizedBox(height: 8),
        Text(label),
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
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
        ),
        title: Text(name),
        subtitle: Text(specialty),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.orange, size: 20),
                SizedBox(width: 4),
                Text('$rating ($reviews Reviews)'),
              ],
            ),
            SizedBox(height: 4),
            Text('Open at $openTime'),
            Text('${distance} KM'),
          ],
        ),
      ),
    );
  }
}
