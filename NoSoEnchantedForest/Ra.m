//
//  Ra.m
//  NoSoEnchantedForest
//
//  Created by Wellington Sousa Matos on 01/05/11.
//  Copyright 2011 Mackenzie. All rights reserved.
//

#import "Ra.h"


@implementation Ra
-(id)init
{
    self = [super init];
    if (self) {
        CCSprite* _sprite = [[CCSprite alloc] initWithFile:@"sapo.png"];
        sprite=[_sprite retain];
        [_sprite release];
    }
    return self; 
}

- (void)dealloc
{
    [super dealloc];
}

-(void)efeito:(Explorador*)explorador{
    if([explorador getVida] >1)
    [explorador setVida:[explorador getVida]-2];
     else [explorador setVida:0];
}

@end
