class CityModel {
  int id;
  String city;
  String cityImage;

  CityModel({this.id, this.city, this.cityImage});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    cityImage = json['cityImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city'] = this.city;
    data['cityImage'] = this.cityImage;
    return data;
  }
}
