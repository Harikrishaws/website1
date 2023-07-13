//
//  main.m
//  MBtest
//
//  Created by Alessandro Vendruscolo on 28/10/12.
//  Copyright (c) 2012 Alessandro Vendruscolo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // a string representing the file to read
        NSString *filePath = @"/Users/MJ/Desktop/100MB.txt";
        // an error object
        NSError *error = nil;
        // our file
        NSString *file = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        
        if (error) {
            NSLog(@"WTF!?: %@", [error userInfo]);
            return 1;
        }
        
        // the char we have to find
        const char charToFind = '0';
        // keep track of how many chars we found
        NSUInteger charsFound = 0;
        
        // get a C array of chars
        const char *characters = [file UTF8String];
        // cache the length of the file
        NSUInteger count = [file length];
        
        // how many of them are == to the char we're looking for?
        for (NSUInteger i = 0; i < count; ++i) {
            if (characters[i] == charToFind) {
                ++charsFound;
            }
        }
        
        // DONE
        NSLog(@"Found %li characters", charsFound);
        return 0;

    }
    return 0;
}
