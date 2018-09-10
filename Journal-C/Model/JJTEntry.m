//
//  Entry.m
//  Journal-C
//
//  Created by John Tate on 9/10/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import "JJTEntry.h"

@implementation JJTEntry

// note that timestamp is omitted from line below because default parameter is set
-(instancetype)initWithTitle:(NSString *)title bodytext:(NSString *)bodytext {
    
    self = [super init];
    if (self) {
        _title = title;
        // adds default parameter for timestamp
        _timestamp = [[NSDate alloc] init];
        _bodytext = bodytext;
    }
    return self;
}

@end
