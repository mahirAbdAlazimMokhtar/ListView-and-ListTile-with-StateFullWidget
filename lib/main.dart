import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  final List<WordPair> _suggestions = <WordPair>[];
  Widget _buildSuggestions(){
    return ListView.builder(
      itemBuilder: (BuildContext _context ,  i){
        if (i.isOdd){
          return Divider();
        }

        final index = i ~/2 ;

        if (index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);//new Row
      }
    );
  }
  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(pair.asCamelCase),
    );
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('My new Text'),
      ),
      body: _buildSuggestions(),
    );
  }
}

