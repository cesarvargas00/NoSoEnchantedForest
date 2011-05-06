//
//  MyClass.m
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 06/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Savana.h"
#import "GameOverScene.h"


#define duracao 0.8
//Variáveis Globais de direção
BOOL turnLeft1= NO;
BOOL turnRight1= NO;
BOOL goDown1 = NO;
BOOL goUp1= NO;
//BOOL moving=NO;

@implementation Savana
@synthesize layer = _layer;
- (id)init
{
    self = [super init];
    if (self) {
        self.layer = [SavanaLayer node];
        [self addChild:_layer];
    }
     return self;
}

- (void)dealloc
{
    [_layer release];
    _layer = nil;
    [super dealloc];
}

@end

@implementation SavanaLayer

- (id)init
{ 
    [[CCEventDispatcher sharedDispatcher] addKeyboardDelegate:self priority:0];
    
    self = [super init];
    if ((self=[super initWithColor:ccc4(5,144,22,255)])) {
        forest = [[Floresta2 alloc]init];
        explorer= [[Explorador alloc]init];
        hearts = [[NSMutableArray alloc]init];
        
        
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
                [[[arraySprites objectAtIndex:i]objectAtIndex:j] setPosition:ccp( size.width /(tamanho+1)*(i+1) , size.height/(tamanho+2)*(j+1) )];
        
        //Bota o EXPLORADOR NA TELA!
        [[explorer getSprite] setPosition:ccp( size.width /(tamanho+1) , size.height/(tamanho+1))];
        
        //Adiciona os Sprites como filhos.
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++)
                if([[arraySprites objectAtIndex:i]objectAtIndex:j]!=Nil)
                    [self addChild:[[arraySprites objectAtIndex:i]objectAtIndex:j]];
        
        //VISIBILIDADE INICIAL ZERO:
        
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++)
                [[[arraySprites objectAtIndex:i]objectAtIndex:j] setVisible:NO];
        
        //Seta visibilidade da CIDADE para YES
        
        [[[arraySprites objectAtIndex:tamanho-1]objectAtIndex:tamanho-1] setVisible:YES];
        //Preenche o vetor de corações:
        for (int i=0; i<5; i++){
            CCSprite* heart =[[CCSprite alloc]initWithFile:@"heart.png"];
            [hearts addObject:heart];
            [heart release];
        }
        //Posição inicial dos corações:
        for(int i=0;i<5;i++)
            [[hearts objectAtIndex:i] setPosition:ccp( (size.width-50)-50*i , size.height-20)];
        
        //Coloca o vetor de corações na tela:
        for (int i=0; i<5; i++){
            [self addChild:[hearts objectAtIndex:i]];
        }
        //Seta o explorador como filho
        [self addChild:[explorer getSprite]];
        //Começa o loop
        [self schedule:@selector(gameLoop:)];
    }
    
    return self;
}

- (void)dealloc
{
    [forest release];
    [explorer release];
    [hearts release];
    [super dealloc];
}


-(void)gameLoop:(ccTime)dt
{
    
    //LOOP DO JOGO
    if (turnRight1) {
        //Move explorador para a direita - MOVES EXPLORER TO THE RIGHT
        if([explorer getPos].x < tamanho){
            [explorer setPosX:[explorer getPos].x + 1 Y:[explorer getPos].y];
            //Mostra o Mato
            [[[forest getMatoX:[explorer getPos].x-1 Y:[explorer getPos].y-1]getSprite]setVisible: YES];
            [[explorer getSprite] runAction:[CCMoveTo actionWithDuration:duracao
                                                                position:ccp(size.width /(tamanho+1)*[explorer getPos].x,  size.height/(tamanho+2)*[explorer getPos].y)]];
        }
        turnRight1=NO;
        if(![[forest getMatoX:[explorer getPos].x-1 Y:[explorer getPos].y-1]isExplored])
            [self updateHearts];
    }
    else  if (turnLeft1) {
        //Move explorador para a esquerda - MOVES EXPLORER TO THE LEFT
        if([explorer getPos].x > 1){
            [explorer setPosX:[explorer getPos].x - 1 Y:[explorer getPos].y];
            //Mostra o Mato
            [[[forest getMatoX:[explorer getPos].x-1 Y:[explorer getPos].y-1]getSprite]setVisible: YES];
            [[explorer getSprite] runAction:[CCMoveTo actionWithDuration:duracao 
                                                                position:ccp(size.width /(tamanho+1)*[explorer getPos].x,  size.height/(tamanho+2)*[explorer getPos].y)]];
        }
        turnLeft1=NO;
        if(![[forest getMatoX:[explorer getPos].x-1 Y:[explorer getPos].y-1]isExplored])
            [self updateHearts];
    }
    else  if (goUp1) {
        //Move explorador para cima  - MOVES EXPLORER UP
        if([explorer getPos].y < tamanho){
            [explorer setPosX:[explorer getPos].x Y:[explorer getPos].y + 1];
            //Mostra o Mato
            [[[forest getMatoX:[explorer getPos].x-1 Y:[explorer getPos].y-1]getSprite]setVisible: YES];
            [[explorer getSprite] runAction:[CCMoveTo actionWithDuration:duracao
                                                                position:ccp(size.width /(tamanho+1)*[explorer getPos].x,  size.height/(tamanho+2)*[explorer getPos].y)]];
        }
        goUp1=NO;
        if(![[forest getMatoX:[explorer getPos].x-1 Y:[explorer getPos].y-1]isExplored])
            [self updateHearts];
    }
    else  if (goDown1) {
        //Move explorador para baixo  - MOVES EXPLORER DOWN
        if([explorer getPos].y >1){
            [explorer setPosX:[explorer getPos].x Y:[explorer getPos].y - 1];
            //Mostra o Mato
            [[[forest getMatoX:[explorer getPos].x-1 Y:[explorer getPos].y-1]getSprite]setVisible: YES];
            
            [[explorer getSprite] runAction:[CCMoveTo actionWithDuration:duracao
                                                                position:ccp(size.width /(tamanho+1)*[explorer getPos].x,  size.height/(tamanho+2)*[explorer getPos].y)]];
        }
        goDown1=NO;
        if(![[forest getMatoX:[explorer getPos].x-1 Y:[explorer getPos].y-1]isExplored])
            [self updateHearts];
    }
}


-(void)updateHearts{
    //Atualiza os corações
    if([explorer getPos].x==tamanho && [explorer getPos].y==tamanho){
        GameOverScene *gameOverScene = [GameOverScene node];
        [gameOverScene.layer.label setString:@"Você Ganhou!!!"];
        [[CCDirector sharedDirector] replaceScene:gameOverScene];
    }
    else{
        if([explorer getVida]<1)
        {
            GameOverScene *gameOverScene = [GameOverScene node];
            [gameOverScene.layer.label setString:@"Você Perdeu!!!"];
            [[CCDirector sharedDirector] replaceScene:gameOverScene];
        }
        if([explorer getVida]>0 && [explorer getVida]<6){
            [[forest getMatoX:[explorer getPos].x-1 Y:[explorer getPos].y-1] efeito:explorer];
            [[forest getMatoX:[explorer getPos].x-1 Y:[explorer getPos].y-1] setExplored:YES];
            
            for(int i=0;i<5;i++){
                [[hearts objectAtIndex:i
                  ]setVisible:NO];
            }
            for(int i=0;i<[explorer getVida];i++){
                [[hearts objectAtIndex:i
                  ]setVisible:YES];
            }
        }
    }
}

-(BOOL)ccKeyDown:(NSEvent *)event{
    if ([event keyCode]==123) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@",[event characters]);
        turnLeft1 = YES;
    }
    else if ([event keyCode]==124) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@!",[event characters]);
        turnRight1 = YES;
    }
    else if ([event keyCode]==125) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@!",[event characters]);
        goDown1 = YES;
    }
    else if ([event keyCode]==126) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@!",[event characters]);
        goUp1 = YES;
    }
    return YES;
}



@end

