part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection =
      FirebaseFirestore.instance.collection('tickets');
      
  static Future<void> saveTicket(String id, Ticket ticket) async {
    await ticketCollection.doc().set({
      'MovieID': ticket.movieDetail.id ?? "",
      'UserID': id ?? "",
      'theaterName': ticket.theater.name ?? 0,
      'time': ticket.time.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
      'bookingCode': ticket.bookingCode,
      'seats': ticket.seatsInString,
      'name': ticket.name,
      'totalPrice': ticket.totalPrice
    });
  }

  static Future<List<modelsUser.Ticket>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.get();
    var documents =
        snapshot.docs.where((document) => document.data()['userID'] == userId);

    List<modelsUser.Ticket> tickets = [];
    for (var document in documents) {
      modelsUser.MovieDetail movieDetail =
          await MovieServices.getDetails(null, movieID: document.data()['movieID']);
      tickets.add(modelsUser.Ticket(
          movieDetail,
          modelsUser.Theater(document.data()['theaterName']),
          DateTime.fromMillisecondsSinceEpoch(document.data()['time']),
          document.data()['bookingCode'],
          document.data()['seats'].toString().split(','),
          document.data()['name'],
          document.data()['totalPrice']));
    }

    return tickets;
  }
}
