import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SedricLianDeloy_MidtermExam',
      theme: ThemeData(primarySwatch: Colors.blue), 
      home: Scaffold(
        appBar: AppBar(title: Text('SedricLianDeloy_MidtermExam')),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/back8.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ItemList(),
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final List<Map<String, dynamic>> _items = [
    {'name': 'Laptop', 'isAdded': false},
    {'name': 'Phone', 'isAdded': false},
    {'name': 'Printer', 'isAdded': false},
    {'name': 'Keyboard', 'isAdded': false},
    {'name': 'Mouse', 'isAdded': false},
    {'name': 'Monitor', 'isAdded': false},
    {'name': 'Processor', 'isAdded': false},
    {'name': 'RAM', 'isAdded': false},
    {'name': 'SSD', 'isAdded': false},
    {'name': 'Motherboard', 'isAdded': false},
  ];

  void _showDetails(String itemName) {
    print('Details of $itemName');
  }

  void _addItem(int index) {
    setState(() {
      _items[index]['isAdded'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return Card(
          color: item['isAdded'] ? Colors.green[200] : Colors.white,
          elevation: 5, 
          margin: EdgeInsets.all(10), 
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => _showDetails(item['name']),
                      child: Text('Details'),
                    ),
                    ElevatedButton(
                      onPressed: item['isAdded'] ? null : () => _addItem(index),
                      child: Text(item['isAdded'] ? 'Added' : 'Add'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
