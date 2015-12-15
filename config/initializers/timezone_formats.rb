# coding: utf-8
# http://api.rubyonrails.org/classes/Time.html#method-i-to_formatted_s
Time::DATE_FORMATS[:default] = '%Y年%m月%d日 %H時%M分'
Time::DATE_FORMATS[:datetime] = '%Y年%m月%d日 %H時%M分'
Time::DATE_FORMATS[:date] = '%Y年%m年%d日'
Time::DATE_FORMATS[:time] = '%H時%M分%S秒'
Date::DATE_FORMATS[:default] = '%Y年%m月%d日'
