//
//  AppDelegate.h
//  toutiao.io
//
//  Created by 孙悟空 on 3/21/16.
//  Copyright © 2016 wxh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

extern const NSString* AppDelegateExternString;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

