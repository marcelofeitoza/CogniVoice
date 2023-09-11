import 'package:cognivoice/providers/user.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:loggerw/loggerw.dart';

enum TimeOfDay {
  morning,
  afternoon,
  night,
}

class Home extends ConsumerStatefulWidget {
  const Home(
      {Key? key,
      required this.context,
      required this.ref,
      required this.logger})
      : super(key: key);

  final BuildContext context;
  final WidgetRef ref;
  final Logger logger;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    user = ref.read(userProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 72,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Good ${timeOfDay.toString().split('.').last}!",
                                style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .fontSize,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                )),
                            Text("Search with CogniVoice",
                                style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .fontSize,
                                  fontWeight: FontWeight.w300,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                                softWrap: true),
                          ]),
                      IconButton(
                        onPressed: () {
                          widget.logger.i("Home: Settings button clicked");
                          Navigator.pushNamed(context, "/settings");
                        },
                        icon: Icon(
                          Icons.settings_outlined,
                          size: 28,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Prompts",
                        style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .fontSize,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      // TextButton(
                      //     style: TextButton.styleFrom(
                      //       padding: EdgeInsets.zero,
                      //       animationDuration: Duration.zero,
                      //     ),
                      //     onPressed: () {},
                      //     child: Text(
                      //       "View all",
                      //       style: TextStyle(
                      //         decoration: TextDecoration.underline,
                      //         fontSize: Theme.of(context)
                      //             .textTheme
                      //             .bodySmall!
                      //             .fontSize,
                      //         fontWeight: FontWeight.w400,
                      //         color: Theme.of(context).colorScheme.onPrimary,
                      //       ),
                      //     )),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 200,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return PromptCard(
                      title: prompts[index]["title"]!,
                      description: prompts[index]["description"]!,
                    );
                  },
                  itemCount: prompts.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                )),
            SizedBox(
              height: 8.0,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "History (${history.length})",
                          style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .fontSize,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        // TextButton(
                        //     style: TextButton.styleFrom(
                        //       padding: EdgeInsets.zero,
                        //       animationDuration: Duration.zero,
                        //     ),
                        //     onPressed: () {},
                        //     child: Text(
                        //       "View all",
                        //       style: TextStyle(
                        //         decoration: TextDecoration.underline,
                        //         fontSize: Theme.of(context)
                        //             .textTheme
                        //             .bodySmall!
                        //             .fontSize,
                        //         fontWeight: FontWeight.w400,
                        //         color: Theme.of(context).colorScheme.onPrimary,
                        //       ),
                        //     )),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 5,
                      padding: EdgeInsets.only(top: 8.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.075),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.chat_outlined,
                                    size: 24.0,
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      history[index],
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                          ],
                        );
                      },
                    )
                  ],
                )),
            SizedBox(
              height: 96.0,
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0062FF),
              Color(0xff12307C),
            ],
          ),
        ),
        child: FloatingActionButton.extended(
          onPressed: _createChat,
          backgroundColor: Colors.transparent,
          label: Text(
            "Go chat",
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          elevation: 0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  late User user;
  late TimeOfDay timeOfDay;
  final List<Map<String, String>> prompts = [
    {
      "title": "Market trends",
      "description": "Have an overview of the main world topics!"
    },
    {
      "title": "Campaign strategies",
      "description": "Provide support for marketing decisions."
    },
    {
      "title": "Customer support",
      "description": "Help your customers with their questions."
    },
    {
      "title": "Sales",
      "description": "Get insights on how to improve your sales."
    },
  ];
  final List<String> history = [
    "Qual o posicionamento da Cisco sobre a terra plana?",
    "Qual o posicionamento da Cisco sobre a terra plana?",
    "Qual o posicionamento da Cisco sobre a terra plana?",
    "Qual o posicionamento da Cisco sobre a terra plana?",
    "Qual o posicionamento da Cisco sobre a terra plana?",
    "Qual o posicionamento da Cisco sobre a terra plana?",
    "Qual o posicionamento da Cisco sobre a terra plana?",
    "Qual o posicionamento da Cisco sobre a terra plana?",
  ];

  void _createChat() {
    widget.logger.i("Home: Creating chat");

    Navigator.pushNamed(context, "/chat");
  }

  @override
  void initState() {
    widget.logger.i("Home: Initializing state");

    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 5 && hour < 12) {
      timeOfDay = TimeOfDay.morning;
    } else if (hour >= 12 && hour < 18) {
      timeOfDay = TimeOfDay.afternoon;
    } else {
      timeOfDay = TimeOfDay.night;
    }

    super.initState();
  }

  @override
  void dispose() {
    widget.logger.i("Home: Disposing");

    super.dispose();
  }
}

class PromptCard extends StatelessWidget {
  final String title;
  final String description;

  const PromptCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        Container(
          width: 200,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0054DC),
                Color.fromARGB(255, 15, 40, 103),
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.displaySmall!.fontSize,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        )
      ],
    );
  }
}
