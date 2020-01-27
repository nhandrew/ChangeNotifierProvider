import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_tracker/models/ticket.dart';
import '../providers/auth_provider.dart';
import '../providers/ticket_provider.dart';

class TicketPage extends StatelessWidget {
  final Ticket ticket;
  final titleController = TextEditingController();

  TicketPage(this.ticket);

  @override
  Widget build(BuildContext context) {
    (ticket != null) ? titleController.text = ticket.title : titleController.text = '';
    var ticketProvider = Provider.of<TicketProvider>(context);
    var userName = Provider.of<AuthProvider>(context).userName;
    return Scaffold(
        appBar: AppBar(
          title: (this.ticket != null)
              ? Text('Ticket #${ticket.number}')
              : Text('New Ticket'), 
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(height: 20.0,),
              RaisedButton(child:Text('Save'), onPressed: (){
                if (ticket != null){
                  //Update
                  ticketProvider.updateTicket(title: titleController.text, ticketNumber: ticket.number);
                  Navigator.of(context).pop();
                } else {
                  //Add
                  ticketProvider.addTicket(title: titleController.text, userName: userName);
                  Navigator.of(context).pop();
                }
              },)
            ],
          ),
        ));
  }
}
