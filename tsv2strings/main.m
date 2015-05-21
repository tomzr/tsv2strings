//
//  main.m
//  tsv2strings
//
//  Created by Tomáš Zrůst on 20.05.15.
//  Copyright (c) 2015 ATIVION s.r.o. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSTsvFileLoad.h"

#import "TSStringsFileEdit.h"
#import "TSLanguages.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        if(argc != 3){
            NSLog(@"Wrong arguments: %d, pass file with strings and tabulator separated values to parse.", argc);
            return -1;
        }
        NSString *stringsFile = [NSString stringWithUTF8String:argv[1]];
        NSString *tsvFile = [NSString stringWithUTF8String:argv[2]];

        TSTsvFileLoad *tfl = [[TSTsvFileLoad alloc] init];
        [tfl load:tsvFile];
        TSStringsFileEdit *sfe = [[TSStringsFileEdit alloc] init];
        for(int i=0; i<tfl.languages.languages.count; i++){
            NSString *lang =[tfl.languages.languages objectAtIndex:i];
            NSLog(@"language: %@", lang);
            [sfe createLanguage:lang origin:stringsFile data:tfl.records index:i];
        }
        NSLog(@"Done");
    }
    return 0;
}

