//
//  LoginViewController.m
//  LoginDemo
//
//  Created by Cian Duffy on 30/06/2016.
//  Copyright © 2016 Cian Duffy. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginManager.h"

@interface LoginViewController () <LoginDelegate>

@property (weak) IBOutlet UITextField *usernameField;
@property (weak) IBOutlet UITextField *passwordField;

@property (weak) IBOutlet UIButton *signInButton;
@property (weak) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signIn:(id)sender
{
    NSString *username = [self.usernameField text];
    NSString *password = [self.passwordField text];
    
    [[LoginManager sharedManager] setDelegate:self];
    [[LoginManager sharedManager] signInUsername:username password:password];
}

#pragma mark - LoginDelegate

- (void)showSpinner
{
    [self toggleHideUIControls:NO];
    [self.spinner startAnimating];
}

- (void)hideSpinner
{
    [self toggleHideUIControls:YES];
    [self.spinner stopAnimating];
}

- (void)loginSuccessful
{
    [self performSegueWithIdentifier:@"LoginComplete" sender:self];
}

#pragma mark - Utils

- (void)toggleHideUIControls:(BOOL)hidden
{
    [self.usernameField setEnabled:hidden];
    [self.passwordField setEnabled:hidden];
    [self.signInButton setHidden:!hidden];
    [self.signInButton setEnabled:hidden];
}

@end
