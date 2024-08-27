bool isPalindrome(String input) {
  // Helper function to clean the input by removing non-alphanumeric characters and converting to lowercase
  String cleanString(String str) {
    return str.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
  }

  // Check if a cleaned string is a palindrome
  String cleanedInput = cleanString(input);
  String reversedInput = cleanedInput.split('').reversed.join('');
  return cleanedInput == reversedInput;
}

// Extended function to handle numeric inputs
bool isNumericPalindrome(int number) {
  return isPalindrome(number.toString());
}

// Testing the function
void main() {
  print(isPalindrome("A man, a plan, a canal, Panama")); // true
  print(isPalindrome("No 'x' in Nixon")); // true
  print(isPalindrome("Hello, World!")); // false
  print(isNumericPalindrome(12321)); // true
  print(isNumericPalindrome(12345)); // false
}
