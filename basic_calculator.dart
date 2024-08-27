double calculate(double num1, double num2, String operator) {
  switch (operator) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      if (num2 == 0) throw ArgumentError('Division by zero is not allowed.');
      return num1 / num2;
    case '%':
      if (num2 == 0) throw ArgumentError('Modulo by zero is not allowed.');
      return num1 % num2;
    default:
      throw ArgumentError('Invalid operator. Use +, -, *, /, or %.');
  }
}

// Multi-step expression evaluation
double evaluateExpression(String expression) {
  // This is a very basic implementation. For complex expressions, use a proper parser.
  List<String> tokens = expression.split(' ');
  double result = double.parse(tokens[0]);

  for (int i = 1; i < tokens.length; i += 2) {
    String operator = tokens[i];
    double nextNumber = double.parse(tokens[i + 1]);
    result = calculate(result, nextNumber, operator);
  }

  return result;
}

// Testing the calculator
void main() {
  print(calculate(10, 5, '+')); // 15
  print(calculate(10, 5, '-')); // 5
  print(calculate(10, 5, '*')); // 50
  print(calculate(10, 5, '/')); // 2
  print(calculate(10, 5, '%')); // 0

  // Multi-step expression
  print(evaluateExpression('10 + 5 * 2 - 3')); // 12
}
