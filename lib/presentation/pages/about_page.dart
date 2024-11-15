import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class AboutPage extends StatelessWidget {
  final HomeController controller;

  AboutPage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader('Tentang Kami', Icons.storefront_outlined),
          SizedBox(height: 16),
          _buildDescriptionContainer(
            'Marketplace Bahan Pangan adalah sebuah platform yang menawarkan berbagai jenis bahan pangan berkualitas dengan harga yang kompetitif, mempermudah Anda dalam memenuhi kebutuhan dapur setiap hari. Di sini, Anda dapat membeli bahan pangan segar seperti sayuran, buah-buahan, dan produk lainnya dari penyedia terpercaya.',
          ),
          SizedBox(height: 20),
          _buildSectionHeader(
              'Keunggulan Kami', Icons.check_circle_outline_sharp),
          SizedBox(height: 16),
          _buildFacilityContainer('Bahan Pangan Segar dan Berkualitas'),
          _buildFacilityContainer('Harga Bersaing'),
          SizedBox(height: 20),
        ],
      ),
      selectedIndex: 2,
      controller: controller,
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionContainer(String description) {
    return Card(
      elevation: 5, // Memberikan shadow pada card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Membuat sudut membulat
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.black),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget _buildFacilityContainer(String facility) {
    return Card(
      elevation: 3, // Memberikan shadow lebih tipis pada card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          facility,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
    );
  }
}
