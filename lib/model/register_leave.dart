class CheckoutBook {
  int? id;
  final String  title;
  final String  userName;
  final String  studentName;
  final String checkoutDate;
  final String returnDate;

  CheckoutBook({
 this.id,
 required this.title,
 required this.userName,
 required this.studentName,
 required this.checkoutDate,
 required this.returnDate,
  });

  Map<String, Object?> toMap() => {
    'id': id,
    'title': title,
    'userName': userName,
    'studentName': studentName,
    'checkoutDate': checkoutDate,
    'returnDate': returnDate,
  };
  factory CheckoutBook.fromMap(Map<String, Object?> mapa) {
   return CheckoutBook(
    id: mapa['id'] as int,
    title: mapa['title'] as String, 
    userName: mapa['userName'] as String,
    studentName: mapa['studentName'] as String,
    checkoutDate: mapa['checkoutDate'] as String,
    returnDate: mapa['returnDate'] as String,
   );
  }
  }

