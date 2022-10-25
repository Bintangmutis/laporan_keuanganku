import 'package:flutter/material.dart';
import 'package:mini_project/keuangan/laporan.dart';
import 'package:mini_project/keuangan/pemasukan.dart';
import 'package:mini_project/keuangan/pengeluaran.dart';
import 'package:mini_project/main.dart';

// ignore: must_be_immutable
class Beranda extends StatelessWidget {
  Beranda({super.key, required this.username});

  String username;

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        padding: const EdgeInsets.all(2),
        child: const Text(
          'Homepage',
          style: TextStyle(
              fontFamily: "Serif",
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 34, 106, 0),
              shadows: [
                Shadow(
                  color: Colors.green,
                  blurRadius: 10.0,
                  offset: Offset(3, 2),
                ),
              ]),
        ));

    Widget descSection = Container(
        padding: const EdgeInsets.all(2),
        child: Text(
          "Selamat Datang $username",
          style: const TextStyle(
              fontFamily: "Serif",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 34, 106, 0),
              shadows: [
                Shadow(
                  color: Colors.green,
                  blurRadius: 10.0,
                  offset: Offset(3, 2),
                ),
              ]),
        ));

    Widget logoSection = Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset.fromDirection(-15, -4))
        ],
      ),
      child: Image.asset(
        'images/icon.png',
        width: 190.0,
        height: 190.0,
      ),
    );

    Widget inSection = Container(
      padding: const EdgeInsets.all(2),
      child: MaterialButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Pemasukan()));
        },
        color: const Color.fromARGB(255, 1, 93, 5),
        textColor: Colors.white,
        minWidth: 300,
        height: 40,
        child: const Text(
          'Pemasukan',
          style: TextStyle(fontFamily: "Serif", fontWeight: FontWeight.bold),
        ),
      ),
    );

    Widget outSection = Container(
      padding: const EdgeInsets.all(2),
      child: MaterialButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Pengeluaran()));
        },
        color: const Color.fromARGB(255, 1, 93, 5),
        textColor: Colors.white,
        minWidth: 300,
        height: 40,
        child: const Text(
          'Pengeluaran',
          style: TextStyle(fontFamily: "Serif", fontWeight: FontWeight.bold),
        ),
      ),
    );

    Widget laporanSection = Container(
      padding: const EdgeInsets.all(2),
      child: MaterialButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Laporan()));
        },
        color: const Color.fromARGB(255, 1, 93, 5),
        textColor: Colors.white,
        minWidth: 300,
        height: 40,
        child: const Text(
          'Laporan Keuangan',
          style: TextStyle(fontFamily: "Serif", fontWeight: FontWeight.bold),
        ),
      ),
    );

    Widget logout = Container(
      padding: const EdgeInsets.all(2),
      child: MaterialButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyHomePage()));
        },
        color: const Color.fromARGB(255, 1, 93, 5),
        textColor: Colors.white,
        minWidth: 300,
        height: 40,
        child: const Text(
          'Log Out',
          style: TextStyle(fontFamily: "Serif", fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 207, 11),
        shadowColor: const Color.fromARGB(255, 34, 106, 0),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Laporan Keuanganku',
          style: TextStyle(
              fontFamily: "Serif",
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 10.0,
                  offset: Offset(1.0, 3.0),
                ),
                Shadow(
                  color: Color.fromARGB(255, 73, 207, 11),
                  blurRadius: 10.0,
                  offset: Offset(-5.0, 5.0),
                ),
              ]),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 144, 248, 154),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: const [
            0.4,
            0.9,
          ],
          colors: [
            const Color.fromARGB(255, 144, 248, 154),
            Colors.grey.shade300
          ],
        )),
        child: ListView(
          padding: const EdgeInsets.only(top: 60.0),
          children: <Widget>[
            Center(
              child: titleSection,
            ),
            Center(
              child: descSection,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: logoSection,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: inSection,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Center(
              child: outSection,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Center(
              child: laporanSection,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Center(
              child: logout,
            )
          ],
        ),
      ),
    );
  }
}
