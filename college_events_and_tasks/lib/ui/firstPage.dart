import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Gaveta no canto superior esquerdo
      drawer: Drawer(
        child: ListView(

          // Importante: Remover to do o padding da ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[

            // Parte da gaveta reponsável pelo login
            new UserAccountsDrawerHeader(

              // Nome do Usuário
              accountName: Text(
                'Nome do Usuário',
                style: new TextStyle(
                    fontSize: 17.0,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                ),
              ),

              // Email do Usuário
              accountEmail: Text(
                'nome.do.usuario@gmail.com',
                style: new TextStyle(
                    fontSize: 17.0,
                    color: Colors.blueAccent,
                ),
              ),

              // Avatar do Usuário
              currentAccountPicture: CircleAvatar(
              child: FlutterLogo(size: 42.0),
                backgroundColor: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
            ),

            // 1º Semestre
            ListTile(
              title: Text(
                '1º Semestre',
                style: new TextStyle(
                    fontSize: 22.0,
                    color: Colors.blueAccent),
              ),
              onTap:(){
                // ...
                Navigator.pop(context);
              },
            ),

            // 2º Semestre
            ListTile(
              title: Text(
                '2º Semestre',
                style: new TextStyle(
                    fontSize: 22.0,
                    color: Colors.blueAccent),
              ),
              onTap:(){
                // ...
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),


      appBar: AppBar(

        title:  Text("Eventos e Tarefas da Faculdade",
          style: new TextStyle(
              fontSize: 19.0,
          ),
        ),
        backgroundColor: Colors.yellow,
        centerTitle: true,
        actions: <Widget>[
        ],
      ),

      body: new Stack(
        children: <Widget>[

          // Inserção da imagem de fundo
          new Center(
            child: new Image.asset(
              'images/3_darker_notebook.png',
              width: 460.0,
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),

          // Botão "rota" para a MainPage
          // Testando o INKWELL
          new InkWell(
            onTap:(){
              Navigator.pushNamed(context, '/main');
              },

            child: new Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(30.0, 375, 0.0, 50.0),
              width: 300.0,
              height: 55.0,
              decoration: new BoxDecoration(
                color: Colors.blueAccent,
                border: new Border.all(color: Colors.yellow[300], width: 2.0),
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: new Center(
                child: new Text(
                  'Entrar',
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          new Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.fromLTRB(0.0, 30, 0.0, 0.0),
            child: new Text(
              'Bem Vindo(a) !\n',
              style: firstPageStyle1(),
            ),
          ),

          new Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 50.0),
            child: new Text(
              'Oraganize seus Eventos e Tarefas desse e dos próximos semestres',
              style: firstPageStyle2(),
            ),
          ),

        ],
      ),
    );
  }
}

// Styling dos textos presentes na FirstPage
TextStyle firstPageStyle1() {
  return new TextStyle(
      color: Colors.yellowAccent, fontSize: 40, fontWeight: FontWeight.bold);
}

TextStyle firstPageStyle2() {
  return new TextStyle(
      color: Colors.blue[900], fontSize: 23, fontWeight: FontWeight.bold);
}
















// Just in case something happen
/*Center(
        child: RaisedButton(
          child: Text('Entrar'),
          onPressed: () {
            // Navegar para a mainPage utilizando o NAME ROUTE
            Navigator.pushNamed(context, '/main');
          },
        ),
),*/