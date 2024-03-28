class LeetcodeContestModal {
  int? contestAttend;
  double? contestRating;
  int? contestGlobalRanking;
  int? totalParticipants;
  double? contestTopPercentage;
  ContestBadges? contestBadges;
  List<ContestParticipation>? contestParticipation;

  LeetcodeContestModal(
      {this.contestAttend,
      this.contestRating,
      this.contestGlobalRanking,
      this.totalParticipants,
      this.contestTopPercentage,
      this.contestBadges,
      this.contestParticipation});

  fromJson(Map<String, dynamic> json) {
    contestAttend = json['contestAttend'];
    contestRating = json['contestRating'];
    contestGlobalRanking = json['contestGlobalRanking'];
    totalParticipants = json['totalParticipants'];
    contestTopPercentage = json['contestTopPercentage'];
    contestBadges = json['contestBadges'] != null
        ? new ContestBadges.fromJson(json['contestBadges'])
        : null;
    if (json['contestParticipation'] != null) {
      contestParticipation = <ContestParticipation>[];
      json['contestParticipation'].forEach((v) {
        contestParticipation!.add(new ContestParticipation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contestAttend'] = this.contestAttend;
    data['contestRating'] = this.contestRating;
    data['contestGlobalRanking'] = this.contestGlobalRanking;
    data['totalParticipants'] = this.totalParticipants;
    data['contestTopPercentage'] = this.contestTopPercentage;
    if (this.contestBadges != null) {
      data['contestBadges'] = this.contestBadges!.toJson();
    }
    if (this.contestParticipation != null) {
      data['contestParticipation'] =
          this.contestParticipation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContestBadges {
  String? name;

  ContestBadges({this.name});

  ContestBadges.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class ContestParticipation {
  bool? attended;
  double? rating;
  int? ranking;
  String? trendDirection;
  int? problemsSolved;
  int? totalProblems;
  int? finishTimeInSeconds;
  Contest? contest;

  ContestParticipation(
      {this.attended,
      this.rating,
      this.ranking,
      this.trendDirection,
      this.problemsSolved,
      this.totalProblems,
      this.finishTimeInSeconds,
      this.contest});

  ContestParticipation.fromJson(Map<String, dynamic> json) {
    attended = json['attended'];
    rating = json['rating'];
    ranking = json['ranking'];
    trendDirection = json['trendDirection'];
    problemsSolved = json['problemsSolved'];
    totalProblems = json['totalProblems'];
    finishTimeInSeconds = json['finishTimeInSeconds'];
    contest =
        json['contest'] != null ? new Contest.fromJson(json['contest']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attended'] = this.attended;
    data['rating'] = this.rating;
    data['ranking'] = this.ranking;
    data['trendDirection'] = this.trendDirection;
    data['problemsSolved'] = this.problemsSolved;
    data['totalProblems'] = this.totalProblems;
    data['finishTimeInSeconds'] = this.finishTimeInSeconds;
    if (this.contest != null) {
      data['contest'] = this.contest!.toJson();
    }
    return data;
  }
}

class Contest {
  String? title;
  int? startTime;

  Contest({this.title, this.startTime});

  Contest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    startTime = json['startTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['startTime'] = this.startTime;
    return data;
  }
}
