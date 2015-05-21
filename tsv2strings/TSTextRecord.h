//
//  TSTextRecord.h
//  tsv2strings
//
//  Created by Tomáš Zrůst on 20.05.15.
//  Copyright (c) 2015 ATIVION s.r.o. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSTextRecord : NSObject{
    NSString *identifier;
    NSMutableArray *texts;
    NSString *comment;
}

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSMutableArray *texts;
@property (nonatomic, retain) NSString *comment;


@end
