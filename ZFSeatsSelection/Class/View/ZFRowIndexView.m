//
//  ZFRowIndexView.m
//  
//
//  Created by qq 316917975  on 16/1/28.
//  Copyright © 2016年 qq 316917975 . All rights reserved.
//

#import "ZFRowIndexView.h"
#import "UIView+Extension.h"
#import "ZFSeatsModel.h"
@implementation ZFRowIndexView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.5];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.layer.cornerRadius = self.width * 0.5;
    self.layer.masksToBounds = YES;
}

-(void)setHeight:(CGFloat)height{
    [super setHeight:height];
    [self setNeedsDisplay];
}

-(void)setIndexsArray:(NSMutableArray *)indexsArray{
    
    _indexsArray = indexsArray;
    
    [self setNeedsDisplay];
}
//画索引条
- (void)drawRect:(CGRect)rect {
    
    NSDictionary *attributeName = @{NSFontAttributeName: [UIFont systemFontOfSize:10],NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    CGFloat NuomberTitleH = (self.height - 2 * 10) / self.indexsArray.count;
    
    [self.indexsArray enumerateObjectsUsingBlock:^(ZFSeatsModel *seatsModel, NSUInteger idx, BOOL *stop) {
        
            CGSize strsize =  [seatsModel.rowId sizeWithAttributes:attributeName];

            [seatsModel.rowId drawAtPoint:CGPointMake(self.width * 0.5 - strsize.width  * 0.5,10 + idx * NuomberTitleH + NuomberTitleH  * 0.5 - strsize.height  * 0.5) withAttributes:attributeName];
        
    }];

}


@end
