//
//  DiaryEntry.h
//  Diary
//
//  Created by Ranjay Salmon on 9/28/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


NS_ENUM(int16_t,DiaryEntryMood){
    
    DiaryEntryMoodGood = 0,
    DiaryEntryMoodAverage = 1,
    DiaryEntryMoodBad = 2
    
};

@interface DiaryEntry : NSManagedObject


@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic) int16_t mood;
@property (nonatomic, retain) NSString * location;

@end
