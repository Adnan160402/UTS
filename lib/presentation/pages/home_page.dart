import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  HomePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container untuk border oranye
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 29, 111, 32),
                  width: 15, // Lebar border oranye
                ),
                borderRadius: BorderRadius.circular(1000), // Sudut membulat
              ),
              padding: EdgeInsets.all(
                  5), // Menambahkan padding agar border oranye tidak menyentuh border
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      1000), // Agar sudut gambar juga membulat
                  child: Container(
                    width: 350, // Atur lebar gambar sesuai kebutuhan
                    height: 350,
                    child: Image.asset('assets/images/image.png'),
                  )),
            ),
            SizedBox(height: 10), // Menambahkan jarak antara gambar dan teks
          ],
        ),
      ),
      selectedIndex: 0, // Home tab is selected
      controller: controller,
    );
  }
}
