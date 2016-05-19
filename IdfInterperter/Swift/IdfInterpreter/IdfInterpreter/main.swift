//
//  main.swift
//  IdfInterpreter
//
//  Created by Aviv Abramovich on 19.5.2016.
//  Copyright © 2016 Aviv Abramovich. All rights reserved.
//

import Foundation

func main(){
    
    if Process.arguments.count != 2 {
        print("Expected 1 argument")
        print("IdfInterperter <file.idf>")
        return;
    }
    
    //check file extension for ".idf"
    let path = Process.arguments[1]
    print("path: \(path)")
    
    let url = NSURL(fileURLWithPath: path)
    
    //opne the file
    do{
        let textToParse = try NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding)
        
        //debug, print file content
        print(textToParse)
    } catch {
        print("Cannot find file \"\(path)\"")
        return
    }
}

main()
