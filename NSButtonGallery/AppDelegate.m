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
    for (int i = 1; i <= 15; i++) {
        int i2;
        NSBezelStyle bezelStyle;

        if (i == 3 || i == 4) {
            continue;
        } else if (i > 4) {
            bezelStyle = (NSBezelStyle) i;
            i2 = i - 2;
        } else {
            bezelStyle = (NSBezelStyle) i;
            i2 = i;
        }

        for (int k = 0; k <= 7; k++) {
            NSButtonType buttonType = (NSButtonType) k;

            NSButton *button = [[NSButton alloc] initWithFrame:NSMakeRect(40 + 100 * k, -50 + 70 * i2, 80, 50)];
            if (bezelStyle == NSBezelStyleDisclosure || bezelStyle == NSBezelStyleHelpButton || bezelStyle == NSBezelStyleRoundedDisclosure) {
                [button setTitle:@""];
            } else if (bezelStyle == NSBezelStyleCircular) {
                [button setTitle:@"B"];
                [button setAlternateTitle:@"X"];
            } else {
                [button setTitle:@"Button"];
                [button setAlternateTitle:@"Boom!"];
            }
            [button setBezelStyle:bezelStyle];
            [button setButtonType:buttonType];
            [self.window.contentView addSubview:button];
        }
    }
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
