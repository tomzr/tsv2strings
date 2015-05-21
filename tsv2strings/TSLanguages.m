//
//  TSLanguages.m
//  tsv2strings
//
//  Created by Tomáš Zrůst on 20.05.15.
//  Copyright (c) 2015 ATIVION s.r.o. All rights reserved.
//

#import "TSLanguages.h"

@implementation TSLanguages
@synthesize languages;

- (instancetype)init
{
    self = [super init];
    if (self) {
        languages = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addLanguage:(NSString *)language{
    [languages addObject:language];
}

-(int)indexOfLanguage:(NSString *)language{
    int i=0;
    for(NSString *lang in languages){
        if([lang isEqualToString:language]){
            return i;
        }
        i++;
    }
    return -1;
}


@end
