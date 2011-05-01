//
//  Danakilia.m
//  NoSoEnchantedForest
//
//  Created by Wellington Sousa Matos on 29/04/11.
//  Copyright 2011 Mackenzie. All rights reserved.
//

#import "Danakilia.h"


@implementation Danakilia
-(id)init
{
    self = [super init];
    if (self) {
		//TODO Fotinha do Peixe feio =D
        CCSprite* _sprite = [[CCSprite alloc] initWithFile:@"danakilla.png"];
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
    [explorador setVida:[explorador getVida]+4];
}


@end
