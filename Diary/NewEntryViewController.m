//
//  NewEntryViewController.m
//  Diary
//
//  Created by Ranjay Salmon on 10/2/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import "NewEntryViewController.h"
#import "DiaryEntry.h"
#import "CoreDataStack.h"

@interface NewEntryViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation NewEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// creating helper method to dismiss view controller
- (void) dissmissSelf{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

// method to insert diary entry
- (void) insertDiaryEntry{
    
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    
    // define diary entry
    // and inserts a new entity in core data stack environment
    DiaryEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"DiaryEntry" inManagedObjectContext:coreDataStack.managedObjectContext];
    
    // configure the entry and store data inside it
    // in the body and the date object
    entry.body = self.textField.text;
    entry.date = [[NSDate date] timeIntervalSince1970];
    
    // save core data stack
    [coreDataStack saveContext];

}

- (IBAction)doneWasPressed:(id)sender {
    [self insertDiaryEntry];
    [self dissmissSelf];
}
- (IBAction)cancelWasPressed:(id)sender {
    
    [self dissmissSelf];
}

@end
