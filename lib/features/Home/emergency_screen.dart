import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  final String issueType;

  const EmergencyScreen({
    Key? key,
    required this.issueType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$issueType First Aid'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'First Aid for $issueType',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Follow these steps:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: _buildFirstAidSteps(issueType),
            ),
            ElevatedButton(
              onPressed: () {
                // Call emergency services
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'CALL EMERGENCY SERVICES',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstAidSteps(String issueType) {
    List<String> steps = [];

    // Different steps based on issue type
    switch (issueType) {
      case 'Heart Attack':
        steps = [
          'Call emergency services immediately',
          'Help the person sit down and rest',
          'Loosen any tight clothing',
          "If the person is not allergic to aspirin and it's readily available, give them an aspirin to chew",
          'If the person becomes unconscious, begin CPR',
        ];
        break;
      case 'Bleeding':
        steps = [
          'Apply direct pressure to the wound using a clean cloth or bandage',
          'If possible, elevate the injured area above the level of the heart',
          'Apply pressure to the wound for at least 15 minutes',
          "If bleeding doesn't stop, apply pressure to the appropriate pressure point",
          "Seek medical attention if bleeding is severe or doesn't stop",
        ];
        break;
      // Add more cases for other issues
      default:
        steps = [
          'Assess the situation carefully',
          'Call emergency services if needed',
          'Keep the person calm and comfortable',
          'Monitor vital signs until help arrives',
        ];
    }

    return ListView.builder(
      itemCount: steps.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  steps[index],
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
