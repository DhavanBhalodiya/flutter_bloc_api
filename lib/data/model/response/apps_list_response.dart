class AppListResponse {
  Feed? feed;

  AppListResponse({this.feed});

  AppListResponse.fromJson(Map<String, dynamic> json) {
    feed = json['feed'] != null ? Feed.fromJson(json['feed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (feed != null) {
      data['feed'] = feed!.toJson();
    }
    return data;
  }
}

class Feed {
  String? title;
  String? id;
  Author? author;
  List<Links>? links;
  String? copyright;
  String? country;
  String? icon;
  String? updated;
  List<Results>? results;

  Feed(
      {this.title,
      this.id,
      this.author,
      this.links,
      this.copyright,
      this.country,
      this.icon,
      this.updated,
      this.results});

  Feed.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    copyright = json['copyright'];
    country = json['country'];
    icon = json['icon'];
    updated = json['updated'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['id'] = id;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['copyright'] = this.copyright;
    data['country'] = this.country;
    data['icon'] = this.icon;
    data['updated'] = this.updated;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Author {
  String? name;
  String? url;

  Author({this.name, this.url});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Links {
  String? self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    return data;
  }
}

class Results {
  String? artistName;
  String? id;
  String? name;
  String? releaseDate;
  String? kind;
  String? artworkUrl100;
  List<Genres>? genres;
  String? url;

  Results(
      {this.artistName,
      this.id,
      this.name,
      this.releaseDate,
      this.kind,
      this.artworkUrl100,
      this.genres,
      this.url});

  Results.fromJson(Map<String, dynamic> json) {
    artistName = json['artistName'];
    id = json['id'];
    name = json['name'];
    releaseDate = json['releaseDate'];
    kind = json['kind'];
    artworkUrl100 = json['artworkUrl100'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistName'] = this.artistName;
    data['id'] = this.id;
    data['name'] = this.name;
    data['releaseDate'] = this.releaseDate;
    data['kind'] = this.kind;
    data['artworkUrl100'] = this.artworkUrl100;
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    data['url'] = this.url;
    return data;
  }
}

class Genres {
  String? genreId;
  String? name;
  String? url;

  Genres({this.genreId, this.name, this.url});

  Genres.fromJson(Map<String, dynamic> json) {
    genreId = json['genreId'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genreId'] = this.genreId;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
