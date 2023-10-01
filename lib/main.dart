import 'package:contacts_pcsb/data/data_model.dart';
import 'package:flutter/material.dart';
import 'presentations/contacts_page/ui/contact_cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 5,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ],
      ),
      drawer: Drawer(),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(bottom: 18), // Adjust the value for spacing
            child: ContactCards(
              Email: dataList[i]["Email"],
              Name: dataList[i]["Name"],
              Gmail: dataList[i]["Gmail"],
              Mobileno: dataList[i]["Mobileno"],
              Position: dataList[i]["Position"],
              GitHub: dataList[i]["GitHub"],
              Linkedin: dataList[i]["Linkedin"],
              pic: dataList[i]["Profilepic"] ?? '',
            ),
          );
        },
        itemCount: dataList.length,
      ),
    );
  }
}
