class CountryDet {
  var countryName;

  var countryCode;
  var lat;
  var lon;
  var confirmed;
  var deaths;
  var recovered;
  var active;
  var date;

  CountryDet(
      {this.countryName,
      this.countryCode,
      this.lat,
      this.lon,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.active,
      this.date});

  factory CountryDet.fromJson(Map<dynamic, dynamic> json) {
    return CountryDet(
      countryName: json['Country'],
      countryCode: json['CountryCode'],
      lat: json['Lat'],
      lon: json['Lon'],
      confirmed: json['Confirmed'],
      deaths: json['Deaths'],
      recovered: json['Recovered'],
      active: json['Active'],
      date: json['Date'],
    );
  }
}
