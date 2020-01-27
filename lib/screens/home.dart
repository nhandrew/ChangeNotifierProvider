import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_tracker/models/ticket.dart';
import 'package:ticket_tracker/screens/ticket.dart';
import '../providers/auth_provider.dart';
import '../providers/ticket_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var ticketProvider = Provider.of<TicketProvider>(context);
    List<Ticket> tickets = ticketProvider.getTickets(authProvider.userName);
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Tasks'),
        actions: <Widget>[
          (authProvider.loggedIn)
              ? FlatButton(
                  child:
                      Text('Sign Out', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    authProvider.setLoggedIn(false);
                  },
                )
              : FlatButton(
                  child: Text('Sign In', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    authProvider.setLoggedIn(true);
                  },
                )
        ],
      ),
      body: (authProvider.loggedIn)
          ? ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text(
                        tickets[index].number.toString(),
                      ),
                      title: Text(tickets[index].title.toString()),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                TicketPage(tickets[index]),
                          ),
                        );
                      },
                    ),
                    Divider(),
                  ],
                );
              },
            )
          : Center(
              child: Text('Login to See Tasks'),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => TicketPage(null)));
        },
      ),
    );
  }
}
