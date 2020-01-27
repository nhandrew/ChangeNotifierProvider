import 'package:flutter/material.dart';
import 'package:ticket_tracker/models/ticket.dart';

class TicketProvider with ChangeNotifier{
  List<Ticket> _tickets = [];

  //Getters
  List<Ticket>  getTickets(String userName) => _tickets.where((ticket) => ticket.developer == userName).toList();

  //Setters
  void addTicket({String title, String userName}){
    var nextTicketNumber = (_tickets.length > 0) ? _tickets.last.number + 1 : 1;
    _tickets.add(Ticket(title: title, developer: userName, number: nextTicketNumber));
    notifyListeners();
  }

  void updateTicket({int ticketNumber, String title}){
    var ticketIndex = _tickets.indexWhere((ticket) => ticket.number == ticketNumber);
    var ticket = _tickets[ticketIndex];
    _tickets[ticketIndex]= Ticket(number:ticketNumber, developer: ticket.developer, title: title);
    notifyListeners();
  }

  void removeTicket(int ticketNumber){
    var removeTicket = _tickets.firstWhere((ticket) => ticket.number==ticketNumber);
    if (removeTicket != null){
      _tickets.remove(removeTicket);
      notifyListeners();
    }
  }

}