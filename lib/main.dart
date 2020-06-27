import 'package:flutter/material.dart';
import 'mycarpage.dart';
import 'title_n_ImageWidget.dart';
import 'carlistdata/cardlistdata.dart';
import 'carlistdata/cardatamodel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            "assets/#1.jpg",
            width: 60,
            height: 60,
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SearchViewList(),
          ],
        ),
      ),
    );
  }
}

class SearchViewList extends StatefulWidget {
  @override
  _SearchViewListState createState() => _SearchViewListState();
}

class _SearchViewListState extends State<SearchViewList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: ListView.builder(
          key: const PageStorageKey<String>("MySearchKey"),
          itemCount: cardListData.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return CarCard(cardListData[index]);
          },
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final CarDataModel _carDataModel;
  CarCard(this._carDataModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyCarPage(_carDataModel)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 30.0, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(28.0)),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(28.0))),
          color: _carDataModel.cardColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Hero(
                child: Image.asset('images/${_carDataModel.imageUrl}'),
                tag: _carDataModel.heroTag,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TitleContainer(EdgeInsets.only(top: 0, left: 2),
                            _carDataModel.title, 30.0, _carDataModel.fontColor),
                        TitleContainer(
                            EdgeInsets.only(top: 0, left: 2),
                            _carDataModel.company,
                            16.0,
                            _carDataModel.fontColor),
                      ],
                    ),
                    TitleContainer(
                        EdgeInsets.only(left: 16),
                        "\CFA${_carDataModel.price}",
                        20.0,
                        _carDataModel.fontColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
