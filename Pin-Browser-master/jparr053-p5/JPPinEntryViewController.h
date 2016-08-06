//
//  JPEntryViewController.h
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

#import <UIKit/UIKit.h>
@class JPPinDatabase;

@interface JPPinEntryViewController : UIViewController
{
    JPPinDatabase *thePinData;
}

@property (weak, nonatomic) IBOutlet UILabel *pinEntryLabel1;

@property (weak, nonatomic) IBOutlet UILabel *pinEntryLabel2;

@property (weak, nonatomic) IBOutlet UILabel *pinEntryLabel3;

@property (weak, nonatomic) IBOutlet UILabel *pinEntryLabel4;



@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numbers;

-(IBAction) clickNumber:(id)sender;

@end
