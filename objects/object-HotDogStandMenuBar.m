/*

 HOT DOG Linux

 Copyright (c) 2020 Arthur Choung. All rights reserved.

 Email: arthur -at- hotdoglinux.com

 This file is part of HOT DOG Linux.

 HOT DOG Linux is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.

 */

#import "HOTDOG.h"

static char *hasFocusPalette =
"b #000000\n"
". #ff0000\n"
"X #ffff00\n"
"o #868a8e\n"
"O #c3c7cb\n"
"+ #ffffff\n"
"t #000000\n"
;
static char *menuBarButtonsPixels =
"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\n"
"b+++++++++++++++++ob+++++++++++++++++ob\n"
"b+OOOOOOOOOOOOOOOoob+OOOOOOOOOOOOOOOoob\n"
"b+OOOOOOOOOOOOOOOoob+OOOOOOOOOOOOOOOoob\n"
"b+OOOOOOOOOOOOOOOoob+OOOOOOOOOOOOOOOoob\n"
"b+OOOOOOOOOOOOOOOoob+OOOOOOObOOOOOOOoob\n"
"b+OOOOOOOOOOOOOOOoob+OOOOOObbbOOOOOOoob\n"
"b+OOOOOOOOOOOOOOOoob+OOOOObbbbbOOOOOoob\n"
"b+OOOObbbbbbbOOOOoob+OOOObbbbbbbOOOOoob\n"
"b+OOOOObbbbbOOOOOoob+OOOOOOOOOOOOOOOoob\n"
"b+OOOOOObbbOOOOOOoob+OOOOOOOOOOOOOOOoob\n"
"b+OOOOOOObOOOOOOOoob+OOOObbbbbbbOOOOoob\n"
"b+OOOOOOOOOOOOOOOoob+OOOOObbbbbOOOOOoob\n"
"b+OOOOOOOOOOOOOOOoob+OOOOOObbbOOOOOOoob\n"
"b+OOOOOOOOOOOOOOOoob+OOOOOOObOOOOOOOoob\n"
"b+OOOOOOOOOOOOOOOoob+OOOOOOOOOOOOOOOoob\n"
"b+OOOOOOOOOOOOOOOoob+OOOOOOOOOOOOOOOoob\n"
"b+ooooooooooooooooob+ooooooooooooooooob\n"
"booooooooooooooooooboooooooooooooooooob\n"
"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\n"
;

@interface HotDogStandMenuBar : IvarObject
{
    id _configPath;
    time_t _configTimestamp;
    int _closingIteration;
    BOOL _buttonDown;
    id _selectedDict;
    id _menuDict;
    id _array;

    int _pixelScaling;
    id _scaledFont;
    id _scaledMenuBarButtonsPixels;
}
@end

@implementation HotDogStandMenuBar

- (void)flashIndex:(int)index duration:(int)duration
{
    if (_closingIteration > 0) {
        return;
    }
    if (_selectedDict) {
        return;
    }

    id dict = [_array nth:index];
    if (dict) {
        [self setValue:dict forKey:@"selectedDict"];
        _closingIteration = duration;
    }
}

- (id)init
{
    self = [super init];
    if (self) {
        int scaling = [[Definitions valueForEnvironmentVariable:@"HOTDOG_SCALING"] intValue];
        if (scaling < 1) {
            scaling = 1;
        }
        [self setPixelScaling:scaling];
        id configPath = [Definitions configDir:@"Config/menuBar.csv"];
        [self setValue:configPath forKey:@"configPath"];
    }
    return self;
}
- (void)setPixelScaling:(int)scaling
{
    _pixelScaling = scaling;
    id scaledFont = [Definitions scaleFont:scaling
                        :[Definitions arrayOfCStringsForWinSystemFont]
                        :[Definitions arrayOfWidthsForWinSystemFont]
                        :[Definitions arrayOfHeightsForWinSystemFont]
                        :[Definitions arrayOfXSpacingsForWinSystemFont]];
    [self setValue:scaledFont forKey:@"scaledFont"];

    id obj = [nsfmt(@"%s", menuBarButtonsPixels) asXYScaledPixels:scaling];
    [self setValue:obj forKey:@"scaledMenuBarButtonsPixels"];
}

- (void)updateMenuBar
{
    id arr = [_configPath parseCSVFile];
    if (!arr) {
        return;
    }
    [self setValue:arr forKey:@"array"];
    for (int i=0; i<[arr count]; i++) {
        id elt = [arr nth:i];
        id objectMessage = [elt valueForKey:@"objectMessage"];
        if ([objectMessage length]) {
            id obj = [objectMessage evaluateMessage];
            [elt setValue:obj forKey:@"object"];
        }
    }
}
- (void)dealloc
{
NSLog(@"DEALLOC HotDogStandMenuBar");
    [super dealloc];
}

- (BOOL)shouldAnimate
{
    if (_closingIteration > 0) {
        return YES;
    }
    return NO;
}
- (void)beginIteration:(id)event rect:(Int4)r
{
    if (_closingIteration > 0) {
        _closingIteration--;
        id x11dict = [event valueForKey:@"x11dict"];
        if (_closingIteration == 0) {
            _buttonDown = NO;
            [self setValue:nil forKey:@"menuDict"];
            [self setValue:nil forKey:@"selectedDict"];
        }
        return;
    }
    time_t timestamp = [_configPath fileModificationTimestamp];
    if (timestamp != _configTimestamp) {
        [self setValue:nil forKey:@"array"];
        _configTimestamp = timestamp;
        [self updateMenuBar];
    }
}

- (id)fileDescriptorObjects
{
    id results = nsarr();
    for (int i=0; i<[_array count]; i++) {
        id elt = [_array nth:i];
        id obj = [elt valueForKey:@"object"];
        if ([obj respondsToSelector:@selector(fileDescriptor)]) {
            [results addObject:obj];
        }
    }
    if ([results count]) {
        return results;
    }
    return nil;
}
- (id)dictForX:(int)x
{
    id monitor = [Definitions monitorForX:x y:0];
    int monitorX = [monitor intValueForKey:@"x"];
    int monitorWidth = [monitor intValueForKey:@"width"];
    if ((x < monitorX) || (x >= monitorX+monitorWidth)) {
        return nil;
    }
    for (int i=0; i<[_array count]; i++) {
        id elt = [_array nth:i];
        int eltX = [elt intValueForKey:@"x"];
        int x1 = (eltX < 0) ? eltX+monitorX+monitorWidth : eltX+monitorX;
        int w1 = [elt intValueForKey:@"width"];
        if ((x >= x1) && (x < x1+w1)) {
            return elt;
        }
    }
    return nil;
}
- (void)handleScrollWheel:(id)event
{
    if (!_buttonDown) {
        return;
    }

    if (_menuDict) {
        id windowManager = [event valueForKey:@"windowManager"];
        id object = [_menuDict valueForKey:@"object"];
        if ([object respondsToSelector:@selector(handleScrollWheel:)]) {
            int mouseRootX = [event intValueForKey:@"mouseRootX"];
            int mouseRootY = [event intValueForKey:@"mouseRootY"];
            int x = [_menuDict intValueForKey:@"x"];
            int y = [_menuDict intValueForKey:@"y"];
            int w = [_menuDict intValueForKey:@"w"];
            int h = [_menuDict intValueForKey:@"h"];
            id newEvent = [windowManager generateEventDictRootX:mouseRootX rootY:mouseRootY x:mouseRootX-x y:mouseRootY-y w:w h:h x11dict:_menuDict];
            [newEvent setValue:[event valueForKey:@"deltaX"] forKey:@"deltaX"];
            [newEvent setValue:[event valueForKey:@"deltaY"] forKey:@"deltaY"];
            [newEvent setValue:[event valueForKey:@"scrollingDeltaX"] forKey:@"scrollingDeltaX"];
            [newEvent setValue:[event valueForKey:@"scrollingDeltaY"] forKey:@"scrollingDeltaY"];
            [object handleScrollWheel:newEvent];
            [_menuDict setValue:@"1" forKey:@"needsRedraw"];
        }
    }
}
- (void)handleKeyDown:(id)event
{
    if (!_buttonDown) {
        return;
    }

    if (_menuDict) {
        id windowManager = [event valueForKey:@"windowManager"];
        id object = [_menuDict valueForKey:@"object"];
        if ([object respondsToSelector:@selector(handleKeyDown:)]) {
            [object handleKeyDown:event];
            [_menuDict setValue:@"1" forKey:@"needsRedraw"];
        }
    }
}

- (void)handleMouseDown:(id)event
{
    if (_buttonDown) {
        return;
    }
    int mouseRootX = [event intValueForKey:@"mouseRootX"];
    id windowManager = [event valueForKey:@"windowManager"];
    int menuBarHeight = [windowManager intValueForKey:@"menuBarHeight"];
    int mouseRootY = [event intValueForKey:@"mouseRootY"];
    if (mouseRootY >= menuBarHeight) {
        return;
    }
    _buttonDown = YES;
    id dict = [self dictForX:mouseRootX];
    [self openRootMenu:dict x:mouseRootX];
}
- (void)handleMouseUp:(id)event
{
NSLog(@"HotDogStandMenuBar handleMouseUp event %@", event);
    if (!_buttonDown) {
        return;
    }

    if (_menuDict) {
        id windowManager = [event valueForKey:@"windowManager"];
        id object = [_menuDict valueForKey:@"object"];
        if ([object respondsToSelector:@selector(handleMouseUp:)]) {
            int mouseRootX = [event intValueForKey:@"mouseRootX"];
            int mouseRootY = [event intValueForKey:@"mouseRootY"];
            int x = [_menuDict intValueForKey:@"x"];
            int y = [_menuDict intValueForKey:@"y"];
            int w = [_menuDict intValueForKey:@"w"];
            int h = [_menuDict intValueForKey:@"h"];
            id newEvent = [windowManager generateEventDictRootX:mouseRootX rootY:mouseRootY x:mouseRootX-x y:mouseRootY-y w:w h:h x11dict:_menuDict];
            [object handleMouseUp:newEvent];
            [_menuDict setValue:@"1" forKey:@"needsRedraw"];
            int closingIteration = [object intValueForKey:@"closingIteration"];
            if (closingIteration) {
                _closingIteration = closingIteration;
                return;
            }
        }
        [self setValue:nil forKey:@"menuDict"];
    }
    _buttonDown = NO;
    [self setValue:nil forKey:@"selectedDict"];
}

- (void)handleMouseMoved:(id)event
{
    id windowManager = [event valueForKey:@"windowManager"];
    [windowManager setX11Cursor:'5'];
    int mouseRootX = [event intValueForKey:@"mouseRootX"];
    if (!_buttonDown) {
        return;
    }
    int menuBarHeight = [windowManager intValueForKey:@"menuBarHeight"];
    int mouseRootY = [event intValueForKey:@"mouseRootY"];
    if (mouseRootY < menuBarHeight) {
        id dict = [self dictForX:mouseRootX];
        if (dict && (dict != _selectedDict)) {
            [_menuDict setValue:@"1" forKey:@"shouldCloseWindow"];
            [self setValue:nil forKey:@"menuDict"];
            [self setValue:nil forKey:@"selectedDict"];
            [self openRootMenu:dict x:mouseRootX];
            return;
        }
    }

    if (_menuDict) {
        id object = [_menuDict valueForKey:@"object"];
        if ([object respondsToSelector:@selector(handleMouseMoved:)]) {
            int x = [_menuDict intValueForKey:@"x"];
            int y = [_menuDict intValueForKey:@"y"];
            int w = [_menuDict intValueForKey:@"w"];
            int h = [_menuDict intValueForKey:@"h"];
            id newEvent = [windowManager generateEventDictRootX:mouseRootX rootY:mouseRootY x:mouseRootX-x y:mouseRootY-y w:w h:h x11dict:_menuDict];
            [object handleMouseMoved:newEvent];
            [_menuDict setValue:@"1" forKey:@"needsRedraw"];
        }
    }

}
- (void)openRootMenu:(id)dict x:(int)mouseRootX
{

    id messageForClick = [dict valueForKey:@"messageForClick"];
    if (!messageForClick) {
        return;
    }
    id obj = [messageForClick evaluateAsMessage];
    if (!obj) {
        return;
    }
    id monitor = [Definitions monitorForX:mouseRootX y:0];
    int monitorX = [monitor intValueForKey:@"x"];
    int monitorWidth = [monitor intValueForKey:@"width"];
    int x = [dict intValueForKey:@"x"];
    if (x < 0) {
        x += monitorX+monitorWidth;
    } else {
        x += monitorX;
    }
    int w = 200;
    if ([obj respondsToSelector:@selector(preferredWidth)]) {
        w = [obj preferredWidth];
    }
    int h = 200;
    if ([obj respondsToSelector:@selector(preferredHeight)]) {
        h = [obj preferredHeight];
    }
    id windowManager = [@"windowManager" valueForKey];
    id menuDict = [windowManager openWindowForObject:obj x:x y:18*_pixelScaling w:w+3 h:h+3];
    [self setValue:menuDict forKey:@"menuDict"];
    [self setValue:dict forKey:@"selectedDict"];
[windowManager XSetInputFocus:[menuDict unsignedLongValueForKey:@"window"]];
}
- (void)drawInBitmap:(id)bitmap rect:(Int4)r
{
    if (_scaledFont) {
        [bitmap useFont:[[_scaledFont nth:0] bytes]
                    :[[_scaledFont nth:1] bytes]
                    :[[_scaledFont nth:2] bytes]
                    :[[_scaledFont nth:3] bytes]];
    }

    [bitmap setColor:@"white"];
    [bitmap fillRect:r];
    [bitmap setColor:@"black"];
    for (int i=0; i<_pixelScaling; i++) {
        [bitmap drawHorizontalLineAtX:r.x x:r.x+r.w-1 y:19*_pixelScaling+i];
    }
    id windowManager = [@"windowManager" valueForKey];
    int mouseRootX = [windowManager intValueForKey:@"mouseX"];
    id mouseMonitor = [Definitions monitorForX:mouseRootX y:0];

    id monitors = [Definitions monitorConfig];
    for (int monitorI=0; monitorI<[monitors count]; monitorI++) {
        id monitor = [monitors nth:monitorI];
        int monitorX = [monitor intValueForKey:@"x"];
        int monitorWidth = [monitor intValueForKey:@"width"];
//        [bitmap drawCString:leftCornerStr x:monitorX y:0 c:'b' r:0 g:0 b:0 a:255];
//        [bitmap drawCString:rightCornerStr x:monitorX+monitorWidth-rightCornerWidth y:0 c:'b' r:0 g:0 b:0 a:255];
        if ([monitor intValueForKey:@"x"] != [mouseMonitor intValueForKey:@"x"]) {
            int monitorIndex = 0;
            id text = nsarr();
            int textHeight = [bitmap bitmapHeightForText:@"X"];
            for (int i=0; i<[monitors count]; i++) {
                id elt = [monitors nth:i];
                if ([elt intValueForKey:@"x"] == [mouseMonitor intValueForKey:@"x"]) {
                    [text addObject:nsfmt(@"This is monitor %d (%@). Pointer is on monitor %d (%@) x:%d y:%d", monitorI+1, [monitor valueForKey:@"output"], monitorIndex+1, [elt valueForKey:@"output"], mouseRootX, [windowManager intValueForKey:@"mouseY"])];
                }
                monitorIndex++;
            }
            [bitmap setColorIntR:0x00 g:0x00 b:0x00 a:0xff];
            [bitmap drawBitmapText:[text join:@""] x:monitorX+5*2*_pixelScaling y:4*_pixelScaling];
        }
    }

    int mouseMonitorX = [mouseMonitor intValueForKey:@"x"];
    int mouseMonitorWidth = [mouseMonitor intValueForKey:@"width"];

    int flexibleIndex = -1;
    {
        int x = 5*_pixelScaling;
        for (int i=0; i<[_array count]; i++) {
            id elt = [_array nth:i];
            id obj = [elt valueForKey:@"object"];
            if (!obj) {
                continue;
            }
            int flexible = [elt intValueForKey:@"flexible"];
            int leftPadding = [elt intValueForKey:@"leftPadding"];
            leftPadding *= _pixelScaling;
            int rightPadding = [elt intValueForKey:@"rightPadding"];
            rightPadding *= _pixelScaling;
            int w = 0;
            if (flexible) {
                flexibleIndex = i;
            } else {
                int highestWidth = [elt intValueForKey:@"highestWidth"];
                id text = nil;
                if ([obj respondsToSelector:@selector(text)]) {
                    text = [obj text];
                }
                if (!text) {
                    text = [obj valueForKey:@"text"];
                }
                if (text) {
                    w = [bitmap bitmapWidthForText:text];
                    w += leftPadding+rightPadding;
                    if (w > highestWidth) {
                        [elt setValue:nsfmt(@"%d", w) forKey:@"highestWidth"];
                    } else {
                        w = highestWidth;
                    }
                } else {
                    id pixels = [obj valueForKey:@"pixels"];
                    if (pixels) {
                        w = [Definitions widthForCString:[pixels UTF8String]];
                        w *= _pixelScaling;
                        w += leftPadding+rightPadding;
                        if (w > highestWidth) {
                            [elt setValue:nsfmt(@"%d", w) forKey:@"highestWidth"];
                        } else {
                            w = highestWidth;
                        }
                    } else {
                        w = 100;
                    }
                }
            }
            [elt setValue:nsfmt(@"%d", x) forKey:@"x"];
            [elt setValue:nsfmt(@"%d", w) forKey:@"width"];
            x += w;
        }
        int maxX = mouseMonitorWidth - (5 + 39)*_pixelScaling;
        int remainingX = maxX - x;
        if (remainingX > 0) {
            if (flexibleIndex != -1) {
                {
                    id elt = [_array nth:flexibleIndex];
                    int leftPadding = [elt intValueForKey:@"leftPadding"];
                    leftPadding *= _pixelScaling;
                    int rightPadding = [elt intValueForKey:@"rightPadding"];
                    rightPadding *= _pixelScaling;
                    int oldX = [elt intValueForKey:@"x"];
                    int newW = remainingX - leftPadding - rightPadding;
                    if (newW > 0) {
                        id obj = [elt valueForKey:@"object"];
                        id text = nil;
                        if ([obj respondsToSelector:@selector(text)]) {
                            text = [obj text];
                        }
                        if (!text) {
                            text = [obj valueForKey:@"text"];
                        }
                        if (text) {
                            int w = [bitmap bitmapWidthForText:text];
                            w += leftPadding+rightPadding;
                            if (w < newW) {
                                newW = w;
                            }
                        } else {
                            id pixels = [obj valueForKey:@"pixels"];
                            if (pixels) {
                                int w = [Definitions widthForCString:[pixels UTF8String]];
                                w *= _pixelScaling;
                                w += leftPadding+rightPadding;
                                if (w < newW) {
                                    newW = w;
                                }
                            }
                        }

                        [elt setValue:nsfmt(@"%d", oldX+leftPadding) forKey:@"x"];
                        [elt setValue:nsfmt(@"%d", newW) forKey:@"width"];
                    }
                }
                for (int i=flexibleIndex+1; i<[_array count]; i++) {
                    id elt = [_array nth:i];
                    int oldX = [elt intValueForKey:@"x"];
                    [elt setValue:nsfmt(@"%d", oldX+remainingX) forKey:@"x"];
                }
            }
        }
    }

    for (int i=0; i<[_array count]; i++) {
        id elt = [_array nth:i];
        Int4 r1 = r;
        int eltX = [elt intValueForKey:@"x"];
        r1.x = r.x+mouseMonitorX+eltX;
        r1.w = [elt intValueForKey:@"width"];

        Int4 r2 = r1;
        id obj = [elt valueForKey:@"object"];
        int leftPadding = [elt intValueForKey:@"leftPadding"];
        leftPadding *= _pixelScaling;
        int rightPadding = [elt intValueForKey:@"rightPadding"];
        rightPadding *= _pixelScaling;
        if ((_buttonDown || (_closingIteration > 0)) && (_selectedDict == elt)) {
            id text = nil;
            if ([obj respondsToSelector:@selector(text)]) {
                text = [obj text];
            }
            if (!text) {
                text = [obj valueForKey:@"text"];
            }
            if (text) {
                Int4 r3 = r2;
                r3.x += leftPadding;
                r3.w -= leftPadding+rightPadding;
                [bitmap setColor:@"black"];
                [bitmap fillRect:r2];
                [bitmap setColor:@"white"];
                if (i == flexibleIndex) {
                    int textWidth = [bitmap bitmapWidthForText:text];
                    if (textWidth > r3.w) {
                        text = [[[bitmap fitBitmapString:text width:r3.w] split:@"\n"] nth:0];
                    }
                }
                [bitmap drawBitmapText:text x:r3.x y:r3.y+4*_pixelScaling];

                id firstLetter = [text stringToIndex:1];
                if (firstLetter) {
                    int w = [bitmap bitmapWidthForText:firstLetter];
                    [bitmap setColor:@"black"];
                    for (int j=0; j<_pixelScaling; j++) {
                        [bitmap drawHorizontalLineAtX:r3.x x:r3.x+w y:r3.y+r3.h-4*_pixelScaling+j];
                    }
                }
            } else {
                id palette = [obj valueForKey:@"highlightedPalette"];
                if (!palette) {
                    palette = [obj valueForKey:@"palette"];
                }
                if (palette) {
                    id pixels = [obj valueForKey:@"pixels"];
                    if (pixels) {
                        Int4 r3 = r2;
                        r3.x += leftPadding;
                        r3.w -= leftPadding+rightPadding;
                        [bitmap setColor:@"black"];
                        [bitmap fillRect:r2];
                        [bitmap setColor:@"white"];
                        pixels = [pixels asXYScaledPixels:_pixelScaling];
                        [bitmap drawCString:[pixels UTF8String] palette:[palette UTF8String] x:r3.x y:r3.y];
                    }
                }
            }
        } else {
            id text = nil;
            if ([obj respondsToSelector:@selector(text)]) {
                text = [obj text];
            }
            if (!text) {
                text = [obj valueForKey:@"text"];
            }
            if (text) {
                Int4 r3 = r2;
                r3.x += leftPadding;
                r3.w -= leftPadding+rightPadding;
                [bitmap setColor:@"black"];
                if (i == flexibleIndex) {
                    int textWidth = [bitmap bitmapWidthForText:text];
                    if (textWidth > r3.w) {
                        text = [[[bitmap fitBitmapString:text width:r3.w] split:@"\n"] nth:0];
                    }
                }
                [bitmap drawBitmapText:text x:r3.x y:r3.y+4*_pixelScaling];

                id firstLetter = [text stringToIndex:1];
                if (firstLetter) {
                    int w = [bitmap bitmapWidthForText:firstLetter];
                    for (int j=0; j<_pixelScaling; j++) {
                        [bitmap drawHorizontalLineAtX:r3.x x:r3.x+w y:r3.y+r3.h-4*_pixelScaling+j];
                    }
                }
            } else {
                id palette = [obj valueForKey:@"palette"];
                if (palette) {
                    id pixels = [obj valueForKey:@"pixels"];
                    if (pixels) {
                        Int4 r3 = r2;
                        r3.x += leftPadding;
                        r3.w -= leftPadding+rightPadding;
                        [bitmap setColor:@"black"];
                        pixels = [pixels asXYScaledPixels:_pixelScaling];
                        [bitmap drawCString:[pixels UTF8String] palette:[palette UTF8String] x:r3.x y:r3.y];
                    }
                }
            }
        }
    }
    
    char *palette = hasFocusPalette;
    [bitmap drawCString:[_scaledMenuBarButtonsPixels UTF8String] palette:palette x:mouseMonitorX+mouseMonitorWidth-39*_pixelScaling y:0];
}
@end
