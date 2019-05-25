import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc_architechture/src/models/country_response.dart';
import 'package:http/http.dart' show Client;

class CountryApiProvider {
  Client client = Client();

  Future<CountryResponse> fetchCountryList() async {
    final response = await client.get("http://restcountries.eu/rest/v2/all");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return CountryResponse.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
