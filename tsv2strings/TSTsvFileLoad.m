//
//  TSTsvFileLoad.m
//  tsv2strings
//
//  Created by Tomáš Zrůst on 20.05.15.
//  Copyright (c) 2015 ATIVION s.r.o. All rights reserved.
//

#import "TSTsvFileLoad.h"

#import "TSLanguages.h"
#import "TSTextRecord.h"

@implementation TSTsvFileLoad
@synthesize languages;
@synthesize records;

-(void)load:(NSString *)path{
    NSString* fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray* allLinedStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSString *headerLine = [allLinedStrings objectAtIndex:0];
    NSArray *data = [allLinedStrings subarrayWithRange:NSMakeRange(1, allLinedStrings.count-1)];
    

    NSArray *heads = [headerLine componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\t"]];
    int commentIndex=0;
    
    languages = [[TSLanguages alloc] init];

    for(NSString *head in heads){
        if(commentIndex==0){
            commentIndex++;
            continue;
        }
        if([head isEqualToString:@"COMMENTS"]){
            break;
        }
        [languages addLanguage:head];
        commentIndex++;
    }
    
    records = [[NSMutableDictionary alloc] init];

    for(NSString *line in data){
        NSArray *parsed = [line componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\t"]];
        TSTextRecord *rec = [[TSTextRecord alloc] init];
        rec.identifier = [[parsed objectAtIndex:0] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        rec.texts = [[NSMutableArray alloc] init];
        for(int i=1;i<commentIndex;i++){
            [rec.texts addObject:[parsed objectAtIndex:i]];
        }
        rec.comment = [parsed objectAtIndex:commentIndex];
        
        [records setObject:rec forKey:rec.identifier];
    }
    
}
@end
