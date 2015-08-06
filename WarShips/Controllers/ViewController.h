//
//  ViewController.h
//  WarShips
//
//  Created by Thibault Le Cornec on 04/08/15.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>
{
    int nbShots;                // Nombre de tirs effectué par le joueur
    int nbPartsOfShipsTouched;   // Nombre de fois qu'un tir a touché un bateau
    int nbShipsSunken;           // Nombre de bateaux coulés
}

@property (strong, nonatomic) IBOutlet UILabel *labelNbShots;
@property (strong, nonatomic) IBOutlet UILabel *labelNbPartsOfShipsTouched;
@property (strong, nonatomic) IBOutlet UILabel *labelNbShipsSunken;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtons;


- (IBAction)fireOnIndex:(id)sender;
- (IBAction)newGame;

@end

