//
//  CRMPublicOperation.m
//  CRMIphone01
//
//  Created by lijian on 13-12-2.
//  Copyright (c) 2013年 lijian. All rights reserved.
//

#import "CRMPublicOperation.h"
#import <libxml/xmlreader.h>
@implementation CRMPublicOperation
//获取单例
static CRMPublicOperation *CRM_PublicOperation=nil;
+(CRMPublicOperation*)sharedManager
{
    if (!CRM_PublicOperation) {
        
        CRM_PublicOperation=[[CRMPublicOperation alloc] init];
    }
    return CRM_PublicOperation;
}


-(UIView *)createPickerView{

    UIPickerView * pickerView =[[UIPickerView alloc]init];
    pickerView.frame=CGRectMake(0, 0, 320, 120);
    
    return pickerView;
}
//定义函数，进行对应的当前传入日期的上一月日期获取操作处理
+(NSString *)getLastOneMonthStringFormatOfStringDate:(NSDate *)currentDate
{
    //定义变量，进行对应的当前日期的对应当前日期的年份、月份、日期的对应属性的合成对象处理
    NSDateComponents *components=[[NSCalendar autoupdatingCurrentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate];
    //定义变量，进行对应的当前月份的值的处理操作
    int currentMonth=components.month-1;
    
    //当对应的月份为0时，进行对应的天数显示及对应的年份、月份显示的更新处理操作
    if(currentMonth==0)
    {
        components.year--;
        components.month=12;
        
        int currentDay=[self getDaysNumInThisYear:components.year month:12];
        
        if(currentDay<components.day)
        {
            components.day=currentDay;
        }
    }
    //当月份不为0时，进行对应的天数显示判断处理
    else
    {
        components.month=currentMonth;
        
        int currentDay=[self getDaysNumInThisYear:components.year month:currentMonth];
        
        if(currentDay<components.day)
        {
            components.day=currentDay;
        }
    }
    
    currentDate=[[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
    NSDateFormatter* formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    return [formatter stringFromDate:currentDate];
}
+(NSString *)getCurrentFormatOfStringtimeData:(NSDate*)date{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //设置时间显示的格式。
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter stringFromDate:date];
}
+(int)getCurrentTimeNumber:(NSString *)currtent{

    NSArray * timeArray =[[NSArray alloc]initWithArray:[currtent componentsSeparatedByString:@"-"]];
    NSString * newString =[NSString stringWithFormat:@"%@%@%@",timeArray[0],timeArray[1],timeArray[2]];

    return [newString integerValue];

}
//获取当前时间
+(NSString *)getCurrentFormatOfStringtimeNSString:(NSString *)time{

    return [[time componentsSeparatedByString:@"."] objectAtIndex:0];
    
}

//版本信息
+(NSMutableArray *) fsPraseXmlVersion:(NSString *) xmlStr
{
    NSData *xmlData = [xmlStr dataUsingEncoding:NSUTF8StringEncoding];
    xmlTextReaderPtr reader = xmlReaderForMemory([xmlData bytes],
                                                 [xmlData length],
                                                 NULL, nil,
                                                 (XML_PARSE_NOBLANKS | XML_PARSE_NOCDATA | XML_PARSE_NOERROR | XML_PARSE_NOWARNING));
    if (!reader) {
        NSLog(@"Failed to load xmlreader");
        return nil;
    }
    NSString *currentTagName = nil;
    NSDictionary *currentPerson = nil;
    NSString *currentTagValue = nil;
    NSMutableArray *advertiseMArray = [NSMutableArray array];
    char* temp;
    while (true) {
        int len=xmlTextReaderRead(reader);
        if (len<=0) break;
        switch (xmlTextReaderNodeType(reader)) {
            case XML_READER_TYPE_ELEMENT:
                // starting an element
                temp =  (char*)xmlTextReaderConstName(reader);
                currentTagName = [NSString stringWithCString:temp
                                                    encoding:NSUTF8StringEncoding];
                
                if ([currentTagName isEqualToString:@"Item"]) {
                    currentPerson = [NSMutableDictionary dictionary];
                    [advertiseMArray addObject:currentPerson];
                }
                
                continue;
            case XML_READER_TYPE_TEXT:
                //The current tag has a text value, stick it into the current
                temp = (char*)xmlTextReaderConstValue(reader);
                currentTagValue = [NSString stringWithCString:temp
                                                     encoding:NSUTF8StringEncoding];
                
                if (!currentPerson) return nil;
                
                [currentPerson setValue:currentTagValue forKey:currentTagName];
                currentTagValue = nil;
                currentTagName = nil;
                continue;
                
            default:
                //NSLog(@"abc");
                continue;
        }
    }
    return advertiseMArray;
}

//定义函数，进行对应的年份与月份下的对应的月份的对应天数处理
+(int)getDaysNumInThisYear:(int)year month:(int)imonth
{
    if((imonth == 1)||(imonth == 3)||(imonth == 5)||(imonth == 7)||(imonth == 8)||(imonth == 10)||(imonth == 12))
        return 31;
    
    if((imonth == 4)||(imonth == 6)||(imonth == 9)||(imonth == 11))
        return 30;
    
    if((year%4 == 1)||(year%4 == 2)||(year%4 == 3))
    {
        return 28;
    }
    if(year%400 == 0)
        return 29;
    if(year%100 == 0)
        return 28;
    return 29;
}
@end
