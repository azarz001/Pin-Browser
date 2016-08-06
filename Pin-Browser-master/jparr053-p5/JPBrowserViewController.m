//
//  JPBrowserViewController.m
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

#import "JPBrowserViewController.h"
#import "JPPinDatabase.h"

@implementation JPBrowserViewController

// Synthesize the webView.
@synthesize webView;

// Synthesize the labels pin and website.
@synthesize pin, website;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        self.title = NSLocalizedString(@"Browser", @"Browser");
        //self.tabBarItem.image = [UIImage imageNamed:@"BrowserImage"];
        
    }
    return self;
}


// This method will refresh the labels and the webView if needed every time
// a user selects another tab on the tab bar.
-(void)viewWillAppear:(BOOL)animated
{
    // Assign the labels pin and website their respective values
    // from the database (singleton class).
    pin.text = thePinData.activePin;
    website.text = thePinData.activeWebsite;
    
    // Create NSString named aSite and assign it the
    // activeWebsite from the database (singleton class).
    NSString *aSite = thePinData.activeWebsite;
    
    // Create a NSURL and convert the website from string to URL format.
    NSURL *url = [NSURL URLWithString:aSite];
    
    // Create a URL Request using the url we just created.
    NSURLRequest *requestUrl = [NSURLRequest requestWithURL:url];
    
    // Call the webView and load the request.
    [webView loadRequest:requestUrl];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Get the instance of the pin database class, JPPinDatabase.
    // Since it is a singleton class, there is only ONE instance of it.
    thePinData = [JPPinDatabase thePinDatabase];
    
    
    // The following site gets loaded if the user has entered NO PIN
    // but clicks on the Browser view tab.
    
    // Create NSString named defaultSite and assign it the
    // activeWebsite from the database (singleton class).
    NSString *defaultSite = thePinData.activeWebsite;
    
    // Create a NSURL and convert the website from string to URL format.    
    NSURL *url = [NSURL URLWithString:defaultSite];
    
    // Create a URL Request using the url we just created.    
    NSURLRequest *requestUrl = [NSURLRequest requestWithURL:url];
    
    // Call the webView and load the request.    
    [webView loadRequest:requestUrl];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
