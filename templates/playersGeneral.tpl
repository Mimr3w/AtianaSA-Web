<?php
$query = $con->prepare("SELECT * FROM `users` WHERE `Name` = '{$user}' LIMIT 1;");
$query->execute();
$xx = 0;
while($dnn = $query->fetch())
{
$xx = 1;
function timestampdiff($qw,$saw)
{
	if($saw == -1) return "مادام العمر";
	$datetime1 = new DateTime("@$qw");
	$datetime2 = new DateTime("@$saw");
	$interval = $datetime1->diff($datetime2);
	return $interval->format('%d روز و %h ساعت');
}
?>
<div id="contentWrap"><div id="contentBox">
    <div class="pageTitle">
                    <?php echo $user ?>
            </div>
    <div id="contentMain">
<div id="leftSidebar"><ul><li class="first"><ul><li class="leftMenuItem"/><li class="menuItem"><a href="/players/online">بازیکنان آنلاین</a></li><li class="rightMenuItem"/></ul></li><li class="next"><ul><li class="leftMenuItem"/><li class="menuItem"><a href="/players/search">جستجوی بازیکن</a></li><li class="rightMenuItem"/></ul></li><li><ul><li class="leftMenuItem"/><li class="menuItem"><a href="/players/reports">شکایات <span class='numberBullet'><?php echo totalunAnsweredReports($con); ?></span></a></li><li class="rightMenuItem"/></ul></li><li><ul><li class="leftMenuItem"/><li class="menuItem"><a href="/players/unbanRequests">رفع محرومیت <span class='numberBullet'>0</span></a></li><li class="rightMenuItem"/></ul></li><li class="prev"><ul><li class="leftMenuItem"/><li class="menuItem"><a href="/players/polls">نظرسنجی‌ها</a></li><li class="rightMenuItem"/></ul></li>
<li class="active"><ul><li class="leftMenuItem"></li><li class="menuItem"><a href="/players/general/<?php echo $user ?>">اطلاعات عمومی</a></li><li class="rightMenuItem"></li></ul></li><li class="next"><ul><li class="leftMenuItem"></li><li class="menuItem"><a href="/players/achievements/<?php echo $user ?>">دستاوردها</a></li><li class="rightMenuItem"></li></ul></li><li><ul><li class="leftMenuItem"></li><li class="menuItem"><a href="/players/monthlyPlayed/<?php echo $user ?>">رده بندی ماهانه</a></li><li class="rightMenuItem"></li></ul></li><li><ul><li class="leftMenuItem"></li><li class="menuItem"><a href="/players/faction/<?php echo $user ?>">اقلیت</a></li><li class="rightMenuItem"></li></ul></li><li><ul><li class="leftMenuItem"></li><li class="menuItem"><a href="/players/clan/<?php echo $user ?>">کلن</a></li><li class="rightMenuItem"></li></ul></li><li><ul><li class="leftMenuItem"></li><li class="menuItem"><a href="/players/job/<?php echo $user ?>">شغل</a></li><li class="rightMenuItem"></li></ul></li><li><ul><li class="leftMenuItem"></li><li class="menuItem"><a href="/players/vehicles/<?php echo $user ?>">دارایی</a></li><li class="rightMenuItem"></li></ul></li><li><ul><li class="leftMenuItem"></li><li class="menuItem"><a href="/players/playerstats/<?php echo $user ?>">اطلاعات بازیکن</a></li><li class="rightMenuItem"></li></ul></li><li class="last"><ul><li class="leftMenuItem"></li><li class="menuItem"><a href="/players/friends/<?php echo $user ?>">دوستان</a></li><li class="rightMenuItem"></li></ul>
</ul></div><div id="contentPage">
    <div class="subPageTitle pageTitle">
        اطلاعات عمومی
		<?php echo $user; ?>
    </div>
    <div id="wrapper">
        <div id="skin">
            <img class="skinImg" src="public/img/Skins/<?php echo $dnn['Skin']; ?>.png" alt="اسکین">
        </div>
        <div class="generalRight">
            <div class="centerbox-outer">
                <div class="centerbox-inner">
                    <div class="badges">
						<?php if($dnn['AdminLevel'] != 0 && $dnn['AdminLevel'] < 9) { ?><div class="badgeIcon"><img class="showTooltip" data-toggle="tooltip" title="<?php echo ($dnn['AdminLevel'] >= 6 ? $alvls[$dnn['AdminLevel'] - 6] : "مدیر سطح {$dnn['AdminLevel']}") ?>" src="public/img/admin.png"/></div><?php } ?>
						<?php if($dnn['HelperLevel'] != 0) { ?><div class="badgeIcon"><img class="showTooltip" data-toggle="tooltip" title="کمک‌یار سطح <?php echo $dnn['HelperLevel'] ?>" src="public/img/helper.png"/></div><?php } ?>
						<?php if($dnn['Leader'] != 0) { ?><div class="badgeIcon"><img class="showTooltip" data-toggle="tooltip" title="راهبر <?php echo $factions[$dnn['Leader']] ?>" src="public/img/leader.png"/></div><?php } ?>
						<?php if($dnn['CLeader'] != 0) { ?><div class="badgeIcon"><img class="showTooltip" data-toggle="tooltip" title="صاحب کلن <?php echo clanName($con, $dnn['CLeader']) ?>" src="public/img/clanOwner.png"/></div><?php } ?>
                                                                    </div>
                </div>
            </div>
            <table border="0" cellspacing="0" cellpadding="0" class="vTable generalRightTable">
                                <tr class="firstRow">
                                        <td class="headerTd">اسم</td>
                    <td>
                        <div style="overflow: hidden; display: table; margin: 0 auto;">
                    <div style="float: right; margin-left: 5px;"><img class="showTooltip" style="display: block; margin-top: 3px;" src="public/img/<?php 
						if($dnn['Status'] == 0) echo "offline";
						else if($dnn['Status'] == 1) echo "online";
						else if($dnn['Status'] == 2) echo "afk";
						?>.png" alt="<?php 
						if($dnn['Status'] == 0) echo "آفلاین";
						else if($dnn['Status'] == 1) echo "آنلاین";
						else if($dnn['Status'] == 2) echo "دور از دسترس";
						?>" data-toggle="tooltip" title="<?php 
						if($dnn['Status'] == 0) echo "آفلاین";
						else if($dnn['Status'] == 1) echo "آنلاین";
						else if($dnn['Status'] == 2) echo "دور از دسترس";
						?>"/></div>
                    <?php generalUserUrl($con, $dnn['Name'], $factions, $factionC, $factionR); ?>
                </div>
        </td>
        </tr>
                                <tr>
            <td class="headerTd">تاریخ عضویت</td>
            <td dir=ltr><?php echo jdate('Y/m/d H:i:s', strtotime(str_replace('/', '-', str_replace(' - ', ' ', $dnn['RegisteredDate'])))) ?></td>
        </tr>
        <?php if($dnn['LastLogin'] != '01/01/2013 00:00') { ?>
        <tr>
            <td class="headerTd">آخرین ورود</td>
            <td  dir=ltr><?php echo jdate('Y/m/d H:i:s', strtotime(str_replace('/', '-', str_replace(' - ', ' ', $dnn['LastLogin'])))) ?></td>
        </tr>
        <?php } ?>
        <tr>
            <td class="headerTd">آخرین جلسه</td>
            <td>اطلاعاتی موجود نیست</td>
        </tr>
        <tr>
            <td class="headerTd">وضعیت</td>
            <td>حساب کاربری فعال</td>
        </tr>
        <tr>
            <td class="headerTd">اخطارها</td>
            <td dir=ltr><?php echo $dnn['Warns'] ?> / 3
                            </td>
        </tr>
        <tr>
            <td class="headerTd">وضعیت تاهل</td>
            <td>
			<?php
			echo ($dnn['Spouse'] == "No-one" ? "مجرد" : "ازدواج کرده با "); generalUserUrl($con, $dnn['Spouse'], $factions, $factionC, $factionR); ?>
			</td>
        </tr>
        <tr class="lastRow">
            <td class="headerTd">حساب کاربری ویژه</td>
            <td><?php echo ($dnn['PremiumAccount'] > time() ? "دارد (" . timestampdiff(time(), $dnn['PremiumAccount']) . " دیگر)" : "ندارد") ?>                           </td>
        </tr>
        </table>
            <div class="playerButtons" style="">
			<?php if($dncx['AdminLevel'] == 8) { ?> <a href="/admin/edit/<?php echo $dnn['Name'] ?>" class="normalButton" style="float: left; font-family: Vazir">ویرایش این کاربر</a> <?php } ?>
			<?php if($dncx['AdminLevel'] == 8) { ?> <a href="/admin/loginas/<?php echo $dnn['Name'] ?>" class="normalButton" style="float: left; font-family: Vazir">ورود به عنوان این کاربر</a> <?php } ?>
			<?php if($dnn['ID'] != $_SESSION['pid'] && isset($_SESSION['pid'])) { ?> <div class="subPageAddButton"><a href="/players/addReport/<?php echo $user; ?>" class="reportPlayerButton">گزارش این بازیکن به ادمین‌ها</a></div> <?php } ?>
			</div>
    </div>
</div>

<div id="generalTableWrapper">
    <div id="generalTableLeft">
        <table border="0" cellspacing="0" cellpadding="0" class="vTable generalNormalTable">
            <tr class="firstRow">
                <td class="headerTd">رده بندی</td>
                <td><a href="/stats/players/rank/">--</a></td>
            </tr>
            <tr class="firstRow">
                <td class="headerTd">رده بندی ماهانه</td>
                <td><a href="/stats/monthlyPlayed/rank/">--</a></td>
            </tr>
            <tr>
                <td class="headerTd">سطح</td>
                <td><?php echo $dnn['Level'] ?>                                  </td>
            </tr>
            <tr>
                <td class="headerTd">امتیاز تجربه</td>
                <td dir=ltr><?php echo $dnn['Respect'] ?> / <?php echo (($dnn['Level'] == 1) ? 2 : ($dnn['Level'] * 2) - 2); ?>                                    </td>
            </tr>
            <tr>
                <td class="headerTd">ساعات بازی کرده</td>
                <td><?php echo $dnn['HoursPlayed'] ?>                                    </td>
            </tr>
            <tr>
                <td class="headerTd">ساعات بازی کرده این ماه</td>
                <td><?php echo $dnn['MHoursPlayed'] ?></td>
            </tr>
                        <tr>
                <td class="headerTd">شماره تلفن</td>
                <td><?php if($dnn['PhoneNumber'] == 0) echo "ندارد"; else echo substr_replace($dnn['PhoneNumber'], '-', 2, 0); ?>                                    </td>
            </tr>
        </table>
    </div>

    <div id="generalTableRight">
        <table border="0" cellspacing="0" cellpadding="0" class="vTable generalNormalTable">
            <tr class="firstRow">
                <td class="headerTd">جرایم ثبت شده</td>
                <td><?php echo $dnn['Crimes'] ?></td>
            </tr>
            <tr>
                <td class="headerTd">تعداد دستگیری</td>
                <td><?php echo $dnn['Arrests'] ?></td>
            </tr>
            <tr>
                <td class="headerTd">مرگ هنگام تحت تعقیب</td>
                <td><?php echo $dnn['WantedDeaths'] ?></td>
            </tr>
                    </table>
    </div>
    </div>
    <div id="licensesWrap">
        <div id="licenses">
		<div class="lic" style="background-color: inherit; border: 0;"></div>
            <div class="lic">
                <div class="licIcon carlic"><img src="public/img/carlic.png" alt="license"/></div>
                <div id="licText">
                    مجوز رانندگی<br/>
                    <?php echo ($dnn['DrivingLic']) ? ($dnn['DrivingLic'] == 1000 ? "دائم" : $dnn['DrivingLic'] . " ساعت") : "منقضی" ?>                                    </div>
            </div>
            <div class="lic">
                <div class="licIcon flylic"><img src="public/img/flylic.png" alt="license"/></div>
                <div id="licText">
                    مجوز پرواز<br/>
                    <?php echo ($dnn['FlyingLic']) ? ($dnn['FlyingLic'] == 1000 ? "دائم" : $dnn['FlyingLic'] . " ساعت") : "منقضی" ?>                                     </div>
            </div>
            <div class="lic">
                <div class="licIcon boatlic"><img src="public/img/boatlic.png" alt="license"/></div>
                <div id="licText">
                    مجوز قایق‌رانی<br/>
                    <?php echo ($dnn['SailLic']) ? ($dnn['SailLic'] == 1000 ? "دائم" : $dnn['SailLic'] . " ساعت") : "منقضی" ?>                                     </div>
            </div>
            <div class="lic">
                <div class="licIcon gunlic"><img src="public/img/gunlic.png" alt="license"/></div>
                <div id="licText">
                    مجوز اسلحه<br/>
                    <?php echo ($dnn['GunLic']) ? ($dnn['GunLic'] == 1000 ? "دائم" : $dnn['GunLic'] . " ساعت") : "منقضی" ?>                                   </div>
            </div>
        </div>
    </div>            </div>
                </div>
<?php
}
if(!$xx)
{
?>
<div id="contentWrap"><div id="contentBox">
    <div class="pageTitle">
                    بازیکنان
            </div>
    <div id="contentMain">
<div id="leftSidebar"><ul><li class="first prev"><ul><li class="leftMenuItem"/><li class="menuItem"><a href="/players/online">بازیکنان آنلاین</a></li><li class="rightMenuItem"/></ul></li><li class="active"><ul><li class="leftMenuItem"/><li class="menuItem"><a href="/players/search">جستجوی بازیکن</a></li><li class="rightMenuItem"/></ul></li><li class="next"><ul><li class="leftMenuItem"/><li class="menuItem"><a href="/players/reports">شکایات <span class='numberBullet'><?php echo totalunAnsweredReports($con); ?></span></a></li><li class="rightMenuItem"/></ul></li><li><ul><li class="leftMenuItem"/><li class="menuItem"><a href="/players/unbanRequests">رفع محرومیت <span class='numberBullet'>0</span></a></li><li class="rightMenuItem"/></ul></li><li class="last"><ul><li class="leftMenuItem"/><li class="menuItem"><a href="/players/polls">نظرسنجی‌ها</a></li><li class="rightMenuItem"/></ul></li></ul></div><div id="contentPage">
   <div class="subPageTitle pageTitle">
        جستجوی بازیکن
    </div>
    <div align="center"> <div class='normalTextBox'>بازیکن مورد نظر پیدا نشد، از صحیح بودن اطلاعات ورودی اطمینان حاصل کنید.<br><br>
	<div class="autosuggestDivContainer">
                <div class="inputSearchSuggestion" id="searchPlayerNameDiv">
                    <input name="name" type="text" dir=ltr class="autosuggestNormalInput textarea" id="searchPlayerName" value="<?php echo $user ?>" />
                </div>
            </div>
			</div>
    
<script>
    $(document).ready(function() {
        $("#searchPlayerName").autoSuggest("/players/autosuggest/",
        {
            resultARender: function(data, value)
            {
                var $a = $('<a class="autosuggestResultA" data-data="'+data+'" href="/players/general/'+value+'">' + value + '</a>');
                return $a;
            }
        });
  
            });
</script>            </div>
                </div>
			</div>
		</div>
	</div>

<?php } ?>
</div></div></div>