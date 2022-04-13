import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '슬라이드퍼즐',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: () => showPuzzlePage(context),
                child: const Text('스타트'))
          ],
        ),
      ),
    );
  }
}

void showPuzzlePage(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const PuzzlePage()));
}

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({Key? key}) : super(key: key);

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  List<int> tileNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('슬라이드퍼즐'),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.play_arrow),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: TilesView(
                  numbers: tileNumbers,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.shuffle),
                label: const Text('셔플'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TilesView extends StatelessWidget {
  final List<int> numbers;

  const TilesView({
    Key? key,
    required this.numbers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: numbers.map((number) {
        if (number == 0) {
          return Container();
        }
        return TileView(
            number: number, color: Colors.blue, onPressed: () => {});
      }).toList(),
    );
  }
}

class TileView extends StatelessWidget {
  final int number;
  final Color color;
  final void Function() onPressed;

  const TileView({
    Key? key,
    required this.number,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        textStyle: const TextStyle(fontSize: 32),
      ),
      child: Center(
        child: Text(number.toString()),
      ),
    );
  }
}
