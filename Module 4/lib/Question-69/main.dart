import 'package:flutter/material.dart';

void main() => runApp(GmailCloneApp());

class GmailCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Clone',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List screens = [
    SecondScreen(title: 'Inbox', icon: Icons.inbox),
    SecondScreen(title: 'Starred', icon: Icons.star),
    SecondScreen(title: 'Drafts', icon: Icons.drafts),
    SecondScreen(title: 'Trash', icon: Icons.delete),
    SecondScreen(title: 'Sent', icon: Icons.send),
  ];

  final List titles = ['Inbox', 'Starred', 'Drafts', 'Trash', 'Sent'];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[selectedIndex]),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Starred'),
          BottomNavigationBarItem(icon: Icon(Icons.drafts), label: 'Drafts'),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: 'Trash'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Sent'),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String title;
  final IconData icon;

  SecondScreen({required this.title, required this.icon});

  final List<Map<String, String>> dummyEmails = List.generate(
    10,
    (index) => {
      'sender': 'User $index',
      'subject': 'Subject $index - Lorem ipsum dolor sit amet',
      'snippet': 'This is the preview text for email number $index',
      'time': '${index + 1}:00 PM',
    },
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyEmails.length,
      itemBuilder: (context, index) {
        final email = dummyEmails[index];
        return ListTile(
          leading: CircleAvatar(
            child: Icon(icon, color: Colors.white, size: 20),
            backgroundColor: Colors.red,
          ),
          title: Text(email['sender']!),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(email['subject']!,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(email['snippet']!,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
          trailing: Text(email['time']!),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tapped on ${email['subject']}')),
            );
          },
        );
      },
    );
  }
}
