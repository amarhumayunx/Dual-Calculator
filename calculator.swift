import Foundation

func displayMainMenu() {
    print("""
    ---------------------
    Dual Calculator Menu
    ---------------------
    1. Calculator with Operators
    2. Calculator without Operators
    3. Exit
    Enter your choice (1-3):
    """)
}

func displayOperatorMenu() {
    print("""
    ---------------------
    Calculator with Operators
    ---------------------
    + : Addition
    - : Subtraction
    * : Multiplication
    / : Division
    % : Modulus
    exit : Back to Main Menu
    Enter your choice:
    """)
}

func displayNoOperatorMenu() {
    print("""
    ---------------------
    Calculator without Operators
    ---------------------
    1. Addition
    2. Subtraction
    3. Multiplication
    4. Division
    5. Modulus
    6. Back to Main Menu
    Enter your choice (1-6):
    """)
}

func getNumber(prompt: String) -> Int {
    print(prompt, terminator: " ")
    guard let input = readLine(), let number = Int(input) else {
        print("Invalid input. Please enter a valid integer.")
        return getNumber(prompt: prompt)
    }
    return number
}

func calculateWithOperators() {
    while true {
        displayOperatorMenu()
        
        guard let operation = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            print("Invalid input. Try again.")
            continue
        }
        
        if operation == "exit" {
            break
        }
        
        let num1 = getNumber(prompt: "Enter the first number:")
        let num2 = getNumber(prompt: "Enter the second number:")
        
        switch operation {
        case "+":
            print("Result: \(num1 + num2)")
        case "-":
            print("Result: \(num1 - num2)")
        case "*":
            print("Result: \(num1 * num2)")
        case "/":
            if num2 == 0 {
                print("Error: Division by zero is not allowed.")
            } else {
                print("Result: \(num1 / num2)")
            }
        case "%":
            if num2 == 0 {
                print("Error: Modulus by zero is not allowed.")
            } else {
                print("Result: \(num1 % num2)")
            }
        default:
            print("Invalid operation. Please try again.")
        }
    }
}

func addWithoutOperator(_ a: Int, _ b: Int) -> Int {
    var sum = a
    for _ in 0..<b {
        sum += 1
    }
    return sum
}

func subtractWithoutOperator(_ a: Int, _ b: Int) -> Int {
    var difference = a
    for _ in 0..<b {
        difference -= 1
    }
    return difference
}

func multiplyWithoutOperator(_ a: Int, _ b: Int) -> Int {
    var product = 0
    for _ in 0..<b {
        product = addWithoutOperator(product, a)
    }
    return product
}

func divideWithoutOperator(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        print("Error: Division by zero is not allowed.")
        return 0
    }
    var quotient = 0
    var remainder = a
    while remainder >= b {
        remainder = subtractWithoutOperator(remainder, b)
        quotient = addWithoutOperator(quotient, 1)
    }
    return quotient
}

func modulusWithoutOperator(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        print("Error: Modulus by zero is not allowed.")
        return 0
    }
    var remainder = a
    while remainder >= b {
        remainder = subtractWithoutOperator(remainder, b)
    }
    return remainder
}

func calculateWithoutOperators() {
    while true {
        displayNoOperatorMenu()
        
        guard let input = readLine(), let choice = Int(input), choice >= 1, choice <= 6 else {
            print("Invalid choice. Please select a valid option (1-6).")
            continue
        }
        
        if choice == 6 {
            break
        }
        
        let num1 = getNumber(prompt: "Enter the first number:")
        let num2 = getNumber(prompt: "Enter the second number:")
        
        switch choice {
        case 1:
            print("Result: \(addWithoutOperator(num1, num2))")
        case 2:
            print("Result: \(subtractWithoutOperator(num1, num2))")
        case 3:
            print("Result: \(multiplyWithoutOperator(num1, num2))")
        case 4:
            let result = divideWithoutOperator(num1, num2)
            if num2 != 0 { print("Result: \(result)") }
        case 5:
            let result = modulusWithoutOperator(num1, num2)
            if num2 != 0 { print("Result: \(result)") }
        default:
            print("Invalid choice.")
        }
    }
}

func dualCalculator() {
    var isRunning = true
    
    while isRunning {
        displayMainMenu()
        
        guard let input = readLine(), let choice = Int(input), choice >= 1, choice <= 3 else {
            print("Invalid choice. Please select a valid option (1-3).")
            continue
        }
        
        switch choice {
        case 1:
            calculateWithOperators()
        case 2:
            calculateWithoutOperators()
        case 3:
            print("Exiting the calculator. Goodbye!")
            isRunning = false
        default:
            print("Invalid choice.")
        }
    }
}

// Start the Dual Calculator
dualCalculator()
