//
//  JPPinDatabase.m
//  jparr053-p5
//
// PROGRAMMER: Jonathan Parrilla

// PATHER ID: 3767284

// CLASS: COP4655 MW 5:00

// INSTRUCTOR: Steven Luis ECS 282

// ASSIGMENT: #5 Pin Browser Program

// DUE: Monday 03/10/2014
//  Created by Jonathan Parrilla on 3/6/14.
//  Copyright (c) 2014 Jonathan Parrilla. All rights reserved.
//

#import "JPPinDatabase.h"

@implementation JPPinDatabase

// Synthesize the NSMutableDictionary gloablPinData
@synthesize globalPinData;

// Synthesize the NSStrings activePin and activeWebsite
@synthesize activePin, activeWebsite;


// The class method thePindDatabase. It returns the instance of this class.
+ (JPPinDatabase *)thePinDatabase
{
    // Creates a static instance of itself named pinDatabase. Sets it to nil (non existent)
    static JPPinDatabase *pinDatabase = nil;
    
    // It synchronizes itself.
    @synchronized(self)
    {
        // if there is no instance of the pinDatabase
        if(!pinDatabase)
        {
            // Then alloc and init the pinDatabase instance
            pinDatabase = [[JPPinDatabase alloc] init];
        }
    }
    
    // After it synchronizes, if there IS an instance of pinDatabase,
    // then it skips the if statement and just returns the synchronized
    // instance of pinDatabase.
    
    // This means that no matter how many views create their own named instance of this class,
    // those instances are all the 'pinDatabase' instance. Essentially, those other named
    // instances are shells and pinDatabase slips into those shells.
    // Hence, there is only ONE instance of this class throughout the whole app.
    
    // Return the pinDatabase instance.
    return pinDatabase;
    
}


// The init method is overriden.
-(id)init
{
    if(self = [super init])
    {
        // The globalPinData dictionary is initialized with a capacity of 10.
        globalPinData = [[NSMutableDictionary alloc] initWithCapacity:10];
        
        // Add the first three websites and their associated keys.
        [globalPinData setObject:@"http://www.solarkhan.com" forKey:@"7777"];
        [globalPinData setObject:@"http://www.google.com" forKey:@"0000"];
        [globalPinData setObject:@"http://www.github.com" forKey:@"0101"];
        
        // Set a default value for the activeWebsite and activePin
        // This is done in  case a user clicks on the browser view BEFORE they enter a valid pin.
        
        activeWebsite = @"http://www.fiu.edu";
        activePin = @"No Pin";
    }
    
    return self;
}


// validatePin method accepts a pin.
-(BOOL)validatePin:(NSString *)obtainedPin
{
    // It iterates through the dictionary's keys or 'pins'
    for(NSString *pin in globalPinData)
    {
        // If the current key or 'pin' matches the obtainedPin then it's a valid pin.
        if ([obtainedPin isEqualToString:pin])
        {
            activePin = obtainedPin;
            activeWebsite = [globalPinData objectForKey:obtainedPin];
            
            return TRUE;
        }
    }
    
    // If it iterates through the whole dictionary and finds no matches,
    // then they obtainedPin is not valid.
    
    return FALSE;
}


// The updateThePinDatabase method accepts two NSMutableArrays, one for pins, and one for websites.
-(void)updateThePinDatabase:(NSMutableArray *)obtainedPins :(NSMutableArray *)obtainedSites
{
    // Create a Dictionary to store these new pins and websites.
    NSMutableDictionary *newPinsAndWebsites = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    
    // Sort through the 10 pins and websites in both of the arrays and add their matching pairs
    // to the dictionary. Since there can be no more than 10 pairs, I hard coded the index limit.
    for(int index = 0; index < 10; index++)
    {
        [newPinsAndWebsites setValue:
         [obtainedSites objectAtIndex:index]forKey:[obtainedPins objectAtIndex:index]];
    }
    
    // Since the data I received is temporary, I need to update the database or dictionary holding
    // my sets of pins and websites. So I assign the updated values of the new dictionary to the
    // globalPinData. Thus, updating the database.
    
    globalPinData = newPinsAndWebsites;

}

@end
