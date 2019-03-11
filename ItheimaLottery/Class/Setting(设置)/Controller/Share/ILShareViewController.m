//
//  ILShareViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-17.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILShareViewController.h"
#import "ILSettingItem.h"
#import "ILSettingArrowItem.h"
#import "ILSettingGroup.h"

#import <MessageUI/MessageUI.h>

#import "UMSocial.h"
#import "MBProgressHUD+MJ.h"
@interface ILShareViewController ()<MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>

@property (nonatomic, assign) int age;

@end

@implementation ILShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 0组
    [self addGroup0];
    
}
- (void)dealloc
{
     NSLog(@"ILShareViewController-----dealloc");
}
- (void)addGroup0
{

      __weak typeof(self) selfVc = self;
    
    // 0组
    ILSettingItem *sina = [ILSettingArrowItem itemWithIcon:@"WeiboSina" title:@"新浪分享" destVcClass:nil];
    sina.option = ^{
        
//        [[UMSocialControllerService defaultControllerService] setShareText:@"天天中500W" shareImage:[UIImage imageNamed:@"阿狸头像"] socialUIDelegate:selfVc];
//
//        [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
        
        [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToSina] content:@"天天中500W" image:[UIImage imageNamed:@"阿狸头像"] location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
            if (response.responseCode == UMSResponseCodeSuccess) {
                [MBProgressHUD showSuccess:@"分享成功"];
            }
        }];
    };
    
    ILSettingItem *sms = [ILSettingArrowItem itemWithIcon:@"SmsShare" title:@"短信分享" destVcClass:nil];
    
    sms.option = ^{
        
        MFMessageComposeViewController *vc = [[MFMessageComposeViewController alloc] init];
        
        vc.body = @"吃饭了吗";
        
        vc.recipients = @[@"10086"];
        
        vc.messageComposeDelegate = selfVc;
        
        [selfVc presentViewController:vc animated:YES completion:nil];

        
    };
    
    ILSettingItem *email = [ILSettingArrowItem itemWithIcon:@"MailShare" title:@"邮件分享" destVcClass:nil];
    email.option = ^{
//        NSURL *url = [NSURL URLWithString:@"mailto://10010@qq.com"];
//        [[UIApplication sharedApplication] openURL:url];
        // 不能发邮件
        if (![MFMailComposeViewController canSendMail]) return;
        
        MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
        
        // 设置邮件主题
        [vc setSubject:@"会议"];
        // 设置邮件内容
        [vc setMessageBody:@"今天下午开会吧" isHTML:NO];
        // 设置收件人列表
        [vc setToRecipients:@[@"643055866@qq.com"]];
        // 设置抄送人列表
        [vc setCcRecipients:@[@"1234@qq.com"]];
        // 设置密送人列表
        [vc setBccRecipients:@[@"56789@qq.com"]];
        
        // 添加附件（一张图片）
        UIImage *image = [UIImage imageNamed:@"阿狸头像"];
        NSData *data = UIImagePNGRepresentation(image);
        [vc addAttachmentData:data mimeType:@"image/png" fileName:@"阿狸头像.png"];
        
        // 设置代理
        vc.mailComposeDelegate = selfVc;
        // 显示控制器
        [selfVc presentViewController:vc animated:YES completion:nil];

    };

    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    group0.items = @[sina,sms,email];
    
    [self.dataLists addObject:group0];
    
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
