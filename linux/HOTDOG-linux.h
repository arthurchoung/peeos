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

/* NOTE: This file was generated by parse-functions.pl */

@interface NSObject(KIFWvkFaDJGBKmEOUxKpgwxtPEaosse)
#ifdef BUILD_WITH_GNUSTEP_RUNTIME
#endif
#ifdef BUILD_WITH_GNU_PRINTF
#else
#endif
#ifdef BUILD_FOR_ANDROID
#else
#endif
#ifdef BUILD_WITH_GNUSTEP_RUNTIME
#endif
void NSLog(id formatString, ...);
#ifdef BUILD_WITH_GNU_PRINTF
#else
#endif
+ (int)currentAutoreleasePoolNumberOfObjects;
+ (int)autoreleasePoolIndex;
+ (int)autoreleasePoolAlloc;
+ (Class)class;
+ (id)alloc;
+ (id)new;
- (id)init;
- (void)drain;
- (void)release;
+ (void)addObject:(id)obj;
- (void)addObject:(id)obj;
- (id)description;
+ (id)className;
- (id)className;
+ (Class)class;
- (Class)class;
- (void)dealloc;
- (id)init;
- (int)retainCount;
- (void)setRetainCount:(int)val;
- (id)retain;
- (void)release;
- (id)autorelease;
- (char *)UTF8String;
- (int)length;
+ (id)description;
- (id)description;
- (BOOL)respondsToSelector:(SEL)sel;
- (BOOL)isKindOfClass:(Class)cls;
+ (void)setValue:(id)val forKey:(id)key;
+ (id)valueForKey:(id)key;
- (void)setValue:(id)val forKey:(id)key;
- (id)valueForKey:(id)key;
+ (Class)class;
- (Class)class;
+ (id)alloc;
- (id)copy;
- (void)dealloc;
- (id)init;
- (int)retainCount;
- (void)setRetainCount:(int)val;
+ (id)retain;
- (id)retain;
+ (void)release;
- (void)release;
+ (id)autorelease;
- (id)autorelease;
+ (BOOL)isKindOfClass:(Class)obj;
- (BOOL)isKindOfClass:(Class)obj;
+ (BOOL)respondsToSelector:(SEL)sel;
- (BOOL)respondsToSelector:(SEL)sel;
+ (id)description;
- (id)description;
- (BOOL)writeToFile:(id)path;
+ (BOOL)isEqual:(id)obj;
+ (void)setValue:(id)val forKey:(id)key;
+ (id)valueForKey:(id)key;
- (void)setValue:(id)val forKey:(id)key;
- (id)valueForKey:(id)key;
- (id)substringFromIndex:(int)index;
- (id)substringToIndex:(int)index;
- (BOOL)writeToFile:(id)path;
- (int)intValueForKey:(id)key;
- (void)dealloc;
- (char *)UTF8String;
- (int)length;
- (id)description;
- (id)initWithFormat:(id)formatString arguments:(va_list)args;
#ifdef BUILD_WITH_GNU_PRINTF
#else
#endif
- (id)initWithBytesNoCopy:(char *)cstr length:(int)length;
- (id)initWithBytes:(char *)cstr length:(int)length;
+ (id)stringWithFormat:(id)formatString, ...;
#ifdef BUILD_WITH_GNU_PRINTF
#else
#endif
- (id)destructiveReplaceCharactersNotInString:(id)keepString withChar:(char)c;
- (id)destructiveChomp;
- (id)destructiveDeleteLastPathComponent;
- (id)destructiveDeletePathExtension;
- (id)destructiveCamelCaseString;
- (id)destructiveRemoveNonASCIICharacters;
- (id)destructiveLowercaseString;
- (id)destructiveUppercaseString;
- (id)destructiveTrim;
- (id)destructiveLastPathComponent;
- (id)pathExtension;
- (id)dataFromFile;
- (int)compare:(id)obj;
- (id)mutableCopy;
- (id)copy;
- (id)chomp;
- (id)stringByDeletingLastPathComponent;
- (id)stringByDeletingPathExtension;
- (id)find:(id)findStr replace:(id)replaceStr;
- (id)stringByReplacingOccurrencesOfString:(id)findStr withString:(id)replaceStr;
- (id)stringByAppendingPathComponent:(id)path;
- (id)sliceFrom:(int)from to:(int)to;
- (id)camelCaseString;
- (id)firstLine;
- (id)stringByRemovingNonASCIICharacters;
- (BOOL)containsString:(id)str;
- (id)asInstance;
- (id)lastPathComponent;
+ (id)stringWithString:(id)str;
- (int)characterAtIndex:(int)index;
- (id)split;
- (id)trim;
- (id)lowercaseString;
- (id)uppercaseString;
- (id)asClass;
- (BOOL)hasPrefix:(id)prefix;
- (BOOL)hasSuffix:(id)suffix;
- (BOOL)boolValue;
- (unsigned char)unsignedCharValue;
- (unsigned int)unsignedIntValue;
- (int)intValue;
- (long long)longLongValue;
- (double)doubleValue;
- (id)stringFromFile;
+ (id)string;
+ (id)stringWithUTF8String:(char *)cstr;
- (id)stringByAppendingString:(id)str;
- (BOOL)isEqual:(id)obj;
- (id)componentsSeparatedByString:(id)separatorString;
- (id)splitTerminator:(id)terminatorString;
- (id)valueForKey:(id)key;
- (BOOL)containsObject:(id)obj;
- (int)findObject:(id)obj;
- (void)dealloc;
- (id)subarrayFromLocation:(int)location length:(int)length;
- (id)firstObject;
- (id)lastObject;
- (void)removeAllObjects;
- (id)mutableCopy;
- (id)copy;
- (id)arrayByAddingObject:(id)obj;
- (id)arrayByAddingObjectsFromArray:(id)arr;
- (unsigned int)countByEnumeratingWithState:(NSFastEnumerationState *)enumerationState objects:(id *)stackBuffer count:(unsigned int)length;
+ (id)array;
+ (id)arrayWithObjects:(id *)objects count:(unsigned int)count;
- (id)componentsJoinedByStringOld:(id)separator;
- (id)componentsJoinedByString:(id)separator;
- (void)addObject:(id)obj;
- (void)removeObjectAtIndex:(int)i;
- (void)removeObject:(id)obj;
- (void)replaceObjectAtIndex:(int)i withObject:(id)obj;
- (void)addObjectsFromArray:(id)arr;
- (int)length;
- (int)count;
- (id)objectAtIndex:(int)index;
- (id)destructiveSortArrayWithFunction:(void *)func argument:(void *)arg;
#ifdef BUILD_WITH_GNU_QSORT_R
#else
#endif
- (id)asArraySortedWithFunction:(void *)func argument:(void *)arg;
- (id)description;
+ (id)data;
+ (id)dataWithCapacity:(int)length;
- (id)initWithCapacity:(int)capacity;
+ (id)dataWithBytes:(char *)bytes length:(int)length;
- (id)initWithBytes:(char *)bytes length:(int)length;
+ (id)dataWithBytesNoCopy:(char *)bytes length:(int)length;
- (id)initWithBytesNoCopy:(char *)bytes length:(int)length;
- (void)dealloc;
- (id)mutableCopy;
- (id)copy;
- (void)appendBytes:(char *)bytes length:(int)length;
- (unsigned char *)bytes;
- (int)length;
- (void)deleteBytesFromIndex:(int)index length:(int)length;
- (BOOL)isEqual:(id)obj;
- (id)description;
- (void)dealloc;
- (id)mutableCopy;
- (id)copy;
+ (id)dictionary;
+ (id)dictionaryWithObjects:(id *)objects forKeys:(id *)keys count:(int)count;
- (id)allKeys;
- (id)allValues;
- (id)allKeysAndValues;
- (void)setValue:(id)val forKey:(id)key;
- (id)valueForKey:(id)key;
- (id)valueForKey:(id)key;
+ (id)valueWithPointer:(void *)ptr;
- (id)initWithPointer:(void *)ptr;
- (void *)pointerValue;
#ifdef BUILD_WITH_GNU_PRINTF
#endif
#ifdef BUILD_WITH_GNUSTEP_RUNTIME
#endif
#ifdef BUILD_WITH_GNU_PRINTF
#endif
- (id)decodeJSON;
- (id)decodeJSON;
- (id)decodeJSONWithValueAsNull:(id)nullValue;
- (id)readFromFileAsJSON;
- (id)encodeJSON;
- (id)encodeJSON;
- (id)encodeJSON;
#ifdef BUILD_FOR_ANDROID
#else
#endif
#ifdef BUILD_FOR_ANDROID
#else
#endif
#ifdef PRINTF_INCLUDE_CONFIG_H
#endif
#ifndef PRINTF_NTOA_BUFFER_SIZE
#endif
#ifndef PRINTF_FTOA_BUFFER_SIZE
#endif
#ifndef PRINTF_DISABLE_SUPPORT_FLOAT
#endif
#ifndef PRINTF_DISABLE_SUPPORT_EXPONENTIAL
#endif
#ifndef PRINTF_DEFAULT_FLOAT_PRECISION
#endif
#ifndef PRINTF_MAX_FLOAT
#endif
#ifndef PRINTF_DISABLE_SUPPORT_LONG_LONG
#endif
#ifndef PRINTF_DISABLE_SUPPORT_PTRDIFF_T
#endif
#if defined(PRINTF_SUPPORT_FLOAT)
#endif
#if 0
#endif
#if defined(PRINTF_SUPPORT_LONG_LONG)
#endif  // PRINTF_SUPPORT_LONG_LONG
#if defined(PRINTF_SUPPORT_FLOAT)
#if defined(PRINTF_SUPPORT_EXPONENTIAL)
#endif
#if defined(PRINTF_SUPPORT_EXPONENTIAL)
#else
#endif
#if defined(PRINTF_SUPPORT_EXPONENTIAL)
#endif  // PRINTF_SUPPORT_EXPONENTIAL
#endif  // PRINTF_SUPPORT_FLOAT
#if defined(PRINTF_SUPPORT_PTRDIFF_T)
#endif
#if defined(PRINTF_SUPPORT_LONG_LONG)
#endif
#if defined(PRINTF_SUPPORT_LONG_LONG)
#endif
#if defined(PRINTF_SUPPORT_FLOAT)
#if defined(PRINTF_SUPPORT_EXPONENTIAL)
#endif  // PRINTF_SUPPORT_EXPONENTIAL
#endif  // PRINTF_SUPPORT_FLOAT
#if defined(PRINTF_SUPPORT_LONG_LONG)
#endif
#if defined(PRINTF_SUPPORT_LONG_LONG)
#endif
#if 0
#endif
- (void)openAudioWithSampleRate:(int)sampleRate frameCount:(int)frameCount channels:(int)channels bitsPerChannel:(int)bitsPerChannel;
- (void)writeAudio:(uint16_t *)buffer frameCount:(int)frameCount;
- (void)closeAudio;
+ (id)configDir;
+ (id)configDir:(id)path;
+ (id)execDir:(id)str;
+ (id)execDir;
+ (id)homeDir;
+ (id)homeDir:(id)path;
+ (void)rotateMonitor:(id)name orientation:(id)orientation;
+ (void)swapMonitors:(id)name1 :(id)name2;
+ (id)previousMonitorName;
+ (id)nextMonitorName;
+ (id)currentMonitor;
+ (id)currentMonitorName;
+ (int)currentMonitorIndex;
+ (id)monitorName;
+ (id)monitorTitle;
+ (void)rotateCurrentMonitor:(id)orientation;
+ (void)showAlert:(id)text monitor:(int)monitor;
+ (void)identifyMonitors;
+ (id)detectMonitors;
+ (void)setupMonitors;
+ (id)monitorIndexNameForX:(int)x y:(int)y;
+ (int)monitorIndexForX:(int)x y:(int)y;
+ (id)monitorForX:(int)x y:(int)y;
+ (id)monitorConfig;
+ (BOOL)hasOpenGL;
+ (BOOL)setupOpenGLForDisplay:(void *)display window:(unsigned long)win visualInfo:(void *)visualInfo;
+ (void)clearOpenGLForWidth:(int)width height:(int)height;
+ (void)drawUsingNearestFilterToOpenGLTextureID:(int)textureID pixels565:(uint16_t *)pixels width:(int)width height:(int)height;
+ (void)drawToOpenGLTextureID:(int)textureID pixels565:(uint16_t *)pixels width:(int)width height:(int)height;
+ (void)drawUsingNearestFilterToOpenGLTextureID:(int)textureID pixels:(uint32_t *)pixels width:(int)width height:(int)height;
+ (void)drawToOpenGLTextureID:(int)textureID pixels:(uint32_t *)pixels width:(int)width height:(int)height;
+ (void)drawUsingNearestFilterToOpenGLTextureID:(int)textureID bytes:(uint8_t *)pixels bitmapWidth:(int)bitmapWidth bitmapHeight:(int)bitmapHeight bitmapStride:(int)bitmapStride;
+ (void)drawToOpenGLTextureID:(int)textureID bytes:(uint8_t *)pixels bitmapWidth:(int)bitmapWidth bitmapHeight:(int)bitmapHeight bitmapStride:(int)bitmapStride;
+ (void)drawOpenGLTextureID:(int)textureID;
+ (void)drawFlippedOpenGLTextureID:(int)textureID x:(int)x y:(int)y w:(int)w h:(int)h inW:(int)inW h:(int)inH;
+ (void)drawOpenGLTextureID:(int)textureID x:(int)x y:(int)y w:(int)w h:(int)h inW:(int)inW h:(int)inH;
+ (void)drawFlippedOpenGLTextureID:(int)textureID;
+ (void)drawOpenGLTextureID:(int)textureID llX:(double)llX llY:(double)llY urX:(double)urX urY:(double)urY;
+ (void)drawTextureId:(int)textureID;
+ (void)openGLXSwapBuffersForDisplay:(void *)display window:(unsigned long)win;
+ (void *)openGLXChooseVisual:(void *)display :(int)screen;
- (void)dealloc;
- (id)init;
- (int)textureID;;
+ (id)currentWindow;
+ (void)x11FixupEvent:(id)eventDict forBitmapObject:(id)object;
+ (void)generateLeftKeyEvent;
+ (id)keyForXKeyCode:(unsigned int)keyCode modifiers:(unsigned int)modifiers;
+ (id)simpleKeyForXKeyCode:(unsigned int)keyCode modifiers:(unsigned int)modifiers;
- (void)showInXWindow;
- (void)showInXWindowWithWidth:(int)width height:(int)height;
- (void)showInXWindow;
- (void)showInXWindowWithWidth:(int)width height:(int)height;
- (void)showInXWindow;
- (void)showInXWindowWithX:(int)x y:(int)y width:(int)width height:(int)height;
- (void)showInXWindowWithWidth:(int)width height:(int)height;
+ (void)runWindowManager;
+ (void)runWindowManagerForObject:(id)object;
+ (id)setupWindowManagerForObject:(id)object x:(int)x y:(int)y w:(int)w h:(int)h;
+ (void)runWindowManagerForObject:(id)object x:(int)x y:(int)y w:(int)w h:(int)h;
- (void)runWindowManagerForObject;
- (void)grabHotKeys;
- (void)dealloc;
- (void)cleanup;
- (BOOL)setupX11;
- (BOOL)setupWindowManager;
- (void)getX11Color:(void *)ptr colormap:(unsigned long)colormap r:(int)r g:(int)g b:(int)b;
- (void)setBackgroundForBitmap:(id)bitmap;
- (void)setBackgroundForCString:(char *)cstr palette:(char *)palette;
- (void)cleanupChildProcesses;
- (void)reparentAllWindows:(id)reparentClassName;
- (void)unparentAllWindows;
- (void)grabButtonForWindow:(unsigned long)win;
- (void)ungrabButtonForWindow:(unsigned long)win;
- (id)reparentWindow:(unsigned long)win x:(int)x y:(int)y w:(int)w h:(int)h;
- (void)sendCloseEventToWindow:(unsigned long)win;
- (void)addShadowMaskToObjectWindow:(id)dict;
- (void)unparentObjectWindow:(id)dict;
- (void)destroyObjectWindow:(id)dict;
- (void)unmapObjectWindow:(id)dict;
- (void)mapObjectWindow:(id)dict;
- (void)raiseObjectWindow:(id)dict;
- (void)lowerObjectWindow:(id)dict;
- (void)moveObjectWindow:(id)dict x:(int)x y:(int)y;
- (void)resizeObjectWindow:(id)dict w:(int)w h:(int)h;
- (void)moveResizeObjectWindow:(id)dict x:(int)x y:(int)y w:(int)w h:(int)h;
- (id)dictForObjectChildWindow:(unsigned long)win;
- (id)dictForObjectWindow:(unsigned long)win;
- (id)dictForObjectWindowClassName:(id)className;
- (id)dictForObjectFilePath:(id)filePath;
- (id)dictForObject:(id)obj;
- (void)destroyWindowButKeepObject:(id)dict;
- (void)openWindowForExistingObjectWindow:(id)dict x:(int)x y:(int)y w:(int)w h:(int)h;
- (unsigned long)openWindowWithName:(id)name x:(int)x y:(int)y w:(int)w h:(int)h;
- (unsigned long)openWindowWithName:(id)name x:(int)x y:(int)y w:(int)w h:(int)h overrideRedirect:(BOOL)overrideRedirect;
- (id)openWindowForObject:(id)object x:(int)x y:(int)y w:(int)w h:(int)h ;
- (id)openWindowForObject:(id)object x:(int)x y:(int)y w:(int)w h:(int)h overrideRedirect:(BOOL)overrideRedirect;
- (id)generateEventDictRootX:(int)rootX rootY:(int)rootY x:(int)x y:(int)y w:(int)w h:(int)h x11dict:(id)x11dict;
- (id)dictForButtonEvent:(void *)eptr w:(int)w h:(int)h x11dict:(id)x11dict;
- (id)dictForKeyEvent:(void *)eptr w:(int)w h:(int)h x11dict:(id)x11dict;
- (void)drawObjectWindow:(id)context;
- (void)setInputFocus:(id)dict;
- (void)setInputFocus:(id)dict raiseWindow:(BOOL)raiseWindow;
- (void)runLoop;
- (void)handleX11KeyPress:(void *)eptr;
- (void)handleX11KeyRelease:(void *)eptr;
- (void)handleXCrossingEvent:(void *)eptr;
- (void)handleX11EnterNotify:(void *)eptr;
- (void)handleX11LeaveNotify:(void *)eptr;
- (void)handleX11FocusIn:(void *)eptr;
- (void)handleX11FocusOut:(void *)eptr;
- (void)handleX11PropertyNotify:(void *)eptr;
- (void)handleX11ConfigureNotify:(void *)eptr;
- (void)handleX11VisibilityNotify:(void *)eptr;
- (void)handleX11ConfigureRequest:(void *)eptr;
- (void)handleX11MapRequest:(void *)eptr;
- (void)handleX11DestroyNotify:(void *)eptr;;
- (void)handleX11UnmapNotify:(void *)eptr;;
- (void)handleX11ButtonPress:(void *)eptr;
- (void)handleX11ButtonRelease:(void *)eptr;
- (void)handleX11MotionNotify:(void *)eptr;
- (void)handleX11SelectionNotify:(void *)ptr source:(id)source;
- (void)handleX11SelectionClear:(void *)eventptr;
- (void)handleX11SelectionRequest:(void *)eventptr;
- (void)convertX11Selection;
- (void)convertX11Selection:(id)source;
- (void)convertX11SelectionTargets:(id)source;
- (void)sendX11SelectionNone:(void *)eventptr;
- (void)sendX11Selection:(void *)eventptr string:(id)str;
- (void)showX11SelectionTargets;
- (void)handleAlertsPath;
- (void)handleDesktopPath;
- (id)allTopLevelWindows;
- (unsigned long)topMostWindowUnderneathWindow:(unsigned long)excludeWindow x:(int)x y:(int)y;
- (void)openBackgroundAgentsWindow;
- (void)XReparentWindow:(unsigned long)child :(unsigned long)parent :(int)x :(int)y;
- (void)XResizeWindow:(unsigned long)win :(int)w :(int)h;
- (void)XMoveWindow:(unsigned long)win :(int)x :(int)y;
- (void)XMoveResizeWindow:(unsigned long)win :(int)x :(int)y :(int)w :(int)h;
- (id)XGetWindowAttributes:(unsigned long)win;
- (void)XRaiseWindow:(unsigned long)win;
- (id)XGetWMNormalHints:(unsigned long)win;
- (void)XDestroyWindow:(unsigned long)win;
- (void)XSync:(BOOL)discard;
- (void)setX11Cursor:(char)cursor;
- (void)x11MoveChildWindowBackAndForthForWine;
- (void)x11MoveToMonitor:(int)monitorNumber;
- (void)x11MaximizeTopHalf;
- (void)x11MaximizeBottomHalf;
- (void)x11MaximizeLeftHalf;
- (void)x11MaximizeRightHalf;
- (void)x11MaximizeTopLeft;
- (void)x11MaximizeTopRight;
- (void)x11MaximizeBottomLeft;
- (void)x11MaximizeBottomRight;
- (void)x11FillToHeightOfMonitor;
- (void)x11CloseWindow;
- (void)x11ToggleMaximizeWindow;
- (void)x11MoveToMonitorDelta:(int)delta;
@end
