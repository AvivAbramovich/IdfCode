//
//  Frame.swift
//  IdfInterpreter
//
//  Created by Aviv Abramovich on 19.5.2016.
//  Copyright © 2016 Aviv Abramovich. All rights reserved.
//

import Foundation

func Frame(content : NSString){
    var frameVariables = [NSString : IdfType]()
    
    let wordsArrayString = content.componentsSeparatedByString(" ")//content.characters.split(" ").map(String.init)
    var wordsArray = [NSString]()
    for word in wordsArrayString{
        wordsArray.append(NSString(string: word))
    }
    
    while(wordsArray.count > 0){
        switch wordsArray[0] {
        case Turai.keyword:
            let varName = wordsArray[1]
            //wordsArray[2] = ":" //TODO: check if really exists
            if let variable = Turai(stringVal: wordsArray[3]){
                frameVariables[varName] = variable
            }
            else{
                //Error
            }
            wordsArray.removeFirst(4)
            break
        case Rabat.keyword:
            let varName = wordsArray[1]
            //wordsArray[2] = ":" //TODO: check if really exists
            if let variable = Rabat(stringVal: wordsArray[3]){
                frameVariables[varName] = variable
            }
            else{
                //Error
            }
            wordsArray.removeFirst(4)
            break
        case Samal.keyword:
            let varName = wordsArray[1]
            //wordsArray[2] = ":" //TODO: check if really exists
            if let variable = Samal(stringVal: wordsArray[3]){
                frameVariables[varName] = variable
            }
            else{
                //Error
            }
            wordsArray.removeFirst(4)
            break
        case Samar.keyword:
            let varName = wordsArray[1]
            //wordsArray[2] = ":" //TODO: check if really exists
            if let variable = Samar(stringVal: wordsArray[3]){
                frameVariables[varName] = variable
            }
            else{
                //Error
            }
            wordsArray.removeFirst(4)
            break
        case Segem.keyword:
            let varName = wordsArray[1]
            //wordsArray[2] = ":" //TODO: check if really exists
            if let variable = Segem(stringVal: wordsArray[3]){
                frameVariables[varName] = variable
            }
            else{
                //Error
            }
            wordsArray.removeFirst(4)
            break
        case Segen.keyword:
            let varName = wordsArray[1]
            //wordsArray[2] = ":" //TODO: check if really exists
            if let variable = Segen(stringVal: wordsArray[3]){
                frameVariables[varName] = variable
            }
            else{
                //Error
            }
            wordsArray.removeFirst(4)
            break
        case Seren.keyword:
            let varName = wordsArray[1]
            //wordsArray[2] = ":" //TODO: check if really exists
            var str : NSString = "" //check wordsArray[3] starts with "
            var count = 3
            
            while true{
                str = str.stringByAppendingString(wordsArray[count] as String)
                if wordsArray[count].characterAtIndex(wordsArray[count].length - 1) == Seren.HebrewMerchaot{
                    break
                }
                else{
                    str = str.stringByAppendingString(" ")
                    count += 1
                }
            }
            if let variable = Seren(nsstring: str){
                frameVariables[varName] = variable
            }
            wordsArray.removeFirst(count + 1)
            break
        case Kama.keyword:
            let varName = wordsArray[1]
            //wordsArray[2] = ":" //TODO: check if really exists
            if let variable = Kama(stringVal: wordsArray[3]){
                frameVariables[varName] = variable
            }
            else{
                //Error
            }
            wordsArray.removeFirst(4)
            break
        case Kaab.keyword:
            let varName = wordsArray[1]
            //wordsArray[2] = ":" //TODO: check if really exists
            if let variable = Kaab(stringVal: wordsArray[3]){
                frameVariables[varName] = variable
            }
            else{
                //Error
            }
            wordsArray.removeFirst(4)
            break

        default:
            break
        }
    }
    
    //debug, print all frame variables
    for variable in frameVariables {
        print("\(variable.0) הוא \(variable.1.type) : \(variable.1.value)")
    }
}

func parseFunction(content : String){
    
}