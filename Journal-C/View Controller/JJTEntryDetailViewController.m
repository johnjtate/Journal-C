//
//  JJTEntryDetailViewController.m
//  Journal-C
//
//  Created by John Tate on 9/10/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import "JJTEntryDetailViewController.h"
#import "JJTEntryController.h"

@interface JJTEntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *entryTitleField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextField;


- (IBAction)clearButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)saveButtonTapped:(UIButton *)sender;

@end

@implementation JJTEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

// this takes the place of the property observer didSet() in Swift
-(void)setEntry:(JJTEntry *)entry {
    _entry = entry;
    [self updateViews];
}

-(void)updateViews {
    self.entryTitleField.text = self.entry.title;
    self.bodyTextField.text = self.entry.bodytext;
}

-(IBAction)clearButtonTapped:(UIBarButtonItem *)sender {
    self.entryTitleField.text = @"";
    self.bodyTextField.text = @"";
}

-(IBAction)saveButtonTapped:(UIButton *)sender {

    // If segue via Add button, add new entry.  If segue from master table view cell, update entry.
    if (_entry.title == nil && _entry.bodytext == nil) {
        [[JJTEntryController shared] addEntryWithTitle:self.entryTitleField.text andBody:self.bodyTextField.text];
        } else {
            [[JJTEntryController shared] updateEntryCalled:self.entry withNewTitle:self.entryTitleField.text andNewBody:self.bodyTextField.text];
        }
    
//    // If segue via Add button, add new entry.  If segue from master table view cell, update entry.
//    if (self.entryTitleField.text != nil && self.bodyTextField.text != nil) {
//        [[JJTEntryController shared] addEntryWithTitle:self.entryTitleField.text andBody:self.bodyTextField.text];
//    } else {
//        [[JJTEntryController shared] updateEntryCalled:self.entry withNewTitle:self.entryTitleField.text andNewBody:self.bodyTextField.text];
//    }
    
    [self.navigationController popViewControllerAnimated:true];
}

@end
