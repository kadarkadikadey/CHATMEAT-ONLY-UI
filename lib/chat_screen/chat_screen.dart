// lib/chat_screen.dart
import 'package:chatmeat/shop_or_friend_profile_screen/shop_or_friend_profile_screen.dart';
import 'package:flutter/material.dart';

// A simple data model class for a chat message
class ChatMessage {
  final String text;
  final String time;
  final bool isSent;

  ChatMessage({required this.text, required this.time, required this.isSent});
}

// This is the main widget for the chat screen
class ChatScreen extends StatefulWidget {
  static const routeName = '/chat-screen';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // A list to hold all the chat messages.
  // In a real app, this data would come from a database or an API.
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Hello, i am from CHATMEAT",
      time: "00:00",
      isSent: false,
    ),
    ChatMessage(text: "nice to meet you, sir", time: "00:00", isSent: true),
    ChatMessage(
      text: "this is chat screen window",
      time: "00:00",
      isSent: false,
    ),
    ChatMessage(text: "how you like it", time: "00:00", isSent: false),
    ChatMessage(text: "yep, i like it very well", time: "00:00", isSent: true),
  ];

  @override
  Widget build(BuildContext context) {

    void navigateShopOrFriendProfileScreen(BuildContext context) {
      Navigator.pushNamed(context, ShopOrFriendProfileScreen.routeName);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      // 1. The App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: GestureDetector(
          onTap: () => navigateShopOrFriendProfileScreen(context) ,
          child: Row(
            children: const [
              CircleAvatar(
                // In a real app, you'd use a NetworkImage for the user's profile picture
                backgroundImage: AssetImage('assets/images/EI.png'),
              ),
              SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CHATMEAT',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      // 2. The Body (Message List)
      body: Column(
        children: [
          // This expands the ListView to take all available space
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                // Display a date separator if it's the first message of the day
                // This is a simplified logic for demonstration
                return _buildMessageBubble(message);
              },
            ),
          ),
          // 3. The Message Input Field
          _buildMessageInputField(),
        ],
      ),
    );
  }

  /// Builds the chat bubble widget based on whether the message is sent or received
  Widget _buildMessageBubble(ChatMessage message) {
    // A Row to align the bubble left or right
    return Row(
      mainAxisAlignment: message.isSent
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          constraints: BoxConstraints(
            maxWidth:
                MediaQuery.of(context).size.width * 0.7, // Max width of bubble
          ),
          decoration: BoxDecoration(
            color: message.isSent
                ? const Color(0xFF6A1B9A)
                : Colors.white, // Purple for sent, white for received
            borderRadius: BorderRadius.circular(16.0),
            border: message.isSent
                ? null
                : Border.all(
                    color: const Color(0xFF6A1B9A),
                  ), // Border for received
          ),
          child: Column(
            crossAxisAlignment: message.isSent
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                message.text,
                style: TextStyle(
                  color: message.isSent ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 5.0),
              Row(
                mainAxisSize: MainAxisSize
                    .min, // To make the row only as wide as its children
                children: [
                  Text(
                    message.time,
                    style: TextStyle(
                      color: message.isSent ? Colors.white70 : Colors.grey,
                      fontSize: 10.0,
                    ),
                  ),
                  if (message.isSent) ...[
                    const SizedBox(width: 5.0),
                    const Icon(
                      Icons.done_all,
                      color: Colors.white70,
                      size: 14.0,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds the text input field at the bottom of the screen
  Widget _buildMessageInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type here...',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                suffixIcon: Row(
                  mainAxisSize:
                      MainAxisSize.min, // To make the row wrap its content
                  children: [
                    Icon(Icons.more_horiz_outlined, color: Colors.grey[600]),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF6A1B9A)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
