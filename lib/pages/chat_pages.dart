import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sendme/components/custom_drawer.dart';
import 'package:sendme/components/text_field.dart';
import 'package:sendme/services/auth/auth_service.dart';
import 'package:sendme/services/chats/chat_services.dart';

var loginuser = FirebaseAuth.instance.currentUser;

class ChatPages extends StatefulWidget {
  const ChatPages({super.key});

  @override
  State<ChatPages> createState() => _ChatPagesState();
}

class _ChatPagesState extends State<ChatPages> {
  TextEditingController messegeController = TextEditingController();

  AuthService authService = AuthService();
  ChatServices chatServices = ChatServices();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firestoreage = FirebaseFirestore.instance;


  getCurrentUser(){
    final user = auth.currentUser;
    if(user!=null){
      loginuser = user;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loginuser!.email.toString()),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ShowMessege(),
          buildUserInput(),
        ],
      ),
    );
  }



  Widget buildUserInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30,left: 20,right: 20),
      child: Row(
        children: [ 
          Expanded(child: ChatTextField( 
            controller: messegeController,
            hintText: "Type your messege ...",
            
            obscurText: false,
      
          )),
          IconButton(onPressed: (){ 
            if(messegeController.text.isNotEmpty){
              firestoreage.collection("Messeges").doc().set({
                "messeges":messegeController.text.trim(),
                "user":loginuser!.email.toString(),
                "timestamp":DateTime.now()
              });
              messegeController.clear();
            }
          }, icon: const Icon(Icons.send_outlined,size: 50,color: Color.fromARGB(255, 65, 94, 89),))
        ],
      ),
    );
  }
}

class ShowMessege extends StatelessWidget {
  const ShowMessege({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Messeges").orderBy("timestamp").snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          primary: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context,i){    
          QueryDocumentSnapshot x = snapshot.data!.docs[i];
          return ListTile( 
            title: Column(
              crossAxisAlignment: loginuser!.email == x['user']?CrossAxisAlignment.end:CrossAxisAlignment.start,
              children: [ 
              Container(
                decoration: BoxDecoration( 
                  borderRadius: BorderRadius.circular(10),
                  color:loginuser!.email == x['user']? Colors.blue.withOpacity(0.2):Colors.white70,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                
                child: Text(x['messeges']))
            ],),
           
          );
        });
      },
      
    );
  }
}