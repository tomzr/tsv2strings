//
//  TSLanguages.h
//  tsv2strings
//
//  Created by Tomáš Zrůst on 20.05.15.
//  Copyright (c) 2015 ATIVION s.r.o. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSLanguages : NSObject{
    NSMutableArray *languages;
}

@property (nonatomic, retain) NSMutableArray *languages;


-(void)addLanguage:(NSString *)language;
-(int)indexOfLanguage:(NSString *)language;


@end
