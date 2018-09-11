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

// Source of Truth--create empty mutable array called entries
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
//    [self saveToPersistentStore];
}

// remove entry function
-(void)removeEntryCalled:(JJTEntry *)entry {
    NSUInteger index = [[JJTEntryController shared].entries indexOfObject:entry];
    [[JJTEntryController shared].entries removeObjectAtIndex:index];
//    [self saveToPersistentStore];
}

// update entry function
-(void)updateEntryCalled:(JJTEntry *)entry withNewTitle:(NSString *)newTitle andNewBody:(NSString *)newBodyText {
    
    entry.title = newTitle;
    entry.timestamp = [[NSDate alloc] init];
    entry.bodytext = newBodyText;
//    [self saveToPersistentStore];
}

//// dictionaryCopy method
//-(void)dictionaryCopy {
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//
//    for (NSInteger i=0, i < [[JJTEntryController shared].entries count]; ++i) {
//        JJTEntry *entry = [JJTEntryController shared].entries[i];
//        [dict setObject:entry.title forKey:(@"title")];
//        [dict setObject:entry.timestamp forKey:(@"timestamp")];
//        [dict setObject:entry.bodytext forKey:(@"bodytext")];
//    }
//}
//
//// save to persistent store
//-(void)saveToPersistentStore {
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"entries.plist"];
//    //    BOOL writeSuccess = [_routeData writeToFile:path atomically:YES];
//}
//
//-(void)loadFromPersistentStore {
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"entries.plist"];
//    //    _routeData = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
//}

@end
    
