//
//  ViewController.h
//  WarShips
//
//  Created by Thibault Le Cornec on 04/08/15.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"

@interface ViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) DataManager *sharedDataManager;

@property BOOL shouldHideLabelLevel;

@property (strong, nonatomic) IBOutlet UILabel *labelNbShots;
@property (strong, nonatomic) IBOutlet UILabel *labelNbPartsOfShipsTouched;
@property (strong, nonatomic) IBOutlet UILabel *labelNbShipsSunken;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtons;


- (IBAction)fireOnIndex:(id)sender;
- (IBAction)newGame;

@end

