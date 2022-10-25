import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/keuangan/update.dart';

class Laporan extends StatefulWidget {
  const Laporan({Key? key}) : super(key: key);

  @override
  State<Laporan> createState() => _FetchDataState();
}

class _FetchDataState extends State<Laporan> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Keuangan');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Keuangan');

  // ignore: non_constant_identifier_names
  Widget listItem({required Map Keuangan}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Kategori :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                Keuangan['category'],
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Tanggal :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                Keuangan['date'],
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Keterangan :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                Keuangan['keterangan'],
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Nominal :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                Keuangan['nominal'],
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              UpdateData(KeuanganKey: Keuangan['key'])));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit_outlined,
                      color: Colors.green.shade700,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  reference.child(Keuangan['key']).remove();
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.highlight_remove,
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 73, 207, 11),
          shadowColor: const Color.fromARGB(255, 34, 106, 0),
          title: const Text(
            'Laporan Keuangan',
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
          child: SizedBox(
            height: double.infinity,
            child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  // ignore: non_constant_identifier_names
                  Map Keuangan = snapshot.value as Map;
                  Keuangan['key'] = snapshot.key;
                  return listItem(Keuangan: Keuangan);
                }),
          ),
        ));
  }
}
