class AppDetailsResponse {
  int? resultCount;
  List<AppDetailsResults>? results;

  AppDetailsResponse({this.resultCount, this.results});

  AppDetailsResponse.fromJson(Map<String, dynamic> json) {
    resultCount = json['resultCount'];
    if (json['results'] != null) {
      results = <AppDetailsResults>[];
      json['results'].forEach((v) {
        results!.add(AppDetailsResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resultCount'] = resultCount;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppDetailsResults {
  bool? isGameCenterEnabled;
  List<String>? features;
  List<String>? supportedDevices;

  List<String>? screenshotUrls;
  List<String>? ipadScreenshotUrls;

  String? artworkUrl60;
  String? artworkUrl512;
  String? artworkUrl100;
  String? artistViewUrl;
  String? kind;
  String? minimumOsVersion;
  String? releaseNotes;
  int? artistId;
  String? artistName;
  List<String>? genres;
  double? price;
  String? currency;
  String? description;
  String? bundleId;
  String? currentVersionReleaseDate;
  List<String>? genreIds;
  int? trackId;
  String? trackName;
  String? primaryGenreName;
  int? primaryGenreId;
  String? releaseDate;
  bool? isVppDeviceBasedLicensingEnabled;
  String? sellerName;
  String? trackContentRating;
  String? trackCensoredName;
  List<String>? languageCodesISO2A;
  String? fileSizeBytes;
  String? sellerUrl;
  String? formattedPrice;
  String? contentAdvisoryRating;
  double? averageUserRatingForCurrentVersion;
  int? userRatingCountForCurrentVersion;
  double? averageUserRating;
  String? trackViewUrl;
  String? version;
  String? wrapperType;
  int? userRatingCount;

  AppDetailsResults(
      {this.isGameCenterEnabled,
      this.features,
      this.supportedDevices,
      this.screenshotUrls,
      this.ipadScreenshotUrls,
      this.artworkUrl60,
      this.artworkUrl512,
      this.artworkUrl100,
      this.artistViewUrl,
      this.kind,
      this.minimumOsVersion,
      this.releaseNotes,
      this.artistId,
      this.artistName,
      this.genres,
      this.price,
      this.currency,
      this.description,
      this.bundleId,
      this.currentVersionReleaseDate,
      this.genreIds,
      this.trackId,
      this.trackName,
      this.primaryGenreName,
      this.primaryGenreId,
      this.releaseDate,
      this.isVppDeviceBasedLicensingEnabled,
      this.sellerName,
      this.trackContentRating,
      this.trackCensoredName,
      this.languageCodesISO2A,
      this.fileSizeBytes,
      this.sellerUrl,
      this.formattedPrice,
      this.contentAdvisoryRating,
      this.averageUserRatingForCurrentVersion,
      this.userRatingCountForCurrentVersion,
      this.averageUserRating,
      this.trackViewUrl,
      this.version,
      this.wrapperType,
      this.userRatingCount});

  AppDetailsResults.fromJson(Map<String, dynamic> json) {
    isGameCenterEnabled = json['isGameCenterEnabled'];
    features = json['features'].cast<String>();
    supportedDevices = json['supportedDevices'].cast<String>();

    screenshotUrls = json['screenshotUrls'].cast<String>();
    ipadScreenshotUrls = json['ipadScreenshotUrls'].cast<String>();

    artworkUrl60 = json['artworkUrl60'];
    artworkUrl512 = json['artworkUrl512'];
    artworkUrl100 = json['artworkUrl100'];
    artistViewUrl = json['artistViewUrl'];
    kind = json['kind'];
    minimumOsVersion = json['minimumOsVersion'];
    releaseNotes = json['releaseNotes'];
    artistId = json['artistId'];
    artistName = json['artistName'];
    genres = json['genres'].cast<String>();
    price = json['price'];
    currency = json['currency'];
    description = json['description'];
    bundleId = json['bundleId'];
    currentVersionReleaseDate = json['currentVersionReleaseDate'];
    genreIds = json['genreIds'].cast<String>();
    trackId = json['trackId'];
    trackName = json['trackName'];
    primaryGenreName = json['primaryGenreName'];
    primaryGenreId = json['primaryGenreId'];
    releaseDate = json['releaseDate'];
    isVppDeviceBasedLicensingEnabled = json['isVppDeviceBasedLicensingEnabled'];
    sellerName = json['sellerName'];
    trackContentRating = json['trackContentRating'];
    trackCensoredName = json['trackCensoredName'];
    languageCodesISO2A = json['languageCodesISO2A'].cast<String>();
    fileSizeBytes = json['fileSizeBytes'];
    sellerUrl = json['sellerUrl'];
    formattedPrice = json['formattedPrice'];
    contentAdvisoryRating = json['contentAdvisoryRating'];
    averageUserRatingForCurrentVersion =
        json['averageUserRatingForCurrentVersion'];
    userRatingCountForCurrentVersion = json['userRatingCountForCurrentVersion'];
    averageUserRating = json['averageUserRating'];
    trackViewUrl = json['trackViewUrl'];
    version = json['version'];
    wrapperType = json['wrapperType'];
    userRatingCount = json['userRatingCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isGameCenterEnabled'] = this.isGameCenterEnabled;
    data['features'] = this.features;
    data['supportedDevices'] = this.supportedDevices;

    data['screenshotUrls'] = this.screenshotUrls;
    data['ipadScreenshotUrls'] = this.ipadScreenshotUrls;

    data['artworkUrl60'] = this.artworkUrl60;
    data['artworkUrl512'] = this.artworkUrl512;
    data['artworkUrl100'] = this.artworkUrl100;
    data['artistViewUrl'] = this.artistViewUrl;
    data['kind'] = this.kind;
    data['minimumOsVersion'] = this.minimumOsVersion;
    data['releaseNotes'] = this.releaseNotes;
    data['artistId'] = this.artistId;
    data['artistName'] = this.artistName;
    data['genres'] = this.genres;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['description'] = this.description;
    data['bundleId'] = this.bundleId;
    data['currentVersionReleaseDate'] = this.currentVersionReleaseDate;
    data['genreIds'] = this.genreIds;
    data['trackId'] = this.trackId;
    data['trackName'] = this.trackName;
    data['primaryGenreName'] = this.primaryGenreName;
    data['primaryGenreId'] = this.primaryGenreId;
    data['releaseDate'] = this.releaseDate;
    data['isVppDeviceBasedLicensingEnabled'] =
        this.isVppDeviceBasedLicensingEnabled;
    data['sellerName'] = this.sellerName;
    data['trackContentRating'] = this.trackContentRating;
    data['trackCensoredName'] = this.trackCensoredName;
    data['languageCodesISO2A'] = this.languageCodesISO2A;
    data['fileSizeBytes'] = this.fileSizeBytes;
    data['sellerUrl'] = this.sellerUrl;
    data['formattedPrice'] = this.formattedPrice;
    data['contentAdvisoryRating'] = this.contentAdvisoryRating;
    data['averageUserRatingForCurrentVersion'] =
        averageUserRatingForCurrentVersion;
    data['userRatingCountForCurrentVersion'] =
        userRatingCountForCurrentVersion;
    data['averageUserRating'] = this.averageUserRating;
    data['trackViewUrl'] = this.trackViewUrl;
    data['version'] = this.version;
    data['wrapperType'] = this.wrapperType;
    data['userRatingCount'] = this.userRatingCount;
    return data;
  }
}
