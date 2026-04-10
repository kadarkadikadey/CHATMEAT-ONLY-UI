import 'package:chatmeat/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';

// Data model for a chat item
class Chat {
  final String avatarUrl;
  final String name;
  final String message;
  final int unreadCount;
  final bool hasRead;

  Chat({
    required this.avatarUrl,
    required this.name,
    required this.message,
    this.unreadCount = 0,
    this.hasRead = false,
  });
}

class StorePart extends StatefulWidget {
  const StorePart({super.key});

  @override
  State<StorePart> createState() => _StorePartState();
}

class _StorePartState extends State<StorePart> {
  final List<Chat> chats = [
    Chat(
      name: 'CHATMEAT',
      message: 'HELLO WELCOME,',
      avatarUrl: 'assets/images/EI.png',
      unreadCount: 4,
      hasRead: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),
            // Chat List section
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return ChatListItem(chat: chats[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for a single item in the chat list
class ChatListItem extends StatelessWidget {
  final Chat chat;

  const ChatListItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    void navigateToChatPage(BuildContext context) {
      Navigator.pushNamed(context, ChatScreen.routeName);
    }

    return InkWell(
      onTap: () => navigateToChatPage(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: const Color(0xFF8A2BE2), width: 1.5),
        ),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(chat.avatarUrl),
            ),
            const SizedBox(width: 12),
            // Name and Message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      if (chat.hasRead)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: 16,
                        ),
                      if (chat.hasRead) const SizedBox(width: 4),
                      Text(
                        
                        chat.message,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                          
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Time and Unread Count
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 6),
                if (chat.unreadCount > 0)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFF8A2BE2),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      chat.unreadCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )
                else
                  // Add a placeholder to maintain alignment
                  const SizedBox(height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
