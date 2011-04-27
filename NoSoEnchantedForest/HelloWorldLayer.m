//
//  HelloWorldLayer.m
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 18/04/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#define tamanho 5
#import "HelloWorldLayer.h"
#import "Floresta.h"
#define duracao 0.1

//Variáveis Globais de direção
BOOL virarEsquerda = NO;
BOOL virarDireita = NO;
BOOL virarBaixo = NO;
BOOL virarCima = NO;




// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		forest = [[Floresta alloc]init];
        explorador = [[Explorador alloc]init];
        
        //Cria um array de Sprites com os Sprites da floresta.
        arraySprites = [NSMutableArray arrayWithCapacity:tamanho];
        for (int i=0;i<tamanho;i++)
            [arraySprites addObject:[NSMutableArray array]];
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++){
                sprite=[[forest getMatoX:i Y:j]getSprite];
                [[arraySprites objectAtIndex:i]addObject:sprite];
                [sprite release];
            }
        
        // ask director the the window size
        size = [[CCDirector sharedDirector] winSize];
        
        //Seta a posição inicial dos Sprites na tela.
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++)
                [[[arraySprites objectAtIndex:i]objectAtIndex:j] setPosition:ccp( size.width /(tamanho+1)*(i+1) , size.height/(tamanho+1)*(j+1) )];
        
        //Bota o EXPLORADOR NA TELA!
        [[explorador getSprite] setPosition:ccp( size.width /(tamanho+1) , size.height/(tamanho+1))];
        
        //Adiciona os Sprites como filhos.
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++)
                if([[arraySprites objectAtIndex:i]objectAtIndex:j]!=Nil)
                    [self addChild:[[arraySprites objectAtIndex:i]objectAtIndex:j]];
        //Seta o explorador como filho
        [self addChild:[explorador getSprite]];
        //Começa o loop
        NSLog(@"%lu",[[forest getMatoX:0 Y:0] retainCount]);
        [[CCEventDispatcher sharedDispatcher] addKeyboardDelegate:self priority:0];
        [self schedule:@selector(gameLoop:)];
    }
    
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

-(BOOL)ccKeyDown:(NSEvent *)event{
    //123 esquerdo
    //124 direito
    //125 baixo
    //126 cima
    if ([event keyCode]==123) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@",[event characters]);
        virarEsquerda = YES;
    }
    else if ([event keyCode]==124) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@!",[event characters]);
        virarDireita = YES;
    }
    else if ([event keyCode]==125) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@!",[event characters]);
        virarBaixo = YES;
    }
    else if ([event keyCode]==126) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@!",[event characters]);
        virarCima = YES;
    }
    return YES;
}

-(void)gameLoop:(ccTime)dt
{
    
    //LOOP DO JOGO
    if (virarDireita) {
        //Move explorador para a direita
        if([explorador getPos].x < tamanho){
            [explorador setPosX:[explorador getPos].x + 1 Y:[explorador getPos].y];
            id actionMove = [CCMoveTo actionWithDuration:duracao
                                                position:ccp(size.width /(tamanho+1)*[explorador getPos].x,  size.height/(tamanho+1)*[explorador getPos].y)];
            //Realiza efeito no explorador
           // Mato * mato = [forest getMatoX:0 Y:0];
            //ERROR TRYING TO ACCESS THIS!!!!!!
           NSLog(@"%lu",[[forest getMatoX:0 Y:0] retainCount]);
            NSLog(@"%d",[explorador getVida]);
            [[explorador getSprite] runAction:actionMove];
        }
        virarDireita=NO;
    }
    else  if (virarEsquerda) {
        //Move explorador para a esquerda
        if([explorador getPos].x > 1){
            [explorador setPosX:[explorador getPos].x - 1 Y:[explorador getPos].y];
            id actionMove = [CCMoveTo actionWithDuration:duracao 
                                                position:ccp(size.width /(tamanho+1)*[explorador getPos].x,  size.height/(tamanho+1)*[explorador getPos].y)];
            
            [[explorador getSprite] runAction:actionMove];
        }
        virarEsquerda=NO;
    }
    else  if (virarCima) {
        //Move explorador para cima
        if([explorador getPos].y < tamanho){
            [explorador setPosX:[explorador getPos].x Y:[explorador getPos].y + 1];
            id actionMove = [CCMoveTo actionWithDuration:duracao
                                                position:ccp(size.width /(tamanho+1)*[explorador getPos].x,  size.height/(tamanho+1)*[explorador getPos].y)];
            
            [[explorador getSprite] runAction:actionMove];
        }
        virarCima=NO;
    }
    else  if (virarBaixo) {
        //Move explorador para a baixo
        if([explorador getPos].y >1){
            [explorador setPosX:[explorador getPos].x Y:[explorador getPos].y - 1];
            id actionMove = [CCMoveTo actionWithDuration:duracao
                                                position:ccp(size.width /(tamanho+1)*[explorador getPos].x,  size.height/(tamanho+1)*[explorador getPos].y)];
            [[explorador getSprite] runAction:actionMove];
        }
        
        virarBaixo=NO;
        
    }
}


@end

