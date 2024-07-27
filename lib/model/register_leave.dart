class CheckoutBook {
  final String  title;
  final String  userName;
  final String  studentName;
  final String checkoutDate;
  final String returnDate;

  CheckoutBook({
 required this.title,
 required this.userName,
 required this.studentName,
 required this.checkoutDate,
 required this.returnDate,
  });

  Map<String, Object?> toMap() => {
    'title': title,
    'userName': userName,
    'studentName': studentName,
    'checkoutDate': checkoutDate,
    'returnDate': returnDate,
  };
  factory CheckoutBook.fromMap(Map<String, dynamic> mapa) {
   return CheckoutBook(
    title: mapa['title'],
    userName: mapa['userName'],
    studentName: mapa['studentName'],
    checkoutDate: mapa['checkoutDate'],
    returnDate: mapa['returnDate'],
   );
  }
  }

