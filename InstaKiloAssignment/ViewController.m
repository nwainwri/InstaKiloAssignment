//
//  ViewController.m
//  InstaKiloAssignment
//
//  Created by Nathan Wainwright on 2018-08-15.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

#import "ViewController.h"
#import "KiloPhotoObject.h"
#import "PhotoCell.h"
#import "KiloPhotoSectionHeaderCollectionReusableView.h"



@interface ViewController ()

@property NSArray<KiloPhotoObject *> *firstPhotoAlbum;
@property NSArray<KiloPhotoObject *> *secondPhotoAlbum;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self turnOnPhotoAlbum];
    
    
//    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.KiloPhotoAlbumViewPort;
    

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: init photo album array

- (void) turnOnPhotoAlbum{
    
        KiloPhotoObject *firstPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanbeach" andCategory:@"second" andLocation:@"ocean"];
        KiloPhotoObject *secondPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceancliff" andCategory:@"first" andLocation:@"lake"];
        KiloPhotoObject *thirdPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanfish" andCategory:@"second" andLocation:@"ocean"];
        KiloPhotoObject *fourthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanhouse" andCategory:@"first" andLocation:@"lake"];
        KiloPhotoObject *fifthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanmoon" andCategory:@"second" andLocation:@"ocean"];
        KiloPhotoObject *sixthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanrandom" andCategory:@"first" andLocation:@"lake"];
        KiloPhotoObject *seventhPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceansunset" andCategory:@"second" andLocation:@"lake"];
        KiloPhotoObject *eighthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"sunsetocean" andCategory:@"first" andLocation:@"ocean"];
        KiloPhotoObject *ninthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"waterfall" andCategory:@"second" andLocation:@"lake"];
        KiloPhotoObject *tenthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"waterfallforest" andCategory:@"first" andLocation:@"ocean"];

    self.firstPhotoAlbum = @[firstPhoto, secondPhoto, thirdPhoto, fourthPhoto, fifthPhoto];
    self.secondPhotoAlbum = @[sixthPhoto, seventhPhoto, eighthPhoto, ninthPhoto, tenthPhoto];

}

// MARK: get count for items/cells ; and populate items/cells here

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.firstPhotoAlbum.count;
    } else {
        return self.secondPhotoAlbum.count;
    }
    
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoViewCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        KiloPhotoObject *currentPhoto = self.firstPhotoAlbum[indexPath.item];
        cell.imageKiloPhoto.image = [UIImage imageNamed:currentPhoto.photo];
        return cell;
    } else {
        KiloPhotoObject *currentPhoto = self.secondPhotoAlbum[indexPath.item];
        cell.imageKiloPhoto.image = [UIImage imageNamed:currentPhoto.photo];
        return cell;
    }
        
    
    
//
//
//
//
//    if ((indexPath.section == 0) && ([currentPhoto.category isEqualToString:@"first"])){
//
//    } else {
//        return cell;
//    }
//
    
    
    
//    if ([currentPhoto.category isEqualToString:@"first"]){
//        ///header first
//        if (indexPath.section == 0){
//            return cell;
//        } else {
//            //
//        }
//
//    } else {
//        if (indexPath.section == 1) {
//            return cell;
//        } else {
//            //
//        }
//    }
//
//    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//
//
//
//}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        KiloPhotoSectionHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionViewSectionHeader" forIndexPath:indexPath];
        
        if (indexPath.section == 0) {
            headerView.sectionHeaderLabel.text = @"FIRST";
            reusableview = headerView;
        } else {
            headerView.sectionHeaderLabel.text = @"SECOND";
            reusableview = headerView;
        }
        
        
    }
    return reusableview;
}




@end
