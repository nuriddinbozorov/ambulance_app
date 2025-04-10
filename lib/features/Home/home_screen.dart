import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:url_launcher/url_launcher.dart';
import 'issue_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _issues = [
    {
      'title': 'Yurak Xuruji',
      'icon': Icons.favorite,
      'color': const Color(0xFFFFB5C8),
      'iconColor': Colors.red,
    },
    {
      'title': 'Qon Ketishi',
      'icon': Icons.water_drop,
      'color': const Color(0xFFFFD2B5),
      'iconColor': Colors.orange,
    },
    {
      'title': 'Tana Harorati',
      'icon': Icons.thermostat,
      'color': const Color(0xFFB5E1FF),
      'iconColor': Colors.blue,
    },
    {
      'title': "Bosh Og'rig'i",
      'icon': Icons.psychology,
      'color': const Color(0xFFCCB5FF),
      'iconColor': Colors.deepPurple,
    },
    {
      'title': 'Nafas Olish',
      'icon': Icons.air,
      'color': const Color(0xFFE1B5FF),
      'iconColor': Colors.purple,
    },
    {
      'title': 'Qayd Qilish',
      'icon': Icons.sick,
      'color': const Color(0xFFFFB5B5),
      'iconColor': Colors.redAccent,
    },
    {
      'title': 'Boshqa',
      'icon': Icons.more_horiz,
      'color': const Color(0xFFE0E0E0),
      'iconColor': Colors.grey,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Header
              Text(
                'Salom,',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple[400],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Nima bo'ldi?",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.deepPurple[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Muammoni tanlang va birinchi yordam ko'rsatish tartibini bilib oling.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 25),

              // Grid of issues
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1,
                  ),
                  itemCount: _issues.length,
                  itemBuilder: (context, index) {
                    return IssueCard(
                      title: _issues[index]['title'],
                      icon: _issues[index]['icon'],
                      color: _issues[index]['color'],
                      iconColor: _issues[index]['iconColor'],
                    );
                  },
                ),
              ),

              // Divider with OR
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Yoki",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Ambulance button
              SlideAction(
                sliderButtonIcon: const Icon(Icons.phone, color: Colors.green),
                onSubmit: () async {
                  final Uri phoneUri = Uri(scheme: 'tel', path: '103');
                  if (await canLaunchUrl(phoneUri)) {
                    await launchUrl(phoneUri,
                        mode: LaunchMode.externalApplication);
                  } else {
                    print("Qo‘ng‘iroqni amalga oshirolmadi");
                  }
                },
                outerColor: Colors.deepPurple,
                text: "Tez yordam chaqirish >>>",
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
