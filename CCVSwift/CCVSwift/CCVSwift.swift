//
//  CCVSwift.swift
//  CCVSwift
//
//  Created by Nikolay Kapustin on 16/05/2018.
//

import Foundation

//public struct CCVSwiftValidator {
//
//}

public enum CCVBankigCardType: String {
    case AmericanExpress = " American Express"
    case Dankort = "Dankort"
    case DinersClub = "Diners Club"
    case Discover = "Discover Card"
    case InterPayment = "InterPayment"
    case JCB = "JCB"
    case Maestro = "Maestro"
    case MasterCard = "MasterCard"
    case Mir = "Mir"
    case Troy = "Troy"
    case VisaElectron = "Visa Electron"
    case Visa = "Visa"
    case Verve = "Verve"
    case UnionPay = "Union Pay"
    case UATP = "UATP"
    case unknow = "n\\a"

    public var description:String {return self.rawValue}
}

public struct CCVCard {
    public let type:CCVBankigCardType
    public let prefixes:[CCVPrefix]
    public let lengths:CountableClosedRange<Int> // valid length's for the card type (one type of card may be more then one valid length)
    public let digitsGrouping:[Int]

    static var rangeNumberBankingCard:CountableClosedRange<Int> {
        return 9...19
    }

    public static func isLuhnaValid(_ digits: String) -> Bool {
        return isLuhnaValid(digits.digits)
    }

    public static func isLuhnaValid(_ digits: [Int]) -> Bool {
        let isRangeOk = CCVCard.rangeNumberBankingCard.contains(digits.count)
        guard isRangeOk else {return false}
        return digits.reversed().enumerated().map { (idx, item) in
            if idx % 2 == 1 {
                let doubledValue = item * 2
                return doubledValue > 9 ? doubledValue - 9 : item
            }
            return item
            }.reduce(0, +) % 10 == 0
    }

    public static func detectTypeCard(_ digits:String) -> CCVBankigCardType {
        let typeCards = CCVPrefix.codes.keys
        var result:CCVBankigCardType = .unknow
        for typeCard in typeCards {
            for prefix in CCVPrefix.codes[typeCard]! {
                if prefix.isMatch(for: digits).0 {
                    result = typeCard
                    break
                }
            }
        }
        return result
    }
    public static func makeCard(type:CCVBankigCardType) -> CCVCard {
        switch type {
        case .Visa: return makeVisa()
        case .MasterCard: return makeMastercard()
        case .Maestro: return makeMaestro()
        case .AmericanExpress: return makeAmericanExpress()
        case .DinersClub: return makeDinersClub()
        case .Discover: return makeDiscover()
        case .InterPayment: return makeInterPayment()
        case .JCB: return makeJCB()
        case .Dankort: return makeDankort()
        case .Mir: return makeMir()
        case .Troy: return makeTroy()
        case .Verve: return makeVerve()
        case .UnionPay: return makeUnionPay()
        case .UATP: return makeUATP()
        default:
            return makeFailInstance()
        }
    }

    static func makeFailInstance() -> CCVCard {
        return CCVCard(type: .unknow,
                       prefixes: [],
                       lengths: 0...0,
                       digitsGrouping: [])
    }
    public static func makeVisa() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.Visa] {
            return CCVCard(type: .Visa,
                           prefixes: prefixez,
                           lengths: 13...19,
                           digitsGrouping: [4,4,4,4,3])
        } else {return makeFailInstance()}
    }
    public static func makeMastercard() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.MasterCard] {
            return CCVCard(type: .MasterCard,
                           prefixes: prefixez,
                           lengths: 16...16,
                           digitsGrouping: [4,4,4,4])
        } else {return makeFailInstance()}
    }
    public static func makeMaestro() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.Maestro] {
            return CCVCard(type: .Maestro,
                           prefixes: prefixez,
                           lengths: 12...19,
                           digitsGrouping: [4,4,4,4,3])
        } else {return makeFailInstance()}
    }
    public static func makeAmericanExpress() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.AmericanExpress] {
            return CCVCard(type: .AmericanExpress,
                           prefixes: prefixez,
                           lengths: 15...15,
                           digitsGrouping: [4,6,5])
        } else {return makeFailInstance()}
    }
    public static func makeDinersClub() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.DinersClub] {
            return CCVCard(type: .DinersClub,
                           prefixes: prefixez,
                           lengths: 14...19,
                           digitsGrouping: [4,4,4,4,3])
        } else {return makeFailInstance()}
    }
    public static func makeDiscover() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.Discover] {
            return CCVCard(type: .Discover,
                           prefixes: prefixez,
                           lengths: 16...19,
                           digitsGrouping: [4,4,4,4,3])
        } else {return makeFailInstance()}
    }
    public static func makeInterPayment() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.InterPayment] {
            return CCVCard(type: .InterPayment,
                           prefixes: prefixez,
                           lengths: 16...19,
                           digitsGrouping: [4,4,4,4,3])
        } else {return makeFailInstance()}
    }
    public static func makeJCB() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.JCB] {
            return CCVCard(type: .JCB,
                           prefixes: prefixez,
                           lengths: 16...19,
                           digitsGrouping: [4,4,4,4,3])
        } else {return makeFailInstance()}
    }
    public static func makeDankort() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.Dankort] {
            return CCVCard(type: .Dankort,
                           prefixes: prefixez,
                           lengths: 16...16,
                           digitsGrouping: [4,4,4,4])
        } else {return makeFailInstance()}
    }
    public static func makeMir() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.Mir] {
            return CCVCard(type: .Mir,
                           prefixes: prefixez,
                           lengths: 16...16,
                           digitsGrouping: [4,4,4,4])
        } else {return makeFailInstance()}
    }
    public static func makeTroy() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.Troy] {
            return CCVCard(type: .Troy,
                           prefixes: prefixez,
                           lengths: 16...16,
                           digitsGrouping: [4,4,4,4])
        } else {return makeFailInstance()}
    }
    public static func makeVerve() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.Verve] {
            return CCVCard(type: .Verve,
                           prefixes: prefixez,
                           lengths: 16...19,
                           digitsGrouping: [4,4,4,4,3])
        } else {return makeFailInstance()}
    }
    public static func makeUnionPay() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.UnionPay] {
            return CCVCard(type: .UnionPay,
                           prefixes: prefixez,
                           lengths: 16...19,
                           digitsGrouping: [4,4,4,4,3])
        } else {return makeFailInstance()}
    }
    public static func makeUATP() -> CCVCard {
        if let prefixez = CCVPrefix.codes[.UATP] {
            return CCVCard(type: .UATP,
                           prefixes: prefixez,
                           lengths: 15...15,
                           digitsGrouping: [4,5,6])
        } else {return makeFailInstance()}
    }
}

public struct CCVPrefix {

    /// Banking card type prefix starting and ending range
    public let range: CountableClosedRange<Int>

    /// Credit Card type prefix length
    public let length: Int

    // Default init
    public init(range:CountableClosedRange<Int>, length:Int) {
        self.range = range
        self.length = length
    }

    public init(range:Int, length:Int) {
        self.init(range: range...range, length: length)
    }

    public func isMatch(for cardNumbers:String) -> (Bool, Int) {
        let normalizedCardNumbers = cardNumbers.prefix(length)
        if let prefixCardNumber = Int(normalizedCardNumbers), range.contains(prefixCardNumber) {
            return (true, Int.max)
        }
        return (false, Int.max) // the tuple result type reserved for the future (for partial matching numbers of pefixes)
    }
    static var codes:[CCVBankigCardType:[CCVPrefix]] {
        return [
            .Visa: [CCVPrefix(range: 4, length: 1)],
            .MasterCard: [CCVPrefix(range: 2221...2720, length: 4),
                          CCVPrefix(range: 51...55, length: 2),
                          CCVPrefix(range: 5...5, length: 1)],
            .Maestro: [CCVPrefix(range: 50, length: 2),
                       CCVPrefix(range: 56...58, length: 2),
                       CCVPrefix(range: 6, length: 1)],
            .AmericanExpress: [CCVPrefix(range: 34...34, length: 2),
                               CCVPrefix(range: 37...37, length: 2)],
            .DinersClub: [ CCVPrefix(range: 2014, length: 4),
                           CCVPrefix(range: 2149, length: 4),
                           CCVPrefix(range: 36, length: 2),
                           CCVPrefix(range: 300...305, length: 3),
                           CCVPrefix(range: 3095, length: 4),
                           CCVPrefix(range: 38...39, length: 2),
                           CCVPrefix(range: 3, length: 1)],
            .Discover: [CCVPrefix(range: 6011, length: 4),
                        CCVPrefix(range: 64...65, length: 2)],
            .InterPayment: [CCVPrefix(range: 636...639, length: 3)],
            .JCB: [CCVPrefix(range: 3528...3589, length: 4)],
            .Dankort: [CCVPrefix(range: 5019...5019, length: 4),
                       CCVPrefix(range: 4571...4571, length: 4)],
            .Mir: [CCVPrefix(range: 2200...2204, length: 4)],
            .Troy: [CCVPrefix(range: 979200...979289, length: 6)],
            .Verve: [CCVPrefix(range: 506099...506198, length: 6),
                     CCVPrefix(range: 650002...650027, length: 6)],
            .UnionPay: [CCVPrefix(range: 62, length: 2)],
            .UATP: [CCVPrefix(range: 1, length: 1)]
        ]
    }

}

extension Int {
    static func makeFromInts(_ digits:[Int]) -> Int {
        let reversed = digits.reversed()
        var counter = 0
        var result = 0
        for digit in reversed {
            result += counter > 0 ? counter * digit : digit
            if counter == 0 {counter = 10} else {counter *= 10}
        }
        return result
    }
}

extension String {

    var digits:[Int] {

        var result = [Int]()
        //guard CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self)) else {return []}
        let digitCS = CharacterSet.decimalDigits
        for char in self {
            let chr = UInt8(Unicode.Scalar(char.unicodeScalars.last!).value)
            if digitCS.hasMember(inPlane: chr) {
                result.append(Int(chr))
            }
        }
        return result
    }
}
