class ContestModal {
  bool? ok;
  List<Data>? data;
  String? lastUpdated;

  ContestModal({this.ok, this.data, this.lastUpdated});

  fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['lastUpdated'] = this.lastUpdated;
    return data;
  }
}

class Data {
  String? title;
  String? url;
  String? startTime;
  String? endTime;
  int? duration;
  String? platform;

  Data(
      {this.title,
      this.url,
      this.startTime,
      this.endTime,
      this.duration,
      this.platform});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    duration = json['duration'];
    platform = json['platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['duration'] = this.duration;
    data['platform'] = this.platform;
    return data;
  }
}
