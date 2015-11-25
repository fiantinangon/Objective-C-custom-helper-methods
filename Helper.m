#import "Helper.h"

#define COLOR_CUSTOM_CLEAR_COLOR [UIColor clearColor]
#define COLOR_CUSTOM_DEFAULT_COLOR [UIColor colorWithRed:189.0f/255.0f green:152.0f/255.0f blue:112.0f/255.0f alpha:1.0f]

#define YOUR_FONT_NAME_WITH_SIZE [UIFont fontWithName:FONT_NAME size:10.0f]

#define YOUR_ARROW_IMAGE [UIImage imageNamed:@"arrow_image_name"]

#define SYSTEM_VERSION_LESS_THAN(v)([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@implementation Helper

#pragma mark -
#pragma mark - LABEL METHODS 

+ (void)setCustomizeLabel:(UILabel *)label
               withString:(NSString *)string
       withParagraphStyle:(NSTextAlignment *)alignment
                 withFont:(UIFont *)font
            withTextColor:(UIColor *)color {
    
    NSMutableParagraphStyle *paragraphStyles = [[NSMutableParagraphStyle alloc] init];
    paragraphStyles.alignment = alignment;
    paragraphStyles.firstLineHeadIndent = 1.0;
    paragraphStyles.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyles.lineHeightMultiple = 8.0f;
    paragraphStyles.maximumLineHeight = 15.0f;
    paragraphStyles.minimumLineHeight = 15.0f;

    NSDictionary *attributes = @{ NSParagraphStyleAttributeName : paragraphStyles,
                                  NSFontAttributeName : font,
                                  NSBaselineOffsetAttributeName : [NSNumber numberWithFloat:0],
                                  NSForegroundColorAttributeName : color};
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes: attributes];
    
    label.attributedText = attributedString;
}

#pragma mark -
#pragma mark - TEXTVIEW METHODS

+ (CGRect)setTextview:(UITextView *)textview
             withText:(NSString *)text
         withDistance:(float)distance
             withFont:(UIFont *)font
        withTextColor:(UIColor *)colorText {
    
    if (isEmpty(text)) {
        
        CGRect mframeTextViews = textview.frame;
        
        return mframeTextViews;
        
    } else {
        
        [textview setEditable:NO];
        [textview setUserInteractionEnabled:YES];
        [textview setScrollEnabled:NO];
        [textview setFont:font];
        [textview setTextColor:colorText];
        [textview setBackgroundColor:COLOR_CUSTOM_CLEAR_COLOR];

        if (!SYSTEM_VERSION_LESS_THAN(@"7.0")) {
            
            [textview setTintColor:COLOR_CUSTOM_DEFAULT_COLOR];
            
        }
        
        [textview setDataDetectorTypes:UIDataDetectorTypeAll];
        
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.alignment = paragraph.alignment;
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        
        NSDictionary *attributes = @{ NSParagraphStyleAttributeName : paragraph,
                                      NSFontAttributeName : textview.font,
                                      NSBaselineOffsetAttributeName : [NSNumber numberWithFloat:0],
                                      NSForegroundColorAttributeName : textview.textColor };
        
        
        NSAttributedString *strText = [[NSAttributedString alloc] initWithString:text attributes:attributes];
        
        CGRect rectString;
        
        CGRect mframeTextViews = textview.frame;
        
        if (!SYSTEM_VERSION_LESS_THAN(@"7.0")) { //ios 7
            
            rectString = [text boundingRectWithSize:CGSizeMake(270.0f, 1000.0f)
                                            options:NSLineBreakByClipping | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                         attributes:attributes context:nil];
            
            mframeTextViews.size.width = rectString.size.width + 20.0f;
            mframeTextViews.size.height = rectString.size.height + 120.0f;//+ 23;
            [textview setAttributedText:strText];
            [textview setTextContainerInset:UIEdgeInsetsMake(0, 0, 0, 0)];
            
        } else {
            
            rectString = [strText boundingRectWithSize:CGSizeMake(290.0f, 1000.0f)
                                               options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                               context:nil];
            
            [textview setAttributedText:strText];
            
            mframeTextViews.size.width = rectString.size.width + 20;
            mframeTextViews.size.height = rectString.size.height + 15;//18;
            
        }
        
        return mframeTextViews;
        
    }
}

+ (int)getNumberOfLineFromTextview:(UITextView *)mTextView {
    int mIntNumberOfLine;
    
    mIntNumberOfLine = mTextView.contentSize.height / mTextView.font.lineHeight;
    
    return mIntNumberOfLine;
    
}

#pragma mark -
#pragma mark - STRING METHODS

+ (CGRect)getStringRectFrame:(NSString *)string
                    withFont:(UIFont *)font
        withAttributedString:(NSMutableAttributedString *)mStringAttributed
     withDictionarAttributed:(NSDictionary *)attributes
                withMaxWidth:(CGFloat)MaxWidth
                andMaxHeight:(CGFloat)MaxHeight {
    
    CGRect mRectString;
    
    NSMutableAttributedString *strText = mStringAttributed;
    
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        
        mRectString = [strText boundingRectWithSize:CGSizeMake(MaxWidth, MaxHeight)
                                            options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                            context:nil];
        
    } else {
        
        mRectString = [string boundingRectWithSize:CGSizeMake(MaxWidth, MaxHeight)
                                           options:NSLineBreakByClipping | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                        attributes:attributes context:nil];

        
    }
    
    return mRectString;
}

+ (CGRect)getStringRectFrame:(NSString *)string
                    withFont:(UIFont *)font
                withMaxWidth:(CGFloat)MaxWidth
                andMaxHeight:(CGFloat)MaxHeight {
    
    CGRect mRectString;
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentLeft;
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{ NSParagraphStyleAttributeName : paragraph,
                                  NSFontAttributeName : font,
                                  NSBaselineOffsetAttributeName : [NSNumber numberWithFloat:0],
                                  };
    
    NSAttributedString *strText;
    if (string) {
        
        strText = [[NSAttributedString alloc] initWithString:string attributes:attributes];
        
    }
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        
        mRectString = [strText boundingRectWithSize:CGSizeMake(MaxWidth, MaxHeight)
                                            options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                            context:nil];
        
    } else {
        
        mRectString = [string boundingRectWithSize:CGSizeMake(MaxWidth, MaxHeight)
                                           options:NSLineBreakByClipping | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                        attributes:attributes context:nil];
        
    }
    
    return mRectString;
}

+ (NSMutableAttributedString *)atributedUnderLineString:(NSString *)string
                                              fontColor:(UIColor *)colorFont
                                         underlineColor:(UIColor *)colorUnderLine {
    
    NSDictionary *attributesLink;
    if (!SYSTEM_VERSION_LESS_THAN(@"7.0")) {//
        
        attributesLink = @{
                           NSForegroundColorAttributeName:colorFont,
                           NSFontAttributeName : YOUR_FONT_NAME_WITH_SIZE,
                           NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                           NSUnderlineColorAttributeName:colorUnderLine
                           };
    } else {
        
        attributesLink = @{
                           NSForegroundColorAttributeName:colorFont,
                           NSFontAttributeName : YOUR_FONT_NAME_WITH_SIZE,
                           NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)
                           };
    }
    
    NSMutableAttributedString *mStringAtributeLearnMore = [[NSMutableAttributedString alloc] initWithString:string attributes:attributesLink];
    
    return mStringAtributeLearnMore;
}

+ (NSMutableAttributedString *)atributedAddArrow:(NSString *)string
                                       fontColor:(UIColor *)colorFont
                                     arrrowColor:(UIColor *)colorUnderLine
                                        fontText:(UIFont *)mFont
                                       fontArrow:(UIFont *)mFontArrow {
    
    NSString * mStringArrow = @">";

    
    NSDictionary * mDictionaryAtributeText = @{
                                               NSForegroundColorAttributeName:colorFont,
                                               NSFontAttributeName : mFont,
                                               NSBaselineOffsetAttributeName:@11.0f,
                                        };

        
    NSDictionary * mDictionaryAtributedArrow = @{
                                                 NSFontAttributeName : mFontArrow,
                                                 NSBaselineOffsetAttributeName:@10.0f,
                                                };
    
    
    NSString * mStringTextWithArrow = [string stringByAppendingString:[NSString stringWithFormat:@" %@",mStringArrow]];
    
    NSMutableAttributedString * mStringAtributeText = [[NSMutableAttributedString alloc] initWithString:mStringTextWithArrow attributes:mDictionaryAtributeText];

   
    if (mStringArrow) {
        NSRange range = [mStringTextWithArrow rangeOfString:mStringArrow];
        
        if (range.location != NSNotFound) {
            
           // NSLog(@"Found the range of the substring at (%d, %d)", range.location, range.location + range.length);
            [mStringAtributeText setAttributes:mDictionaryAtributedArrow range:NSMakeRange(range.location, 1)];
            
        }
    }
    
    
    return mStringAtributeText;
}

+ (BOOL)isAlphaNumericString:(NSString *)mString {
    NSCharacterSet *mCharacterSet = [NSCharacterSet alphanumericCharacterSet];
    BOOL isValid = [[mString stringByTrimmingCharactersInSet:mCharacterSet] isEqualToString:@""];
    return isValid;
}

+ (void)addAtrributedStringTo:(UILabel *)mLabel
         withAttributedString:(NSMutableAttributedString *)mAttributedString
                   baseString:(NSString *)mStringBase
                matchToString:(NSString *)mString
              setRangeSpecial:(BOOL)isSpecial
                    baseColor:(UIColor *)mColorBase
                     addColor:(UIColor *)mColor
                     baseFont:(UIFont *)mFontBase
                      addFont:(UIFont *)mFont {
    
    NSString * pStringBase = mStringBase;
    
    if (mAttributedString) {
        pStringBase = mAttributedString.string;
    }
   
    NSDictionary *mDictAttributesBased = @{
                                            NSFontAttributeName : mFontBase,
                                            NSForegroundColorAttributeName:mColorBase
                                        };
    
    NSDictionary *mDictAttributesAdd = @{
                                          NSFontAttributeName : mFont,
                                          NSForegroundColorAttributeName:mColor
                                          };
    
     NSMutableAttributedString *AttributedString = [[NSMutableAttributedString alloc] initWithString:pStringBase attributes:mDictAttributesBased];
    
    if (mAttributedString) {
     
        AttributedString = mAttributedString;
    }
   
    if (isSpecial) {
        NSArray *mArrayOfChar = [pStringBase componentsSeparatedByString:@"\n"];
        int countLine = 0;
        for (int i = 0; i < mArrayOfChar.count; i ++) {
            
            //NSLog(@"CurrentChar %@",[mArrayOfChar objectAtIndex:i]);
            mString = [mArrayOfChar objectAtIndex:i];
        
            if (!isEmpty(mString)) {
                countLine ++;
                
                if (countLine % 2 == 0) {
                    NSRange range;
                    range = [pStringBase rangeOfString:mString];
                    //NSLog(@"getRange of this String %@",mString);
                    if (range.location == NSNotFound) {
                        
                    }
                    else {
                        
                        //NSLog(@"Found the range of the substring at (%d, %d)", range.location, range.location + range.length);
                        [AttributedString setAttributes:mDictAttributesAdd range:NSMakeRange(range.location,range.length)];
                        [mLabel setAttributedText:AttributedString];
                    }
                }
            }
        }
        
        countLine = 0;
        
    } else {
        
        if (pStringBase.length > 0) {
            NSRange range;
            range = [pStringBase rangeOfString:mString];
            if (range.location == NSNotFound) {
                
            }
            else {
                // NSLog(@"Found the range of the substring at (%d, %d)", range.location, range.location + range.length);
                [AttributedString setAttributes:mDictAttributesAdd range:NSMakeRange(range.location, pStringBase.length - range.location)];
                [mLabel setAttributedText:AttributedString];
            }
            
        }
    }
    

    
}

#pragma mark -
#pragma mark - VIEW / BUTTON / IMAGE METHODS

+ (void)setButtonWithArrow:(UIButton *)button withTitle:(NSString *)string {
    
    CALayer *mLayerbutton = [button layer];
    [mLayerbutton setMasksToBounds:YES];
    
    UIImageView *ImageArrowDown;
    
    if (!ImageArrowDown) {
        ImageArrowDown = [[UIImageView alloc]initWithImage:YOUR_ARROW_IMAGE];
        
    }
    
    ImageArrowDown.frame = CGRectMake(0, 0, 9, 8);
    
    button.contentMode = UIViewContentModeScaleAspectFill;
    [button addSubview:ImageArrowDown];
    
    float buttonx = (button.bounds.size.width - ImageArrowDown.frame.size.width) - 10.0f;
    float buttony = (button.bounds.origin.y + button.bounds.size.height - ImageArrowDown.frame.size.height)/2.0f + 1.0f ;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    ImageArrowDown.frame = CGRectMake(buttonx, buttony, 9, 8);
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, button.frame.size.width, button.frame.size.height);
    
    [button setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [button setTitle:string forState:UIControlStateNormal];
    
}

+ (void)setImageToCircle:(UIImageView *)image
              withBorder:(BOOL)isWithBorder
         withBorderWidth:(CGFloat)width
         withBorderColor:(UIColor *)color {
    
    CGRect mRect = image.frame;
    
    CALayer *mLayer = [image layer];
    
    [mLayer setMasksToBounds:YES];
    
    if(mRect.size.width ==  mRect.size.height)
    {
        [mLayer setCornerRadius:(mRect.size.width/2.0f)];
        
    } else {
        
        [mLayer setCornerRadius:(mRect.size.width/2.0f)];
    }

    if (isWithBorder) {
        
        if (width) {
         
            [mLayer setBorderWidth:width];
        
        } else {
            [
             mLayer setBorderWidth:0.5f];
        
        }
        
        if (color) {
            
            [mLayer setBorderColor:color.CGColor];
            
        } else {
            
            [mLayer setBorderColor:[UIColor whiteColor].CGColor];
        }
        
    }
    
    
    CGRect rect = image.bounds;
    float radius = (mRect.size.width/2.0f);
    //Make round
    // Create the path for to make circle
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                   byRoundingCorners:UIRectCornerAllCorners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    maskLayer.frame = rect;
    maskLayer.path  = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the view's layer
    mLayer.mask = maskLayer;
    
    //Give Border
    //Create path for border
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                     byRoundingCorners:UIRectCornerAllCorners
                                                           cornerRadii:CGSizeMake(radius, radius)];
    
    // Create the shape layer and set its path
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    
    borderLayer.frame       = rect;
    borderLayer.path        = borderPath.CGPath;
    borderLayer.strokeColor = [UIColor whiteColor].CGColor;
    borderLayer.fillColor   = [UIColor clearColor].CGColor;
    borderLayer.lineWidth   = width;
    
    //Add this layer to give border.
    [mLayer addSublayer:borderLayer];
    
}

+ (void)setRounderEdgeToview:(UIView *)view
                  withBorder:(BOOL)isWithBorder
             withBorderWidth:(CGFloat)width
             withBorderColor:(UIColor *)color
                      radius:(float)rad {
    
    CALayer *mLayer = [view layer];
    
    [mLayer setMasksToBounds:YES];
    
    if (rad == 0) {
        rad = view.frame.size.width/2;
    }
    [mLayer setCornerRadius:rad];
    
    
    if (isWithBorder) {
        
        if (width) {
            
            [mLayer setBorderWidth:width];
            
        } else {
            [
             mLayer setBorderWidth:0.5f];
            
        }
        
        if (color) {
            
            [mLayer setBorderColor:color.CGColor];
            
        } else {
            
            [mLayer setBorderColor:[UIColor whiteColor].CGColor];
        }
        
    }
    
    
    CGRect rect = view.bounds;
    float radius = rad;
    //Make round
    // Create the path for to make circle
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                   byRoundingCorners:UIRectCornerAllCorners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    maskLayer.frame = rect;
    maskLayer.path  = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the view's layer
    mLayer.mask = maskLayer;
    
    //Give Border
    //Create path for border
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                     byRoundingCorners:UIRectCornerAllCorners
                                                           cornerRadii:CGSizeMake(radius, radius)];
    
    // Create the shape layer and set its path
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    
    borderLayer.frame       = rect;
    borderLayer.path        = borderPath.CGPath;
    borderLayer.strokeColor = [UIColor whiteColor].CGColor;
    borderLayer.fillColor   = [UIColor clearColor].CGColor;
    borderLayer.lineWidth   = width;
    
    //Add this layer to give border.
    if(!isEmpty([mLayer sublayers])) {
        [mLayer replaceSublayer:[[mLayer sublayers]firstObject] with:borderLayer];
    } else {
        [mLayer addSublayer:borderLayer];
    }
    
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark -
#pragma mark - COLOR WITH HEX VALUE

+ (UIColor*)colorWithHexString:(NSString *)hex {
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

#pragma mark -
#pragma mark - NETWORK CONNECTION

+ (BOOL)isNetworkAvailable {
    CFNetDiagnosticRef dReference;
    dReference = CFNetDiagnosticCreateWithURL (NULL, (__bridge CFURLRef)[NSURL URLWithString:@"www.google.com"]);
    
    CFNetDiagnosticStatus status;
    status = CFNetDiagnosticCopyNetworkStatusPassively (dReference, NULL);
    
    CFRelease (dReference);
    
    if (status == kCFNetDiagnosticConnectionUp) {
        // Connection is available
        return YES;
    } else {
        // Connection is down
        return NO;
    }
}

@end
