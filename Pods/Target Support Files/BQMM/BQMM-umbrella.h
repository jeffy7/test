#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BQMM.h"
#import "MMEmoji.h"
#import "MMEmotionCentre.h"
#import "MMTextParser.h"
#import "MMTheme.h"
#import "SMTextAttachment.h"
#import "UITextView+BQMM.h"
#import "MMTextParser+ExtData.h"
#import "MMTextView.h"

FOUNDATION_EXPORT double BQMMVersionNumber;
FOUNDATION_EXPORT const unsigned char BQMMVersionString[];

