import Foundation

// შექმენით function რომლის მეშვეობითაც გამოითვლით ფაქტორიალს. function იღებს ერთ Int ტიპის ცვლადს და აბრუნებს ფაქტორიალს, ანუ მაგალითად თუ გადავაწვდით 5-იანს function-მა უნდა დაგვიბრუნოს 120 რომელიც მიიღო შემდეგი გამოთვლის შედეგად 5*4*3*2*1. არ გამოიყენოთ მზა ფუნქციები.

print("Problem 1")

func calculateFactorial(num: Int) -> Int {
    var counter = num
    var factorial = 1
    
    while counter > 0 {
        factorial = counter * factorial
        counter -= 1
    }
    
    return factorial
}

print(calculateFactorial(num: 5))
print("")

// შექმენით function რომელიც აგენერირებს ფიბონაჩის პირველ 20 რიცხვს. არ გამოიყენოთ მზა ფუნქციები.

print("Problem 2")

func fibonacchiNumber(num: Int) -> [Int] {
    var counter = 2
    var fibonacci = [0, 1]
    
    while counter < num {
        let nextNum = fibonacci[counter - 1] + fibonacci[counter - 2]
        fibonacci.append(nextNum)
        counter += 1
    }
    
    return fibonacci
}
 
print(fibonacchiNumber(num: 20))

print("")

// შექმენით function რომელიც მიიღებს String-ს, function-მა უნდა შეამოწმოს პალინდრომია (წინიდანაც და უკნიდანაც იკითხება ერთნაირად) თუ არა ეს String-ი. მაგალითად "racecar" ამ შემთხვევაში ფუნქციამ უნდა დააბრუნოს true. არ გამოიყენოთ მზა ფუნქციები. შეგიძლიათ მეორე solution-ი მზა ფუნქციის გამოყენებით გვაჩვენოთ.

print("Problem 3")

func checkPalindromy(word: String) -> Bool {
    var x = 0
    var y = word.count - 1
    
    while x < y {
        var index1 = word.index(word.startIndex, offsetBy: x)
        var index2 = word.index(word.startIndex, offsetBy: y)
        if word[index1] != word[index2] {
            return false
        }
        x += 1
        y -= 1
    }
    return true
}
print(checkPalindromy(word: "racecar"))
print("")

// შექმენით function რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.
print("Problem 4")

func squareNumbers(numbers: [Int]) -> [Int] {
    var squaredNumbers: [Int] = []
    for num in numbers {
        squaredNumbers.append(num * num)
    }
    print(squaredNumbers)
    return squaredNumbers
}
squareNumbers(numbers: [2, 4, 55, 77, 100])

print("")

// შექმენით function რომელიც დაითვლის სიტყვების რაოდენობას String-ში, ფუნქციამ უნდა მიიღოს String-ი, და დააბრუნოს dictionary, სიტყვებით და იმ რაოდენობით რამდენჯერ იყო ერთი და იგივე სიტყვა გამოყენებული String-ში. uppercase და lowercase ასოები უნდა იყოს დაჰენდლილი ერთნაირად, მაგალითად თუ function-s გადავაწვდით "TBC x USAID, tbc it academy, we are in TBC academy." function-მა უნდა დააბრუნოს ["tbc": 3, "academy": 2, "we": 1, "are": 1, "in": 1, "it": 1, "x": 1]

print("Problem 5")

func countWords(sentence: String) -> Dictionary<String, Int> {
    var lowerCasedSentence = sentence.lowercased()
    let charactersToBeRemomved: Set<Character> = [",", ".", ":", "?", "!", "-", "(", ")"]
    lowerCasedSentence.removeAll { char in charactersToBeRemomved.contains(char) }
    let words = lowerCasedSentence.split(separator: " ").map(String.init)
    
    var wordsCount: Dictionary<String, Int> = [:]
    
    for word in words {
        if !wordsCount.keys.contains(word) {
            wordsCount[word] = 1
        } else {
            if let currentCount = wordsCount[word] {
                wordsCount.updateValue(currentCount + 1, forKey: word)
            }
        }
    }

    return wordsCount
}

print(countWords(sentence: "TBC x USAID, tbc it academy, we are in TBC academy."))

print("")

// შექმენით Closure რომელსაც გადაეცემა რიცხვი და დააბრუნებს ამ რიცხვის ორობით ჩანაწერს.
print("Problem 6")

let numToBinary = { (num: Int) -> String in String(num, radix: 2) }
print(numToBinary(11))
print("")

// შექმენით Closure რომელიც გაფილტრავს(ანუ წაშლის) კენტ რიცხვებს Int-ების Array-დან.
print("Problem 7")

var allNumbers = [2, 5, 7, 8, 10, 4, 3, 99]

let removeOddNumbers = {(numbers: inout [Int]) -> Void in
    var i = 0
    while i < numbers.count{
        if numbers[i] % 2 != 0 {
            numbers.remove(at: i)
        } else {
            i += 1
        }
    }
}
removeOddNumbers(&allNumbers)
print(allNumbers)

// old solution: allNumbers.removeAll(where: { (num: Int) -> Bool in return num % 2 != 0 })
// shorter: allNumbers.removeAll(where: { num in num % 2 != 0 })

print("")

// შექმენით Closure რომელიც დამაპავს(ანუ გააკეთებს ქმედებას ყველა მასივის ელემენტზე) Int-ების Array-ის და თითოეულ ელემენტს გაათმაგებს.
print("Problem 8")

var numbersArray = [99, 44, 2, 1, 8, 77]

let elementsTenTimes = {(numbers: inout [Int]) -> Void in
    var i = 0
    while i < numbers.count {
        numbers[i] *= 10
        i += 1
    }
}
elementsTenTimes(&numbersArray)
print(numbersArray)

// old solution: let arrayWithTenTimesNumbers = numbersArray.map { (num: Int) -> Int in return num * 10 }
// shorter: arrayNumbers.map { num in num * 10 }



print("")

// გამოიყენეთ escaping closure სადაც 3 წამის შემდეგ დაბეჭდავს ჩაწოდებული მასივის ჯამს.
print("Problem 9")

let array = [2, 4, 99, 8, 77, 2]

func sum(nums: [Int], closure: @escaping (Int) -> Void) {
    let totalSum = nums.reduce(0, +)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        closure(totalSum)
    }
}
sum(nums: array, closure: { (totalSum: Int) -> Void in
    print("Problem 3 result - sum: \(totalSum)")
})

print("")

// function-ს გადავცეთ String-ების array და დაგვიბრუნოს მხოლოდ კენტი რიცხვების მასივი. გამოიყენეთ high order functions.
print("Problem 10")

let stringsArray = ["5", "77", "hh", "3", "car", "4", "100"]
let arrayWithOddNumbers = stringsArray
    .compactMap { (str: String) -> Int? in return Int(str)}
    .filter { (num: Int) -> Bool in return num % 2 == 1 }

print(arrayWithOddNumbers)

print("")

