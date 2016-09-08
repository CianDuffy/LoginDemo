//
//  LoginManager.m
//  LoginDemo
//
//  Created by Cian Duffy on 30/06/2016.
//  Copyright © 2016 Cian Duffy. All rights reserved.
//

#import "LoginManager.h"

@implementation LoginManager

+ (id)sharedManager
{
    static LoginManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (id)init
{
    if (self = [super init])
    {
    }
    return self;
}

#pragma mark - Login Methods

- (void)signInUsername:(NSString *)username password:(NSString *)password
{
    [self notifyClientIsSigningIn];
    
    if([username isEqualToString:@"cian"] && [password isEqualToString:@"1234"])
    {
        [self performSelector:@selector(notifyClientHasSignedIn) withObject:nil afterDelay:4.0];
    }
}

#pragma mark - Utils

- (void)notifyClientIsSigningIn
{
    [self.delegate showSpinner];
}

- (void)notifyClientHasSignedIn
{
    [self.delegate hideSpinner];
    [self.delegate loginSuccessful];
}

@end
