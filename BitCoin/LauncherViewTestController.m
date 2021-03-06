#import "LauncherViewTestController.h"

///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation LauncherViewTestController

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"BitCoin";
  }
  return self;
}

- (void)dealloc {
    TT_RELEASE_SAFELY(_background);
    TT_RELEASE_SAFELY(_launcherView);
  [super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// UIViewController

- (void)loadView {
  [super loadView];

    
    _background = [[UIImageView alloc] initWithFrame:self.view.bounds]; 
    _background.image = [UIImage imageNamed: @"back.png"];
    [self.view addSubview:_background];

    _launcherView = [[TTLauncherView alloc]   
                     initWithFrame:self.view.bounds]; 
    _launcherView.backgroundColor = [UIColor clearColor]; 
    //_launcherView.backgroundColor = [UIColor colorWithRed:0x5d/256. green:0x5d/256. blue:0x5d/256. alpha:1.0];
    
  _launcherView.delegate = self;
  _launcherView.columnCount = 4;
  _launcherView.pages = [NSArray arrayWithObjects:
    [NSArray arrayWithObjects:
    // [[[TTLauncherItem alloc] initWithTitle:@"Accounts"
    //                                  image:@"bundle://Icon.png"
    //                                    URL:@"bitcoin://rpccommand/1/listaccounts" canDelete:NO] autorelease],
     [[[TTLauncherItem alloc] initWithTitle:@"My Address"
                                      image:@"bundle://Address@2x.png"
                                        URL:@"bitcoin://myaddress" canDelete:NO] autorelease], 
     [[[TTLauncherItem alloc] initWithTitle:@"Balance"
                                      image:@"bundle://Balance@2x.png"
                                        URL:@"bitcoin://balance" canDelete:NO] autorelease],//getbalance 
     [[[TTLauncherItem alloc] initWithTitle:@"Send"
                                      image:@"bundle://Send@2x.png"
                                        URL:@"bitcoin://sendto" canDelete:NO] autorelease], 
     [[[TTLauncherItem alloc] initWithTitle:@"Backup"
                                      image:@"bundle://backup@2x.png"
                                        URL:@"bitcoin://backup" canDelete:NO] autorelease], 
     [[[TTLauncherItem alloc] initWithTitle:@"Console"
                                      image:@"bundle://Console@2x.png"
                                        URL:@"bitcoin://console" canDelete:NO] autorelease], 
     [[[TTLauncherItem alloc] initWithTitle:@"Remote"
                                      image:@"bundle://Remote@2x.png"
                                        URL:@"bitcoin://login" canDelete:YES] autorelease], 
     [[[TTLauncherItem alloc] initWithTitle:@"Help"
                                      image:@"bundle://HowTo@2x.png"
                                        URL:@"bitcoin://about" canDelete:YES] autorelease], 
     [[[TTLauncherItem alloc] initWithTitle:@"Feedback"
                                      image:@"bundle://Em.png"
                                        URL:@"bitcoin://contactus" canDelete:NO] autorelease], 
     [[[TTLauncherItem alloc] initWithTitle:@"License"
                                      image:@"bundle://license@2x.png"
                                        URL:@"bitcoin://page/license" canDelete:NO] autorelease],
     [[[TTLauncherItem alloc] initWithTitle:@"Please Donate"
                                      image:@"bundle://Donate@2x.png"
                                        URL:@"bitcoin://sendto/1JsHXZRoqoPkwpZajy1VmnSmmvxqy1eux2" canDelete:YES] autorelease], 
      nil],
      nil
    ];
  [self.view addSubview:_launcherView];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTLauncherViewDelegate

- (void)launcherView:(TTLauncherView*)launcher didSelectItem:(TTLauncherItem*)item {
	TTNavigator* navigator = [TTNavigator navigator];
    [navigator openURLAction:[TTURLAction actionWithURLPath:item.URL]];   
}

- (void)launcherViewDidBeginEditing:(TTLauncherView*)launcher {
  [self.navigationItem setRightBarButtonItem:[[[UIBarButtonItem alloc]
    initWithBarButtonSystemItem:UIBarButtonSystemItemDone
    target:_launcherView action:@selector(endEditing)] autorelease] animated:YES];
}

- (void)launcherViewDidEndEditing:(TTLauncherView*)launcher {
  [self.navigationItem setRightBarButtonItem:nil animated:YES];
}

@end
