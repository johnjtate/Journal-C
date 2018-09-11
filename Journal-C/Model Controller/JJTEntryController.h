//
//  JJTEntryController.h
//  Journal-C
//
//  Created by John Tate on 9/10/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJTEntry.h"

@interface JJTEntryController : NSObject

@property (nonatomic) NSMutableArray *entries;

-(void)addEntryWithTitle:(NSString *)title andBody:(NSString *)bodytext;
-(void)removeEntryCalled:(JJTEntry *)entry;
-(void)updateEntryCalled:(JJTEntry *)entry withNewTitle:(NSString *)newTitle andNewBody:(NSString *)newBodyText;

// shared instance
+(JJTEntryController *)shared;

@end
