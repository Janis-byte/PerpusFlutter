import 'package:flutter/material.dart';
import 'package:navigasi_flutter/widgets/bottom_nav.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Halaman Profil"),
      bottomNavigationBar: BottomNav(1),
    );
  }
}
