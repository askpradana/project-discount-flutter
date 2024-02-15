class DiscountModel {
  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;
  List<Items>? items;

  DiscountModel(
      {this.page, this.perPage, this.totalItems, this.totalPages, this.items});

  DiscountModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['perPage'] = perPage;
    data['totalItems'] = totalItems;
    data['totalPages'] = totalPages;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? collectionId;
  String? collectionName;
  String? created;
  String? dateFrom;
  String? id;
  String? link;
  bool? ongoing;
  String? previewImg;
  String? title;
  String? dateTo;
  String? updated;

  Items(
      {this.collectionId,
      this.collectionName,
      this.created,
      this.dateFrom,
      this.id,
      this.link,
      this.ongoing,
      this.previewImg,
      this.title,
      this.dateTo,
      this.updated});

  Items.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    dateFrom = json['dateFrom'];
    id = json['id'];
    link = json['link'];
    ongoing = json['ongoing'];
    previewImg = json['previewImg'];
    title = json['title'];
    dateTo = json['dateTo'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['dateFrom'] = dateFrom;
    data['id'] = id;
    data['link'] = link;
    data['ongoing'] = ongoing;
    data['previewImg'] = previewImg;
    data['title'] = title;
    data['dateTo'] = dateTo;
    data['updated'] = updated;
    return data;
  }
}
