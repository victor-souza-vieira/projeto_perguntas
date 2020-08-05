import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Rosa', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual seu animal favorito?',
      'resposta': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 5},
        {'texto': 'Papagaio', 'pontuacao': 3},
        {'texto': 'Tartaruga', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual seu filme favorito?',
      'resposta': [
        {'texto': 'Vingadores', 'pontuacao': 10},
        {'texto': 'Guerra Civil', 'pontuacao': 5},
        {'texto': 'Homem-aranha', 'pontuacao': 3},
        {'texto': 'Django', 'pontuacao': 1},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Perguntas")),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                quantoResponder: _responder,
              )
            : Resultado(
                pontuacao: _pontuacaoTotal,
                reiniciarQuestionario: _reiniciarQuestionario,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
