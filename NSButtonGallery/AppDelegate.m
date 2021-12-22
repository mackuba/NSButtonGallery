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
    return @[@"Network", @"Accounts", @"Columns1", @"Columns2", @"Columns3", @"Columns4"];
}

- (NSArray<NSToolbarItemIdentifier> *)toolbarAllowedItemIdentifiers:(NSToolbar *)toolbar {
    return @[@"Network", @"Accounts", @"Columns1", @"Columns2", @"Columns3", @"Columns4"];
}

- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSToolbarItemIdentifier)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag {
    
    NSToolbarItem *item = [[NSToolbarItem alloc] initWithItemIdentifier:itemIdentifier];
    item.action = @selector(executeAction:);
    item.label = itemIdentifier;
    item.target = self;
    item.paletteLabel = itemIdentifier;

    if (@available(macOS 10.15, *)) {
        item.bordered = ([itemIdentifier isEqualTo:@"Accounts"] || [itemIdentifier isEqualTo:@"Columns2"] || [itemIdentifier isEqualTo:@"Columns4"]);
    }

    if ([itemIdentifier isEqualTo:@"Network"]) {
        item.image = [NSImage imageNamed:NSImageNameNetwork];
    } else if ([itemIdentifier isEqualTo:@"Accounts"]) {
        item.image = [NSImage imageNamed:NSImageNameUserAccounts];
    } else {
        NSButton *button = [[NSButton alloc] init];
        button.target = self;
        button.action = @selector(executeAction:);
        button.image = [NSImage imageNamed:NSImageNameColumnViewTemplate];
        button.bordered = ([itemIdentifier isEqualTo:@"Columns1"] || [itemIdentifier isEqualTo:@"Columns2"]);
        button.bezelStyle = NSBezelStyleTexturedRounded;
        item.view = button;
    }
    
    return item;
}

- (void)executeAction:(id)sender {
    
}

@end
