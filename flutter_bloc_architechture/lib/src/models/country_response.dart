class CountryResponse {
  List<Country> countries;
  CountryResponse({this.countries});
  CountryResponse.fromJson(dynamic json) {
    countries = new List<Country>();
    json.forEach((v) {
      countries.add(new Country.fromJson(v));
    });
  }
}

class Country {
  String name;
  String flag;

  Country({
    this.name,
    this.flag,
  });

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    flag = json['flag'];
  }

}
