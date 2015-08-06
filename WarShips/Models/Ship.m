//
//  Ship.m
//  WarShips
//
//  Created by Julien Poumarat on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import "Ship.h"

@implementation Ship

static NSArray *lengthTab; // Array de la taille des bateaux


-(id) initWithType:(NSInteger)_type // Constructeur de Ship
{
    self = [super init];
    
    if (self)
    {
        if (lengthTab == nil)
        {
            lengthTab = [NSArray arrayWithObjects:@"2", @"3", @"4", @"5", nil];
        }
        
        _idType = _type;
        _length = [lengthTab[_idType] integerValue]; // initialistaion de la longueur d'un bateau

    }

    return self;
}

-(void) affectShip:(BOOL)isVertical originPoint:(NSInteger)originPoint{ // Méthode d'affectation des paramètres d'un objet Ship
    _nbCaseTouch = 0; // Initialisation des nombres de touches
    _isVertical = isVertical; // Intialisation de la position du bateau
    _originPoint = originPoint; // Initialisation du point d'origine
    
}

@end
