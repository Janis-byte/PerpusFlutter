import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  BottomNav(this.page);
  int page;
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  getPage(index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/profile');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/transaksi');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/movie');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.red,
      selectedItemColor: Colors.black,
      currentIndex: widget.page,
      onTap: getPage,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Transaksi",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Movie",
        ),
      ],
    );
  }
}
