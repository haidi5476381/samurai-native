//
//     ____    _                        __     _      _____
//    / ___\  /_\     /\/\    /\ /\    /__\   /_\     \_   \
//    \ \    //_\\   /    \  / / \ \  / \//  //_\\     / /\/
//  /\_\ \  /  _  \ / /\/\ \ \ \_/ / / _  \ /  _  \ /\/ /_
//  \____/  \_/ \_/ \/    \/  \___/  \/ \_/ \_/ \_/ \____/
//
//	Copyright Samurai development team and other contributors
//
//	http://www.samurai-framework.com
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "UIScrollView+Html.h"

#import "_pragma_push.h"

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "Samurai_HtmlStyle.h"
#import "Samurai_HtmlRenderObject.h"
#import "Samurai_HtmlRenderScope.h"

// ----------------------------------
// Source code
// ----------------------------------

#pragma mark -

@implementation UIScrollView(Html)

+ (HtmlRenderModel)html_defaultRenderModel
{
	return HtmlRenderModel_Container;
}

#pragma mark -

- (void)html_applyDom:(SamuraiHtmlDomNode *)dom
{
	[super html_applyDom:dom];
	
	NSString * isPaging = [dom.attributes objectForKey:@"is-paging"];
	
	if ( isPaging )
	{
		self.pagingEnabled = YES;
	}
	else
	{
		self.pagingEnabled = NO;
	}
}

- (void)html_applyStyle:(SamuraiHtmlStyle *)style
{
	[super html_applyStyle:style];
	
	if ( IOS7_OR_LATER )
	{
		self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
	}
}

- (void)html_applyFrame:(CGRect)newFrame
{
	[super html_applyFrame:newFrame];
}

#pragma mark -

- (id)html_serialize
{
	return [super html_serialize];
}

- (void)html_unserialize:(id)obj
{
	[super html_unserialize:obj];
}

- (void)html_zerolize
{
	[super html_zerolize];
}

@end

// ----------------------------------
// Unit test
// ----------------------------------

#pragma mark -

#if __SAMURAI_TESTING__

TEST_CASE( WebCore, UIScrollView_Html )

DESCRIBE( before )
{
}

DESCRIBE( after )
{
}

TEST_CASE_END

#endif	// #if __SAMURAI_TESTING__

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "_pragma_pop.h"
