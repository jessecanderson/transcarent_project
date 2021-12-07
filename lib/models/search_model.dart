// To parse this JSON data, do
//
//     final searchResults = searchResultsFromJson(jsonString);

import 'dart:convert';

SearchResults searchResultsFromJson(String str) => SearchResults.fromJson(json.decode(str));

String searchResultsToJson(SearchResults data) => json.encode(data.toJson());

class SearchResults {
  SearchResults({
    this.searchMetadata,
    this.searchParameters,
    this.searchInformation,
    this.suggestedSearches,
    this.imagesResults,
  });

  SearchMetadata? searchMetadata;
  SearchParameters? searchParameters;
  SearchInformation? searchInformation;
  List<SuggestedSearch>? suggestedSearches;
  List<ImagesResult>? imagesResults;

  factory SearchResults.fromJson(Map<String, dynamic> json) => SearchResults(
        searchMetadata: json["search_metadata"] == null ? null : SearchMetadata.fromJson(json["search_metadata"]),
        searchParameters:
            json["search_parameters"] == null ? null : SearchParameters.fromJson(json["search_parameters"]),
        searchInformation:
            json["search_information"] == null ? null : SearchInformation.fromJson(json["search_information"]),
        suggestedSearches: json["suggested_searches"] == null
            ? null
            : List<SuggestedSearch>.from(json["suggested_searches"].map((x) => SuggestedSearch.fromJson(x))),
        imagesResults: json["images_results"] == null
            ? null
            : List<ImagesResult>.from(json["images_results"].map((x) => ImagesResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "search_metadata": searchMetadata?.toJson(),
        "search_parameters": searchParameters?.toJson(),
        "search_information": searchInformation?.toJson(),
        "suggested_searches":
            suggestedSearches == null ? null : List<dynamic>.from(suggestedSearches!.map((x) => x.toJson())),
        "images_results": imagesResults == null ? null : List<dynamic>.from(imagesResults!.map((x) => x.toJson())),
      };
}

class ImagesResult {
  ImagesResult({
    this.position,
    required this.thumbnail,
    this.source,
    required this.title,
    required this.link,
    required this.original,
    this.isProduct,
  });

  int? position;
  String thumbnail;
  String? source;
  String title;
  String link;
  String original;
  bool? isProduct;

  factory ImagesResult.fromJson(Map<String, dynamic> json) => ImagesResult(
        position: json["position"],
        thumbnail: json["thumbnail"],
        source: json["source"],
        title: json["title"],
        link: json["link"],
        original: json["original"],
        isProduct: json["is_product"],
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "thumbnail": thumbnail,
        "source": source,
        "title": title,
        "link": link,
        "original": original,
        "is_product": isProduct,
      };
}

class SearchInformation {
  SearchInformation({
    this.imageResultsState,
    this.queryDisplayed,
  });

  String? imageResultsState;
  String? queryDisplayed;

  factory SearchInformation.fromJson(Map<String, dynamic> json) => SearchInformation(
        imageResultsState: json["image_results_state"],
        queryDisplayed: json["query_displayed"],
      );

  Map<String, dynamic> toJson() => {
        "image_results_state": imageResultsState,
        "query_displayed": queryDisplayed,
      };
}

class SearchMetadata {
  SearchMetadata({
    this.id,
    this.status,
    this.jsonEndpoint,
    this.createdAt,
    this.processedAt,
    this.googleUrl,
    this.rawHtmlFile,
    this.totalTimeTaken,
  });

  String? id;
  String? status;
  String? jsonEndpoint;
  String? createdAt;
  String? processedAt;
  String? googleUrl;
  String? rawHtmlFile;
  double? totalTimeTaken;

  factory SearchMetadata.fromJson(Map<String, dynamic> json) => SearchMetadata(
        id: json["id"],
        status: json["status"],
        jsonEndpoint: json["json_endpoint"],
        createdAt: json["created_at"],
        processedAt: json["processed_at"],
        googleUrl: json["google_url"],
        rawHtmlFile: json["raw_html_file"],
        totalTimeTaken: json["total_time_taken"] == null ? null : json["total_time_taken"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "json_endpoint": jsonEndpoint,
        "created_at": createdAt,
        "processed_at": processedAt,
        "google_url": googleUrl,
        "raw_html_file": rawHtmlFile,
        "total_time_taken": totalTimeTaken,
      };
}

class SearchParameters {
  SearchParameters({
    this.engine,
    this.q,
    this.googleDomain,
    this.hl,
    this.gl,
    this.device,
    this.tbm,
  });

  String? engine;
  String? q;
  String? googleDomain;
  String? hl;
  String? gl;
  String? device;
  String? tbm;

  factory SearchParameters.fromJson(Map<String, dynamic> json) => SearchParameters(
        engine: json["engine"],
        q: json["q"],
        googleDomain: json["google_domain"],
        hl: json["hl"],
        gl: json["gl"],
        device: json["device"],
        tbm: json["tbm"],
      );

  Map<String, dynamic> toJson() => {
        "engine": engine,
        "q": q,
        "google_domain": googleDomain,
        "hl": hl,
        "gl": gl,
        "device": device,
        "tbm": tbm,
      };
}

class SuggestedSearch {
  SuggestedSearch({
    this.name,
    this.link,
    this.chips,
    this.serpapiLink,
    this.thumbnail,
  });

  String? name;
  String? link;
  String? chips;
  String? serpapiLink;
  String? thumbnail;

  factory SuggestedSearch.fromJson(Map<String, dynamic> json) => SuggestedSearch(
        name: json["name"],
        link: json["link"],
        chips: json["chips"],
        serpapiLink: json["serpapi_link"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
        "chips": chips,
        "serpapi_link": serpapiLink,
        "thumbnail": thumbnail,
      };
}
