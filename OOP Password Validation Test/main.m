//
//  main.m
//  OOP Password Validation Test
//
//  Created by Aditya Narayan on 6/14/16.
//  Copyright (c) 2016 Marc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "checkPassword.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *blacklist = [[NSMutableArray alloc] initWithObjects:@"A123456a#",@"X123456a@",@"a1234&@56a#",@"aaaaX1#", @"Abcd1234$", nil];

        NSString *inputPassword = [[NSString alloc] init];
        inputPassword = @"bd1Tdf$##@d4d";
//      inputPassword = @"bA3r!2d0WE#$13";
//      inputPassword = @"X123456a@";
    
        for (int x = 0; x<blacklist.count; x++){
            if (inputPassword == blacklist[x]) {
                NSLog(@"The password %@ is on the blacklist. Please try a different one.", inputPassword);
                return 0;
            }//end of if      
        }//end of for
        
        if(![checkPassword isValidPassword:inputPassword]) {
            NSLog(@"Password \"%@\" is not valid - must be at least 8 but no more than 15 characters with at least 1 uppercase character, 1 lowercase character, 1 number, 1 special character and no empty spaces.", inputPassword);
        }
        else {
            NSLog(@"Password \"%@\" is valid.", inputPassword);// Password is valid
        }
    }

    return 0;
}
