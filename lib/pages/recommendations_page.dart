import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  Map<String, String> recommendations = {
    'Stronger by Kelly Clarkson': 'H4TXUGa_CMk',
    'Eye of the Tiger by Survivor': 'btPJPFnesV4',
    'Roar by Katy Perry': 'CevxZvSJLk8',
    'Ain\'t No Sunshine by Bill Withers': 'YuKfiH0Scao',
    'Walking on Sunshine by Katrina and the Waves': 'qK5KhQG06xU',
    'I Will Survive by Gloria Gaynor': 'ihUF8pbphbk',
    'Good as Hell by Lizzo': '4WmgQekz4RQ',
    'Brave by Sara Bareilles': '4Ny_LX3byp8',
    'The Climb by Miley Cyrus': 'LWL5v2y_dOI',
    'The Power of Love by Huey Lewis and the News': 'WK0z87WrhGo',
    'Zinda by Siddharth Mahadevan': 'Ax0G_P2dSBw ',
    'Jeena Jeena by Atif Aslam': 'UMOFhrxZ2eQ',
    'Tum Hi Ho by Arijit Singh': 'yWWqcupqUo4',
    'Soch by Hardy Sandhu': 'PI5sDDoAD-8',
    'Lag Jaa Gale by Lata Mangeshkar': 'rp1GKSkdizA',
    'Abhi Muj Mein Kahin by Sonu Nigam': '3Iq3j3L06rQ',
    'Tere Bina by A.R. Rahman': '7HKbt19q3Rc',
    'Phir Bhi Tumko Chaahunga by Arijit Singh and Shashaa Tirupati':
        '_iktURk0X-A',
    'Tum Se Hi by Mohit Chauhan': 'mOAQLgOue5I',
    'Channa Mereya by Arijit Singh': 'bzSTpdcs-EI',
    'Ale by  Neeraj Shridhar ': 'uV33WWTDjqI'
  };
  Map<String, String> physical = {
    'Exercise':
        'Physical activity can help improve your mood . Try going for a walk, run, or bike ride, or find a form of exercise that you enjoy, such as dancing, yoga, or swimming.',
    'Practice mindfulness':
        'Mindfulness involves paying attention to the present moment and can be a helpful tool for managing depression. Try activities such as deep breathing, meditation, or journaling to help you stay present and focused.',
    'Engage in hobbies':
        'Hobbies and activities that you enjoy can provide a sense of accomplishment and help improve your mood.',
    'Connect with others':
        ' Try reaching out to friends and family, joining a support group, or volunteering to connect with others and feel more supported.',
    'Take care of yourself':
        'Try to get enough sleep, eat a balanced diet, and engage in activities that help you relax, such as taking a warm bath or reading a book.',
  };
  final curr = FirebaseAuth.instance;
  final spinkit = const SpinKitRipple(
    color: Color.fromRGBO(0, 99, 219, 1),
    size: 50.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(12, 205, 163, 1),
            Color.fromRGBO(193, 252, 211, 1)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('Email', isEqualTo: curr.currentUser?.email)
            .snapshots(),
        builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs[0]['Diagonsis'].isEmpty) {
              return const Center(
                child: Text('No Recommendations'),
              );
            } else {
              return ListView.builder(
                itemCount: recommendations.length + physical.length,
                itemBuilder: (context, index) {
                  if (index < recommendations.length) {
                    return ListTile(
                      title: Text(recommendations.keys.elementAt(index)),
                      trailing: IconButton(
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () async {
                          if (!await launchUrl(Uri(
                              scheme: 'https',
                              host: 'www.youtube.com',
                              path: '/watch',
                              queryParameters: {
                                'v': recommendations.values.elementAt(index)
                              }))) {
                            throw 'Could not launch $recommendations.values.elementAt(index)';
                          }
                        },
                      ),
                    );
                  } else {
                    return ListTile(
                      title: Text(physical.keys
                          .elementAt(index - recommendations.length)),
                      subtitle: Text(physical.values
                          .elementAt(index - recommendations.length)),
                    );
                  }
                },
              );
            }
          } else {
            return spinkit;
          }
        }),
      ),
    ));
  }
}
