//
//  MessageListCell.m
//  InsurancePlatform
//
//  Created by kangle1208 on 13-12-10.
//  Copyright (c) 2013年 CENTRIN. All rights reserved.
//


#import "MessageListCell.h"


#define MSG_VIEW_LEFT   62

#define MSG_VIEW_RIGHT  260

#define MSG_VIEW_TOP    30

#define MSG_VIEW_BOTTOM 8


@implementation MessageListCell


@synthesize frdIconView, ownIconView, frdNameLabel, msgBgView, messageView;


- (void)refreshForOwnMsg:(NSMutableArray *)message withSize:(CGSize)size {
    
    ownIconView.image = [UIImage imageNamed:@"chat_bg_own"];
    
    frdIconView.image = nil;
    frdNameLabel.text = nil;

    CGRect frame = messageView.frame;
    frame.origin.x = MSG_VIEW_RIGHT - size.width;
    frame.size = size;
    messageView.frame = frame;

    msgBgView.frame = messageView.frame;
    msgBgView.image = [[UIImage imageNamed:@"chat_bg_own"]
                         resizableImageWithCapInsets:UIEdgeInsetsMake( 23, 23, 7, 23 )];

    [messageView showMessage:message];
}


- (void)refreshForFrdMsg:(NSMutableArray *)message withSize:(CGSize)size {

    [self refreshForFrdMsg:message withName:@"friend" withSize:size];
}

- (void)refreshForFrdMsg:(NSMutableArray *)message withName:(NSString *)name withSize:(CGSize)size
{
    
    frdIconView.image = [UIImage imageNamed:@"chat_bg_frd"];
    frdNameLabel.text = name;
    
    ownIconView.image = nil;
    
    CGRect frame = messageView.frame;
    frame.origin.x = MSG_VIEW_LEFT;
    frame.size = size;
    messageView.frame = frame;
    
    msgBgView.frame = messageView.frame;
    msgBgView.image = [[UIImage imageNamed:@"chat_bg_frd"]
                       resizableImageWithCapInsets:UIEdgeInsetsMake( 23, 23, 7, 23 )];
    
    [messageView showMessage:message];
}


@end
