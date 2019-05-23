class LiveModel {
  bool hasMore;
  List<Banners> banners;
  int total;
  List<Lives> lives;
  int err;

  LiveModel({this.hasMore, this.banners, this.total, this.lives, this.err});

  LiveModel.fromJson(Map<String, dynamic> json) {
    hasMore = json['has_more'];
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    total = json['total'];
    if (json['lives'] != null) {
      lives = new List<Lives>();
      json['lives'].forEach((v) {
        lives.add(new Lives.fromJson(v));
      });
    }
    err = json['err'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_more'] = this.hasMore;
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    if (this.lives != null) {
      data['lives'] = this.lives.map((v) => v.toJson()).toList();
    }
    data['err'] = this.err;
    return data;
  }
}

class Banners {
  String url;
  String redirectType;
  double ratio;
  String redirectUrl;

  Banners({this.url, this.redirectType, this.ratio, this.redirectUrl});

  Banners.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    redirectType = json['redirect_type'];
    ratio = json['ratio'];
    redirectUrl = json['redirect_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['redirect_type'] = this.redirectType;
    data['ratio'] = this.ratio;
    data['redirect_url'] = this.redirectUrl;
    return data;
  }
}

class Lives {
  int status;
  int liveType;
  Author author;
  bool isFollow;
  String updateAt;
  String createdAt;
  String rtmpLiveUrl;
  Share share;
  int accumulatedCount;
  String content;
  String streamId;
  String thumbnailUrl;
  int roomId;
  String location;
  String hdlLiveUrl;
  int visitorsCount;
  int id;

  Lives(
      {this.status,
        this.liveType,
        this.author,
        this.isFollow,
        this.updateAt,
        this.createdAt,
        this.rtmpLiveUrl,
        this.share,
        this.accumulatedCount,
        this.content,
        this.streamId,
        this.thumbnailUrl,
        this.roomId,
        this.location,
        this.hdlLiveUrl,
        this.visitorsCount,
        this.id});

  Lives.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    liveType = json['live_type'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    isFollow = json['is_follow'];
    updateAt = json['update_at'];
    createdAt = json['created_at'];
    rtmpLiveUrl = json['rtmp_live_url'];
    share = json['share'] != null ? new Share.fromJson(json['share']) : null;
    accumulatedCount = json['accumulated_count'];
    content = json['content'];
    streamId = json['stream_id'];
    thumbnailUrl = json['thumbnail_url'];
    roomId = json['room_id'];
    location = json['location'];
    hdlLiveUrl = json['hdl_live_url'];
    visitorsCount = json['visitors_count'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['live_type'] = this.liveType;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['is_follow'] = this.isFollow;
    data['update_at'] = this.updateAt;
    data['created_at'] = this.createdAt;
    data['rtmp_live_url'] = this.rtmpLiveUrl;
    if (this.share != null) {
      data['share'] = this.share.toJson();
    }
    data['accumulated_count'] = this.accumulatedCount;
    data['content'] = this.content;
    data['stream_id'] = this.streamId;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['room_id'] = this.roomId;
    data['location'] = this.location;
    data['hdl_live_url'] = this.hdlLiveUrl;
    data['visitors_count'] = this.visitorsCount;
    data['id'] = this.id;
    return data;
  }
}

class Author {
  int origin;
  String name;
  int level;
  String gender;
  int levelAnchor;
  int platformId;
  String intro;
  bool isFollow;
  int nickId;
  int id;
  String headurl;

  Author(
      {this.origin,
        this.name,
        this.level,
        this.gender,
        this.levelAnchor,
        this.platformId,
        this.intro,
        this.isFollow,
        this.nickId,
        this.id,
        this.headurl});

  Author.fromJson(Map<String, dynamic> json) {
    origin = json['origin'];
    name = json['name'];
    level = json['level'];
    gender = json['gender'];
    levelAnchor = json['level_anchor'];
    platformId = json['platform_id'];
    intro = json['intro'];
    isFollow = json['is_follow'];
    nickId = json['nick_id'];
    id = json['id'];
    headurl = json['headurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['origin'] = this.origin;
    data['name'] = this.name;
    data['level'] = this.level;
    data['gender'] = this.gender;
    data['level_anchor'] = this.levelAnchor;
    data['platform_id'] = this.platformId;
    data['intro'] = this.intro;
    data['is_follow'] = this.isFollow;
    data['nick_id'] = this.nickId;
    data['id'] = this.id;
    data['headurl'] = this.headurl;
    return data;
  }
}

class Share {
  String url;
  String caption;
  String webInfo;
  String title;

  Share({this.url, this.caption, this.webInfo, this.title});

  Share.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    caption = json['caption'];
    webInfo = json['web_info'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['caption'] = this.caption;
    data['web_info'] = this.webInfo;
    data['title'] = this.title;
    return data;
  }
}
