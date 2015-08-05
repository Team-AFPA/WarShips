//
//  ViewController.m
//  WarShips
//
//  Created by Thibault Le Cornec on 04/08/15.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import "ViewController.h"
#import "ShipButton.h"
#import "DataManager.h"

@interface ViewController ()
    @property DataManager *sharedDataManager;
@end

@implementation ViewController
@synthesize sharedDataManager, allButtons;

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        sharedDataManager = [DataManager sharedDataManager];
    }

    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *indexesOfShipsPlaces = [sharedDataManager getAllIndexesOfAllShips];
    
    for (NSUInteger i = 0; i < [indexesOfShipsPlaces count]; i++)
    {
        [[allButtons objectAtIndex:[indexesOfShipsPlaces objectAtIndex:i]] setIsThereAShip:YES];
    }
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*!
 *  @author Thibault Le Cornec
 *  
 *  @brief  Method called when user touch a button
 *
 *  @param sender The button touched
 */
- (IBAction)fireOnIndex:(id)sender
{
    if ([sender isThereAShip])
    {
        
    }
    else
    {
        [sender setBackgroundColor:[UIColor colorWithRed:0.02 green:0.59 blue:1 alpha:1]];
    }
}
@end
