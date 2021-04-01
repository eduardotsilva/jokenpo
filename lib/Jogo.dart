
import 'dart:math';

import 'package:flutter/material.dart';


class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
     var _imagemApp = AssetImage("imagens/padrao.png");
     var _mensagem = "Escolha uma opção abaixo:";

     void _opcaoSelecionada(String escolhaUsuario){

       var opcoes = ["pedra", "papel","tesoura"];
       var numero = Random().nextInt(3);
       var escolhaApp = opcoes[numero];


       switch( escolhaApp ){
         case "pedra" :
           setState(() {
             this._imagemApp = AssetImage("imagens/pedra.png");
           });
           break;

         case "papel" :
           setState(() {
             this._imagemApp = AssetImage("imagens/papel.png");
           });
           break;

         case "tesoura" :
           setState(() {
             this._imagemApp = AssetImage("imagens/tesoura.png");
           });
           break;
       }

       //validação ganhador

       if (
           (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
           (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
           (escolhaUsuario == "papel" && escolhaApp == "pedra")
        ){
          setState(() {
            this._mensagem = "Você ganhou!";
          });
        }else if (
             (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
             (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
             (escolhaApp == "papel" && escolhaUsuario == "pedra")
            ){
         setState(() {
           this._mensagem = "Você perdeu!";
         });
       }else {
         setState(() {
           this._mensagem = "EMPATE!";
         });
       }

     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PokenPo"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "Escolha do app",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight:  FontWeight.bold
              ),
            ),
            Image(image: this._imagemApp,),
            Text(
                this._mensagem,
                textAlign: TextAlign.center,
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20
                 ),
            ),
           Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset("imagens/pedra.png",fit: BoxFit.fill, height: 95),
                ),
                GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: Image.asset("imagens/papel.png",fit: BoxFit.fill, height: 95)),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset("imagens/tesoura.png",fit: BoxFit.fill, height: 95),
                ),
              ],
           )
          ],
        ),
      ),
    );
  }
}
