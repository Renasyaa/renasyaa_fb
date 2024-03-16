import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:renasyaa_fb/models/models.dart';

Future create(Map<String, dynamic> data) async {
  final docId = data['id'];
  final produk = data['nama'];
  final createAt = data['created_at'];
  await FirebaseFirestore.instance
      .collection('username')
      .doc(docId)
      .set({'nama': produk, 'id': docId, 'created_at': createAt});
  await FirebaseFirestore.instance.collection('userDetail').doc(docId).set(data);
}

// Future update(AdminX updateProduk) async {
//   final docId = updateProduk.id;
//   final produk = updateProduk.name;
//   final createAt = updateProduk['created_at'];
//   await FirebaseFirestore.instance
//       .collection('username')
//       .doc(docId)
//       .set({'nama': produk, 'id': docId, 'created_at': createAt});
//   await FirebaseFirestore.instance.collection('userDetail').doc(docId).set(updateProduk);
// }

// class AdminX {}

Future<List<UserX>> getColl() async {
  List<UserX> userList = [];

  final result = await FirebaseFirestore.instance.collection('username').orderBy('created_at', descending: true).get();
  for (var element in result.docs) {
    userList.add(UserX.fromMap(element.data()));
  }
  return userList;
}

Future<UserX> getDoc(String id) async {
  final result = await FirebaseFirestore.instance.collection('userDetail').doc(id).get();
  final user = UserX.fromMap(result.data() ?? {});
  return user;
}
