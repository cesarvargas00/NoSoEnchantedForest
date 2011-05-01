//
//  Marula.m
//  NoSoEnchantedForest
//
//  Created by Wellington Sousa Matos on 29/04/11.
//  Copyright 2011 Mackenzie. All rights reserved.
//

#import "Marula.h"


@implementation Marula
-(id)init
{
    self = [super init];
    if (self) {
		//TODO Fotinha da marula
        CCSprite* _sprite = [[CCSprite alloc] initWithFile:@"marula.png"];
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
    [explorador setVida:[explorador getVida]+1];
}


@end
