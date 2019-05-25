import 'package:flutter/material.dart';
import 'package:flutter_bloc_architechture/src/models/country_response.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../blocs/country_bloc.dart';

class CountryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CountryListState();
  }
}

class CountryListState extends State<CountryList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchCountries();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOC Architechture',style: TextStyle(color: Colors.white),),
      ),
      body: StreamBuilder(
        stream: bloc.allCountries,
        builder: (context, AsyncSnapshot<CountryResponse> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<CountryResponse> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.countries.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return getStructuredGridCell(snapshot.data.countries[index]);
        });
  }

  Card getStructuredGridCell(Country country) {
    return Card(
        elevation: 1.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            SvgPicture.network(
              country.flag.replaceAll('https', 'http'),
              height: 130.0,
              width: 100.0,
              placeholderBuilder: (BuildContext context) => Container(
                    child: CircularProgressIndicator(),
                    padding: EdgeInsets.all(70),
                  ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(country.name),
            )
          ],
        ));
  }
}
