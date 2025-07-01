
import Foundation

//Task 1.1
//Дни недели
//Создайте перечисление Weekday, которое содержит дни недели (понедельник, вторник и т.д.).
//Напишите функцию, которая принимает день недели и выводит его название.

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

func printDay(day: Weekday) {
    print(day)
}
printDay(day: .friday)

//Task 1.2
//Сезоны года
//Создайте перечисление Season, которое содержит сезоны года (зима, весна, лето, осень).
//Добавьте метод description(), который возвращает описание сезона.

enum Season {
    case winter
    case spring
    case summer
    case fall
    
    func description() {
        switch self {
        case .winter:
            print("It's cold")
        case .spring:
            print("It's blooming")
        case .summer:
            print("It's sizzling")
        case .fall:
            print("It's nasty")
        }
    }
}

Season.winter.description()


//Task 1.3
//Цвета светофора
//Создайте перечисление TrafficLight, которое содержит цвета светофора (красный, желтый, зеленый).
//Добавьте метод next(), который возвращает следующий цвет в цикле.

enum TrafficLight {
    case green
    case yellow
    case red
    
    func next() -> TrafficLight {
        switch self {
        case .green:
            return .yellow
        case .yellow:
            return .red
        case .red:
            return .green
        }
    }
}

print(TrafficLight.green.next())

//Task 1.4
//Типы треугольников
//Создайте перечисление TriangleType, которое содержит типы треугольников (равносторонний, равнобедренный, разносторонний).
//Напишите функцию, которая принимает длины сторон треугольника и возвращает его тип.

enum TriangleType {
    case equilateral
    case isosceles
    case scalene
        
}

func printType(x: Int, y: Int, z: Int) -> TriangleType? {
    guard x > 0, y > 0, z > 0,
          x + y >= z, x + z >= y, z + y >= x else {
        return nil
    }
    if x == y, x == z, y == z {
        return .equilateral
    } else if x == y || y == z || x == z {
        return .isosceles
    } else {
        return .scalene
    }
}

if let result = printType(x: 5, y: 4, z: 2) {
    print(result)
} else {
    print("Такого треугольника не существует")
}

//Task 1.5
//Направления компаса
//Создайте перечисление CompassDirection, которое содержит направления (север, юг, восток, запад).
//Напишите функцию, которая принимает направление и выводит противоположное направление.

enum CompasDirection {
    case north
    case south
    case east
    case west
}

func oppositeDir(dir: CompasDirection) -> CompasDirection {
    switch dir {
    case .north:
        return .south
    case .south:
        return .north
    case .east:
        return .west
    case .west:
        return .east
    }
    
}

print(oppositeDir(dir: .south))

//Task 2.1
//Перечисление с raw значениями
//Создайте перечисление Month с raw значениями типа Int, представляющими номера месяцев.
//Напишите функцию, которая принимает номер месяца и возвращает его название.

enum Month: Int, CaseIterable {
    case january = 1, february, march, april, may, june, july, august, september, october, november, december
}

func returnMonth(month: Int) -> Month? {
    return Month(rawValue: month)
}

if let monthResult = returnMonth(month: 12) {
    print(monthResult)
} else {
    print("Такого месяца не существует")
}

//Task 2.2
//HTTP методы
//Создайте перечисление HTTPMethod, которое содержит методы HTTP (GET, POST, PUT, DELETE).
//Добавьте свойство description, которое возвращает строковое представление метода.

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    
    func description() -> String {
        return self.rawValue
    }
}

print(HTTPMethod.get.description())


//Task 2.3
//Создайте перечисление Point, которое имеет ассоциированные значения для хранения координат (x, y).
//Напишите функцию, которая принимает две точки и вычисляет расстояние между ними.

enum Point {
    case coordinate(x: Double, y: Double)
}

func pointDistance(point1: Point, point2: Point) -> Double? {
    if case let .coordinate(x1, y1) = point1, case let .coordinate(x2, y2) = point2 {
        let distX = x2 - x1
        let distY = y2 - y1
        return (distX * distX + distY * distY).squareRoot()
    }
    return nil
}
let point1 = Point.coordinate(x: 5, y: 4)
let point2 = Point.coordinate(x: 10, y: 2)
if let distResult = pointDistance(point1: point1, point2: point2) {
    print(distResult)
} else {
    print("Что-то не так")
}


//Task 2.4
//Типы ошибок
//Создайте перечисление ErrorType, которое содержит возможные типы ошибок (например, invalidInput, fileNotFound, networkError).
//Добавьте метод message(), который возвращает сообщение об ошибке.

enum ErrorType {
    case invalidInput
    case fileNotFound
    case networkError
    
    func message() -> String {
        switch self {
        case .invalidInput:
            return "Invalid input"
        case .fileNotFound:
            return "File not found"
        case .networkError:
            return "Network error"
        }
        
    }
}

let error = ErrorType.invalidInput.message()
print(error)


//Task 2.5
//Создайте перечисление DataType, которое представляет различные типы данных (целое число, строка, булево значение).
//Добавьте ассоциированные значения для каждого случая.
enum DataType {
    case int(Int)
    case string(String)
    case bool(String)
    case double(Double)
    
}
let type = DataType.string("Hi")


switch type {
case .int(let number):
    print("Это целое число", number)
case .string(let text):
    print("Это строка", text)
case .bool(let bool):
    print("Это булевое значение", bool)
case .double(let doubleNumber):
    print("Это тип double", doubleNumber)
}


//Task 3.1
//Выражения арифметических операций
//Создайте перечисление Operation, которое содержит арифметические операции (add, subtract, multiply, divide) с ассоциированными значениями для операндов.
//Напишите функцию, которая вычисляет результат выражения.

enum Operation {
    case add(number1: Int, number2: Int)
    case subtract(number1: Int, number2: Int)
    case multiply(number1: Int, number2: Int)
    case divide(number1: Int, number2: Int)
}

func calculate(operation: Operation) -> Int {
    switch operation{
    case .add(let number1, let number2):
        return number1 + number2
    case .subtract(let number1, let number2):
        return number1 - number2
    case .multiply(let number1, let number2):
        return number1 * number2
    case .divide(let number1, let number2):
        if number2 != 0 {
            return number1 / number2
        }
        return 0
    }
}

let operationNumbers = Operation.add(number1: 5, number2: 0)
let resultOfOperation = calculate(operation: operationNumbers)
print(resultOfOperation)


//Task 3.2
//Фигуры
//Создайте перечисление Shape, которое содержит случаи для различных фигур (круг, прямоугольник, треугольник) с ассоциированными значениями для их параметров.
//Добавьте метод area(), который вычисляет площадь фигуры.

enum Shape {
    case circle(radius: Double)
    case rectangle(width: Double, height: Double)
    case triangle(side1: Double, side2: Double, side3: Double)
    
    func area() -> Double {
        let pi = 3.14159
        switch self {
        case .circle(let radius):
            return pi * radius * radius
        case .rectangle(let width, let height):
            return width * height
        case .triangle(let side1, let side2, let side3):
            let p = (side1 + side2 + side3)/2
            return (p * (p - side1) * (p - side2) * (p - side3)).squareRoot()
        }
    }
}

let circleArea = Shape.circle(radius: 5).area()
let triangleArea = Shape.triangle(side1: 6, side2: 5, side3: 2.2).area()
print(circleArea)
print(triangleArea)


//Task 3.3
//Монеты
//Создайте перечисление Coin, которое содержит номиналы монет (1, 2, 5, 10) с raw значениями типа Int.
//Напишите функцию, которая принимает массив монет и вычисляет общую сумму.

enum Coin: Int {
    case one = 1
    case two = 2
    case five = 5
    case ten = 10
}

func countSum(coinsArr: [Coin]) -> Int{
    var sum = 0
    for coin in coinsArr {
        sum += coin.rawValue
    }
    return sum
}

let arrayOfCoins = [Coin.one, Coin.two, Coin.two, Coin.ten]
let sum = countSum(coinsArr: arrayOfCoins)
print(sum)

//Task 3.4
//Статус заказа
//Создайте перечисление OrderStatus, которое содержит статусы заказа (новый, обрабатывается, отправлен, доставлен).
//Добавьте метод canCancel(), который проверяет, можно ли отменить заказ в данном статусе.

enum OrderStatus {
    case new
    case processed
    case sent
    case delivered
    
    func canCancel() -> Bool {
        switch self{
        case .new, .processed:
            return true
        case .sent, .delivered:
            return false
        }
    }
}
let order = OrderStatus.sent
if order.canCancel() {
    print("Заказ можно вернуть")
} else {
    print("Заказ нельзя вернуть")
}


//Task 3.5
//Калькулятор с перечислением
//Создайте перечисление CalculatorAction, которое содержит действия калькулятора (add, subtract, multiply, divide) с ассоциированными значениями для операндов.
//Реализуйте функцию, которая выполняет действие на основе выбранного варианта.

func calculatePro(operation: Operation) -> String? {
    switch operation{
    case .add(let number1, let number2):
        let add = number1 + number2
        return "\(number1) + \(number2) = \(add)"
    case .subtract(let number1, let number2):
        let subtract = number1 - number2
        return "\(number1) - \(number2) = \(subtract)"
    case .multiply(let number1, let number2):
        let multiply = number1 * number2
        return "\(number1) * \(number2) = \(multiply)"
    case .divide(let number1, let number2):
        guard number2 != 0 else {return nil}
        let divide = number1 / number2
        return "\(number1) / \(number2) = \(divide)"

    }
}

let operationNumbersPro = Operation.add(number1: 5, number2: 5)
if let resultOfOperationPro = calculatePro(operation: operationNumbersPro) {
    print(resultOfOperationPro)
} else {
    print("На 0 делить нельзя")
}


//Task 4.1
//Телефонные номера
//Создайте перечисление PhoneNumberType, которое содержит типы телефонных номеров (мобильный, домашний, рабочий).
//Добавьте ассоциированные значения для номера телефона.
//Напишите функцию, которая форматирует номер в зависимости от типа.

enum PhoneNumberType {
    case mobile(phone: String)
    case home(phone: String)
    case work(phone: String)
}

func formattedPhone(phone: PhoneNumberType) -> String? {
    func formatMobileAndHome(phone: String, type: String ) -> String{
        var numberArray = phone.map {String($0)}
        if numberArray[0] == "8" {
            numberArray[0] = "+7"
        }
        let cityCode = numberArray[1...3].joined()
        let part1 = numberArray[4...6].joined()
        let part2 = numberArray[7...8].joined()
        let part3 = numberArray[9...10].joined()
        return "\(type) \(numberArray[0]) (\(cityCode)) \(part1)-\(part2)-\(part3)"
    }
    switch phone {
    case .mobile(phone: let phone):
        guard !phone.isEmpty && phone.count == 11 else {return nil}
       return formatMobileAndHome(phone: phone, type: "Мобильный телефон")
    case .home(phone: let phone):
        guard !phone.isEmpty && phone.count == 10 else {return nil}
        var numberArray = phone.map {String($0)}
        let cityCode = numberArray[0...2].joined()
        let part1 = numberArray[3...5].joined()
        let part2 = numberArray[6...7].joined()
        let part3 = numberArray[8...9].joined()
        return "Домашний телефон (\(cityCode)) \(part1)-\(part2)-\(part3)"
    case .work(phone: let phone):
        guard !phone.isEmpty && phone.count == 11 else {return nil}
        return formatMobileAndHome(phone: phone, type: "Рабочий телефон")
    }
}
let phone = PhoneNumberType.work(phone: "89118266764")
if let phoneFormatted = formattedPhone(phone: phone) {
    print(phoneFormatted)
}

//Task 4.2
//Режимы работы приложения
//Создайте перечисление AppMode, которое содержит режимы работы приложения (светлая тема, темная тема, режим экономии энергии).
//Добавьте метод apply(), который имитирует применение режима.

enum AppMode {
    case lightTheme
    case darkTheme
    case powerSaving
    
    func aplly(){
        switch self{
        case .lightTheme:
            print("Светлая тема включена")
        case .darkTheme:
            print("Темная тема включена")
        case .powerSaving:
            print("Включен режим энергосбережения")
        }
    }
}


//Task 4.3
//Карты
//Создайте перечисление CardSuit, которое содержит масти карт (пики, червы, бубны, трефы).
//Создайте перечисление CardRank, которое содержит ранги карт (2–10, валет, дама, король, туз).
//Создайте структуру Card, которая объединяет масть и ранг.
//Напишите функцию, которая генерирует полную колоду карт.

enum CardSuit: String, CaseIterable {
    case spades = "Spades"     // пики
    case hearts = "Hearts"     // черви
    case diamonds = "Diamonds" // бубны
    case clubs = "Clubs"       // крести
}

enum CardRank: String, CaseIterable {
    case two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7",
         eight = "8", nine = "9", ten = "10"
    case jack = "Jack"
    case queen = "Queen"
    case king = "King"
    case ace = "Ace"
}

struct Card {
    var rank: CardRank
    var suit: CardSuit
    func description() -> String {
        return "\(rank.rawValue) of \(suit.rawValue)"
    }
}

func fullDeck() -> [Card] {
    var deckArr: [Card] = []
    for suit in CardSuit.allCases {
        for rank in CardRank.allCases {
            deckArr.append(Card(rank: rank, suit: suit))
        }
    }
    return deckArr
}

let cardrank = CardRank.jack
let cardsuit = CardSuit.clubs
let card1 = Card(rank: cardrank, suit: cardsuit)
let cardArr = fullDeck()
for card in cardArr {
    print(card.description())
}

//Task 4.4
//Команды управления роботом
//Создайте перечисление RobotCommand, которое содержит команды управления роботом (вперед, назад, влево, вправо) с ассоциированными значениями для расстояния или угла поворота.
//Напишите функцию, которая интерпретирует команды и перемещает робота.

enum RobotCommand {
    case up(distance: Double)
    case back(distance: Double)
    case left(angle: Double)
    case right(angle: Double)
}
struct Robot {
    var x: Double = 0
    var y: Double = 0
    var angle: Double = 0
    
    mutating func useCommand(command: RobotCommand) {
        switch command{
        case .up(distance: let distance):
            move(moveDistance: distance)
        case .back(distance: let distance):
            move(moveDistance: -distance)
        case .left(angle: let angle):
            rotate(rotateAngle: angle)
        case .right(angle: let angle):
            rotate(rotateAngle: -angle)
        }
    }
    
    mutating func move(moveDistance: Double) {
        let currAngle = angle * .pi / 180
        x += moveDistance * cos(currAngle)
        y += moveDistance * sin(currAngle)
        print("Робот перемещен на \(x) и \(y)")
    }
    
    mutating func rotate(rotateAngle: Double) {
        self.angle = (rotateAngle + angle).truncatingRemainder(dividingBy: 360)
        if self.angle < 0 {
            self.angle += 360
        }
        print("Робот повернут на \(self.angle)")
    }
}

var robot = Robot()
robot.useCommand(command: .up(distance: 5))
robot.useCommand(command: .left(angle: 90))
robot.useCommand(command: .back(distance: 5))


//Task 4.5
//Типы событий
//Создайте перечисление EventType, которое содержит типы событий (конференция, семинар, встреча).
//Добавьте ассоциированные значения для даты, времени и места события.
//Напишите функцию, которая форматирует информацию о событии.

enum EventType {
    case conferention(date: String, time: String, place: String)
    case seminar(date: String, time: String, place: String)
    case meeting(date: String, time: String, place: String)
}

func eventFormating(event: EventType) -> String{
    switch event{
    case .conferention(date: let date, time: let time, place: let place):
        return "Конференция состоится \(date) в \(time) в \(place)"
    case .seminar(date: let date, time: let time, place: let place):
        return "Семинар состоится \(date) в \(time) в \(place)"
    case .meeting(date: let date, time: let time, place: let place):
        return "Встреча состоится \(date) в \(time) в \(place)"
    }
}

let conferention = EventType.conferention(date: "10 июля", time: "15:00", place: "Зал №1")
print(eventFormating(event: conferention))
