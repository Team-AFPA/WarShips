//
//  MenuController.h
//  WarShips
//
//  Created by François Juteau on 10/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

// =================== //
// --- PROPERTIES ---- //
// =================== //
@property (strong, nonatomic) IBOutlet UISwitch *switchHeadShot;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerLevels;
@property (strong, nonatomic) IBOutlet UISwitch *switchShipsMustMove;
@end
