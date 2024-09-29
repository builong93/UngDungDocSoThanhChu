import 'dart:io';

void main() {
  print('Nhập số cần chuyển dổi: ');
  String? num = stdin.readLineSync();
  try {
    int numParse = int.parse(num!);
    print(convertToWord(numParse));
  } catch (e) {
    print('Vui lòng nhập một số nguyên hợp lệ.');
  }
}

String convertToWord(int num) {
  List<String> units = [
    "",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten",
    "eleven",
    "twelve",
    "thirteen",
    "fourteen",
    "fifthteen",
    "sixteen",
    "seventeen",
    "eighteen",
    "nineteen"
  ];
  List<String> tens = [
    "",
    "",
    "twenty",
    "thirty",
    "fourty",
    "fifty",
    "sixty",
    "seventy",
    "eighty",
    "ninety"
  ];
  List<String> hundreds = [
    "",
    "one hundred",
    "two hundred",
    "three hundred",
    "four hundred",
    "five hundred",
    "six hundred",
    "seven hundred",
    "eight hundred",
    "nine hundred"
  ];
  if (num == 0) return "zero";
  if (num < 20) return units[num];

  String words = "";
  int hundredDigit = num ~/ 100; // lấy phần nguyên hàng trăm
  int tenDigit = (num % 100) ~/ 10; // lấy phần nguyên hàng chục
  int unitDigit = num % 10; // lấy hàng đơn vi

  if (hundredDigit != 0) words += hundreds[hundredDigit] + " "; // nếu chữ số hàng trăm khác không
  if (tenDigit == 1)
    words += units[tenDigit * 10 + tenDigit];
  else {
    words += tens[tenDigit];
    if (unitDigit != 0) words += " " + units[unitDigit];
  }
  return words;
}
