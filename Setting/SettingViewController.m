//
//  SettingViewController.m
//  secret
//
//  Created by 刘旭辉 on 15/7/9.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 40;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0)
    {
        return 3;
    }
    else if (section == 1)
    {
        return 3;
    }
    else if (section == 2)
    {
        return 3;
    }
    else
    {
        return 1;
    }
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    int row = [indexPath row];
    int section = [indexPath section];
    
    static NSString *CellIdentifier = @"Cell";
    static NSString *PickerCellIdentifier = @"PickerCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:(indexPath.section == 0 && indexPath.row == 0) || (indexPath.section == 0 && indexPath.row == 2) || (indexPath.section == 2 && indexPath.row == 1) ?
                                                   PickerCellIdentifier : CellIdentifier];
    
  
     cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
//    if (cell == nil)
//    {
//        if ((indexPath.section == 0 && indexPath.row == 0) || (indexPath.section == 0 && indexPath.row == 2) || (indexPath.section == 2 && indexPath.row == 1))
//        {
//            cell = [[[BDVRPickerTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:PickerCellIdentifier] autorelease];
//            ((BDVRPickerTableViewCell *)cell).pickerView.delegate = self;
//            ((BDVRPickerTableViewCell *)cell).pickerView.tag = section * 10 + row;
//        }
//        else
//        {
//            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
//        }
//    } else {
//        if ((indexPath.section == 0 && indexPath.row == 0) || (indexPath.section == 0 && indexPath.row == 2) || (indexPath.section == 2 && indexPath.row == 1))
//        {
//            ((BDVRPickerTableViewCell *)cell).pickerView.delegate = self;
//            ((BDVRPickerTableViewCell *)cell).pickerView.tag = section * 10 + row;
//        }
//    }
    
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    cell.textLabel.textColor = [UIColor blackColor];
    
    if (section == 0)
    {
        if (row == 0)
        {
            cell.textLabel.text = NSLocalizedString(@"StringRecoginitonMode", nil);
            
            UILabel *propertyLable = [[UILabel alloc] initWithFrame:CGRectZero];
            propertyLable.frame = CGRectMake(-40, 0, 66, 40);
            propertyLable.textAlignment = UITextAlignmentCenter;
            propertyLable.font = [UIFont boldSystemFontOfSize:14.0];
            propertyLable.textColor = [UIColor blackColor];
            propertyLable.backgroundColor = [UIColor clearColor];
            cell.accessoryView = propertyLable;
           
        }
        else if (row == 1)
        {
            cell.textLabel.text = NSLocalizedString(@"StringRecoginitonNLU", nil);
            UISwitch *tmpSwitch = [[UISwitch alloc] init];
            tmpSwitch.on = NO;
            [tmpSwitch addTarget:self action:@selector(setNeedNLU:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = tmpSwitch;
        }
        else if (row == 2)
        {
            cell.textLabel.text = NSLocalizedString(@"StringLanguage", nil);
            UILabel *sampleRateLable = [[UILabel alloc] initWithFrame:CGRectZero];
            sampleRateLable.frame = CGRectMake(-40, 0, 66, 40);
            sampleRateLable.textAlignment = UITextAlignmentCenter;
            sampleRateLable.font = [UIFont boldSystemFontOfSize:14.0];
            sampleRateLable.textColor = [UIColor blackColor];
            sampleRateLable.backgroundColor = [UIColor clearColor];
            cell.accessoryView = sampleRateLable;
          
        }
    }
    else if (section == 1)
    {
        if (row == 0)
        {
            cell.textLabel.text = NSLocalizedString(@"StringPlayStartMusic", nil);
            UISwitch *tmpSwitch = [[UISwitch alloc] init];
            [tmpSwitch addTarget:self action:@selector(playStartMusicSwitch:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = tmpSwitch;
        }
        else if (row == 1)
        {
            cell.textLabel.text = NSLocalizedString(@"StringPlayEndMusic", nil);
            UISwitch *tmpSwitch = [[UISwitch alloc] init];
            [tmpSwitch addTarget:self action:@selector(playEndMusicSwitch:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = tmpSwitch;
        }
        else if (row == 2)
        {
            cell.textLabel.text = NSLocalizedString(@"StringSaveVoiceLevelMeter", nil);
            UISwitch *tmpSwitch = [[UISwitch alloc] init];
            [tmpSwitch addTarget:self action:@selector(voiceLevelMeterSwitch:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = tmpSwitch;
        }
    }
    else if (section == 2)
    {
        if (row == 0)
        {
            cell.textLabel.text = NSLocalizedString(@"StringRecoginitonResultContinuousShow", nil);
            UISwitch *tmpSwitch = [[UISwitch alloc] init];
            [tmpSwitch addTarget:self action:@selector(resultContinuousShowSwitch:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = tmpSwitch;
          
        }
        else if (row == 1)
        {
            cell.textLabel.text = NSLocalizedString(@"StringTheme", nil);
            
            UILabel *sampleRateLable = [[UILabel alloc] initWithFrame:CGRectZero];
            sampleRateLable.frame = CGRectMake(-40, 0, 44, 40);
            sampleRateLable.textAlignment = UITextAlignmentCenter;
            sampleRateLable.font = [UIFont boldSystemFontOfSize:14.0];
            sampleRateLable.textColor = [UIColor blackColor];
            sampleRateLable.backgroundColor = [UIColor clearColor];
            cell.accessoryView = sampleRateLable;
          
        }
        else if (row == 2)
        {
            cell.textLabel.text = NSLocalizedString(@"StringClosedUIHintMusic", nil);
            UISwitch *tmpSwitch = [[UISwitch alloc] init];
            [tmpSwitch addTarget:self action:@selector(uiHintMusicSwitch:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = tmpSwitch;
                   }
    }
    else
    {
        if (row == 0)
        {
            cell.accessoryView = nil;
            cell.textLabel.text = NSLocalizedString(@"StringLibVersion", nil);

        }
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *titleString = nil;
    if (section == 0)
    {
        titleString = NSLocalizedString(@"StringSectionTitleCommon", nil);
    }
    else if (section == 1)
    {
        titleString = NSLocalizedString(@"StringSectionTitleNoUI", nil);
    }
    else if (section == 2)
    {
        titleString = NSLocalizedString(@"StringSectionTitleUI", nil);
    }
    else
    {
        titleString = NSLocalizedString(@"StringSectionTitleVersion", nil);
    }
    
    return titleString;
}


@end
