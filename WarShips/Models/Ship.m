//
//  Ship.m
//  WarShips
//
//  Created by Julien Poumarat on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import "Ship.h"

@implementation Ship


-(id) initWithType:(NSInteger)_Type // Constructeur de Ship
{
    self = [super init];
    lengthTab= @[@"2", @"3", @"4", @"5"]; // Array de la taille des bateaux
    _Length = [lengthTab[_Type] integerValue]; // initialistaion de la longueur d'un bateau
return self;
}

-(void) affectship:(BOOL)IsVertical originpoint:(NSInteger)OriginPoint{ // Méthode d'affectation des paramètres d'un objet Ship
    _NbCaseTouch = 0; // Initialisation des nombres de touches
    _IsVertical = IsVertical; // Intialisation de la position du bateau
    _OriginPoint = OriginPoint; // Initialisation du point d'origine
    
}
@end
