//
//  Entry.h
//  Journal-C
//
//  Created by John Tate on 9/10/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJTEntry : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSDate *timestamp;
@property (nonatomic, copy) NSString *bodytext;

-(instancetype)initWithTitle:(NSString *)title bodytext:(NSString *)bodytext;

@end
