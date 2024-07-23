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
    'clientName': studentName,
    'checkoutDate': checkoutDate,
    'returnDate': returnDate,
  };
  }

