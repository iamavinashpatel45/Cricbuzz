class json_com {
  String? apikey;
  Data? data;
  String? status;
  Info? info;

  json_com({this.apikey, this.data, this.status, this.info});

  json_com.fromJson(Map<String, dynamic> json) {
    apikey = json['apikey'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apikey'] = this.apikey;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? matchType;
  String? status;
  String? venue;
  String? date;
  String? dateTimeGMT;
  List<String>? teams;
  List<TeamInfo>? teamInfo;
  List<Score>? score;
  String? tossWinner;
  String? tossChoice;
  String? matchWinner;
  String? seriesId;
  List<Bbb>? bbb;

  Data(
      {this.id,
        this.name,
        this.matchType,
        this.status,
        this.venue,
        this.date,
        this.dateTimeGMT,
        this.teams,
        this.teamInfo,
        this.score,
        this.tossWinner,
        this.tossChoice,
        this.matchWinner,
        this.seriesId,
        this.bbb});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    matchType = json['matchType'];
    status = json['status'];
    venue = json['venue'];
    date = json['date'];
    dateTimeGMT = json['dateTimeGMT'];
    teams = json['teams'].cast<String>();
    if (json['teamInfo'] != null) {
      teamInfo = <TeamInfo>[];
      json['teamInfo'].forEach((v) {
        teamInfo!.add(new TeamInfo.fromJson(v));
      });
    }
    if (json['score'] != null) {
      score = <Score>[];
      json['score'].forEach((v) {
        score!.add(new Score.fromJson(v));
      });
    }
    tossWinner = json['tossWinner'];
    tossChoice = json['tossChoice'];
    matchWinner = json['matchWinner'];
    seriesId = json['series_id'];
    if (json['bbb'] != null) {
      bbb = <Bbb>[];
      json['bbb'].forEach((v) {
        bbb!.add(new Bbb.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['matchType'] = this.matchType;
    data['status'] = this.status;
    data['venue'] = this.venue;
    data['date'] = this.date;
    data['dateTimeGMT'] = this.dateTimeGMT;
    data['teams'] = this.teams;
    if (this.teamInfo != null) {
      data['teamInfo'] = this.teamInfo!.map((v) => v.toJson()).toList();
    }
    if (this.score != null) {
      data['score'] = this.score!.map((v) => v.toJson()).toList();
    }
    data['tossWinner'] = this.tossWinner;
    data['tossChoice'] = this.tossChoice;
    data['matchWinner'] = this.matchWinner;
    data['series_id'] = this.seriesId;
    if (this.bbb != null) {
      data['bbb'] = this.bbb!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeamInfo {
  String? name;
  String? shortname;
  String? img;

  TeamInfo({this.name, this.shortname, this.img});

  TeamInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortname = json['shortname'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['shortname'] = this.shortname;
    data['img'] = this.img;
    return data;
  }
}

class Score {
  int? r;
  int? w;
  num? o;
  String? inning;

  Score({this.r, this.w, this.o, this.inning});

  Score.fromJson(Map<String, dynamic> json) {
    r = json['r'];
    w = json['w'];
    o = json['o'];
    inning = json['inning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['r'] = this.r;
    data['w'] = this.w;
    data['o'] = this.o;
    data['inning'] = this.inning;
    return data;
  }
}

class Bbb {
  int? n;
  int? inning;
  int? over;
  int? ball;
  Batsman? batsman;
  Batsman? bowler;
  int? runs;
  int? extras;
  String? penalty;
  String? dismissal;
  String? catcher;
  String? notes;

  Bbb(
      {this.n,
        this.inning,
        this.over,
        this.ball,
        this.batsman,
        this.bowler,
        this.runs,
        this.extras,
        this.penalty,
        this.dismissal,
        this.catcher,
        this.notes});

  Bbb.fromJson(Map<String, dynamic> json) {
    n = json['n'];
    inning = json['inning'];
    over = json['over'];
    ball = json['ball'];
    batsman =
    json['batsman'] != null ? new Batsman.fromJson(json['batsman']) : null;
    bowler =
    json['bowler'] != null ? new Batsman.fromJson(json['bowler']) : null;
    runs = json['runs'];
    extras = json['extras'];
    penalty = json['penalty'];
    dismissal = json['dismissal'];
    catcher = json['catcher'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['n'] = this.n;
    data['inning'] = this.inning;
    data['over'] = this.over;
    data['ball'] = this.ball;
    if (this.batsman != null) {
      data['batsman'] = this.batsman!.toJson();
    }
    if (this.bowler != null) {
      data['bowler'] = this.bowler!.toJson();
    }
    data['runs'] = this.runs;
    data['extras'] = this.extras;
    data['penalty'] = this.penalty;
    data['dismissal'] = this.dismissal;
    data['catcher'] = this.catcher;
    data['notes'] = this.notes;
    return data;
  }
}

class Batsman {
  String? id;
  String? name;

  Batsman({this.id, this.name});

  Batsman.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Info {
  int? hitsToday;
  int? hitsUsed;
  int? hitsLimit;
  int? credits;
  int? server;
  double? queryTime;
  int? s;

  Info(
      {this.hitsToday,
        this.hitsUsed,
        this.hitsLimit,
        this.credits,
        this.server,
        this.queryTime,
        this.s});

  Info.fromJson(Map<String, dynamic> json) {
    hitsToday = json['hitsToday'];
    hitsUsed = json['hitsUsed'];
    hitsLimit = json['hitsLimit'];
    credits = json['credits'];
    server = json['server'];
    queryTime = json['queryTime'];
    s = json['s'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hitsToday'] = this.hitsToday;
    data['hitsUsed'] = this.hitsUsed;
    data['hitsLimit'] = this.hitsLimit;
    data['credits'] = this.credits;
    data['server'] = this.server;
    data['queryTime'] = this.queryTime;
    data['s'] = this.s;
    return data;
  }
}
