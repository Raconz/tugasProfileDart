import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile', textAlign: TextAlign.center),
          backgroundColor: Colors.blueGrey[200],
        ),
        body: ProfileContent(),
        backgroundColor: Colors.cyan[50],
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ProfilePage(),
          SizedBox(height: 20), // Memberi jarak antara ProfilePage dan RowCards
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: [
                Text('Hobi', 
                textAlign: TextAlign.center, 
                style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                RowCrads(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('asset/profile.jpg'),
          ),
          const SizedBox(height: 20),
          Text('Ahmat Fauzi',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text('Hai! Saya mahasiswa dari Universitas Sains Al - Quran.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 20),
          const Card(
            elevation: 4.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.cake),
                  title: Text('Tanggal Lahir'),
                  subtitle: Text('04 November 2000'),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),
                  subtitle: Text('Ahmat.04112000@gmail.com'),
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Alamat'),
                  subtitle: Text('Kaliwiro, Wonosobo'),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text('Pendidikan'),
                  subtitle: Text('Universitas Sains Al - Quran'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.code),
                onPressed: () async {
                  const url = 'https://github.com/Raconz/tugasProfileDart';
                  if (await canLaunchUrl(url as Uri)) {
                    await launchUrl(url as Uri);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                color: Colors.black,
                tooltip: 'GitHub',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RowCrads extends StatelessWidget {
  const RowCrads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
      height: 180, // Tinggi baris kartu
      child: ListView(
        scrollDirection: Axis.horizontal, // Mengatur scroll ke arah horizontal
        children: [
          buildCard('asset/gaming.webp', 'Gaming'),
          buildCard('asset/bnovel.webp', 'Baca Novel'),
          buildCard('asset/bmanga.jpg', 'Baca Komik'),
        ],
      ),
    ),
    );
  }

  Widget buildCard(String imageUrl, String title) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 140, // Lebar tiap kartu
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                height: 100,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
