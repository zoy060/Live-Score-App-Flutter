import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LiveScore extends StatelessWidget {
  LiveScore({super.key});

  final doc = FirebaseFirestore.instance
      .collection('matches')
      .doc('live_match');

  void addRun(int run) {
    doc.update({"runs": FieldValue.increment(run)});
  }

  void addWicket() {
    doc.update({"wickets": FieldValue.increment(1)});
  }

  void reset() {
    doc.set({
      "overs": "0",
      "runs": 0,
      "status": "live",
      "teamA": "Bangladesh",
      "teamB": "India",
      'teamC': "",
      "wickets": "0",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Live Score App",

          style: TextStyle(fontWeight: .bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: doc.snapshots(),
        builder: (context, Snapshot) {
          if (!Snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = Snapshot.data?.data() as Map<String, dynamic>;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  '${data['teamA']} VS ${data['teamB']}',
                  style: TextStyle(fontSize: 26, fontWeight: .bold),
                ),
                SizedBox(height: 40),
                Text(
                  '${data['runs']} runs / ${data['wickets']}',
                  style: TextStyle(fontSize: 44, fontWeight: .bold),
                ),
                Text(
                  'Over ${data['overs']}',
                  style: TextStyle(fontSize: 30, fontWeight: .bold),
                ),
                Text(
                  '${data['status']}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: .bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 40),
                Wrap(
                  alignment: .center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        addRun(1);
                      },
                      child: Text('+1 Run'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addRun(4);
                      },
                      child: Text('Four'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addRun(6);
                      },
                      child: Text('Six'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addWicket();
                      },
                      child: Text('Wicket'),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('Next Ball')),
                    ElevatedButton(
                      onPressed: () {
                        reset();
                      },
                      child: Text('Reset'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
