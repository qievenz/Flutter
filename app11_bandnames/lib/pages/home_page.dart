import 'package:app11_bandnames/models/band.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String route = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '0', name: 'Metalfirs', votes: 5),
    Band(id: '1', name: 'Metal', votes: 5),
    Band(id: '2', name: 'pemnico', votes: 5),
    Band(id: '3', name: 'terma', votes: 5),
    Band(id: '4', name: 'jopvi', votes: 5),
    Band(id: '5', name: 'heroes', votes: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames', style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) => _bandTile(bands[index])
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: (){},
      ),
   );
  }

  ListTile _bandTile(Band band) {
    return ListTile(
          leading: CircleAvatar(
            child: Text(band.name.substring(0,2)),
            backgroundColor: Colors.blue[100],
          ),
          title: Text(band.name),
          trailing: Text('${band.votes}', style: TextStyle(fontSize: 20),),
          onTap: () => print(band.id),
        );
  }
}