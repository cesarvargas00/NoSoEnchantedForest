//
//  HelloWorldLayer.h
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 18/04/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import <Foundation/Foundation.h>
#import "Floresta.h"
// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    @protected
    NSMutableArray* arraySprites;
    Floresta *forest;
    CCSprite* sprite;
    Explorador* explorador;
    NSMutableArray* arrayExplorador;
    CGSize size;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;


-(BOOL)ccKeyDown:(NSEvent *)event;
-(void)gameLoop:(ccTime)dt;

@end
