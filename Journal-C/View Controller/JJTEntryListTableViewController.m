//
//  JJTEntryListTableViewController.m
//  Journal-C
//
//  Created by John Tate on 9/10/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import "JJTEntryListTableViewController.h"
#import "JJTEntryController.h"
#import "JJTEntry.h"
#import "JJTEntryDetailViewController.h"

@interface JJTEntryListTableViewController ()

@property (nonatomic) NSString *destinationVC;

@end

@implementation JJTEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[JJTEntryController shared].entries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    JJTEntry *entry = [JJTEntryController shared].entries[indexPath.row];
    cell.textLabel.text = entry.title;
    cell.detailTextLabel.text = @"%@", entry.timestamp;
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        JJTEntry *entry = [JJTEntryController shared].entries[indexPath.row];
        [[JJTEntryController shared] removeEntryCalled: entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDetailEntry"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        JJTEntryDetailViewController *destinationVC = segue.destinationViewController;
        destinationVC.entry = [[JJTEntryController shared].entries objectAtIndex:indexPath.row];
    }
}

@end
