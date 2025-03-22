class BookingModel {
  final String id;
  final String team;
  final String? order;
  final String? reorder;
  final String title;
  final String start;
  final String end;
  final bool? complete;
  const BookingModel({
    required this.id,
    required this.team,
    this.order,
    this.reorder,
    required this.title,
    required this.start,
    required this.end,
    required this.complete,
  });

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      id: map['_id'],
      team: map['team'],
      title: map['title'],
      start: map['start'],
      end: map['end'],
      complete: map['complete'],
      order: map['order'],
      reorder: map['reorder'],
    );
  }
}
