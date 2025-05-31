extension StringEx on String {
  String get getInputAfterTrimmed {
    List<String> inputChars = this.split('');
    List<String> inputCharactersWithoutSpace = [];
    for (int i = 0; i < inputChars.length; i++) {
      if (inputChars[i].trim().isNotEmpty) {
        inputCharactersWithoutSpace.add(inputChars[i]);
      }
    }
    return inputCharactersWithoutSpace.join();
  }

  bool get isValidEmail {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]",
    ).hasMatch(this);
  }
}
