//
//  TSTsvFileLoad.h
//  tsv2strings
//
//  Created by Tomáš Zrůst on 20.05.15.
//  Copyright (c) 2015 ATIVION s.r.o. All rights reserved.
//

#import <Foundation/Foundation.h>


@class TSLanguages;

@interface TSTsvFileLoad : NSObject{
    TSLanguages *languages;
    NSMutableDictionary *records;
}

@property (nonatomic, retain) TSLanguages *languages;
@property (nonatomic, retain) NSMutableDictionary *records;

-(void)load:(NSString *)path;

@end
