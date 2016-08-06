//
//  JPEntryViewController.m
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

#import "JPPinEntryViewController.h"
#import "JPPinDatabase.h"


@implementation JPPinEntryViewController

@synthesize numbers;

@synthesize pinEntryLabel1,pinEntryLabel2,pinEntryLabel3,pinEntryLabel4;

//Global variable
//counter is essentially the label tag. From left to right: 0, 1, 2, or 3.
int currentLabelTag = 0;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        self.title = NSLocalizedString(@"Pin", @"Pin");
        //self.tabBarItem.image = [UIImage imageNamed:@"PinImage"];
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Get the instance of the pin database class, JPPinDatabase.
    // Since it is a singleton class, there is only ONE instance of it.
    thePinData = [JPPinDatabase thePinDatabase];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)clickNumber:(id)sender
{
    // Get the ID or TAG of the button pressed (0 - 9) and assign it to the tag variable.
    NSInteger tag = [sender tag];
    
    
    // Convert the tag variable to a string variable named number.
    // This variable will be used to display the number pressed to the user via the labels.
    NSString *number = [NSString stringWithFormat:@"%i",tag];
    
    // Check counter to see where it is at. This corresponds with the pin sequence number being entered.
    switch (currentLabelTag)
    {
        // If it's the first number in the sequence, display it and increment the counter.
        case 0:
            pinEntryLabel1.text = number;
            currentLabelTag++;
            break;
        
        // If it's the second number in the sequence, display it and increment the counter.
        case 1:
            pinEntryLabel2.text = number;
            currentLabelTag++;
            break;
            
        // If it's the third number in the sequence, display it and increment the counter.
        case 2:
            pinEntryLabel3.text = number;
            currentLabelTag++;
            break;
            
        // If it's the fourth number (final number) in the sequence, display it.
        // Then test the full pin sequence.
        // Then reset the counter to 0, since each sequence is made up of 4 numbers.
        // Then clear the labels.
        case 3:
            pinEntryLabel4.text = number;
            [self testPin];
            currentLabelTag = 0;
            [self clearLabels];
            break;
            
        // There is no default behavior since this switch only happens AFTER a button is pressed.
        default:
            break;
    }
    
}

-(void)testPin
{
    // Combine all of the text in the labels into ONE string.
    NSString *pin = [NSString stringWithFormat:@"%@%@%@%@",
                     pinEntryLabel1.text,
                     pinEntryLabel2.text,
                     pinEntryLabel3.text,
                     pinEntryLabel4.text];
    
    // Create a BOOL variable and
    // call the validatePin method and see if the pin entered is valid.
    BOOL pinValidation = [thePinData validatePin:pin];
    
    // If the pin is valid, open the browser view
    if(pinValidation == TRUE)
    {
        // This sets the tab bar to select the view in index 1 (The Browser).
        [self.tabBarController setSelectedIndex:1];
        
        // setNeedsDisplay redraws the whole thing with the new view being displayed.
        // Hence, it goes to the Browser view.
        [self.tabBarController.view setNeedsDisplay];
    }
    
    // Otherwise, the pin IS NOT valid and the user is informed of that.
    else
    {
        //Alert Message to inform user they entered the WRONG pin.
        NSString *message = [NSString stringWithFormat:
                             @"%@ is not a valid pin!", pin];
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Invalid Pin!"
                              message:message
                              delegate:nil
                              cancelButtonTitle:@"Okay."
                              otherButtonTitles:nil];
        [alert show];
        
    }
    
}

// Set all of the EntryLabels to blank.
-(void)clearLabels
{
    pinEntryLabel1.text = @"";
    pinEntryLabel2.text = @"";
    pinEntryLabel3.text = @"";
    pinEntryLabel4.text = @"";
}

@end
