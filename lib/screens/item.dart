import 'package:flutter/material.dart';
import 'package:myproject/models/person.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/screens/addForm.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Item List"),
      //   backgroundColor: Colors.blue,
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: data[index].job.color,
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index].name,
                            style: GoogleFonts.kanit(
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            "Age: ${data[index].age} ages, Job: ${data[index].job.title}",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        data[index].job.image,
                        width: 70,
                        height: 70,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => const Addform()));
        },
        backgroundColor: Colors.yellow,
        child: const Icon(
          Icons.add,
          size: 36,
        ),
      ),
    );
  }
}
