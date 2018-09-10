//
//  JJTEntryController.m
//  Journal-C
//
//  Created by John Tate on 9/10/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import "JJTEntryController.h"
#import "JJTEntry.h"

@implementation JJTEntryController

// shared instance
+(JJTEntryController *)shared {
    static JJTEntryController *shared  = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [JJTEntryController new];
    });
    return shared;
}

// Source of Truth--creat empty mutable array called entries
-(instancetype)init {
    self = [super init];
    if (self) {
        _entries = [[NSMutableArray alloc] init];
    }
    return self;
}

// add entry function
-(void)addEntryWithTitle:(NSString *)title andBody:(NSString *)bodytext {
    JJTEntry *entry = [[JJTEntry alloc] initWithTitle: title bodytext: bodytext];
    [[JJTEntryController shared].entries addObject:entry];
}

// remove entry function
-(void)removeEntryWithEntry:(JJTEntry *)entry {
    NSUInteger index = [[JJTEntryController shared].entries indexOfObject:entry];
    [[JJTEntryController shared].entries removeObjectAtIndex:index];
}

@end

