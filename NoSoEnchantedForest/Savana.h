//
//  MyClass.h
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 06/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelloWorldLayer.h"
#import "Floresta2.h"


@interface SavanaLayer : CCLayerColor {

@protected
    NSMutableArray* arraySprites;
    Floresta2 *forest;
    CCSprite* sprite;
    Explorador* explorer;
    CGSize size;
    NSMutableArray* hearts;
}
-(BOOL)ccKeyDown:(NSEvent *)event;
-(void)gameLoop:(ccTime)dt;
-(void)updateHearts;
@end
@interface Savana : CCScene {
@private
    SavanaLayer *_layer;
}
@property (nonatomic, retain) SavanaLayer *layer;
@end

