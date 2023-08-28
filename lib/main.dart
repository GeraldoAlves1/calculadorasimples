import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tela = '';

  void setvalor(var botao) {
    setState(() {
      if (tela == '0') {
        tela = botao;
      } else {
        tela += botao;
      }
    });
  }

  void resetar() {
    setState(() {
      tela = '0';
    });
  }
  //TODO - 11: Utilizando o arquivo readme e os exemplos disponíveis na página oficial do pacote math_expressions
  //crie uma variável que receba a nossa expressão matemática que atualmente se encontra dentro da variável mensagemVisor.

  void realizarCalculo() {
    tela = tela.replaceAll('%', '%');
    Parser p = Parser();

    Expression expressao = p.parse(tela);
    ContextModel cm = ContextModel();
    double resultadoDaExpressao = expressao.evaluate(EvaluationType.REAL, cm);
    setState(() {
      tela = resultadoDaExpressao.toString();
    });
  }

  Expanded criarBotao(String nomebotao, void Function() onPress, Color cor) {
    return Expanded(
      child: ElevatedButton(
        child: Text(
          nomebotao,
          style: TextStyle(fontSize: 40, color: cor),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.only(top: 20, bottom: 20)),
        onPressed: onPress,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black12,
          appBar: AppBar(
            title: Text('Calculadora'),
            backgroundColor: Colors.black,
          ),
          body: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                width: 400,
                height: 120,
                margin: EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    '$tela',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      //Primeira Row
                      children: <Widget>[
                        criarBotao('C', () {
                          resetar();
                        }, Colors.deepOrange),
                        criarBotao('Del', () {
                          resetar();
                        }, Colors.deepOrange),
                        criarBotao('%', () {
                          setvalor('%');
                        }, Colors.deepOrange),
                        criarBotao('/', () {
                          setvalor('/');
                        }, Colors.deepOrange),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      //Segunda Row
                      children: <Widget>[
                        criarBotao('7', () {
                          setvalor('7');
                        }, Colors.white),
                        criarBotao('8', () {
                          setvalor('8');
                        }, Colors.white),
                        criarBotao('9', () {
                          setvalor('9');
                        }, Colors.white),
                        criarBotao('*', () {
                          setvalor('*');
                        }, Colors.deepOrange),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      //Terceira Row
                      children: <Widget>[
                        criarBotao('4', () {
                          setvalor('4');
                        }, Colors.white),
                        criarBotao('5', () {
                          setvalor('5');
                        }, Colors.white),
                        criarBotao('6', () {
                          setvalor('6');
                        }, Colors.white),
                        criarBotao('+', () {
                          setvalor('+');
                        }, Colors.deepOrange),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      //Quarta Row
                      children: <Widget>[
                        criarBotao('1', () {
                          setvalor('1');
                        }, Colors.white),
                        criarBotao('2', () {
                          setvalor('2');
                        }, Colors.white),
                        criarBotao('3', () {
                          setvalor('3');
                        }, Colors.white),
                        criarBotao('-', () {
                          setvalor('-');
                        }, Colors.deepOrange),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      //Quinta Row
                      children: <Widget>[
                        criarBotao('0', () {
                          setvalor('0');
                        }, Colors.white),
                        criarBotao('.', () {
                          setvalor('.');
                        }, Colors.deepOrange),
                        criarBotao('=', () {
                          realizarCalculo();
                        }, Colors.deepOrange),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
