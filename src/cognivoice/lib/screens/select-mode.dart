import 'package:cognivoice/providers/user.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:loggerw/loggerw.dart';

class SelectMode extends ConsumerStatefulWidget {
  const SelectMode(
      {Key? key,
      required this.context,
      required this.ref,
      required this.logger})
      : super(key: key);

  final BuildContext context;
  final WidgetRef ref;
  final Logger logger;

  @override
  _SelectModeState createState() => _SelectModeState();
}

class _SelectModeState extends ConsumerState<SelectMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 64),
            Image.asset(
              'assets/logo.png',
              width: 150.0,
              height: 100.0,
            ),
            const SizedBox(height: 20),
            Text(
              'How do you intend to use CogniVoice?',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'In CogniVoice we have two search modes. You can choose the mode that best suits your needs.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.75),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextButton(
                        onPressed: () {
                          _updateSelectedMode(0);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: selectedMode == 0
                              ? Theme.of(context).colorScheme.background
                              : Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "MarketTracker",
                            style: TextStyle(
                              color: selectedMode == 0
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextButton(
                        onPressed: () {
                          _updateSelectedMode(1);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: selectedMode == 1
                              ? Theme.of(context).colorScheme.background
                              : Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "SalesTracker",
                            style: TextStyle(
                              color: selectedMode == 1
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            selectedSection[selectedMode],

            const SizedBox(height: 32),
            Text(
              'You can change this setting later.',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            // Login button
            Container(
              width: 370,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0062FF), Color(0xFF12307C)],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: _submitHandler,
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int selectedMode = 0;
  List<Widget> selectedSection = [
    Column(
      children: [
        const Text(
          'MarketTracker',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 18),
        Image.asset(
          'assets/icons/markettracker.png',
          width: 150.0,
          height: 100.0,
        ),
        const SizedBox(height: 18),
        const Text(
          'In MarketTracker mode, the results of the searches will be focused on guiding texts of campaigns from other companies with decision support for Marketing campaigns.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    Column(
      children: [
        const Text(
          'SalesTracker',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 18),
        Image.asset(
          'assets/icons/salestracker.png',
          width: 150.0,
          height: 100.0,
        ),
        const SizedBox(height: 18),
        const Text(
          'In SalesTracker mode, the results of the searches will be focused on guiding texts of campaigns from other companies with decision support for Sales campaigns.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ];

  void _submitHandler() {
    widget.logger.i('SelectMode: Submit button pressed');

    widget.ref.read(userProvider).selectedMode = selectedMode == 0
        ? 'MarketTracker'
        : selectedMode == 1
            ? 'SalesTracker'
            : '';

    if (selectedMode == 0 || selectedMode == 1) {
      widget.logger.i('SelectMode: Submit successful');

      widget.ref.read(userProvider).selectedMode = selectedMode == 0
          ? 'MarketTracker'
          : selectedMode == 1
              ? 'SalesTracker'
              : '';

      widget.logger.i(
          'SelectMode: Selected mode: ${widget.ref.read(userProvider).selectedMode}');
    } else {
      widget.logger.e('SelectMode: Mode selection failed');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select a mode',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ),
      );
    }

    Navigator.pushNamed(widget.context, '/home');
  }

  void _updateSelectedMode(int mode) {
    setState(() {
      selectedMode = mode;
    });

    widget.logger.i('SelectMode: Selected mode: $selectedMode');
  }
}
