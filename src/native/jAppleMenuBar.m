/*
 Part of the jAppleMenuBar
 
 The MIT License
 
 Copyright (c) 2011, hansi raber.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "jAppleMenuBar.h"
#import <JavaNativeFoundation/JavaNativeFoundation.h> // helper framework for Cocoa and JNI development
#import <Carbon/Carbon.h> // helper framework for Cocoa and JNI development


JNIEXPORT void JNICALL Java_japplemenubar_JAppleMenuBar_setVisible
(JNIEnv *env, jclass clazz, jboolean visible, jboolean kioskMode)
{
	if( visible == JNI_TRUE ){
        SetSystemUIMode(kUIModeNormal, 0);
	}
	else{
        SetSystemUIMode(kUIModeAllHidden, (kioskMode == JNI_TRUE) ?
						( kUIOptionDisableAppleMenu
						| kUIOptionDisableProcessSwitch
						| kUIOptionDisableForceQuit
						| kUIOptionDisableSessionTerminate) : 0);						
	}
}
