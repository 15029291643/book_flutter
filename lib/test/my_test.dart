import 'package:novel/network/BookNetwork.dart';
import 'package:novel/utils/ShowUtil.dart';

main() async {
  final books = await BookNetwork.books();
  for (var book in books) {
    ShowUtil.myPrint(book);
  }
}
