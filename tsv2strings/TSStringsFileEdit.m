//
//  TSStringsFileEdit.m
//  tsv2strings
//
//  Created by Tomáš Zrůst on 20.05.15.
//  Copyright (c) 2015 ATIVION s.r.o. All rights reserved.
//

#import "TSStringsFileEdit.h"
#import "TSTextRecord.h"

@implementation TSStringsFileEdit


-(void)createLanguage:(NSString *)language origin:(NSString *)baseFile data:(NSDictionary *)data index:(int)index{
    NSString* fileContents = [NSString stringWithContentsOfFile:baseFile encoding:NSUTF8StringEncoding error:nil];
    NSArray* allLinedStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSMutableString *newContent = [[NSMutableString alloc] init];
    for(int i=0;i<allLinedStrings.count;i++){
        NSString *line = [allLinedStrings objectAtIndex:i];
        if(line.length>0 && [line characterAtIndex:0] == '"' ){
            NSArray *pair = [line componentsSeparatedByString:@"\" = \""];
            NSString *key = [[[pair objectAtIndex:0] substringFromIndex:1] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
            NSString *value = [[[data objectForKey:key] texts] objectAtIndex:index] ;
            line = [NSString stringWithFormat:@"\"%@\" = \"%@\";", key, value];
        }
    
        [newContent appendString:line];
        [newContent appendString:@"\n"];
    }
    [self writeToTextFile:language text:newContent];
    
    
}


//Method writes a string to a text file
-(void) writeToTextFile:(NSString *)file text:(NSString *)text{
    //get the documents directory:
    //NSArray *paths = NSSearchPathForDirectoriesInDomains
    //(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/%@.strings",
                          [[NSFileManager defaultManager] currentDirectoryPath], file];
    if([[NSFileManager defaultManager] fileExistsAtPath:fileName isDirectory:nil]){
        [[NSFileManager defaultManager] removeItemAtPath:fileName error:nil];
    }
    //create content - four lines of text
    NSString *content = text;
    //save content to the documents directory
    [content writeToFile:fileName
              atomically:NO
                encoding:NSUTF8StringEncoding
                   error:nil];
    
}

@end
