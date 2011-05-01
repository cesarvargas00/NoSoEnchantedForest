//
//  Jaguatirica.m
//  NoSoEnchantedForest
//
//  Created by Wellington Sousa Matos on 29/04/11.
//  Copyright 2011 Mackenzie. All rights reserved.
//

#import "Jaguatirica.h"


@implementation Jaguatirica
-(id)init
{
    self = [super init];
    if (self) {
        CCSprite* _sprite = [[CCSprite alloc] initWithFile:@"jaguatirica.png"];
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
    if ([explorador getVida]>3)
    [explorador setVida:[explorador getVida]-4];
    else 
        [explorador setVida:0];
}


@end
