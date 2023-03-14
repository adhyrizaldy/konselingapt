import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  // final CollectionReference patientCollection =
  //     FirebaseFirestore.instance.collection("patients");
  final CollectionReference consultCollection =
      FirebaseFirestore.instance.collection("consults");
    
  Future savingConsultData(String fullName, String email, String rumahSakit) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "RS": rumahSakit,
      "spesialis": "",
      "profilePic": "", 
      "uid": uid,
      "access": "apoteker",
    });
  }

  Future savingPatientData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "groups": [],
      "profilePic": "", 
      "uid": uid,
      "access": "pasien",
    });
  }

  // Future gettingPatientData(String email) async {
  //   QuerySnapshot snapshot =
  //       await patientCollection.where("email", isEqualTo: email).get();
  //   return snapshot;
  // }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  // get user groups
  getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }

  getPatientConsults(String uid) async {
    return userCollection
      .doc(uid)
      .collection("consults")
      .orderBy("time")
      .snapshots();
  }

   // getting the chats
  getChats(String id, String consultId) async {
    return consultCollection
        .doc(consultId)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }
  

  //setting members nya masih nda tahu
  Future createConsult(String userName, String userId, String id) async {
    DocumentReference consultDocumentReference =
        await userCollection.doc(uid).collection("consults").add({
          "consultName": userName,
          "consultId": "${id}_$userId",
          "members": [],

        });
  }

  // Future createConsult(String userName, String userId, String id) async {
  //   DocumentReference patientDocumentReference =
  //       await patientCollection.doc(uid).collection("groups").add({
  //         "consultName": userName,
  //         "consultId": "${id}_$userId",
  //         "members": [],

  //       });
  // }

  sendMessage(String consultId, Map<String, dynamic> chatMessageData) async {
    consultCollection.doc(uid).collection("messages").add(chatMessageData);
    // groupCollection.doc(groupId).update({
    //   "recentMessage": chatMessageData['message'],
    //   "recentMessageSender": chatMessageData['sender'],
    //   "recentMessageTime": chatMessageData['time'].toString(),
    // });
  }
}
