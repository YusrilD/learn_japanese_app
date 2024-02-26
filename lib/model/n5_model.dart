class N5Model {
  int? id;
  String? kanji;
  String? onyomi;
  String? kunyomi;
  String? arti;

  N5Model({
    this.id,
    this.kanji,
    this.onyomi,
    this.kunyomi,
    this.arti,
  });
  N5Model.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    kanji = json['kanji']?.toString();
    onyomi = json['onyomi']?.toString();
    kunyomi = json['kunyomi']?.toString();
    arti = json['arti']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['kanji'] = kanji;
    data['onyomi'] = onyomi;
    data['kunyomi'] = kunyomi;
    data['arti'] = arti;
    return data;
  }
}
