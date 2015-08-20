#import <Foundation/Foundation.h>

@interface Helper : NSObject

+ (void)setCustomizeLabel:(UILabel *)label
                   WithString:(NSString *)string
           WithParagraphStyle:(NSTextAlignment*)alignment
                     WithFont:(UIFont *)font
                WithTextColor:(UIColor *)color;

+ (CGRect)setTextview:(UITextView *)textview
             withText:(NSString *)text
         withDistance:(float)distance
             withFont:(UIFont *)font
        withTextColor:(UIColor *)colorText;

+ (void)setImageToCircle:(UIImageView *)image
              withBorder:(BOOL)isWithBorder
         withBorderWidth:(CGFloat)width
         withBorderColor:(UIColor *)color;

+ (void)setRounderEdgeToview:(UIView *)view
                  withBorder:(BOOL)isWithBorder
             withBorderWidth:(CGFloat)width
             withBorderColor:(UIColor *)color
                      radius:(float)rad;

+ (CGRect)getStringRectFrame:(NSString *)string
                    withFont:(UIFont *)font
                withMaxWidth:(CGFloat)MaxWidth
                andMaxHeight:(CGFloat)MaxHeight;

+ (void)addAtrributedStringTo:(UILabel *)mLabel
         withAttributedString:(NSMutableAttributedString *)mAttributedString
                   baseString:(NSString *)mStringBase
                matchToString:(NSString *)mString
              setRangeSpecial:(BOOL)isSpecial
                    baseColor:(UIColor *)mColorBase
                     addColor:(UIColor *)mColor
                     baseFont:(UIFont *)mFontBase
                      addFont:(UIFont *)mFont;

+ (CGRect)getStringRectFrame:(NSString *)string
                    withFont:(UIFont *)font
        withAttributedString:(NSMutableAttributedString *)mStringAttributed
     withDictionarAttributed:(NSDictionary *)attributes
                withMaxWidth:(CGFloat)MaxWidth
                andMaxHeight:(CGFloat)MaxHeight;

+ (int)getNumberOfLineFromTextview:(UITextView *)mTextView;
+ (BOOL)isAlphaNumericString:(NSString *)mString;

+ (void)setButtonWithArrow:(UIButton *)button withTitle:(NSString *)string;

+ (NSMutableAttributedString *)atributedUnderLineString:(NSString *)string
                                              fontColor:(UIColor *)colorFont
                                         underlineColor:(UIColor *)colorUnderLine;

+ (NSMutableAttributedString *)atributedAddArrow:(NSString *)string
                                       fontColor:(UIColor *)colorFont
                                     arrrowColor:(UIColor *)colorUnderLine
                                        fontText:(UIFont *)mFont
                                       fontArrow:(UIFont *)mFontArrow;

+ (UIImage *)imageWithColor:(UIColor *)color;

+(UIColor*)colorWithHexString:(NSString*)hex;
@end
