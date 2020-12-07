//
//  ConvertAPIData.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/23.
//

import UIKit
class  ConvertAPIData
{
    //MARK: - Function DateString To TimeStamp
    static func stringToTimeInterval(dateStr:String) -> (TimeInterval)
    {
        //MARK: - DateString To TimeInterval
        let dateFormatterToDate = DateFormatter()
        dateFormatterToDate.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let date = dateFormatterToDate.date(from: dateStr)
        var timeStamp = TimeInterval()
        if let date = date
        {
            timeStamp = date.timeIntervalSince1970
        }
      
        return timeStamp
    }
    
    //MARK: - DateStringCapture "yyyy-MM-dd HH:mm:ss"->"MM/dd"
    static func dateStringCapture(dateStr:String,formatter:String = "MM/dd") -> String
    {
       
        let dateFormatterToDate = DateFormatter()
        dateFormatterToDate.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let date = dateFormatterToDate.date(from: dateStr)
       
        let dateToString = DateFormatter()
        dateToString.dateFormat = formatter
        let dateStringCapture = dateToString.string(from: date!)
        return dateStringCapture
    }
}
