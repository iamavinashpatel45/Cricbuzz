class json_info {
  String? apikey;
  List<Data>? data;
  String? status;
  Info? info;

  json_info({this.apikey, this.data, this.status, this.info});

  json_info.fromJson(Map<String, dynamic> json) {
    apikey = json['apikey'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apikey'] = this.apikey;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}

class Data {
  String? teamName;
  List<Players>? players;

  Data({this.teamName, this.players});

  Data.fromJson(Map<String, dynamic> json) {
    teamName = json['teamName'];
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(new Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamName'] = this.teamName;
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Players {
  String? id;
  String? name;
  String? role;
  String? battingStyle;
  String? bowlingStyle;
  String? country;
  String? playerImg;

  Players(
      {this.id,
        this.name,
        this.role,
        this.battingStyle,
        this.bowlingStyle,
        this.country,
        this.playerImg});

  Players.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    battingStyle = json['battingStyle'];
    bowlingStyle = json['bowlingStyle'];
    country = json['country'];
    playerImg = json['playerImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['role'] = this.role;
    data['battingStyle'] = this.battingStyle;
    data['bowlingStyle'] = this.bowlingStyle;
    data['country'] = this.country;
    data['playerImg'] = this.playerImg;
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
