//
//  JJTEntryDetailViewController.h
//  Journal-C
//
//  Created by John Tate on 9/10/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJTEntry.h"

@interface JJTEntryDetailViewController : UIViewController

// landing pad for segue
@property (strong, nonatomic) JJTEntry *entry;

-(void)updateViews;

@end
