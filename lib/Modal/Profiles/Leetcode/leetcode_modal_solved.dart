class LeetcodeSolved {
  int? solvedProblem;
  int? easySolved;
  int? mediumSolved;
  int? hardSolved;
  List<TotalSubmissionNum>? totalSubmissionNum;
  List<AcSubmissionNum>? acSubmissionNum;

  LeetcodeSolved(
      {this.solvedProblem,
      this.easySolved,
      this.mediumSolved,
      this.hardSolved,
      this.totalSubmissionNum,
      this.acSubmissionNum});

  fromJson(Map<String, dynamic> json) {
    solvedProblem = json['solvedProblem'];
    easySolved = json['easySolved'];
    mediumSolved = json['mediumSolved'];
    hardSolved = json['hardSolved'];
    if (json['totalSubmissionNum'] != null) {
      totalSubmissionNum = <TotalSubmissionNum>[];
      json['totalSubmissionNum'].forEach((v) {
        totalSubmissionNum!.add(new TotalSubmissionNum.fromJson(v));
      });
    }
    if (json['acSubmissionNum'] != null) {
      acSubmissionNum = <AcSubmissionNum>[];
      json['acSubmissionNum'].forEach((v) {
        acSubmissionNum!.add(new AcSubmissionNum.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['solvedProblem'] = this.solvedProblem;
    data['easySolved'] = this.easySolved;
    data['mediumSolved'] = this.mediumSolved;
    data['hardSolved'] = this.hardSolved;
    if (this.totalSubmissionNum != null) {
      data['totalSubmissionNum'] =
          this.totalSubmissionNum!.map((v) => v.toJson()).toList();
    }
    if (this.acSubmissionNum != null) {
      data['acSubmissionNum'] =
          this.acSubmissionNum!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TotalSubmissionNum {
  String? difficulty;
  int? count;
  int? submissions;

  TotalSubmissionNum({this.difficulty, this.count, this.submissions});

  TotalSubmissionNum.fromJson(Map<String, dynamic> json) {
    difficulty = json['difficulty'];
    count = json['count'];
    submissions = json['submissions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['difficulty'] = this.difficulty;
    data['count'] = this.count;
    data['submissions'] = this.submissions;
    return data;
  }
}

class AcSubmissionNum {
  String? difficulty;
  int? count;
  int? submissions;

  AcSubmissionNum({this.difficulty, this.count, this.submissions});

  AcSubmissionNum.fromJson(Map<String, dynamic> json) {
    difficulty = json['difficulty'];
    count = json['count'];
    submissions = json['submissions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['difficulty'] = this.difficulty;
    data['count'] = this.count;
    data['submissions'] = this.submissions;
    return data;
  }
}
