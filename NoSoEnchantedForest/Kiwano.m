//
//  Kiwano.m
//  NoSoEnchantedForest
//
//  Created by Wellington Sousa Matos on 01/05/11.
//  Copyright 2011 Mackenzie. All rights reserved.
//

#import "Kiwano.h"


@implementation Kiwano
-(id)init
{
    self = [super init];
    if (self) {
		//TODO Fotinha do maxixe amarelo
        CCSprite* _sprite = [[CCSprite alloc] initWithFile:@"perigo.png"];
        sprite=[_sprite retain];
        [_sprite release];
    }
    return self; 
}

- (void)dealloc
{
    [super dealloc];
    [sprite release];
}

-(void)efeito:(Explorador*)explorador{
    [explorador setVida:[explorador getVida]+2];
     }
	 
	 

@end
