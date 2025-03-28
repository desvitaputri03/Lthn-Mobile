import 'package:flutter/material.dart';

class PageCustomGrid extends StatefulWidget {
  const PageCustomGrid({super.key});

  @override
  State<PageCustomGrid> createState() => _PageCustomGridState();
}

class _PageCustomGridState extends State<PageCustomGrid> {
  // Daftar film dengan judul, gambar, dan harga
  List<Map<String, dynamic>> listMovie = [
    {
      "judul": "Ciao Alberto",
      "gambar": "movie1.jpg",
      "harga": "Rp 45.000"
    },
    {
      "judul": "The Simpson",
      "gambar": "movie2.png",
      "harga": "Rp 45.000"
    },
    {
      "judul": "Jungle Cruise",
      "gambar": "movie3.jpg",
      "harga": "Rp 45.000"
    },
    {
      "judul": "Home Alone",
      "gambar": "movie4.jpg",
      "harga": "Rp 45.000"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: listMovie.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom dalam grid
            crossAxisSpacing: 10, // Spasi antar kolom
            mainAxisSpacing: 10, // Spasi antar baris
            childAspectRatio: 0.7, // Rasio lebar terhadap tinggi item
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailPage(movie: listMovie[index]),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange[100], // Warna latar belakang
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.black54),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Gambar film
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'gambar/${listMovie[index]['gambar']}', // Path gambar
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Judul film
                    Text(
                      listMovie[index]['judul'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    // Harga film
                    Text(
                      listMovie[index]['harga'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Halaman detail film
class MovieDetailPage extends StatelessWidget {
  final Map<String, dynamic> movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['judul']),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'gambar/${movie['gambar']}', // Jalur gambar
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              movie['judul'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              movie['harga'],
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}