import 'dart:convert';

class UserX {
  final String produk;
  final String price;
  final String deskripsi;
  final String id;
  final int sold;
  final String createAt;

  UserX({
    this.produk = '',
    this.price = '',
    this.deskripsi = '',
    this.id = '',
    this.sold = 0,
    this.createAt = '',
  });

  UserX copyWith({
    String? nama,
    String? film,
    String? lagu,
    String? id,
    int? umur,
    String? createdAt,
  }) {
    return UserX(
      produk: nama ?? produk,
      price: film ?? price,
      deskripsi: lagu ?? deskripsi,
      id: id ?? this.id,
      sold: umur ?? sold,
      createAt: createdAt ?? createAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nama': produk});
    result.addAll({'film': price});
    result.addAll({'lagu': deskripsi});
    result.addAll({'id': id});
    result.addAll({'umur': sold});
    result.addAll({'created_at': createAt});

    return result;
  }

  factory UserX.fromMap(Map<String, dynamic> map) {
    return UserX(
      produk: map['nama'] ?? '',
      price: map['film'] ?? '',
      deskripsi: map['lagu'] ?? '',
      id: map['id'] ?? '',
      sold: map['umur']?.toInt() ?? 0,
      createAt: map['created_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserX.fromJson(String source) => UserX.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserX(nama: $produk, film: $price, lagu: $deskripsi, id: $id, umur: $sold, createdAt: $createAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserX &&
        other.produk == produk &&
        other.price == price &&
        other.deskripsi == deskripsi &&
        other.id == id &&
        other.sold == sold &&
        other.createAt == createAt;
  }

  @override
  int get hashCode {
    return produk.hashCode ^ price.hashCode ^ deskripsi.hashCode ^ id.hashCode ^ sold.hashCode ^ createAt.hashCode;
  }
}
