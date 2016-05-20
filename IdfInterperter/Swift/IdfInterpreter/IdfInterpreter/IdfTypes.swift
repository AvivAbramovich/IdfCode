//
//  IdfTypes.swift
//  IdfInterpreter
//
//  Created by Aviv Abramovich on 19.5.2016.
//  Copyright © 2016 Aviv Abramovich. All rights reserved.
//

import Foundation
/*
enum IdfTypeEnum : String {
    case FunctionPrefix = "הקשב"
    case Function = "הקשב המפקד"  //Function
    case Team = "צוות"              //Struct
    
    case Turai = "טוראי"            //bool
    case Rabat = "רבט"             //byte
    case Samael = "סמל"            //short
    case Samar = "סמר"             //int
    
    case Segem = "סגם"             //float
    case Segen = "סגן"              //double
    case Seren = "סרן"              //String
    
    case Kama = "קמא"              //long
    case Kaab = "קאב"              //long long
}*/

// Base protocol
protocol IdfType {
    static var keyword : String { get }
    var value : Any { get set }
    var type : String { get }
    init?(stringVal : String)
}

//חוגרים

class Turai : IdfType{
    static var keyword: String{
        get{
            return "טוראי"
        }
    }
    var type: String{
        get{
            return Turai.keyword
        }
    }
    var value : Any{
        get{
            return _value
        }
        set(newValue){
            if let boolValue = newValue as? Bool{
                self._value = boolValue
            }
        }
    }
    
    var _value : Bool
    
    init(Value : Bool){
        self._value = Value
    }
    
    required init?(stringVal: String) {
        switch stringVal {
        case "כן","כן המפקד","אמת":
            self._value = true
            break
        case "לא","לא המפקד","שקר":
            self._value = false
            break
        default:
            return nil
        }
    }
    
    convenience init?(stringVal: NSString) {
        self.init(stringVal : stringVal as String)
    }
}

class Rabat : IdfType{
    static var keyword: String{
        get{
            return "רבט"
        }
    }
    var type: String{
        get{
            return Rabat.keyword
        }
    }
    var value : Any {
        get{
            return _value
        }
        set(newValue){
            if let byteValue = newValue as? Int8{
                self._value = byteValue
            }
        }
    }
    
    var _value : Int8
    
    init(value : Int8){
        self._value = value
    }
    
    required init?(stringVal: String) {
        if let val = Int8(stringVal){
            self._value = val
        }
        else{
            return nil
        }
    }
    
    convenience init?(stringVal: NSString) {
        self.init(stringVal : stringVal as String)
    }
}

class Samal : IdfType{
    static var keyword: String{
        get{
            return "סמל"
        }
    }
    var type: String{
        get{
            return Samal.keyword
        }
    }
    var value : Any {
        get{
            return _value
        }
        set(newValue){
            if let int16Value = newValue as? Int16{
                self._value = int16Value
            }
        }
    }
    
    var _value : Int16
    
    init(value : Int16){
        self._value = value
    }
    
    required init?(stringVal: String) {
        if let val = Int16(stringVal){
            self._value = val
        }
        else{
            return nil
        }
    }

    convenience init?(stringVal: NSString) {
        self.init(stringVal : stringVal as String)
    }
}

class Samar : IdfType{
    static var keyword: String{
        get{
            return "סמר"
        }
    }
    var type: String{
        get{
            return Samar.keyword
        }
    }
    var value : Any{
        get{
            return _value
        }
        set(newValue){
            if let int32Value = newValue as? Int32{
                self._value = int32Value
            }
        }
    }
    
    var _value : Int32
    
    init(value : Int32){
        self._value = value
    }
    
    required init?(stringVal: String) {
        if let val = Int32(stringVal){
            self._value = val
        }
        else{
            return nil
        }
    }

    convenience init?(stringVal: NSString) {
        self.init(stringVal : stringVal as String)
    }
}

//קצינים

class Segem : IdfType{
    static var keyword: String{
        get{
            return "סגם"
        }
    }
    var type: String{
        get{
            return Segem.keyword
        }
    }
    var value : Any{
        get{
            return _value
        }
        set(newValue){
            if let floatValue = newValue as? Float{
                self._value = floatValue
            }
        }
    }
    
    var _value : Float
    
    init(value : Float){
        self._value = value
    }
    
    required init?(stringVal: String) {
        if let val = Float(stringVal){
            self._value = val
        }
        else{
            return nil
        }
    }
    
    convenience init?(stringVal: NSString) {
        self.init(stringVal : stringVal as String)
    }
}

class Segen : IdfType{
    static var keyword: String{
        get{
            return "סגן"
        }
    }
    var type: String{
        get{
            return Segen.keyword
        }
    }
    var value : Any{
        get{
            return _value
        }
        set(newValue){
            if let doubleValue = newValue as? Double{
                self._value = doubleValue
            }
        }
    }
    
    var _value : Double
    
    init(value : Double){
        self._value = value
    }
    
    required init?(stringVal: String) {
        if let val = Double(stringVal){
            self._value = val
        }
        else{
            return nil
        }
    }

    convenience init?(stringVal: NSString) {
        self.init(stringVal : stringVal as String)
    }
}

class Seren : IdfType{
    static var keyword: String{
        get{
            return "סרן"
        }
    }
    var type: String{
        get{
            return Seren.keyword
        }
    }
    var value : Any{
        get{
            return _value
        }
        set(newValue){
            if let stringValue = newValue as? NSString{
                self._value = stringValue
            }
        }
    }
    
    var _value : NSString
    
    init(value : String){
        self._value = NSString(string : value)
    }
    
    static let HebrewMerchaot = unichar(1524)
    
    required convenience init?(stringVal: String) {
        let nsstring = NSString(string: stringVal)
        self.init(nsstring : nsstring)
    }
    
    init?(nsstring: NSString) {
        let utf16String = (nsstring as String).utf16
        
        if utf16String.count > 2 && nsstring.characterAtIndex(0) == Seren.HebrewMerchaot && nsstring.characterAtIndex(nsstring.length - 1) == Seren.HebrewMerchaot{
            self._value = nsstring.substringWithRange(NSRange(location: 1, length: utf16String.count-2))
        }
        else{
            return nil
        }
    }
}

//קצינים אקדמאים

class Kama : IdfType{
    static var keyword: String{
        get{
            return "קמא"
        }
    }
    var type: String{
        get{
            return Kama.keyword
        }
    }
    var value : Any{
        get{
            return _value
        }
        set(newValue){
            if let longValue = newValue as? CLong{
                self._value = longValue
            }
        }
    }
    
    var _value : CLong
    
    init(value : CLong){
        self._value = value
    }
    
    required init?(stringVal: String) {
        if let val = CLong(stringVal){
            self._value = val
        }
        else{
            return nil
        }
    }
    
    convenience init?(stringVal: NSString) {
        self.init(stringVal : stringVal as String)
    }
}

class Kaab : IdfType{
    static var keyword: String{
        get{
            return "קאב"
        }
    }
    var type: String{
        get{
            return Kaab.keyword
        }
    }
    var value : Any{
        get{
            return _value
        }
        set(newValue){
            if let longlongValue = newValue as? CLongLong{
                self._value = longlongValue
            }
        }
    }
    
    var _value : CLongLong
    
    init(value : CLongLong){
        self._value = value
    }
    
    required init?(stringVal: String) {
        if let val = CLongLong(stringVal){
            self._value = val
        }
        else{
            return nil
        }
    }
    
    convenience init?(stringVal: NSString) {
        self.init(stringVal : stringVal as String)
    }
}