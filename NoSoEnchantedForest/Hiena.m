//
//  Hiena.m
//  NoSoEnchantedForest
//
//  Created by Wellington Sousa Matos on 01/05/11.
//  Copyright 2011 Mackenzie. All rights reserved.
//

#import "Hiena.h"


@implementation Hiena
-(id)init
{
    self = [super init];
    if (self) {
		//TODO Fotinha da carnicenta
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
    [explorador setVida:[explorador getVida]-3];
}


@end
