import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';

class BasePage extends StatelessWidget {
  final Widget bodyContent;
  final int selectedIndex;
  final HomeController _controller;

  const BasePage({
    Key? key,
    required this.bodyContent,
    required this.selectedIndex,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Marketplace Bahan Pangan',
          style: TextStyle(
            color: Colors.black, // Warna teks
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor:
            Color(0xFFF5F5F5), // Warna latar belakang AppBar yang lebih netral
        elevation: 0, // Menghilangkan shadow/border pada AppBar
        centerTitle: true, // Memusatkan teks di AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(
              0xFFF8F9FA), // Warna latar belakang body yang lembut dan cocok untuk marketplace
          border: Border.all(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 3), // Border dengan warna netral
        ),
        child: bodyContent,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.2), // Warna shadow yang lebih lembut
              spreadRadius: 1, // Memberikan sedikit spread pada shadow
              blurRadius: 10, // Menambahkan blur agar shadow lebih halus
              offset: Offset(0, -2), // Menempatkan shadow di atas
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag), label: 'Card'),
              BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: const Color.fromARGB(
                255, 65, 139, 209), // Warna item terpilih untuk kesan alami
            unselectedItemColor:
                Colors.black54, // Warna item tidak terpilih yang lebih halus
            backgroundColor:
                Colors.white, // Latar belakang BottomNavigationBar putih
            onTap: _controller.onBottomNavTapped,
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../controllers/home_controller.dart';

// class BasePage extends StatelessWidget {
//   final Widget bodyContent;
//   final int selectedIndex;
//   final HomeController _controller;

//   const BasePage({
//     Key? key,
//     required this.bodyContent,
//     required this.selectedIndex,
//     required HomeController controller,
//   })  : _controller = controller,
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Marketplace Bahan Pangan',
//           style: TextStyle(
//             color: Colors.black, // Warna teks
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         backgroundColor:
//             Color(0xFFF5F5F5), // Warna latar belakang AppBar yang lebih netral
//         elevation: 0, // Menghilangkan shadow/border pada AppBar
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Color(
//               0xFFF8F9FA), // Warna latar belakang body yang lembut dan cocok untuk marketplace
//           border: Border.all(
//               color: Color(0xFFCCCCCC), width: 3), // Border dengan warna netral
//         ),
//         child: bodyContent,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_bag), label: 'Card'),
//           BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
//         ],
//         currentIndex: selectedIndex,
//         selectedItemColor:
//             Colors.green, // Warna item terpilih untuk kesan alami
//         unselectedItemColor:
//             Colors.black54, // Warna item tidak terpilih yang lebih halus
//         backgroundColor: Color(
//             0xFFE0E0E0), // Warna latar belakang BottomNavigationBar yang netral
//         onTap: _controller.onBottomNavTapped,
//       ),
//     );
//   }
// }

