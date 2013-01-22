//
//  LoginViewController.m
//  TutorialBase
//
//  Created by Antonio MG on 6/23/12.
//  Copyright (c) 2012 AMG. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

#import <Parse/Parse.h>

@implementation LoginViewController

@synthesize userTextField = _userTextField, passwordTextField = _passwordTextField;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Delete me
    self.userTextField.text = @"Antonio";
    self.passwordTextField.text = @"12345";
    
    /*
    PFObject* name = [PFObject objectWithClassName:@"name"];
    NSMutableDictionary* date = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* obj = [[NSMutableDictionary alloc] init];
    [obj setObject:@"haha1" forKey:@"record1"];
    [obj setObject:@"haha2" forKey:@"record2"];
    [date setObject:obj forKey:@"obj1"];
    [name setObject:@"hello" forKey:@"account"];
    [name setObject:@"good" forKey:@"password"];
    [name setObject:date forKey:@"date1"];
    [name saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"succeeded");
        }else {
            NSLog(@"error:%@",error);
        }
    }];
     */
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    self.userTextField = nil;
    self.passwordTextField = nil;
}


#pragma mark IB Actions

//Login button pressed
-(IBAction)logInPressed:(id)sender
{
    [PFUser logInWithUsernameInBackground:self.userTextField.text password:self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        if (user) {
            //Open the wall
             [self performSegueWithIdentifier:@"LoginSuccesful" sender:self];
        } else {
            //Something bad has ocurred
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
}

@end
