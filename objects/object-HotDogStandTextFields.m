/*

 HOTDOG

 Copyright (c) 2020 Arthur Choung. All rights reserved.

 Email: arthur -at- hotdogpucko.com

 This file is part of HOTDOG.

 HOTDOG is free software: you can redistribute it and/or modify
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

static char *iconPalette =
"b #000000\n"
". #ffff00\n"
;

static char *iconPixels =
"            bbbbbbbb            \n"
"         bbb........bbb         \n"
"       bb..............bb       \n"
"      b.....bbbbbbbb.....b      \n"
"     b......bbbbbbbb......b     \n"
"    b.......bbbbbbbb.......b    \n"
"   b........bbbbbbbb........b   \n"
"  b.........bbbbbbbb.........b  \n"
"  b.........bbbbbbbb.........b  \n"
" b..........bbbbbbbb..........b \n"
" b..........bbbbbbbb..........b \n"
" b..........bbbbbbbb..........b \n"
"b...........bbbbbbbb...........b\n"
"b...........bbbbbbbb...........b\n"
"b...........bbbbbbbb...........b\n"
"b...........bbbbbbbb...........b\n"
"b...........bbbbbbbb...........b\n"
"b...........bbbbbbbb...........b\n"
"b...........bbbbbbbb...........b\n"
"b...........bbbbbbbb...........b\n"
" b..........bbbbbbbb..........b \n"
" b............................b \n"
" b.............bb.............b \n"
"  b..........bbbbbb..........b  \n"
"  b..........bbbbbb..........b  \n"
"   b........bbbbbbbb........b   \n"
"    b.......bbbbbbbb.......b    \n"
"     b.......bbbbbb.......b     \n"
"      b......bbbbbb......b      \n"
"       bb......bb......bb       \n"
"         bbb........bbb         \n"
"            bbbbbbbb            \n"
;

static char *buttonPalette =
"b #000000\n"
"X #AA0055\n"
"O #868A8E\n"
". #C3C7CB\n"
"@ #ffffff\n"
"T #c3c7cb\n"
;

static char *focusButtonPixels =
" bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb \n"
"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\n"
"bb@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Obb\n"
"bb@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OObb\n"
"bb@@..................................................OObb\n"
"bb@@.............TUTUTUTUTUTUTUTUTUTUT................OObb\n"
"bb@@............T.....................T...............OObb\n"
"bb@@............U.....................U...............OObb\n"
"bb@@............T.....................T...............OObb\n"
"bb@@............U....TTTT....TT...TT..U...............OObb\n"
"bb@@............T...TT..TT...TT..TT...T...............OObb\n"
"bb@@............U..TT....TT..TT.TT....U...............OObb\n"
"bb@@............T..TT....TT..TTTT.....T...............OObb\n"
"bb@@............U..TT....TT..TTT......U...............OObb\n"
"bb@@............T..TT....TT..TTTT.....T...............OObb\n"
"bb@@............U..TT....TT..TT.TT....U...............OObb\n"
"bb@@............T..TT....TT..TT..TT...T...............OObb\n"
"bb@@............U...TT..TT...TT...TT..U...............OObb\n"
"bb@@............T....TTTT....TT....TT.T...............OObb\n"
"bb@@............U.....................U...............OObb\n"
"bb@@............T.....................T...............OObb\n"
"bb@@............U.....................U...............OObb\n"
"bb@@............T.....................T...............OObb\n"
"bb@@.............TUTUTUTUTUTUTUTUTUTUT................OObb\n"
"bb@OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOObb\n"
"bbOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOObb\n"
"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\n"
" bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb \n"
;

static char *buttonDownPixels =
" bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb \n"
"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\n"
"bbOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOObb\n"
"bbO.....................................................bb\n"
"bbO.....................................................bb\n"
"bbO.....................................................bb\n"
"bbO...............TUTUTUTUTUTUTUTUTUTUT.................bb\n"
"bbO..............T.....................T................bb\n"
"bbO..............U.....................U................bb\n"
"bbO..............T.....................T................bb\n"
"bbO..............U....TTTT....TT...TT..U................bb\n"
"bbO..............T...TT..TT...TT..TT...T................bb\n"
"bbO..............U..TT....TT..TT.TT....U................bb\n"
"bbO..............T..TT....TT..TTTT.....T................bb\n"
"bbO..............U..TT....TT..TTT......U................bb\n"
"bbO..............T..TT....TT..TTTT.....T................bb\n"
"bbO..............U..TT....TT..TT.TT....U................bb\n"
"bbO..............T..TT....TT..TT..TT...T................bb\n"
"bbO..............U...TT..TT...TT...TT..U................bb\n"
"bbO..............T....TTTT....TT....TT.T................bb\n"
"bbO..............U.....................U................bb\n"
"bbO..............T.....................T................bb\n"
"bbO..............U.....................U................bb\n"
"bbO..............T.....................T................bb\n"
"bbO...............TUTUTUTUTUTUTUTUTUTUT.................bb\n"
"bbO.....................................................bb\n"
"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\n"
" bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb \n"
;
static char *normalButtonPixels =
" bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb \n"
"b@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Ob\n"
"b@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OOb\n"
"b@@....................................................OOb\n"
"b@@....................................................OOb\n"
"b@@....................................................OOb\n"
"b@@....................................................OOb\n"
"b@@....................................................OOb\n"
"b@@....................................................OOb\n"
"b@@......TTTT..................................TT......OOb\n"
"b@@.....TT..TT.................................TT......OOb\n"
"b@@....TT....T.................................TT......OOb\n"
"b@@....TT........TTTT...TTTTT....TTTT...TTTT...TT......OOb\n"
"b@@....TT.......TT..TT..TT..TT..TT..TT.TT..TT..TT......OOb\n"
"b@@....TT.........TTTT..TT..TT..TT.....TTTTTT..TT......OOb\n"
"b@@....TT........TT.TT..TT..TT..TT.....TT......TT......OOb\n"
"b@@....TT....T..TT..TT..TT..TT..TT.....TT......TT......OOb\n"
"b@@.....TT..TT..TT..TT..TT..TT..TT..TT.TT..TT..TT......OOb\n"
"b@@......TTTT....TTTTT..TT..TT...TTTT...TTTT...TT......OOb\n"
"b@@....................................................OOb\n"
"b@@....................................................OOb\n"
"b@@....................................................OOb\n"
"b@@....................................................OOb\n"
"b@@....................................................OOb\n"
"b@@....................................................OOb\n"
"b@OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOb\n"
"bOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOb\n"
" bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb \n"
;

static char *focusButtonLeftPixels =
" bbb\n"
"bbbb\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@@\n"
"bb@O\n"
"bbOO\n"
"bbbb\n"
" bbb\n"
;

static char *focusButtonMiddlePixels =
"b\n"
"b\n"
"@\n"
"@\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
"O\n"
"O\n"
"b\n"
"b\n"
;

static char *focusButtonRightPixels =
"bbb \n"
"bbbb\n"
"@Obb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"OObb\n"
"bbbb\n"
"bbb \n"
;

static char *buttonDownLeftPixels =
" bb\n"
"bbb\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbO\n"
"bbb\n"
" bb\n"
;

static char *buttonDownMiddlePixels =
"b\n"
"b\n"
"O\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
"b\n"
"b\n"
;

static char *buttonDownRightPixels =
"b \n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"bb\n"
"b \n"
;

static char *normalButtonLeftPixels =
" bb\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@@\n"
"b@O\n"
"bOO\n"
" bb\n"
;
static char *normalButtonMiddlePixels =
"b\n"
"@\n"
"@\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
".\n"
"O\n"
"O\n"
"b\n"
;
static char *normalButtonRightPixels =
"bb \n"
"@Ob\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"OOb\n"
"bb \n"
;

static char *textBorderLeftPixels =
" O\n"
"O \n"
"X \n"
"O \n"
"X \n"
"O \n"
"X \n"
"O \n"
"X \n"
"O \n"
"X \n"
"O \n"
"X \n"
"O \n"
"X \n"
"O \n"
"X \n"
"O \n"
" O\n"
;

static char *textBorderMiddlePixels =
"XO\n"
"  \n"
"  \n"
"  \n"
"  \n"
"  \n"
"  \n"
"  \n"
"  \n"
"  \n"
"  \n"
"  \n"
"  \n"
"  \n"
"  \n"
"  \n"
"  \n"
"  \n"
"XO\n"
;

static char *textBorderRightPixels =
".\n"
"O\n"
"X\n"
"O\n"
"X\n"
"O\n"
"X\n"
"O\n"
"X\n"
"O\n"
"X\n"
"O\n"
"X\n"
"O\n"
"X\n"
"O\n"
"X\n"
"O\n"
".\n"
;


@implementation Definitions(fjdksljfklsdjfdsjkfljdsklfjkfjdskfjksdfjfdksf)
+ (id)testHotDogStandTextFields
{
    id obj = [@"HotDogStandTextFields" asInstance];
    id fields = [@"field1:field2:field3:field4:field5:" splitTerminator:@":"];
    [obj setValue:@"JDLFKSJLKDFJKLDSJFKL" forKey:@"text"];
    [obj setValue:fields forKey:@"fields"];
    [obj setValue:@"OK" forKey:@"okText"];
    [obj setValue:@"Cancel" forKey:@"cancelText"];
//    [obj setValue:@"1" forKey:@"hidden"];
    return obj;
}
@end

@interface HotDogStandTextFields : IvarObject
{
    id _text;
    id _fields;
    id _buffers;
    id _readonly;
    int _cursorBlink;
    int _cursorPos;
    int _returnKeyDown;

    Int4 _okRect;
    Int4 _cancelRect;
    id _okText;
    id _cancelText;
    char _buttonDown;
    char _buttonHover;
    int _dialogMode;
    int _hidden;
    char _focus;
}
@end
@implementation HotDogStandTextFields
- (id)init
{
    self = [super init];
    if (self) {
        _focus = 1;
    }
    return self;
}
- (int)preferredWidth
{
    return 640;
}
- (int)preferredHeight
{
    id bitmap = [Definitions bitmapWithWidth:1 height:1];
    [bitmap useWinSystemFont];
    int lineHeight = [bitmap bitmapHeightForText:@"X"];
    int h = 24;
    int w = 640-89-18;
    {
        id text = [bitmap fitBitmapString:_text width:w];
        h += [bitmap bitmapHeightForText:text] + lineHeight;
    }
    h += [_fields count]*27;
    h += 21+28+21;
    return h;
}

- (void)handleBackgroundUpdate:(id)event
{
    _cursorBlink--;
    if (_cursorBlink < 0) {
        _cursorBlink = 1;
    }
}
- (void)drawInBitmap:(id)bitmap rect:(Int4)r
{
    id windowBackgroundColor = [Definitions valueForEnvironmentVariable:@"HOTDOG_WINDOWBACKGROUNDCOLOR"];
    if (!windowBackgroundColor) {
        windowBackgroundColor = @"red";
    }
    id windowTextColor = [Definitions valueForEnvironmentVariable:@"HOTDOG_WINDOWTEXTCOLOR"];
    if (!windowTextColor) {
        windowTextColor = @"white";
    }

    [bitmap useWinSystemFont];

    [bitmap setColor:windowBackgroundColor];
    [bitmap fillRect:r];

    char *palette = "b #000000\n. #ffffff\n";
    [bitmap drawCString:iconPixels palette:iconPalette x:28 y:28];

    int lineHeight = [bitmap bitmapHeightForText:@"X"];

    // text

    int y = 24;

    {
        int textWidth = r.w - 89 - 18;
        id text = [bitmap fitBitmapString:_text width:textWidth];
        int textHeight = [bitmap bitmapHeightForText:text];
        [bitmap setColor:windowTextColor];
        [bitmap drawBitmapText:text x:89 y:y];
        y += textHeight + lineHeight;
    }

    int fieldWidth = 0;
    for (int i=0; i<[_fields count]; i++) {
        int w = [bitmap bitmapWidthForText:[_fields nth:i]];
        if (w > fieldWidth) {
            fieldWidth = w;
        }
    }

    {
        for (int i=0; i<[_fields count]; i++) {
            id field = [_fields nth:i];
            [bitmap setColor:windowTextColor];
            [bitmap drawBitmapText:field x:89+10+fieldWidth-[bitmap bitmapWidthForText:field] y:y+4];

            int x = 89 + 10 + fieldWidth + 10;
            [bitmap setColor:@"black"];
            [bitmap fillRectangleAtX:x y:y w:r.w-x-18 h:20];
            [bitmap setColor:windowBackgroundColor];
            [bitmap fillRectangleAtX:x+1 y:y+1 w:r.w-x-18-2 h:20-2];

            id str = [_buffers nth:i];
            if (!str) {
                str = @"";
            }
            if (_hidden) {
                str = [[[str mutableCopy] autorelease] destructiveReplaceCharactersNotInString:@"" withChar:'*'];
            }

            if (_focus == i+1) {
                id left = [str stringToIndex:_cursorPos];
                id right = [str stringFromIndex:_cursorPos];
                if ([left length]) {
                    [bitmap setColor:windowTextColor];
                    [bitmap drawBitmapText:left x:x+4 y:y+4];
                    x += [bitmap bitmapWidthForText:left]+2;
                }
                if (_cursorBlink) {
                    [bitmap setColor:@"black"];
                    [bitmap drawVerticalLineAtX:x-1+4 y:y+3 y:y+12+4];
                }
                if ([right length]) {
                    [bitmap setColor:windowTextColor];
                    [bitmap drawBitmapText:right x:x+4 y:y+4];
                }
            } else {
                [bitmap setColor:windowTextColor];
                [bitmap drawBitmapText:str x:x+4 y:y+4];
            }

            y += 27;
        }
    }

    // metrics

    int okTextWidth = (_okText) ? [bitmap bitmapWidthForText:_okText] : 0;
    int okTextHeight = (_okText) ? [bitmap bitmapHeightForText:_okText] : 0;
    int okButtonWidth = [Definitions widthForCString:focusButtonPixels];
    int okButtonHeight = [Definitions heightForCString:focusButtonPixels];
    if (okTextWidth > 44) {
        okButtonWidth = okTextWidth+14;
    }
    _okRect.w = okButtonWidth;
    _okRect.h = okButtonHeight;
NSLog(@"okButtonWidth %d okTextWidth %d", okButtonWidth, okTextWidth);

    int cancelTextWidth = [bitmap bitmapWidthForText:_cancelText];
    int cancelTextHeight = [bitmap bitmapHeightForText:_cancelText];
    int cancelButtonWidth = [Definitions widthForCString:normalButtonPixels];
    int cancelButtonHeight = [Definitions heightForCString:normalButtonPixels];
    if (cancelTextWidth > 44) {
        cancelButtonWidth = cancelTextWidth+14;
    }
    _cancelRect.w = cancelButtonWidth;
    _cancelRect.h = cancelButtonHeight;
NSLog(@"cancelButtonWidth %d cancelTextWidth %d", cancelButtonWidth, cancelTextWidth);

    if (_okText && _cancelText) {
        if (_okRect.w > _cancelRect.w) {
            _cancelRect.w = _okRect.w;
        } else if (_okRect.w < _cancelRect.w) {
            _okRect.w = _cancelRect.w;
        }
        _okRect.x = r.x+(r.w-_okRect.w-_cancelRect.w-16)/2;
        _okRect.y = r.y+r.h-okButtonHeight-11;
        _cancelRect.x = _okRect.x + _okRect.w + 16;
        _cancelRect.y = _okRect.y;
    } else if (_okText) {
        _okRect.x = r.x+(r.w-okButtonWidth)/2;
        _okRect.y = r.y+r.h-okButtonHeight-11;
    } else if (_cancelText) {
        _cancelRect.x = r.x+(r.w-cancelButtonWidth)/2;
        _cancelRect.y = r.y+r.h-cancelButtonHeight-11;
    }

    // ok button

    if (_okText) {
        BOOL okButtonDown = NO;        
        if ((_buttonDown == 'o') && (_buttonHover == 'o')) {
            okButtonDown = YES;
        } else if (_returnKeyDown && (_focus == 'o')) {
            okButtonDown = YES;
        }
        if (okButtonDown) {
            int okTextX = _okRect.x+(_okRect.w-okTextWidth)/2;
            int okTextY = _okRect.y+(_okRect.h-okTextHeight)/2+2;
//            [bitmap drawCString:buttonDownPixels palette:buttonPalette x:_okRect.x y:_okRect.y];
[Definitions drawInBitmap:bitmap left:buttonDownLeftPixels middle:buttonDownMiddlePixels right:buttonDownRightPixels x:_okRect.x y:_okRect.y w:_okRect.w palette:buttonPalette];

            [bitmap setColorIntR:0 g:0 b:0 a:255];
            [bitmap drawBitmapText:_okText x:okTextX y:okTextY];
[Definitions drawInBitmap:bitmap left:textBorderLeftPixels middle:textBorderMiddlePixels right:textBorderRightPixels x:okTextX-2 y:okTextY-3 w:okTextWidth+4 palette:buttonPalette];
        } else if (_focus == 'o') {
            int okTextX = _okRect.x+(_okRect.w-okTextWidth)/2-1;
            int okTextY = _okRect.y+(_okRect.h-okTextHeight)/2+1;
//            [bitmap drawCString:focusButtonPixels palette:buttonPalette x:_okRect.x y:_okRect.y];
[Definitions drawInBitmap:bitmap left:focusButtonLeftPixels middle:focusButtonMiddlePixels right:focusButtonRightPixels x:_okRect.x y:_okRect.y w:_okRect.w palette:buttonPalette];

            [bitmap setColorIntR:0 g:0 b:0 a:255];
            [bitmap drawBitmapText:_okText x:okTextX y:okTextY];
[Definitions drawInBitmap:bitmap left:textBorderLeftPixels middle:textBorderMiddlePixels right:textBorderRightPixels x:okTextX-2 y:okTextY-3 w:okTextWidth+4 palette:buttonPalette];
        } else {
            int okTextX = _okRect.x+(_okRect.w-okTextWidth)/2-1;
            int okTextY = _okRect.y+(_okRect.h-okTextHeight)/2+1;
//            [bitmap drawCString:normalButtonPixels palette:buttonPalette x:_okRect.x y:_okRect.y];
[Definitions drawInBitmap:bitmap left:normalButtonLeftPixels middle:normalButtonMiddlePixels right:normalButtonRightPixels x:_okRect.x y:_okRect.y w:_okRect.w palette:buttonPalette];

            [bitmap setColorIntR:0 g:0 b:0 a:255];
            [bitmap drawBitmapText:_okText x:okTextX y:okTextY];
        }
    } else {
        _okRect.x = 0;
        _okRect.y = 0;
        _okRect.w = 0;
        _okRect.h = 0;
    }

    // cancel button

    if (_cancelText) {
        BOOL cancelButtonDown = NO;
        if ((_buttonDown == 'c') && (_buttonHover == 'c')) {
            cancelButtonDown = YES;
        } else if (_returnKeyDown && (_focus == 'c')) {
            cancelButtonDown = YES;
        }
        if (cancelButtonDown) {
            int cancelTextX = _cancelRect.x+(_cancelRect.w-cancelTextWidth)/2;
            int cancelTextY = _cancelRect.y+(_cancelRect.h-cancelTextHeight)/2+2;
//            [bitmap drawCString:buttonDownPixels palette:buttonPalette x:_cancelRect.x y:_cancelRect.y];
[Definitions drawInBitmap:bitmap left:buttonDownLeftPixels middle:buttonDownMiddlePixels right:buttonDownRightPixels x:_cancelRect.x y:_cancelRect.y w:_cancelRect.w palette:buttonPalette];

            [bitmap setColorIntR:0 g:0 b:0 a:255];
            [bitmap drawBitmapText:_cancelText x:cancelTextX y:cancelTextY];
[Definitions drawInBitmap:bitmap left:textBorderLeftPixels middle:textBorderMiddlePixels right:textBorderRightPixels x:cancelTextX-2 y:cancelTextY-3 w:cancelTextWidth+4 palette:buttonPalette];
        } else if (_focus == 'c') {
            int cancelTextX = _cancelRect.x+(_cancelRect.w-cancelTextWidth)/2-1;
            int cancelTextY = _cancelRect.y+(_cancelRect.h-cancelTextHeight)/2+1;
//            [bitmap drawCString:focusButtonPixels palette:buttonPalette x:_cancelRect.x y:_cancelRect.y];
[Definitions drawInBitmap:bitmap left:focusButtonLeftPixels middle:focusButtonMiddlePixels right:focusButtonRightPixels x:_cancelRect.x y:_cancelRect.y w:_cancelRect.w palette:buttonPalette];

            [bitmap setColorIntR:0 g:0 b:0 a:255];
            [bitmap drawBitmapText:_cancelText x:cancelTextX y:cancelTextY];
[Definitions drawInBitmap:bitmap left:textBorderLeftPixels middle:textBorderMiddlePixels right:textBorderRightPixels x:cancelTextX-2 y:cancelTextY-3 w:cancelTextWidth+4 palette:buttonPalette];
        } else {
            int cancelTextX = _cancelRect.x+(_cancelRect.w-cancelTextWidth)/2-1;
            int cancelTextY = _cancelRect.y+(_cancelRect.h-cancelTextHeight)/2+1;
//            [bitmap drawCString:normalButtonPixels palette:buttonPalette x:_cancelRect.x y:_cancelRect.y];
[Definitions drawInBitmap:bitmap left:normalButtonLeftPixels middle:normalButtonMiddlePixels right:normalButtonRightPixels x:_cancelRect.x y:_cancelRect.y w:_cancelRect.w palette:buttonPalette];

            [bitmap setColorIntR:0 g:0 b:0 a:255];
            [bitmap drawBitmapText:_cancelText x:cancelTextX y:cancelTextY];
        }
    } else {
        _cancelRect.x = 0;
        _cancelRect.y = 0;
        _cancelRect.w = 0;
        _cancelRect.h = 0;
    }
}

- (void)handleKeyDown:(id)event
{
    if (!_buffers) {
        id arr = nsarr();
        for (int i=0; i<[_fields count]; i++) {
            id elt = [_fields nth:i];
            [arr addObject:@""];
        }
        [self setValue:arr forKey:@"buffers"];
    }
    id buf = [_buffers nth:_focus-1];
    id str = [event valueForKey:@"keyString"];
    if ([str isEqual:@"space"]) {
        str = @" ";
    }
    if ([str length] == 1) {
        if (![buf length]) {
            [_buffers replaceObjectAtIndex:_focus-1 withObject:str];
            _cursorPos = 1;
            _cursorBlink = 1;
        } else {
            id left = [buf stringToIndex:_cursorPos];
            id right = [buf stringFromIndex:_cursorPos];
            id newBuf = nsfmt(@"%@%@%@", left, str, right);
            [_buffers replaceObjectAtIndex:_focus-1 withObject:newBuf];
            _cursorPos++;
            _cursorBlink = 1;
        }
    } else if ([str isEqual:@"left"]) {
        if (_cursorPos - 1 >= 0) {
            _cursorPos--;
        }
        _cursorBlink = 1;
    } else if ([str isEqual:@"right"]) {
        if (_cursorPos + 1 <= [buf length]) {
            _cursorPos++;
        }
        _cursorBlink = 1;
    } else if ([str isEqual:@"backspace"]) {
        if (_cursorPos >= 1) {
            id left = (_cursorPos > 1) ? [buf stringToIndex:_cursorPos-1] : @"";
            id right = [buf stringFromIndex:_cursorPos];
            id newBuf = nsfmt(@"%@%@", left, right);
            [_buffers replaceObjectAtIndex:_focus-1 withObject:newBuf];
            _cursorPos--;
        }
        _cursorBlink = 1;
    } else if ([str isEqual:@"return"]) {
        _returnKeyDown = YES;
    } else if ([str isEqual:@"tab"]) {
        if (_focus == 'o') {
            if (_cancelText) {
                _focus = 'c';
            } else {
                if ([_fields count] > 0) {
                    _focus = 1;
                    _cursorPos = [[_buffers nth:_focus-1] length];
                }
            }
        } else if (_focus == 'c') {
            if ([_fields count] > 0) {
                _focus = 1;
                _cursorPos = [[_buffers nth:_focus-1] length];
            } else {
                _focus = 'o';
            }
        } else {
            _focus++;
            if (_focus > [_fields count]) {
                _focus = 'o';
            } else {
                _cursorPos = [[_buffers nth:_focus-1] length];
            }
            _cursorBlink = 2;
        }
    } else if ([str isEqual:@"shift-tab"]) {
        if (_focus == 'o') {
            if ([_fields count] > 0) {
                _focus = [_fields count];
                _cursorPos = [[_buffers nth:_focus-1] length];
            } else {
                if (_cancelText) {
                    _focus = 'c';
                }
            }
        } else if (_focus == 'c') {
            _focus = 'o';
        } else {
            _focus--;
            if (_focus < 1) {
                if (_cancelText) {
                    _focus = 'c';
                } else {
                    _focus = 'o';
                }
            } else {
                _cursorPos = [[_buffers nth:_focus-1] length];
            }
            _cursorBlink = 2;
        }
    }
}
- (void)handleKeyUp:(id)event
{
    id str = [event valueForKey:@"keyString"];
    if ([str isEqual:@"return"]) {
        if (_returnKeyDown) {
            if (_dialogMode) {
                [self exitWithDialogMode];
            }
            id x11Dict = [event valueForKey:@"x11dict"];
            [x11Dict setValue:@"1" forKey:@"shouldCloseWindow"];
            _returnKeyDown = NO;
        }
    }
}
- (void)handleMouseDown:(id)event
{
    int mouseX = [event intValueForKey:@"mouseX"];
    int mouseY = [event intValueForKey:@"mouseY"];
    if (_okText && [Definitions isX:mouseX y:mouseY insideRect:_okRect]) {
        _buttonDown = 'o';
        _buttonHover = 'o';
    } else if (_cancelText && [Definitions isX:mouseX y:mouseY insideRect:_cancelRect]) {
        _buttonDown = 'c';
        _buttonHover = 'c';
    } else {
        _buttonDown = 0;
        _buttonHover = 0;
    }
}
- (void)handleMouseMoved:(id)event
{
    int mouseX = [event intValueForKey:@"mouseX"];
    int mouseY = [event intValueForKey:@"mouseY"];
    if (_okText && [Definitions isX:mouseX y:mouseY insideRect:_okRect]) {
        _buttonHover = 'o';
    } else if (_cancelText && [Definitions isX:mouseX y:mouseY insideRect:_cancelRect]) {
        _buttonHover = 'c';
    } else {
        _buttonHover = 0;
    }
}
- (void)handleMouseUp:(id)event
{
    if (_buttonDown == _buttonHover) {
        if (_buttonDown == 'o') {
            if (_dialogMode) {
                [self exitWithDialogMode];
            }
            id x11dict = [event valueForKey:@"x11dict"];
            [x11dict setValue:@"1" forKey:@"shouldCloseWindow"];
        } else if (_buttonDown == 'c') {
            if (_dialogMode) {
                exit(1);
            }
            id x11dict = [event valueForKey:@"x11dict"];
            [x11dict setValue:@"1" forKey:@"shouldCloseWindow"];
        }
    }
    _buttonDown = 0;
    _buttonHover = 0;
}
- (void)exitWithDialogMode
{
    for (int i=0; i<[_fields count]; i++) {
        id readonly = [_readonly nth:i];
        if (![readonly intValue]) {
            id field = [_fields nth:i];
            id buffer = [_buffers nth:i];
            if (_dialogMode == 1) {
                NSOut(@"%@\n", buffer);
            } else {
                NSErr(@"%@\n", buffer);
            }
        }
    }
    exit(0);
}
@end

