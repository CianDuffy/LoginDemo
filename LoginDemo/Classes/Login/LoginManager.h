//
//  LoginManager.h
//  LoginDemo
//
//  Created by Cian Duffy on 30/06/2016.
//  Copyright © 2016 Cian Duffy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginDelegate;

@interface LoginManager : NSObject

@property (nonatomic, weak) id<LoginDelegate> delegate;

+ (id)sharedManager;

- (void)signInUsername:(NSString *)username password:(NSString *)password;

@end

@protocol LoginDelegate <NSObject>

@optional
- (void)loginSuccessful;

@required
- (void)showSpinner;
- (void)hideSpinner;

@end