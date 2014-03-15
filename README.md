KKActionSheet
=============

Subclass of UIActionSheet for setting text color in buttons for given indexes.

## Screenshots
<img src="https://raw.github.com/leoru/KKActionSheet/master/screenshots/1.png">

## Install
1.Over cocoapods

```objc
pod install 'KKActionSheet'
```

2.You can drag the src/KKActionSheet folder to your project. This library must be ARC enabled.

## Use
At first
```objc
#import "KKActionSheet.h"
```
Then in yours controller for example:
```objc
- (IBAction)actionShowActionSheet:(id)sender
{
    KKActionSheet *sheet = [[KKActionSheet alloc] initWithTitle:@"Test actionsheet" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Button index 1",@"Button index 2", nil];
    [sheet setTitlesTextColor:[UIColor blackColor]];
    [sheet setTextColors:@[[UIColor redColor], [UIColor blueColor]] forButtonIndexes:@[@(0),@(1)]];
    [sheet showInView:self.view];
}
```
Delegate and other properties and methods are equal to UIActionSheet.

License
=======
MIT License
