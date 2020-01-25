//
//  checkPassword.m
//  OOP Password Validation Test
//
//  Created by Aditya Narayan on 6/14/16.
//  Copyright (c) 2016 Marc. All rights reserved.
//

#import "checkPassword.h"

@implementation checkPassword

+ (BOOL) isValidPassword: (NSString*) passwordString
{
    {
//  NSString *regexFilter = @"(([a-z0-9])(?!\\2))+";  //(This checks if there are 2 repeating characters)
    NSString *regexFilter = @"^[a-zA-Z](?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%#&])[A-Za-z\\d$@$!%#&](([A-Za-z\\d$@$!%#&])(?!\\2))+${7,14}";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexFilter];
    return [passwordTest evaluateWithObject:passwordString];
    }
}

@end





// The Regex code above checks first for an alpha character in the password then all the conditions including at least
// 1 number, 1 upper, 1 lower, 1 special character, no empty spaces and length from 8 to 15.  There was a fence posting
// error when using {8,15} but it worked fine when using {7,14} to ensure the length of 8-15.


// -------------------------------------------------------------------------------------------


// Various REGEX examples for use in password checking

// "(([A-Za-z\\d$@$!%#&])(?!\\2))+$"-->(This checks if there are 2 repeating characters in all characters allowed)
// "(([a-z0-9])(?!\\2))+$" --> (This checks if there are 2 repeating characters in alphanumerics)
// "^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" --> (Minimum 8 characters at least 1 Alphabet and 1 Number)
// "^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" --> (Minimum 8 and Maximum 16 characters at least 1 Alphabet, 1 Number and 1 Special Character)
// "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" --> (Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet and 1 Number)
// "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" --> (Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character)
// "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,10}" --> (Minimum 8 and Maximum 10 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character)

