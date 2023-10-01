import 'package:contacts_pcsb/presentations/contacts_page/bloc/contacts_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCards extends StatelessWidget {
  final HomeBlocBloc homeBloc = HomeBlocBloc();
  final String Email, Name, Gmail, Mobileno, Position, GitHub, Linkedin, pic;

  ContactCards(
      {super.key,
      required this.Email,
      required this.Name,
      required this.Gmail,
      required this.Mobileno,
      required this.Position,
      required this.GitHub,
      required this.Linkedin,
      required this.pic});
  _launchURLBrowser(String url) {
    launchUrl(Uri.parse(url));
  }

  _launchEmail() {
    String recipient = Gmail;
    String subject = ''; // for future use

    // Construct the mailto URL with recipient and subject
    final url = 'mailto:$recipient?subject=';
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final imageWidth = mediaQuery.size.width * 0.35;
    final imageHeight = mediaQuery.size.width * 0.35;
    double width = mediaQuery.size.width * 0.4;
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBloc,
      listener: (context, state) {
        if (state is HomeGmailPressedState) {
          _launchEmail();
        }
        if (state is HomeGitPressedState) {
          _launchURLBrowser(GitHub);
        }
        if (state is HomeLinkedinPressedState) {
          _launchURLBrowser(Linkedin);
        }
      },
      builder: (context, state) {
        return Card(
          color: Color(0xFF000000),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(117, 45, 44, 125),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                border: Border.all(color: Color.fromARGB(117, 45, 44, 125))),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: imageWidth,
                              height: imageHeight,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(75),
                                child: Image.asset(
                                  pic,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                                // width: width * 0.05,
                                ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  Position,
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.grey),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {
                                        homeBloc.add(CardGmailNavigateEvent());
                                      },
                                      style: OutlinedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        side: const BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromARGB(0, 77, 101, 111),
                                        ),
                                      ),
                                      child: const SizedBox(
                                        height: 34,
                                        width: 34,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/generalimages/gmailfinal.png'),
                                        ),
                                      ),
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        homeBloc.add(CardGitNavigateEvent());
                                      },
                                      style: OutlinedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        side: const BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromARGB(0, 77, 101, 111),
                                        ),
                                      ),
                                      child: const SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/generalimages/github.png'),
                                        ),
                                      ),
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        homeBloc
                                            .add(CardGLinkedinNavigateEvent());
                                      },
                                      style: OutlinedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        side: const BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromARGB(0, 124, 145, 154),
                                        ),
                                      ),
                                      child: const SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/generalimages/linkedin.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
