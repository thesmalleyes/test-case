bool isCircularPalindrome(dynamic word) {
  // Convert the word to lowercase and ensure it is a string
  String input = (word ?? '').toString().toLowerCase();

  //Empty strings and single-character strings are not considered palindromes.
  if (input.isEmpty || input.length == 1) {
    return false;
  }

  // TODO: Check if the word is a palindrome by comparing it with its reverse
  // TODO: comment line 15 to 23
  //return input == input.split('').reversed.join('');

  // Split the word into a list of characters
  List<String> strings = input.split('');
  for (int i = 0; i < strings.length / 2; i++) {
    // Compare characters at opposite ends of the word
    if (strings[i] != strings[strings.length - 1 - i]) {
      return false;
    }
  }
  // If no mismatch is found, the word is a palindrome
  return true;
}

void main() {
  // Test cases
  print(isCircularPalindrome("racecar")); // true
  print(isCircularPalindrome("hello world")); // false
  print(isCircularPalindrome("mAlAyAlaM")); // true
  print(isCircularPalindrome("")); // false
  print(isCircularPalindrome("s")); // false
  print(isCircularPalindrome("abcabca")); // false
  print(isCircularPalindrome("madamimadam")); // false
}
