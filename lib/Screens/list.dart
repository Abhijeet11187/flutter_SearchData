import 'package:assignment2/Services/jsonlist.dart';
import 'package:flutter/material.dart';
import 'package:assignment2/Utils/customExtension.dart';

class ListElements extends StatefulWidget {
  @override
  _ListElementsState createState() => _ListElementsState();
}

class _ListElementsState extends State<ListElements> {
  bool _isSearching;
  List _notesForDisplay;
  @override
  void initState() {
    _isSearching = false;
    _notesForDisplay = jsonList;
    super.initState();
  }

  Widget _returnAppbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: _isSearching
          ? TextField(
              style: TextStyle(color: Colors.white),
              onChanged: (text) {
                text = text.toLowerCase();
                setState(() {
                  _notesForDisplay = jsonList.where((element) {
                    var searchField = element.countryName;
                    return searchField.contains(text);
                  }).toList();
                });
              },
              decoration: InputDecoration(
                  hintText: 'Search here',
                  hintStyle: TextStyle(color: Colors.white)),
            )
          : Text("List"),
      actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _notesForDisplay = jsonList;
                _isSearching = !_isSearching;
              });
            })
      ],
    );
  }

  _getStyle(bold) {
    return TextStyle(
        fontWeight: bold ? FontWeight.bold : FontWeight.normal, fontSize: 17);
  }

  Widget _returnCard(cardData) {
    return Card(
      color: Colors.amberAccent[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Country : ",
                style: _getStyle(true),
              ),
              Text(cardData.countryName, style: _getStyle(false)),
              Text("State : ", style: _getStyle(true)),
              Text(cardData.stateName, style: _getStyle(false)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("City  : ", style: _getStyle(true)),
              Text(cardData.cityName, style: _getStyle(false)),
            ],
          ),
        ],
      ).addPadding(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _returnAppbar(),
      body: ListView.builder(
          itemCount: _notesForDisplay.length,
          itemBuilder: (ctx, index) {
            return _returnCard(_notesForDisplay[index]);
          }),
    );
  }
}
