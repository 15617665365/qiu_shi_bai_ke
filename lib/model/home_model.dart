class HomeModel {
  bool hasMore;
  List<Items> items;
  String message;
  int err;

  HomeModel(
      {this.hasMore, this.items, this.message, this.err});

  HomeModel.fromJson(Map<String, dynamic> json) {
    hasMore = json['has_more'] != null?json['has_more']:null;
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    message = json['message'] == null?json['message']:null;
    err = json['err'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_more'] = this.hasMore;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['err'] = this.err;
    return data;
  }
}

class Items {
  String image;
  int publishedAt;
  String tag;
  String highUrl;
  String picUrl;
  HotComment hotComment;
  Votes votes;
  String shareUrl;
  int id;
  String content;
  String state;
  int shareCount;
  String type;
  String format;
  User user;
  ImageSize imageSize;
  int createdAt;
  int commentsCount;
  String lowUrl;
  bool allowComment;
  int loop;
  List<Attachments> attachments;

  Items(
      {this.image,
        this.publishedAt,
        this.tag,
        this.highUrl,
        this.picUrl,
        this.hotComment,
        this.votes,
        this.shareUrl,
        this.id,
        this.content,
        this.state,
        this.shareCount,
        this.type,
        this.format,
        this.user,
        this.imageSize,
        this.createdAt,
        this.commentsCount,
        this.lowUrl,
        this.allowComment,
        this.loop,
        this.attachments});

  Items.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    publishedAt = json['published_at'];
    tag = json['tag'];
    highUrl = json['high_url'];
    picUrl = json['pic_url'];
    hotComment = json['hot_comment'] != null
        ? new HotComment.fromJson(json['hot_comment'])
        : null;
    votes = json['votes'] != null ? new Votes.fromJson(json['votes']) : null;
    shareUrl = json['share_url'];
    id = json['id'];
    content = json['content'];
    state = json['state'];
    shareCount = json['share_count'];
    type = json['type'];
    format = json['format'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    imageSize = json['image_size'] != null
        ? new ImageSize.fromJson(json['image_size'])
        : null;
    createdAt = json['created_at'];
    commentsCount = json['comments_count'];
    lowUrl = json['low_url'];
    allowComment = json['allow_comment'];
    loop = json['loop'];
    if (json['attachments'] != null) {
      attachments = new List<Attachments>();
      json['attachments'].forEach((v) {
        attachments.add(new Attachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['published_at'] = this.publishedAt;
    data['tag'] = this.tag;
    data['high_url'] = this.highUrl;
    data['pic_url'] = this.picUrl;
    if (this.hotComment != null) {
      data['hot_comment'] = this.hotComment.toJson();
    }
    if (this.votes != null) {
      data['votes'] = this.votes.toJson();
    }
    data['share_url'] = this.shareUrl;
    data['id'] = this.id;
    data['content'] = this.content;
    data['state'] = this.state;
    data['share_count'] = this.shareCount;
    data['type'] = this.type;
    data['format'] = this.format;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.imageSize != null) {
      data['image_size'] = this.imageSize.toJson();
    }
    data['created_at'] = this.createdAt;
    data['comments_count'] = this.commentsCount;
    data['low_url'] = this.lowUrl;
    data['allow_comment'] = this.allowComment;
    data['loop'] = this.loop;
    return data;
  }
}
class Attachments {
  String status;
  ImageSize imageSize;
  String lowUrl;
  String highUrl;
  String format;

  Attachments(
      {this.status, this.imageSize, this.lowUrl, this.highUrl, this.format});

  Attachments.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    imageSize = json['image_size'] != null
        ? new ImageSize.fromJson(json['image_size'])
        : null;
    lowUrl = json['low_url'];
    highUrl = json['high_url'];
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.imageSize != null) {
      data['image_size'] = this.imageSize.toJson();
    }
    data['low_url'] = this.lowUrl;
    data['high_url'] = this.highUrl;
    data['format'] = this.format;
    return data;
  }
}
class HotComment {
  int floor;
  int createdAt;
  int hotCommentType;
  String content;
  int parentId;
  int likeCount;
  User user;
  int score;
  int id;

  HotComment(
      {
        this.floor,
        this.createdAt,
        this.hotCommentType,
        this.content,
        this.parentId,
        this.likeCount,
        this.user,
        this.score,
        this.id});

  HotComment.fromJson(Map<String, dynamic> json) {
    floor = json['floor'];
    createdAt = json['created_at'];
    hotCommentType = json['hot_comment_type'];
    content = json['content'];
    parentId = json['parent_id'];
    likeCount = json['like_count'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    score = json['score'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['floor'] = this.floor;
    data['created_at'] = this.createdAt;
    data['hot_comment_type'] = this.hotCommentType;
    data['content'] = this.content;
    data['parent_id'] = this.parentId;
    data['like_count'] = this.likeCount;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['score'] = this.score;
    data['id'] = this.id;
    return data;
  }
}

class User {
  String medium;
  String thumb;
  String gender;
  int age;
  String role;
  String astrology;
  String login;
  String icon;
  int id;
  int uid;

  User(
      {this.medium,
        this.thumb,
        this.gender,
        this.age,
        this.role,
        this.astrology,
        this.login,
        this.icon,
        this.id,
        this.uid});

  User.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    thumb = json['thumb'];
    gender = json['gender'];
    age = json['age'];
    role = json['role'];
    astrology = json['astrology'];
    login = json['login'];
    icon = json['icon'];
    id = json['id'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium;
    data['thumb'] = this.thumb;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['role'] = this.role;
    data['astrology'] = this.astrology;
    data['login'] = this.login;
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['uid'] = this.uid;
    return data;
  }
}

class Votes {
  int down;
  int up;

  Votes({this.down, this.up});

  Votes.fromJson(Map<String, dynamic> json) {
    down = json['down'];
    up = json['up'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['down'] = this.down;
    data['up'] = this.up;
    return data;
  }
}

class Talents {
  String cmdDesc;
  String remark;
  int cmd;

  Talents({this.cmdDesc, this.remark, this.cmd});

  Talents.fromJson(Map<String, dynamic> json) {
    cmdDesc = json['cmd_desc'];
    remark = json['remark'];
    cmd = json['cmd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cmd_desc'] = this.cmdDesc;
    data['remark'] = this.remark;
    data['cmd'] = this.cmd;
    return data;
  }
}

class ImageSize {
  List<int> s;
  List<int> m;

  ImageSize({this.s, this.m});

  ImageSize.fromJson(Map<String, dynamic> json) {
    s = json['s'].cast<int>();
    m = json['m'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s'] = this.s;
    data['m'] = this.m;
    return data;
  }
}
