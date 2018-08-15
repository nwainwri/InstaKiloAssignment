//
//  KiloPhotoObject.h
//  InstaKiloAssignment
//
//  Created by Nathan Wainwright on 2018-08-15.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KiloPhotoObject : NSObject

@property (nonatomic, weak) NSString *photo;

- (instancetype)initWithPhoto:(NSString *)photo;


@end
