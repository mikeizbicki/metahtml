#!/bin/sh

# The list of lists is:
# https://easylist.to/pages/other-supplementary-filter-lists-and-easylist-variants.html

easy_lists='
https://easylist.to/easylistgermany/easylistgermany.txt
https://easylist-downloads.adblockplus.org/easylistitaly.txt
https://easylist-downloads.adblockplus.org/easylistdutch.txt
https://easylist-downloads.adblockplus.org/liste_fr.txt
https://easylist-downloads.adblockplus.org/easylistchina.txt
http://stanev.org/abp/adblock_bg.txt
https://raw.githubusercontent.com/heradhis/indonesianadblockrules/master/subscriptions/abpindo.txt
https://easylist-downloads.adblockplus.org/Liste_AR.txt
https://raw.githubusercontent.com/tomasko126/easylistczechandslovak/master/filters.txt
https://notabug.org/latvian-list/adblock-latvian/raw/master/lists/latvian-list.txt
https://raw.githubusercontent.com/easylist/EasyListHebrew/master/EasyListHebrew.txt
https://easylist-downloads.adblockplus.org/antiadblockfilters.txt
https://easylist.to/easylist/fanboy-annoyance.txt
https://easylist.to/easylist/fanboy-social.txt
https://easylist-downloads.adblockplus.org/easylist-cookie.txt
https://easylist.to/easylist/easyprivacy.txt
https://easylist.to/easylist/easylist.txt
'

# https://github.com/uBlockOrigin/uAssets/tree/master/filters
ublockorigin_lists='
https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt
https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt
https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/experimental.txt
https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt
https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt
https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/legacy.txt
https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt
https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt
https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resources.txt
https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt
'

for list in $easy_lists $ublockorigin_lists; do
    wget $list
done
