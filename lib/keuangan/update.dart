import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const UpdateData({Key? key, required this.KeuanganKey}) : super(key: key);

  // ignore: non_constant_identifier_names
  final String KeuanganKey;

  @override
  State<UpdateData> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateData> {
  final keterangan = TextEditingController();
  final nominal = TextEditingController();
  final jenis = TextEditingController();
  final date = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Keuangan');
    getKeuanganData();
  }

  void getKeuanganData() async {
    DataSnapshot snapshot = await dbRef.child(widget.KeuanganKey).get();

    // ignore: non_constant_identifier_names
    Map Keuangan = snapshot.value as Map;

    keterangan.text = Keuangan['keterangan'];
    nominal.text = Keuangan['nominal'];
    jenis.text = Keuangan['category'];
    date.text = Keuangan['date'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 73, 207, 11),
          shadowColor: const Color.fromARGB(255, 34, 106, 0),
          title: const Text(
            'Pemasukan',
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
            padding: const EdgeInsets.only(top: 10.0),
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Silahkan mengisi data baru yang ingin anda ubah:',
                        style: TextStyle(
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
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: jenis,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Kategori',
                          labelStyle: TextStyle(fontFamily: 'Serif'),
                          hintStyle: TextStyle(fontFamily: 'Serif'),
                          hintText: 'Kategori',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: keterangan,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Keterangan',
                          labelStyle: TextStyle(fontFamily: 'Serif'),
                          hintStyle: TextStyle(fontFamily: 'Serif'),
                          hintText: 'Masukan keterangan pemasukan',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: nominal,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nominal',
                          hintText: 'Masukan nominal pemasukan',
                          labelStyle: TextStyle(fontFamily: 'Serif'),
                          hintStyle: TextStyle(fontFamily: 'Serif'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        onPressed: () {
                          // ignore: non_constant_identifier_names
                          Map<String, String> Keuangan = {
                            'keterangan': keterangan.text,
                            'nominal': nominal.text,
                            'category': jenis.text,
                            'date': date.text
                          };

                          dbRef
                              .child(widget.KeuanganKey)
                              .update(Keuangan)
                              .then((value) => {Navigator.pop(context)});
                        },
                        color: const Color.fromARGB(255, 1, 93, 5),
                        textColor: Colors.white,
                        minWidth: 300,
                        height: 40,
                        child: const Text(
                          'Ubah Data',
                          style: TextStyle(
                              fontFamily: "Serif", fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
