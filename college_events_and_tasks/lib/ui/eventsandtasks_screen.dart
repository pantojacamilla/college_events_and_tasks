/*import 'package:flutter/material.dart';
                           TESTE INICIAL
class EventsAndTasksScreen extends StatefulWidget {
  @override
  _EventsAndTasksScreenState createState() => _EventsAndTasksScreenState();
}

class _EventsAndTasksScreenState extends State<EventsAndTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white70,
      body: Column(),

      floatingActionButton: new FloatingActionButton(
          tooltip: "Adicionar Afazer",
          backgroundColor: Colors.yellowAccent,
          child: new ListTile(
            title: Icon(Icons.add),
          ),

          onPressed: _showFormDialog ),
    );
  }

  void _showFormDialog() {
  }
}*/

import 'package:flutter/material.dart';
import 'package:college_events_and_tasks/model/eventsandtasks_item.dart';
import 'package:college_events_and_tasks/util/database_client.dart';
import 'package:college_events_and_tasks/util/date_formatter.dart';

class EventsAndTasksScreen extends StatefulWidget {
  @override
  _EventsAndTasksScreenState createState() => _EventsAndTasksScreenState();
}

class _EventsAndTasksScreenState extends State<EventsAndTasksScreen> {
  final TextEditingController _textEditingController = new TextEditingController();
  var db = new DatabaseHelper();
  final List<EventsAndTasksItem> _itemList = <EventsAndTasksItem>[];

  @override
  void initState() {
    super.initState();
    _readEventsAndTasks();
  }

  void _handleSubmitted(String text) async {
    _textEditingController.clear();

    EventsAndTasksItem eventsAndTasksItem = new EventsAndTasksItem(text, dateFormatted());
    int savedItemId = await db.saveItem(eventsAndTasksItem);

    EventsAndTasksItem addedItem = await db.getItem(savedItemId);
    setState(() {
      _itemList.insert(0, addedItem);
    });
    print("Id da(o) Tarefa/Evento adicionada(o): $savedItemId");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,

      body: new Stack(
        children: <Widget>[

          // Inserção da imagem de fundo
          new Center(
            child: new Image.asset(
              'images/1_notebook_and_half.png',
              width: 460.0,
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),

          // Inserção dos cards
          new Column(
            children: <Widget>[
              new Flexible(
                child: new ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: false,
                  itemCount: _itemList.length,
                  itemBuilder: (_, int index){
                    return new Card(
                      color: Colors.lightBlue[400],
                      child: new ListTile(
                        title: _itemList[index],
                        onLongPress: () => _updateItem(_itemList[index], index),
                        trailing: new Listener(
                          key: new Key(_itemList[index].itemName),
                          child:  new Icon(
                            Icons.remove_circle,
                            color: Colors.yellowAccent
                          ),
                          onPointerDown: (pointerEvent) => _deleteEventsAndTasks(_itemList[index].id, index),
                        ),
                      ),
                    );
                  },
                ),
              ),

              new Divider(
                height: 1.0,
              ),

            ],
          ),
        ],
      ),

      // Botão de adicionar nota
      floatingActionButton: new FloatingActionButton(
        tooltip: "Adicionar Tarefa ou Evento",
        backgroundColor: Colors.yellowAccent,
          child: new ListTile(
            title: new Icon(Icons.add),
           ),
         onPressed: _showFormDialog
      ),

    );
  }

  void _showFormDialog() {
    var alert = new AlertDialog(
      content: new Row(
        children: <Widget>[
          new Expanded(
              child: new TextField(
                controller: _textEditingController,
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: "Evento/Tarefa",
                    hintText: "Adicione um Evento ou Tarefa",
                    icon: new Icon(Icons.note_add)
                ),
              ))
        ],
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              _handleSubmitted(_textEditingController.text);
              _textEditingController.clear();
              Navigator.pop(context);
            },
            child: Text("Salvar")),
        new FlatButton(onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"))

      ],
    );
    showDialog(context: context,
        builder:(_) {
          return alert;

        });
  }

  _readEventsAndTasks() async {
    List items = await db.getItems();
    items.forEach((item) {
      // EventsAndTasksItem eventsAndTasksItem = EventsAndTasksItem.fromMap(item);
      setState(() {
        _itemList.add(EventsAndTasksItem.map(item));
      });
      // print("Db items: ${eventsAndTasksItem.itemName}");
    });
  }

  _deleteEventsAndTasks(int id, int index) async {
    debugPrint("Item Deletado!");

    await db.deleteItem(id);
    setState(() {
      _itemList.removeAt(index);
    });
  }

  _updateItem(EventsAndTasksItem item, int index) {
    var alert = new AlertDialog(
      title: new Text("Atualizar Evento ou Tarefa"),
      content: new Row(
        children: <Widget>[
          new Expanded(
              child: new TextField(
                controller: _textEditingController,
                autofocus: true,

                decoration: new InputDecoration(
                    labelText:  "Evento/Tarefa",
                    hintText: "Atualize o Evento ou Tarefa",
                    icon: new Icon(Icons.update)),
              ))
        ],
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () async {
              EventsAndTasksItem newItemUpdated = EventsAndTasksItem.fromMap(
                  {"itemName": _textEditingController.text,
                    "dateCreated" : dateFormatted(),
                    "id" : item.id
                  });

              _handleSubmittedUpdate(index, item);//redrawing the screen
              await db.updateItem(newItemUpdated); //updating the item
              setState(() {
                _readEventsAndTasks(); // Redesenha a tela com todos os itens salvos no BD
              });

              Navigator.pop(context);

            },
            child: new Text("Atualizar")),
        new FlatButton(onPressed: () => Navigator.pop(context),
            child: new Text("Cancelar"))
      ],
    );
    showDialog(context:
    context ,builder: (_) {
      return alert;
    });
  }

  void _handleSubmittedUpdate(int index, EventsAndTasksItem item) {
    setState(() {
      _itemList.removeWhere((element) {
        _itemList[index].itemName == item.itemName;

      });

    });
  }
}





