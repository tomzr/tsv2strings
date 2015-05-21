//
//  TSStringsFileEdit.h
//  tsv2strings
//
//  Created by Tomáš Zrůst on 20.05.15.
//  Copyright (c) 2015 ATIVION s.r.o. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSStringsFileEdit : NSObject


-(void)createLanguage:(NSString *)language origin:(NSString *)baseFile data:(NSDictionary *)data index:(int)index;

@end
