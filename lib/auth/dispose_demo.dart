import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DemoProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Dispose Demo')),
        body: Consumer<DemoProvider>(
          builder: (context, provider, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: provider.emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NextPage(),
                      ),
                    );
                  },
                  child: const Text('Go to Next Page'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DemoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Next Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email: ${provider.emailController.text}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // This will throw an error if the controller is disposed
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Try to use disposed controller'),
                    content: TextField(
                      controller: provider.emailController,
                      decoration: const InputDecoration(
                          labelText: 'Should throw error if disposed'),
                    ),
                  ),
                );
              },
              child: const Text('Use Controller in TextField'),
            ),
          ],
        ),
      ),
    );
  }
}
