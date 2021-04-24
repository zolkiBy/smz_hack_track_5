String numberWithSpaces(num x) {
  final regExp = RegExp(r'\B(?=(\d{3})+(?!\d))');
  final newString = x
      .toString()
      .replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "")
      .replaceAllMapped(regExp, (match) {
    return '${match.group(0)} ';
  });
  return newString;
}
