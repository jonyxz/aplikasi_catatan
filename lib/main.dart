import 'package:flutter/material.dart';
import 'package:aplikasi_catatan/catatan.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController judulCtrl = TextEditingController();
  TextEditingController isiCtrl = TextEditingController();

  List<Map<String, String>> listCatatan = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Catatan Pagi'),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                TextField(
                    controller: judulCtrl,
                    decoration: InputDecoration(
                      hintText: "Judul Catatan",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
                SizedBox(height: 10),
                TextField(
                    controller: isiCtrl,
                    decoration: InputDecoration(
                      hintText: "Isi Catatan",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          judulCtrl.clear();
                          isiCtrl.clear();
                        },
                        child: Text("Clear")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            listCatatan.add({
                              "judul": judulCtrl.text,
                              "isi": isiCtrl.text,
                            });
                          });
                        },
                        child: Text("Submit")),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                    child: ListView.builder(
                  itemCount: listCatatan.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(listCatatan[index]["judul"]);
                        print(listCatatan[index]["isi"]);
                      },
                      child: ListTile(
                        title: Text(listCatatan[index]["judul"] ?? ""),
                        subtitle: Text(listCatatan[index]["isi"] ?? ""),
                      ),
                    );
                  },
                ))
              ],
            ),
          )),
    );
  }
}
