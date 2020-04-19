import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'src/second_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}


class RandomWords extends StatefulWidget{
  @override
  _RandomWordsState createState() => _RandomWordsState();
}


class _RandomWordsState extends State<RandomWords>{
  final TextStyle _biggerFont = const TextStyle(fontSize: 33);   
  final List<WordPair> _suggestions = <WordPair>[];

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }
        final int index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      subtitle: Text('My Status'),
      
      trailing: Icon(
        Icons.favorite_border,
        color: Colors.green,
        ),
      
      leading: CircleAvatar(
        child : FlutterLogo(
          size: 30,
          colors:Colors.red,
        ),
      ),
      
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),

      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return SecondScreen(pair);
            }
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      drawer : Drawer(),
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );     
  }
}

