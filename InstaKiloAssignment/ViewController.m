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



@interface ViewController ()

@property NSArray<KiloPhotoObject *> *photoAlbum;


//@property (weak, nonatomic) IBOutlet UICollectionView *KiloPhotoAlbumViewPort;



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
    KiloPhotoObject *firstPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanbeach"];
    KiloPhotoObject *secondPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceancliff"];
    KiloPhotoObject *thirdPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanfish"];
    KiloPhotoObject *fourthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanhouse"];
    KiloPhotoObject *fifthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanmoon"];
    KiloPhotoObject *sixthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanrandom"];
    KiloPhotoObject *seventhPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceansunset"];
    KiloPhotoObject *eighthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"sunsetocean"];
    KiloPhotoObject *ninthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"waterfall"];
    KiloPhotoObject *tenthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"waterfallforest"];
    
    self.photoAlbum = @[firstPhoto, secondPhoto, thirdPhoto, fourthPhoto, fifthPhoto, sixthPhoto, seventhPhoto, eighthPhoto, ninthPhoto, tenthPhoto];
}

// MARK: get count for items/cells ; and populate items/cells here

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photoAlbum.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoViewCell" forIndexPath:indexPath];
    
    KiloPhotoObject *currentPhoto = self.photoAlbum[indexPath.item];
    
    cell.imageKiloPhoto.image = [UIImage imageNamed:currentPhoto.photo];
    
    return cell;
}



@end
