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

@property NSArray<KiloPhotoObject *> *masterPhotoArray;

@property NSArray<KiloPhotoObject *> *firstPhotoAlbum;
@property NSArray<KiloPhotoObject *> *secondPhotoAlbum;

@property NSString *sectionOneHeader;
@property NSString *sectionTwoHeader;



@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sectionOneHeader = @"Section 1";
    self.sectionTwoHeader = @"Section 2";
    
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
    
    KiloPhotoObject *firstPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanbeach" andCategory:@"first" andLocation:@"ocean"];
    KiloPhotoObject *secondPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceancliff" andCategory:@"first" andLocation:@"lake"];
    KiloPhotoObject *thirdPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanfish" andCategory:@"first" andLocation:@"ocean"];
    KiloPhotoObject *fourthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanhouse" andCategory:@"first" andLocation:@"lake"];
    KiloPhotoObject *fifthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanmoon" andCategory:@"first" andLocation:@"ocean"];
    KiloPhotoObject *sixthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceanrandom" andCategory:@"second" andLocation:@"lake"];
    KiloPhotoObject *seventhPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"oceansunset" andCategory:@"second" andLocation:@"lake"];
    KiloPhotoObject *eighthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"sunsetocean" andCategory:@"second" andLocation:@"ocean"];
    KiloPhotoObject *ninthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"waterfall" andCategory:@"second" andLocation:@"lake"];
    KiloPhotoObject *tenthPhoto = [[KiloPhotoObject alloc] initWithPhoto:@"waterfallforest" andCategory:@"second" andLocation:@"ocean"];
    
    self.masterPhotoArray = @[firstPhoto, secondPhoto, thirdPhoto, fourthPhoto, fifthPhoto, sixthPhoto, seventhPhoto, eighthPhoto, ninthPhoto, tenthPhoto];
    
    self.firstPhotoAlbum = @[firstPhoto, secondPhoto, thirdPhoto, fourthPhoto, fifthPhoto];
    
    self.secondPhotoAlbum = @[sixthPhoto, seventhPhoto, eighthPhoto, ninthPhoto, tenthPhoto];
    
}

// MARK: get count for items/cells ; and populate items/cells here

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        
        return self.firstPhotoAlbum.count;
    }
    
    
    else {
        return self.secondPhotoAlbum.count;
    }
    
    
}

- (void) sortPhotoCategory{
    NSMutableArray *categoryOneArray = [NSMutableArray new];
    NSMutableArray *categoryTwoArray = [NSMutableArray new];
    
    
    for (KiloPhotoObject *blah in self.masterPhotoArray) {
        if ([blah.category isEqualToString:@"first"]) {
            [categoryOneArray addObject:blah];
            
        }
    }
    for (KiloPhotoObject *blah2 in self.masterPhotoArray) {
        if ([blah2.category isEqualToString:@"second"]) {
            [categoryTwoArray addObject:blah2];
        }
    }
    
    self.firstPhotoAlbum = categoryOneArray;
    self.sectionOneHeader = @"First Section";
    self.secondPhotoAlbum = categoryTwoArray;
    self.sectionTwoHeader = @"Second Section";
    [self.collectionView reloadData];
    
}

- (void) sortPhotoLocation{
    NSMutableArray *categoryOneArray = [NSMutableArray new];
    NSMutableArray *categoryTwoArray = [NSMutableArray new];
    
    
    for (KiloPhotoObject *blah in self.masterPhotoArray) {
        if ([blah.location isEqualToString:@"ocean"]) {
            [categoryOneArray addObject:blah];
        }
    }
    for (KiloPhotoObject *blah2 in self.masterPhotoArray) {
        if ([blah2.location isEqualToString:@"lake"]) {
            [categoryTwoArray addObject:blah2];
        }
    }
    
    self.firstPhotoAlbum = categoryOneArray;
    self.sectionOneHeader = @"Ocean Location";
    self.secondPhotoAlbum = categoryTwoArray;
    self.sectionTwoHeader = @"Lake Location";
    
    [self.collectionView reloadData];
    
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
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}


- (IBAction)organizePhotos:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        [self sortPhotoCategory];
    } else {
        [self sortPhotoLocation];
    }
}




- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        KiloPhotoSectionHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionViewSectionHeader" forIndexPath:indexPath];
        
        if (indexPath.section == 0) {
            headerView.sectionHeaderLabel.text = self.sectionOneHeader;
            reusableview = headerView;
        } else {
            headerView.sectionHeaderLabel.text = self.sectionTwoHeader;
            reusableview = headerView;
        }
        
        
    }
    return reusableview;
}




@end
