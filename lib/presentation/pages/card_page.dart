import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class CardPage extends StatefulWidget {
  final HomeController controller;

  CardPage(this.controller);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  // Daftar produk
  final List<Map<String, String>> productData = [
    {
      'image': 'assets/images/beras.png',
      'name': 'Beras super',
      'price': 'Rp 80.000'
    },
    {
      'image': 'assets/images/tomat.png',
      'name': 'Tomat Segar',
      'price': 'Rp 32.000/kg'
    },
    {
      'image': 'assets/images/cabe.png',
      'name': 'Cabe Segar',
      'price': 'Rp 25.000/kg'
    },
    {
      'image': 'assets/images/telur.png',
      'name': 'Telor Omega',
      'price': 'Rp 27.000/kg'
    },
    {
      'image': 'assets/images/ayam.png',
      'name': 'Ayam Fresh',
      'price': 'Rp 63.000/ekor'
    },
    {
      'image': 'assets/images/ikan.png',
      'name': 'Ikan Bandeng',
      'price': 'Rp 30.000/kg'
    },
    {
      'image': 'assets/images/minyak.png',
      'name': 'Minyak Bumoli',
      'price': 'Rp 12.000/kg'
    },
    {
      'image': 'assets/images/bawang.png',
      'name': 'Bawang Merah',
      'price': 'Rp 40.000/kg'
    },
    {
      'image': 'assets/images/bawangp.png',
      'name': 'Bawang Putih',
      'price': 'Rp 36.000/kg'
    },
  ];

  // Variabel untuk menyimpan query pencarian
  String query = '';

  // Fungsi untuk memfilter produk berdasarkan query pencarian
  List<Map<String, String>> get filteredProductData {
    return productData
        .where((product) => product['name']!.toLowerCase().contains(
            query.toLowerCase())) // Mencocokkan nama produk dengan query
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  query = text; // Update query setiap kali input berubah
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari produk...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // GridView untuk menampilkan produk
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(4),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Jumlah kolom per baris
                crossAxisSpacing: 4, // Jarak antar kolom
                mainAxisSpacing: 4, // Jarak antar baris
              ),
              itemCount: filteredProductData
                  .length, // Menggunakan data yang sudah difilter
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        8), // Menambahkan radius pada kotak
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black.withOpacity(0.1), // Warna shadow tipis
                        offset: Offset(0, 2), // Mengatur posisi shadow
                        blurRadius: 4, // Mengatur kehalusan shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Gambar produk
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            8), // Menambahkan sudut membulat pada gambar
                        child: Image.asset(
                          filteredProductData[index]['image']!,
                          fit: BoxFit
                              .cover, // Menyusun gambar agar sesuai dalam grid
                          height: 100, // Menentukan tinggi gambar
                          width: 100, // Menentukan lebar gambar
                        ),
                      ),
                      SizedBox(
                          height:
                              8), // Menambahkan jarak antara gambar dan deskripsi
                      // Nama produk
                      Text(
                        filteredProductData[index]['name']!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      // Harga produk
                      Text(
                        filteredProductData[index]['price']!,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 65, 139, 209),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      selectedIndex: 1,
      controller: widget.controller,
    );
  }
}
