class CodeChef {
  bool? success;
  String? profile;
  String? name;
  int? currentRating;
  int? highestRating;
  String? countryFlag;
  String? countryName;
  int? globalRank;
  int? countryRank;
  String? stars;

  CodeChef(
      {this.success,
      this.profile,
      this.name,
      this.currentRating,
      this.highestRating,
      this.countryFlag,
      this.countryName,
      this.globalRank,
      this.countryRank,
      this.stars});

  fromJson(Map<String, dynamic> json) {
    success = json['success'];
    profile = json['profile'];
    name = json['name'];
    currentRating = json['currentRating'];
    highestRating = json['highestRating'];
    countryFlag = json['countryFlag'];
    countryName = json['countryName'];
    globalRank = json['globalRank'];
    countryRank = json['countryRank'];
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['profile'] = this.profile;
    data['name'] = this.name;
    data['currentRating'] = this.currentRating;
    data['highestRating'] = this.highestRating;
    data['countryFlag'] = this.countryFlag;
    data['countryName'] = this.countryName;
    data['globalRank'] = this.globalRank;
    data['countryRank'] = this.countryRank;
    data['stars'] = this.stars;
    return data;
  }
}
