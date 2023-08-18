import 'package:flutter/material.dart';

class SelectMode extends StatefulWidget {
  const SelectMode({Key? key, required this.context}) : super(key: key);

  final BuildContext context;

  @override
  _SelectModeState createState() => _SelectModeState();
}

class _SelectModeState extends State<SelectMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 70),
              // Logo
              Image.asset(
                'assets/logo.png',
                width: 150.0,
                height: 100.0,
              ),
              const SizedBox(height: 20),
              Text(
                'Como você quer utilizar o CogniVoice?',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'No CogniVoice temos dois modos de busca. Você pode escolher o modo que melhor se encaixa à sua necessidade.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.onBackground,
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
                                    ? const Color(0xff0062FF)
                                    : Theme.of(context).colorScheme.primary,
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
                                    ? const Color(0xff0062FF)
                                    : Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
              // Selected mode
              selectedSection[selectedMode],

              const SizedBox(height: 48),
              Text(
                'Você pode mudar o modo de busca a qualquer momento.',
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
                  onPressed: () {
                    // Action to perform when the button is pressed
                    // Navigator.pushNamed(context, '/work');
                  },
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
          'No modo MarketTracker os resultados das pesquisas serão focados em textos norteadores de campanhas de outras empresas com apoio de decisão para campanhas de Marketing.',
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
          'No modo SalesTracker os resultados das pesquisas serão focados em textos norteadores de campanhas de outras empresas com apoio de decisão para campanhas de Vendas.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ];

  void _updateSelectedMode(int mode) {
    setState(() {
      selectedMode = mode;
    });
  }
}
