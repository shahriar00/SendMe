import 'package:cloud_firestore/cloud_firestore.dart';

class MessegeData{
  final String senderID;
  final String senderEmail;
  final String recieverID;
  final String message;
  final Timestamp timestamp;

  MessegeData({required this.senderEmail,required this.recieverID,required this.message,required this.timestamp,required this.senderID});

  // Convert to Map

  Map<String,dynamic> toMap(){
    return {
      'senderID':senderID,
      'senderEmail':senderEmail,
      'recieverID':recieverID,
      'message': message,
      'timestap':timestamp
    };
  }
}