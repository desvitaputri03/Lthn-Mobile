import 'package:flutter/material.dart';
import 'package:flutter_app_desvita/Screen/page_image_network.dart';
import 'package:flutter_app_desvita/Screen/page_satu.dart';
import 'package:flutter_app_desvita/Screen/page_dua.dart';
import 'package:flutter_app_desvita/Screen/page_tiga.dart';
import 'package:flutter_app_desvita/Screen/page_form_login.dart';
import 'package:flutter_app_desvita/Screen/page_form_register.dart';
import 'package:flutter_app_desvita/Screen/page_gambar.dart';
import 'package:flutter_app_desvita/Screen/custom_grid/page_custom_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Apps MI2C'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 34),
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(context, 'Satu', PageSatu()),
                  _buildListTile(context, 'Register', PageFormRegister()),
                  _buildListTile(context, 'Dua', PageDua()),
                  _buildListTile(context, 'Tiga', PageTiga()),
                  _buildListTile(context, 'Login', PageFormLogin()),
                  _buildListTile(context, 'Gambar', PageGambar()),
                  _buildListTile(context, 'Image Network', GambarNetwork()),
                  _buildListTile(context, 'Custom Grid', PageCustomGrid()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, Widget page) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 12),
      color: Colors.lightBlueAccent,
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
        child: Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 22, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}