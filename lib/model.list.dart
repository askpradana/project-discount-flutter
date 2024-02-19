class ModelListDiscount {
  int? page;
  int? perPage;
  int? totalPages;
  int? totalItems;
  List<Items>? items;

  ModelListDiscount(
      {this.page, this.perPage, this.totalPages, this.totalItems, this.items});

  ModelListDiscount.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
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
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? collectionId;
  String? collectionName;
  String? title;
  String? link;
  List<String>? previewImg;
  String? dateFrom;
  String? dateTo;

  Items(
      {this.id,
      this.collectionId,
      this.collectionName,
      this.title,
      this.link,
      this.previewImg,
      this.dateFrom,
      this.dateTo});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    title = json['title'];
    link = json['link'];
    previewImg = json['previewImg'].cast<String>();
    dateFrom = json['dateFrom'];
    dateTo = json['dateTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['title'] = title;
    data['link'] = link;
    data['previewImg'] = previewImg;
    data['dateFrom'] = dateFrom;
    data['dateTo'] = dateTo;
    return data;
  }
}
