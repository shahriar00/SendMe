import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sendme/model/messege.dart';


class ChatServices{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream <List<Map<String,dynamic>>> getUserStream(){
    return firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        return user;
      }).toList();
    });
  }


  // send messege .................

  Future<void> sendMessege(String reciverId,messege) async{
    final String currentUserID = auth.currentUser!.uid;
    final String currentUserEmail = auth.currentUser!.email!;
    final Timestamp timestamp =  Timestamp.now();


    // create the messege ...........

    MessegeData messegeData = MessegeData(
      senderEmail: currentUserEmail,
      recieverID: reciverId, 
      message: messege,
      timestamp: timestamp,
      senderID: currentUserID);



      // Chat room ..............

      List<String> ids = [currentUserID,reciverId];
      ids.sort();
      String chatRoomId = ids.join("_");


      // add new messege ............

      await firestore.collection("chat_room").doc(chatRoomId).collection("messeges").add(messegeData.toMap());



  }


  // recieve messge .................

  Stream<QuerySnapshot> getMessege(String userID, String otheruserID){
    List<String> ids = [userID,otheruserID];

    ids.sort();
    String chatRoomID = ids.join("_");

    return firestore.collection("chat_room").doc(chatRoomID).collection("messeges").orderBy("timestamp",descending: false).snapshots();
  }


}