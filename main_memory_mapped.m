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
        NSData *data = [NSData dataWithContentsOfFile:filePath
                                              options:NSDataReadingMappedAlways
                                                error:&error];
        
        if (error) {
            NSLog(@"WTF!?: %@", [error userInfo]);
            return 1;
        }
        
        // the char we have to find
        const char charToFind = '0';
        // keep track of how many chars we found
        NSUInteger charsFound = 0;
        
        // we'll incrementally read the data, starting obviously from 0
        NSUInteger readPointer = 0;
        
        // cache some results
        NSUInteger dataLenght = [data length];
        const void *dataBytes = [data bytes];
        
        // read as long as there's data to read
        while(readPointer < dataLenght) {
            // calculate how far we're from EOF
            NSUInteger distanceToEndOfData = dataLenght - readPointer;
            // pointer arithmetic is magic (-> start reading from this)
            const void *bytes = (uint8_t *)dataBytes + readPointer;
            // in every loop we want to read up to 128 kb of data (-> up to here)
            NSUInteger _128kb = distanceToEndOfData > 131072 ? 131072 : distanceToEndOfData;
            
            // get a string from said data (start reading from from bytes and read up to _128kb chars)
            NSString *shortString = [[NSString alloc] initWithBytes:bytes length:_128kb encoding:NSUTF8StringEncoding];

            // get the a C array of chars
            const char *characters = [shortString UTF8String];
            // and cache its length (it may not be _128kb)
            NSUInteger count = [shortString length];
            
            // how many of them are == to the char we're looking for?
            for (NSUInteger i = 0; i < count; ++i) {
                if (characters[i] == charToFind) {
                    ++charsFound;
                }
            }
            
            // advance our read pointer by the number of bytes actually read
            readPointer += count;
        }
        
        // DONE!
        NSLog(@"Found %li characters", charsFound);
        return 0;

    }
    return 0;
}
