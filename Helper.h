#import <Foundation/Foundation.h>

@interface Helper : NSObject

#pragma mark -
#pragma mark - LABEL METHODS

+ (void)setCustomizeLabel:(UILabel *)label
               withString:(NSString *)string
       withParagraphStyle:(NSTextAlignment *)alignment
                 withFont:(UIFont *)font
            withTextColor:(UIColor *)color;

#pragma mark -
#pragma mark - TEXTVIEW METHODS

+ (CGRect)setTextview:(UITextView *)textview
             withText:(NSString *)text
         withDistance:(float)distance
             withFont:(UIFont *)font
        withTextColor:(UIColor *)colorText;

+ (int)getNumberOfLineFromTextview:(UITextView *)mTextView;

#pragma mark -
#pragma mark - STRING METHODS

+ (CGRect)getStringRectFrame:(NSString *)string
                    withFont:(UIFont *)font
        withAttributedString:(NSMutableAttributedString *)mStringAttributed
     withDictionarAttributed:(NSDictionary *)attributes
                withMaxWidth:(CGFloat)MaxWidth
                andMaxHeight:(CGFloat)MaxHeight;

+ (CGRect)getStringRectFrame:(NSString *)string
                    withFont:(UIFont *)font
                withMaxWidth:(CGFloat)MaxWidth
                andMaxHeight:(CGFloat)MaxHeight;

+ (NSMutableAttributedString *)atributedUnderLineString:(NSString *)string
                                              fontColor:(UIColor *)colorFont
                                         underlineColor:(UIColor *)colorUnderLine;

+ (NSMutableAttributedString *)atributedAddArrow:(NSString *)string
                                       fontColor:(UIColor *)colorFont
                                     arrrowColor:(UIColor *)colorUnderLine
                                        fontText:(UIFont *)mFont
                                       fontArrow:(UIFont *)mFontArrow;

+ (BOOL)isAlphaNumericString:(NSString *)mString;

+ (void)addAtrributedStringTo:(UILabel *)mLabel
         withAttributedString:(NSMutableAttributedString *)mAttributedString
                   baseString:(NSString *)mStringBase
                matchToString:(NSString *)mString
              setRangeSpecial:(BOOL)isSpecial
                    baseColor:(UIColor *)mColorBase
                     addColor:(UIColor *)mColor
                     baseFont:(UIFont *)mFontBase
                      addFont:(UIFont *)mFont;

#pragma mark -
#pragma mark - VIEW / BUTTON / IMAGE METHODS

+ (void)setButtonWithArrow:(UIButton *)button withTitle:(NSString *)string;

+ (void)setImageToCircle:(UIImageView *)image
              withBorder:(BOOL)isWithBorder
         withBorderWidth:(CGFloat)width
         withBorderColor:(UIColor *)color;

+ (void)setRounderEdgeToview:(UIView *)view
                  withBorder:(BOOL)isWithBorder
             withBorderWidth:(CGFloat)width
             withBorderColor:(UIColor *)color
                      radius:(float)rad;

+ (UIImage *)imageWithColor:(UIColor *)color;

#pragma mark -
#pragma mark - COLOR WITH HEX VALUE

+ (UIColor*)colorWithHexString:(NSString *)hex;

#pragma mark -
#pragma mark - NETWORK CONNECTION

+ (BOOL)isNetworkAvailable;

@end
