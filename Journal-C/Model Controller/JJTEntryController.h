//
//  JJTEntryController.h
//  Journal-C
//
//  Created by John Tate on 9/10/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJTEntryController : NSObject

@property (nonatomic) NSMutableArray *entries;

-(void)addEntryWithTitle;
-(void)removeEntryWithEntry;

// shared instance
+(JJTEntryController *)shared;

@end
