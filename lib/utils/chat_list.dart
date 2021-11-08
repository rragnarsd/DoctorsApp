import 'package:doctors_app/models/models.dart';

List<Chat> chats = [
  Chat(message: 'Hello there!', doctor: 'Angela', dateTime: 'Yesterday', image: 'https://images.pexels.com/photos/4173251/pexels-photo-4173251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', hasStory: true, isOnline: true, messageType: 'sender'),
  Chat(message: 'Hi how are you?', doctor: 'Max', dateTime: 'Friday', image: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80', hasStory: false, isOnline: true, messageType: 'receiver'),
  Chat(message: 'Are you taking a shift tomorrow?', doctor: 'Martin', dateTime: '27 Oct', image: 'https://images.pexels.com/photos/4586993/pexels-photo-4586993.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', hasStory: true, isOnline: false, messageType: 'sender'),
  Chat(message: 'No, still on vacation', doctor: 'Iva', dateTime: '25 Oct', image: 'https://images.pexels.com/photos/4225880/pexels-photo-4225880.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', hasStory: false, isOnline: true, messageType: 'receiver'),
  Chat(message: 'Oh ok!', doctor: 'Birgitte', dateTime: '20 Oct', image: 'https://images.unsplash.com/photo-1614608682850-e0d6ed316d47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=976&q=80', hasStory: true, isOnline: false, messageType: 'sender'),
  Chat(message: 'I come back on saturday', doctor: 'Mayme', dateTime: '13 Oct', image: 'https://images.pexels.com/photos/4989131/pexels-photo-4989131.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', hasStory: false, isOnline: false, messageType: 'receiver'),
  Chat(message: 'See ya there!', doctor: 'Christian', dateTime: '10 Oct', image: 'https://images.unsplash.com/photo-1618498082410-b4aa22193b38?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80', hasStory: false, isOnline: true, messageType: 'sender'),
];

