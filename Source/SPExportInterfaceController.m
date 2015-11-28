//
//  SPExportInterfaceController.m
//  sequel-pro
//
//  Created by Stuart Connolly (stuconnolly.com) on March 31, 2012.
//  Copyright (c) 2012 Stuart Connolly. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//
//  More info at <https://github.com/sequelpro/sequelpro>

#import "SPExportInterfaceController.h"

@implementation SPExportController (SPExportInterfaceController)

/**
 * Resizes the export window's height by the supplied delta, while retaining the position of 
 * all interface controls to accommodate the custom filename view.
 *
 * @param delta The height delta for which the height should be adjusted for.
 */
- (void)_resizeWindowForCustomFilenameViewByHeightDelta:(NSInteger)delta
{
	NSAutoresizingMaskOptions popUpMask              = [exportInputPopUpButton autoresizingMask];
	NSAutoresizingMaskOptions fileCheckMask          = [exportFilePerTableCheck autoresizingMask];
	NSAutoresizingMaskOptions scrollMask             = [exportTablelistScrollView autoresizingMask];
	NSAutoresizingMaskOptions buttonBarMask          = [exportTableListButtonBar autoresizingMask];
	NSAutoresizingMaskOptions buttonMask             = [exportCustomFilenameViewButton autoresizingMask];
	NSAutoresizingMaskOptions textFieldMask          = [exportCustomFilenameViewLabelButton autoresizingMask];
	NSAutoresizingMaskOptions customFilenameViewMask = [exportCustomFilenameView autoresizingMask];
	NSAutoresizingMaskOptions tabBarMask             = [accessoryViewContainer autoresizingMask];
	
	NSRect frame = [[self window] frame];
	
	// what is this about?
//	if (frame.size.height > 600 && delta > heightOffset1) {
//		frame.origin.y += [exportCustomFilenameView frame].size.height;
//		frame.size.height -= [exportCustomFilenameView frame].size.height;
//		
//		[[self window] setFrame:frame display:YES animate:YES];
//	}
	
	[exportInputPopUpButton setAutoresizingMask:NSViewNotSizable | NSViewMaxYMargin];
	[exportFilePerTableCheck setAutoresizingMask:NSViewNotSizable | NSViewMaxYMargin];
	[exportTablelistScrollView setAutoresizingMask:NSViewNotSizable | NSViewMaxYMargin];
	[exportTableListButtonBar setAutoresizingMask:NSViewNotSizable | NSViewMaxYMargin];
	[accessoryViewContainer setAutoresizingMask:NSViewNotSizable | NSViewMaxYMargin];
	[exportCustomFilenameViewButton setAutoresizingMask:NSViewNotSizable | NSViewMinYMargin];
	[exportCustomFilenameViewLabelButton setAutoresizingMask:NSViewNotSizable | NSViewMinYMargin];
	[exportCustomFilenameView setAutoresizingMask:NSViewNotSizable | NSViewMinYMargin];
	
	NSInteger newMinHeight = (windowMinHeigth - heightOffset1 + delta < windowMinHeigth) ? windowMinHeigth : windowMinHeigth - heightOffset1 + delta;
	
	[[self window] setMinSize:NSMakeSize(windowMinWidth, newMinHeight)];
	
	frame.origin.y += heightOffset1;
	frame.size.height -= heightOffset1;
	
	heightOffset1 = delta;
	
	frame.origin.y -= heightOffset1;
	frame.size.height += heightOffset1;
	
	[[self window] setFrame:frame display:YES animate:YES];
	
	[exportInputPopUpButton setAutoresizingMask:popUpMask];
	[exportFilePerTableCheck setAutoresizingMask:fileCheckMask];
	[exportTablelistScrollView setAutoresizingMask:scrollMask];
	[exportTableListButtonBar setAutoresizingMask:buttonBarMask];
	[exportCustomFilenameViewButton setAutoresizingMask:buttonMask];
	[exportCustomFilenameViewLabelButton setAutoresizingMask:textFieldMask];
	[exportCustomFilenameView setAutoresizingMask:customFilenameViewMask];
	[accessoryViewContainer setAutoresizingMask:tabBarMask];
}

/**
 * Resizes the export window's height by the supplied delta, while retaining the position of 
 * all interface controls to accommodate the advanced options view.
 *
 * @param delta The height delta for which the height should be adjusted for.
 */
- (void)_resizeWindowForAdvancedOptionsViewByHeightDelta:(NSInteger)delta
{
	NSAutoresizingMaskOptions scrollMask        = [exportTablelistScrollView autoresizingMask];
	NSAutoresizingMaskOptions buttonBarMask     = [exportTableListButtonBar autoresizingMask];
	NSAutoresizingMaskOptions tabBarMask        = [exportTypeTabBar autoresizingMask];
	NSAutoresizingMaskOptions optionsTabBarMask = [accessoryViewContainer autoresizingMask];
	NSAutoresizingMaskOptions buttonMask        = [exportAdvancedOptionsViewButton autoresizingMask];
	NSAutoresizingMaskOptions textFieldMask     = [exportAdvancedOptionsViewLabelButton autoresizingMask];
	NSAutoresizingMaskOptions advancedViewMask  = [exportAdvancedOptionsView autoresizingMask];
	
	NSRect frame = [[self window] frame];
	
	// what is this about?
//	if (frame.size.height > 600 && delta > heightOffset2) {
//		frame.origin.y += [exportAdvancedOptionsView frame].size.height;
//		frame.size.height -= [exportAdvancedOptionsView frame].size.height;
//		
//		[[self window] setFrame:frame display:YES animate:YES];
//	}
	
	[exportTablelistScrollView setAutoresizingMask:NSViewNotSizable | NSViewMinYMargin];
	[exportTableListButtonBar setAutoresizingMask:NSViewNotSizable | NSViewMinYMargin];
	[exportTypeTabBar setAutoresizingMask:NSViewNotSizable | NSViewMinYMargin];
	[accessoryViewContainer setAutoresizingMask:NSViewNotSizable | NSViewMinYMargin];
	[exportAdvancedOptionsViewButton setAutoresizingMask:NSViewNotSizable | NSViewMinYMargin];
	[exportAdvancedOptionsViewLabelButton setAutoresizingMask:NSViewNotSizable | NSViewMinYMargin];
	[exportAdvancedOptionsView setAutoresizingMask:NSViewNotSizable | NSViewMinYMargin];
	
	NSInteger newMinHeight = (windowMinHeigth - heightOffset2 + delta < windowMinHeigth) ? windowMinHeigth : windowMinHeigth - heightOffset2 + delta;
	
	[[self window] setMinSize:NSMakeSize(windowMinWidth, newMinHeight)];
	
	frame.origin.y += heightOffset2;
	frame.size.height -= heightOffset2;
	
	heightOffset2 = delta;
	
	frame.origin.y -= heightOffset2;
	frame.size.height += heightOffset2;
	
	[[self window] setFrame:frame display:YES animate:YES];
	
	[exportTablelistScrollView setAutoresizingMask:scrollMask];
	[exportTableListButtonBar setAutoresizingMask:buttonBarMask];
	[exportTypeTabBar setAutoresizingMask:tabBarMask];
	[accessoryViewContainer setAutoresizingMask:optionsTabBarMask];
	[exportAdvancedOptionsViewButton setAutoresizingMask:buttonMask];
	[exportAdvancedOptionsViewLabelButton setAutoresizingMask:textFieldMask];
	[exportAdvancedOptionsView setAutoresizingMask:advancedViewMask];
}

@end
