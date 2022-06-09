class json_score {
  String? apikey;
  Data? data;
  String? status;
  Info? info;

  json_score({this.apikey, this.data, this.status, this.info});

  json_score.fromJson(Map<String, dynamic> json) {
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
  List<Scorecard>? scorecard;

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
      this.scorecard});

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
    if (json['scorecard'] != null) {
      scorecard = <Scorecard>[];
      json['scorecard'].forEach((v) {
        scorecard!.add(new Scorecard.fromJson(v));
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
    if (this.scorecard != null) {
      data['scorecard'] = this.scorecard!.map((v) => v.toJson()).toList();
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

class Scorecard {
  List<Batting>? batting;
  List<Bowling>? bowling;
  List<Catching>? catching;
  Extras? extras;
  Totals? totals;
  String? inning;

  Scorecard(
      {this.batting,
      this.bowling,
      this.catching,
      this.extras,
      this.totals,
      this.inning});

  Scorecard.fromJson(Map<String, dynamic> json) {
    if (json['batting'] != null) {
      batting = <Batting>[];
      json['batting'].forEach((v) {
        batting!.add(new Batting.fromJson(v));
      });
    }
    if (json['bowling'] != null) {
      bowling = <Bowling>[];
      json['bowling'].forEach((v) {
        bowling!.add(new Bowling.fromJson(v));
      });
    }
    if (json['catching'] != null) {
      catching = <Catching>[];
      json['catching'].forEach((v) {
        catching!.add(new Catching.fromJson(v));
      });
    }
    extras =
        json['extras'] != null ? new Extras.fromJson(json['extras']) : null;
    totals =
        json['totals'] != null ? new Totals.fromJson(json['totals']) : null;
    inning = json['inning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.batting != null) {
      data['batting'] = this.batting!.map((v) => v.toJson()).toList();
    }
    if (this.bowling != null) {
      data['bowling'] = this.bowling!.map((v) => v.toJson()).toList();
    }
    if (this.catching != null) {
      data['catching'] = this.catching!.map((v) => v.toJson()).toList();
    }
    if (this.extras != null) {
      data['extras'] = this.extras!.toJson();
    }
    if (this.totals != null) {
      data['totals'] = this.totals!.toJson();
    }
    data['inning'] = this.inning;
    return data;
  }
}

class Batting {
  Batsman? batsman;
  String? dismissal;
  Bowler? bowler;
  Batsman? catcher;
  String? dismissalText;
  int? r;
  int? b;
  int? i4s;
  int? i6s;
  num? sr;

  Batting(
      {this.batsman,
      this.dismissal,
      this.bowler,
      this.catcher,
      this.dismissalText,
      this.r,
      this.b,
      this.i4s,
      this.i6s,
      this.sr});

  Batting.fromJson(Map<String, dynamic> json) {
    batsman =
        json['batsman'] != null ? new Batsman.fromJson(json['batsman']) : null;
    dismissal = json['dismissal'];
    bowler =
        json['bowler'] != null ? new Bowler.fromJson(json['bowler']) : null;
    catcher =
        json['catcher'] != null ? new Batsman.fromJson(json['catcher']) : null;
    dismissalText = json['dismissal-text'];
    r = json['r'];
    b = json['b'];
    i4s = json['4s'];
    i6s = json['6s'];
    sr = json['sr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.batsman != null) {
      data['batsman'] = this.batsman!.toJson();
    }
    data['dismissal'] = this.dismissal;
    if (this.bowler != null) {
      data['bowler'] = this.bowler!.toJson();
    }
    if (this.catcher != null) {
      data['catcher'] = this.catcher!.toJson();
    }
    data['dismissal-text'] = this.dismissalText;
    data['r'] = this.r;
    data['b'] = this.b;
    data['4s'] = this.i4s;
    data['6s'] = this.i6s;
    data['sr'] = this.sr;
    return data;
  }
}

class Batsman {
  String? id;
  String? name;
  List<String>? altnames;

  Batsman({this.id, this.name, this.altnames});

  Batsman.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    altnames = json['altnames']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['altnames'] = this.altnames;
    return data;
  }
}

class Bowler {
  String? id;
  String? name;

  Bowler({this.id, this.name});

  Bowler.fromJson(Map<String, dynamic> json) {
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

class Bowling {
  Bowler? bowler;
  num? o;
  int? m;
  int? r;
  int? w;
  int? nb;
  int? wd;
  num? eco;

  Bowling(
      {this.bowler,
      this.o,
      this.m,
      this.r,
      this.w,
      this.nb,
      this.wd,
      this.eco});

  Bowling.fromJson(Map<String, dynamic> json) {
    bowler =
        json['bowler'] != null ? new Bowler.fromJson(json['bowler']) : null;
    o = json['o'];
    m = json['m'];
    r = json['r'];
    w = json['w'];
    nb = json['nb'];
    wd = json['wd'];
    eco = json['eco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bowler != null) {
      data['bowler'] = this.bowler!.toJson();
    }
    data['o'] = this.o;
    data['m'] = this.m;
    data['r'] = this.r;
    data['w'] = this.w;
    data['nb'] = this.nb;
    data['wd'] = this.wd;
    data['eco'] = this.eco;
    return data;
  }
}

class Catching {
  int? stumped;
  int? runout;
  int? cat;
  Batsman? catcher;

  Catching({this.stumped, this.runout, this.cat, this.catcher});

  Catching.fromJson(Map<String, dynamic> json) {
    stumped = json['stumped'];
    runout = json['runout'];
    cat = json['cat'];
    catcher =
        json['catcher'] != null ? new Batsman.fromJson(json['catcher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stumped'] = this.stumped;
    data['runout'] = this.runout;
    data['cat'] = this.cat;
    if (this.catcher != null) {
      data['catcher'] = this.catcher!.toJson();
    }
    return data;
  }
}

class Extras {
  int? r;
  int? b;
  int? lb;
  int? w;
  int? nb;
  int? p;

  Extras({this.r, this.b, this.lb, this.w, this.nb, this.p});

  Extras.fromJson(Map<String, dynamic> json) {
    r = json['r'];
    b = json['b'];
    lb = json['lb'];
    w = json['w'];
    nb = json['nb'];
    p = json['p'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['r'] = this.r;
    data['b'] = this.b;
    data['lb'] = this.lb;
    data['w'] = this.w;
    data['nb'] = this.nb;
    data['p'] = this.p;
    return data;
  }
}

class Totals {
  int? r;
  num? o;
  int? w;
  num? rR;

  Totals({this.r, this.o, this.w, this.rR});

  Totals.fromJson(Map<String, dynamic> json) {
    r = json['R'];
    o = json['O'];
    w = json['W'];
    rR = json['RR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['R'] = this.r;
    data['O'] = this.o;
    data['W'] = this.w;
    data['RR'] = this.rR;
    return data;
  }
}

class Info {
  int? hitsToday;
  int? hitsUsed;
  int? hitsLimit;
  int? credits;
  int? server;
  num? queryTime;
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
