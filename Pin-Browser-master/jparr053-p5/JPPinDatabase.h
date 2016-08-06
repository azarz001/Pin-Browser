//
//  JPPinDatabase.h
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

#import <Foundation/Foundation.h>

@interface JPPinDatabase : NSObject

// Properties
@property (nonatomic, strong) NSMutableDictionary *globalPinData;
@property (nonatomic, strong) NSString *activePin;
@property (nonatomic, strong) NSString *activeWebsite;

// Class Method
+(JPPinDatabase *) thePinDatabase;

// Instance Methods
-(id)init;

-(BOOL)validatePin:(NSString *) obtainedPin;

-(void)updateThePinDatabase:(NSMutableArray *)obtainedPins :(NSMutableArray *)obtainedSites;


@end
