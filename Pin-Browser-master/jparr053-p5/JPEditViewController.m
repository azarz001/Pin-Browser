//
//  JPEditViewController.m
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

#import "JPEditViewController.h"
#import "JPPinDatabase.h"


@implementation JPEditViewController

@synthesize pinFields, websiteFields;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        // Custom initialization
        self.title = NSLocalizedString(@"Edit", @"Edit");
        //self.tabBarItem.image = [UIImage imageNamed:@"EditImage"];
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
    
    
    // Load the pins and websites from the database to the view
    [self loadPinsToView];
    
    [self loadWebsitesToView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadPinsToView
{
    // Create an array named obtainedPins
    NSMutableArray *obtainedPins = [[NSMutableArray alloc] init];
    
    // Create an array named thePins and set the 10 pins to be empty by default.
    NSMutableArray *thePins = [[NSMutableArray alloc] initWithObjects:
                               @"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
    
    
    // Use a FOR loop to go through the pins from the database and add them to obtainedPins.
    for(NSString *pin in thePinData.globalPinData)
    {
        [obtainedPins addObject:pin];
    }
    
    // Use a FOR loop based on the number of pins in the database
    // to replace thePins with the obtainedPins from the database.
    for(int i = 0; i < [thePinData.globalPinData count]; i++)
    {
        [thePins replaceObjectAtIndex:i withObject:[obtainedPins objectAtIndex:i]];
    }
    
    // FOR every textField in the pinFields OutletCollection array do the following...
    for(UITextField *textField in pinFields)
    {
        // Set the textField delegate to itself.
        textField.delegate = self;
        
        // Make the numPad the default keyboard for entering a pin
        textField.keyboardType = UIKeyboardTypeNumberPad;
        
        
        // Test the tag of the textField.
        switch (textField.tag)
        {
                // If it's 0, assign it the thePin value at index 0.
            case 0:
                textField.text = [thePins objectAtIndex:0];
                break;
                
            case 1:
                textField.text = [thePins objectAtIndex:1];
                break;
                
            case 2:
                textField.text = [thePins objectAtIndex:2];
                break;
                
            case 3:
                textField.text = [thePins objectAtIndex:3];
                break;
                
            case 4:
                textField.text = [thePins objectAtIndex:4];
                break;
                
            case 5:
                textField.text = [thePins objectAtIndex:5];
                break;
                
            case 6:
                textField.text = [thePins objectAtIndex:6];
                break;
                
            case 7:
                textField.text = [thePins objectAtIndex:7];
                break;
                
            case 8:
                textField.text = [thePins objectAtIndex:8];
                break;
                
            case 9:
                textField.text = [thePins objectAtIndex:9];
                break;
                
            default:
                break;
        }
        
    }
}


-(void) loadWebsitesToView
{
    // Create an array named obtainedWebsites
    NSMutableArray *obtainedWebsites = [[NSMutableArray alloc] init];
    
    // Create an array named theSite and set the 10 sites to be empty by default.
    NSMutableArray *theSite = [[NSMutableArray alloc] initWithObjects:
                               @"http://",@"http://",@"http://",
                               @"http://",@"http://",@"http://",
                               @"http://",@"http://",@"http://",
                               @"http://", nil];
    
    // Use a FOR loop to go through the pins from the database and add thier
    // associated value to obtainedWebsites.
    for(NSString *pin in thePinData.globalPinData)
    {
        [obtainedWebsites addObject:[thePinData.globalPinData valueForKey:pin]];
    }
    
    // Use a FOR loop based on the number of pins in the database
    // to replace theSite with the obtainedWebsites from the database.
    for(int i = 0; i < [thePinData.globalPinData count]; i++)
    {
        [theSite replaceObjectAtIndex:i withObject:[obtainedWebsites objectAtIndex:i]];
    }
    
    // FOR every textField in the websiteFields OutletCollection array do the following...
    for(UITextField *textField in websiteFields)
    {
        // Set the textField delegate to itself.
        textField.delegate = self;
        
        // Test the tag of the textField.
        switch (textField.tag)
        {
                // If it's 0, assign it the theSite value at index 0.
            case 0:
                textField.text = [theSite objectAtIndex:0];
                break;
                
            case 1:
                textField.text = [theSite objectAtIndex:1];
                break;
                
            case 2:
                textField.text = [theSite objectAtIndex:2];
                break;
                
            case 3:
                textField.text = [theSite objectAtIndex:3];
                break;
                
            case 4:
                textField.text = [theSite objectAtIndex:4];
                break;
                
            case 5:
                textField.text = [theSite objectAtIndex:5];
                break;
                
            case 6:
                textField.text = [theSite objectAtIndex:6];
                break;
                
            case 7:
                textField.text = [theSite objectAtIndex:7];
                break;
                
            case 8:
                textField.text = [theSite objectAtIndex:8];
                break;
                
            case 9:
                textField.text = [theSite objectAtIndex:9];
                break;
                
            default:
                break;
        }
        
    }
}

-(void) tellDatabaseToUpdate
{
    // Create two Arrays. Each one will hold either newPins or newWebsites
    NSMutableArray *newPins = [[NSMutableArray alloc] initWithCapacity:10];
    NSMutableArray *newWebsites = [[NSMutableArray alloc] initWithCapacity:10];
    
    // For every pin inside the pin textFields, put them in the newPins array.
    for(UITextField *pin in pinFields)
    {
        [newPins addObject:pin.text];
    }
    
    // For every website inside the website textFields, put them in the newWebsite array
    for(UITextField *site in websiteFields)
    {
        [newWebsites addObject:site.text];
    }
    
    // Now that I have stored the data in the text fields in two NSMutableArrays
    // I call the method in the model to update the database. It expects two NSMutablArrays.
    
    [thePinData updateThePinDatabase:newPins :newWebsites];

}


// UITextField Delegate Methods that I implemented.

// This method makes the keyboard disappear whenever ANYTHING on the screen is touched that is not the keyboard.
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
    
    [self tellDatabaseToUpdate];
}


// This method makes the keyboard disappear after pressing return.
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    [self tellDatabaseToUpdate];
    
    return YES;
}


@end
