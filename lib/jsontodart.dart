class jason_to_dart {
  String? apikey;
  List<Data>? data;
  String? status;
  Info? info;

  jason_to_dart({this.apikey, this.data, this.status, this.info});

  jason_to_dart.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? name;
  String? startDate;
  String? endDate;
  int? odi;
  int? t20;
  int? test;
  int? squads;
  int? matches;

  Data(
      {this.id,
        this.name,
        this.startDate,
        this.endDate,
        this.odi,
        this.t20,
        this.test,
        this.squads,
        this.matches});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    odi = json['odi'];
    t20 = json['t20'];
    test = json['test'];
    squads = json['squads'];
    matches = json['matches'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['odi'] = this.odi;
    data['t20'] = this.t20;
    data['test'] = this.test;
    data['squads'] = this.squads;
    data['matches'] = this.matches;
    return data;
  }
}

class Info {
  int? hitsToday;
  int? hitsUsed;
  int? hitsLimit;
  int? credits;
  int? server;
  int? offsetRows;
  int? cache;
  int? totalRows;
  double? queryTime;
  int? s;

  Info(
      {this.hitsToday,
        this.hitsUsed,
        this.hitsLimit,
        this.credits,
        this.server,
        this.offsetRows,
        this.cache,
        this.totalRows,
        this.queryTime,
        this.s});

  Info.fromJson(Map<String, dynamic> json) {
    hitsToday = json['hitsToday'];
    hitsUsed = json['hitsUsed'];
    hitsLimit = json['hitsLimit'];
    credits = json['credits'];
    server = json['server'];
    offsetRows = json['offsetRows'];
    cache = json['cache'];
    totalRows = json['totalRows'];
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
    data['offsetRows'] = this.offsetRows;
    data['cache'] = this.cache;
    data['totalRows'] = this.totalRows;
    data['queryTime'] = this.queryTime;
    data['s'] = this.s;
    return data;
  }
}
