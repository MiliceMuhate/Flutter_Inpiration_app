import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inspirationapp/presentation/widgets/promoCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late Image imagens =
  //     getImage() as Image; // Lista para armazenar as publicações
  late List<String> imageUrl;
  // late String imageUrl1;
  final storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    // Set the initial value of imageUrl to an empty string
    imageUrl = [];
    // imageUrl1 = '';
    //Retrieve the imge grom Firebase Storage
    getImageUrl();
  }

  final ref = FirebaseDatabase.instance.ref('data');
// #########################################################################################
  Future<List<String>> getImageNames() async {
    // final ref = FirebaseDatabase.instance.ref('data');
    final List<String> imageNames = [];
    final ref1 = FirebaseDatabase.instance.ref('data');
    print("campos: " + ref1.path);
    // await printFields();

    // Get the snapshot of the specified field
    final snapshot = await ref1.get();
    print("Snapshot: " + snapshot.children.toString());

    // Iterate over the snapshot and extract image names
    if (snapshot.exists) {
      List<String> imageName = [];
      for (final childSnapshot in snapshot.children) {
        imageName = (childSnapshot.value.toString().split(","));
        // print("nomes: ${imageName[2].split(":")[1]}");
        imageNames.add(imageName[2].split(":")[1]);
      }
    }
    print("fim: $imageNames");
    return imageNames;
  }

  Future<List<String>> getImageUrl() async {
    // Get the reference to the image file in Firebase Storage
    final List<String> imageNomes = await getImageNames();
    var ref = await storage.ref().child('pexels-alesia-kozik-7797740.jpg');
    var url = await ref.getDownloadURL();
    setState(() {
      imageUrl.add(url);
    });
    // ref = await storage.ref().child(imageNomes[1]);
    // url = await ref.getDownloadURL();
    // setState(() {
    //   imageUrl.add(url);
    // });
    // ref = await storage.ref().child(imageNomes[2]);
    // url = await ref.getDownloadURL();
    // setState(() {
    //   imageUrl.add(url);
    // });
    // ref = await storage.ref().child(imageNomes[3]);
    // url = await ref.getDownloadURL();
    // setState(() {
    //   imageUrl.add(url);
    // });

    return imageUrl;
  }

  // Future<void> printFields() async {
  //   final ref = FirebaseDatabase.instance.ref('data');

  //   // Get the root node snapshot
  //   final snapshot = await ref.get();
  //   // Check if the snapshot exists
  //   if (snapshot.exists) {
  //     // Iterate over the child nodes (fields)
  //     for (final childSnapshot in snapshot.children) {
  //       // Get the field name (key) and value
  //       final fieldName = childSnapshot.key!;
  //       final fieldValue = childSnapshot.value;

  //       // Print the field name and value
  //       print("Field: $fieldName, Value: $fieldValue");
  //     }
  //   } else {
  //     print('No data found at the root node');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(244, 243, 243, 1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Encontre a tua",
                    style: TextStyle(color: Colors.black87, fontSize: 25),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Inspiracao",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(244, 243, 243, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black87,
                            ),
                            hintText: "Pesquise pelo que procura",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13))),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Parte rolável verticalmente

            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  // index++;
                  print("urls: $imageUrl");
                  return Column(
                    children: [
                      SizedBox(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            promoCard(imageUrl[index],
                                snapshot.child('name').value.toString()),
                            promoCard(imageUrl[index],
                                snapshot.child('name').value.toString()),
                            promoCard(imageUrl[index],
                                snapshot.child('name').value.toString()),
                            promoCard(imageUrl[index],
                                snapshot.child('name').value.toString()),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      bigPromoCard(imageUrl[index],
                          snapshot.child('name').value.toString()),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
        )));
  }
}
