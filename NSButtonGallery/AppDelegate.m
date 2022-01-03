//
//  AppDelegate.m
//  NSButtonGallery
//
//  Created by Jakub Suder on 15/12/2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NSArray<NSToolbarItemIdentifier> *)toolbarDefaultItemIdentifiers:(NSToolbar *)toolbar {
    return [self toolbarAllowedItemIdentifiers:toolbar];
}

- (NSArray<NSToolbarItemIdentifier> *)toolbarAllowedItemIdentifiers:(NSToolbar *)toolbar {
    return @[@"Network", @"Accounts1", @"Accounts2", @"Accounts3", @"Accounts4", @"Columns1", @"Columns2", @"Columns3", @"Columns4", @"Columns1a", @"Columns2a", @"Columns3a", @"Columns4a", @"Columns1b", @"Columns2b", @"Columns3b", @"Columns4b"];
}

- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSToolbarItemIdentifier)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag {
    
    NSToolbarItem *item = [[NSToolbarItem alloc] initWithItemIdentifier:itemIdentifier];
    item.action = @selector(executeAction:);
    item.label = itemIdentifier;
    item.target = self;
    item.paletteLabel = itemIdentifier;

    if (@available(macOS 10.15, *)) {
        item.bordered = ([itemIdentifier hasPrefix:@"Accounts"] || [itemIdentifier hasPrefix:@"Columns2"] || [itemIdentifier hasPrefix:@"Columns4"]);
    }

    if ([itemIdentifier isEqualTo:@"Network"]) {
        item.image = [NSImage imageNamed:NSImageNameNetwork];
    } else if ([itemIdentifier hasPrefix:@"Accounts"]) {
        item.image = [NSImage imageNamed:NSImageNameUserAccounts];
        if ([itemIdentifier isEqualTo:@"Accounts1"]) {
            item.minSize = CGSizeMake(30, 20);
            item.maxSize = CGSizeMake(30, 20);
        } else if ([itemIdentifier isEqualTo:@"Accounts2"]) {
            item.minSize = CGSizeMake(50, 60);
            item.maxSize = CGSizeMake(50, 60);
        } else if ([itemIdentifier isEqualTo:@"Accounts3"]) {
            item.minSize = CGSizeMake(40, 60);
            item.maxSize = CGSizeMake(40, 60);
        }
    } else {
        NSButton *button = [[NSButton alloc] init];
        button.target = self;
        button.action = @selector(executeAction:);
        button.image = [NSImage imageNamed:NSImageNameColumnViewTemplate];
        button.bordered = YES;
        button.bezelStyle = NSBezelStyleTexturedRounded;
        item.view = button;

        int i = [[[itemIdentifier substringFromIndex:7] substringToIndex:1] intValue];
        int h = 20 * i - 10;

        NSLog(@"%d %d", i, h);

        if ([itemIdentifier hasSuffix:@"a"]) {
            button.frame = NSMakeRect(0, 0, 50, h);
        } else if ([itemIdentifier hasSuffix:@"b"]) {
            item.minSize = CGSizeMake(50, h);
            item.maxSize = CGSizeMake(50, h);
        }
    }
    
    return item;
}

- (void)executeAction:(id)sender {
    
}

@end
