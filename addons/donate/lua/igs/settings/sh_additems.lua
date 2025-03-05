--[[-------------------------------------------------------------------------
	Обязательные методы:
		:SetPrice()
		:SetDescription()

	Популярные:
		:SetTerm()
		:SetStackable()
		:SetCategory()
		:SetIcon()
		:SetOnActivate()
		:SetNetworked()
		:SetHidden()
		:SetHighlightColor()
		:SetDiscountedFrom()

	Подробнее и все остальные:
		gm-donate.ru/docs
--]]

local cats = { '• Привилегии', '• Ранги', '• Валюта', '• Kits', '• Кейсы', '• Кастомизация', '• Ивенты', '• Базы', '• Способности', '• Договоры' }


--## Привилегии #############################
IGS( "Premium 30д", "rank_prem" )
	:SetPrice( 50 )
	:SetDiscountedFrom( 100 )
	:SetTerm( 0 )
	:SetCategory( cats[1] )
	:SetIcon( 'https://i.imgur.com/EeuoQSR.png' )
	:SetDescription([[ Привилегия — Premium ( На 30 дней )
	• Вы не обязаны следить за сервером!
	• Проп лимит увеличен x3
	• Доступны некоторые Инструменты (дупликатор, верёвка и т.д)
	• Доступны VIP, Premium работы
	• При спавне +20 брони
	• Доступны /kit vip, /kit premium (деньги + оружие)
	• Огромные шансы пройти набор на хелпера

	• Вы просто становитесь пирожочкем ( ͡° ͜ʖ ͡°) ]])
	:SetOnActivate( function( ePly )
		RunConsoleCommand( 'ulx', 'adduserid',ePly:SteamID(), 'premium', '30' )
end )

IGS( "Premium", "rank_prem_f" )
	:SetPrice( 149 )
	:SetDiscountedFrom( 250 )
	:SetTerm( 0 )
	:SetCategory( cats[1] )
	:SetIcon( 'https://i.imgur.com/qrwnhk2.png' )
	:SetDescription([[ Привилегия — Premium
	• Услуга остаётся навсегда!
	• Вы не обязаны следить за сервером!
	• Проп лимит увеличен x3
	• Доступны некоторые Инструменты (дупликатор, верёвка и т.д)
	• Доступны VIP, Premium работы
	• При спавне +20 брони
	• Доступны /kit vip, /kit premium (деньги + оружие)
	• Огромные шансы пройти набор на хелпера

	• Вы просто становитесь пирожочкем ( ͡° ͜ʖ ͡°) ]])
	:SetOnActivate( function( ePly )
		RunConsoleCommand( 'ulx', 'adduserid',ePly:SteamID(), 'premium', '4000' )
end )

--###########################################




--## Ранги ##################################
IGS( 'Модератор 30д', 'r5' )
	:SetPrice( 149 )
	:SetDiscountedFrom( 300 )
	:SetTerm( 0 )
	:SetCategory( cats[2] )
	:SetIcon( 'https://cdn.discordapp.com/attachments/765965677017169970/770363911257325578/Moder.png' )
	:SetDescription([[ Должность — Модератор ( На 30 дней )
	• Ваша задача разбирать жалобы игроков!
	• Вы регулируете отыгровку на сервере
	• Бьёте по попке нарушителей
	• Проп лимит увеличен x3
	• Доступны некоторые Инструменты
	• Доступны VIP, Premium работы
	• У вас есть доступ к Gag, Mute, UnGag, unMute [1]
	• У вас есть доступ к Jail, UnJail [2]
	• У вас есть доступ к Kick (Ударить по попке) [3]
	• У вас есть доступ к Slay (Убить) [4]
	• У вас есть доступ к Slap (Отвесить поджопник) [5]
	• У вас есть доступ к Goto, Tp, Send, NoClip [6]
	• Вы можете трогать игроков своим длинным физганом
	• Зарплата 3 рубля в день
	
	ԅ(≖‿≖ԅ) ]])
	:SetOnActivate( function( ePly )
		RunConsoleCommand( 'ulx', 'adduserid',ePly:SteamID(), 'moder', '30' )
end )

IGS( 'Модератор', 'r5f' )
	:SetPrice( 250 )
	:SetDiscountedFrom( 400 )
	:SetTerm( 0 )
	:SetCategory( cats[2] )
	:SetIcon( 'https://cdn.discordapp.com/attachments/765965677017169970/770363911257325578/Moder.png' )
	:SetDescription([[ Должность — Модератор
	• Услуга остаётся навсегда!
	• Ваша задача разбирать жалобы игроков!
	• Вы регулируете отыгровку на сервере
	• Бьёте по попке нарушителей
	• Проп лимит увеличен x3
	• Доступны некоторые Инструменты
	• Доступны VIP, Premium работы
	• У вас есть доступ к Gag, Mute, UnGag, unMute [1]
	• У вас есть доступ к Jail, UnJail [2]
	• У вас есть доступ к Kick (Ударить по попке) [3]
	• У вас есть доступ к Slay (Убить) [4]
	• У вас есть доступ к Slap (Отвесить поджопник) [5]
	• У вас есть доступ к Goto, Tp, Send, NoClip [6]
	• Вы можете трогать игроков своим длинным физганом
	• Зарплата 3 рубля в день
	
	{\__/}
	(●_●)]])
	:SetOnActivate( function( ePly )
		RunConsoleCommand( 'ulx', 'adduserid',ePly:SteamID(), 'moder', '4000' )
end )

IGS( 'Менеджер 30д', 'r7' )
	:SetPrice( 450 )
	:SetDiscountedFrom( 800 )
	:SetTerm( 0 )
	:SetCategory( cats[2] )
	:SetIcon( 'https://i.imgur.com/fBllX3K.png' )
	:SetDescription([[ Должность — Менеджер ( На 30 дней )
	• Ваша задача полноценно следить за сервером!
	• Вы регулируете отыгровку на сервере
	• АННИГИЛИРУЕТЕ нарушителей
	• Проп лимит увеличен x4
	• Доступны все Инструменты
	• Доступен спавн пушек и машин
	• Доступны VIP, Premium, Titanium работы
	• У вас есть почти ко всем ULX командам! ДА ВЫ, МЛЯ, БОГ!!
	• Вы можете трогать игроков своим длинным физганом
	• Зарплата 4 рубля в день
	
	⊂_ヽ
	　 ＼＼
	　　 ＼( ͡° ͜ʖ ͡°)
	　　　 >　⌒ヽ
	　　　/ 　 へ＼
	　　 /　　/　＼＼
	　　 ﾚ　ノ　　 ヽ_つ
	　　/　/
	　 /　/|
	　(　(ヽ
	　|　|、＼
	　| 丿 ＼ ⌒)
	　| |　　) /
	ノ )　　Lﾉ
	(_／]])
	:SetOnActivate( function( ePly )
		RunConsoleCommand( 'ulx', 'adduserid',ePly:SteamID(), 'manager', '30' )
end )

IGS( 'Менеджер', 'r7f' )
	:SetPrice( 950 )
	:SetDiscountedFrom( 1500 )
	:SetTerm( 0 )
	:SetCategory( cats[2] )
	:SetIcon( 'https://i.imgur.com/fBllX3K.png' )
	:SetDescription([[ Должность — Менеджер
	• Услуга остаётся навсегда!
	• Ваша задача полноценно следить за сервером!
	• Вы регулируете отыгровку на сервере
	• АННИГИЛИРУЕТЕ нарушителей
	• Проп лимит увеличен x4
	• Доступны все Инструменты
	• Доступен спавн пушек и машин
	• Доступны VIP, Premium, Titanium работы
	• У вас есть почти ко всем ULX командам! ДА ВЫ, МЛЯ, БОГ!!
	• Вы можете трогать игроков своим длинным физганом
	• Зарплата 4 рубля в день

	(ဖ෴ဖ)⚔(စ__စ ) ]])
	:SetOnActivate( function( ePly )
		RunConsoleCommand( 'ulx', 'adduserid',ePly:SteamID(), 'manager', '4000' )
end )
--###########################################








--## Валюта #################################
IGS( 'Закладка с Деньгами', 'm1' )
	:SetPrice( 15 )
	:SetDiscountedFrom( 30 )
	:SetTerm( 0 )
	:SetCategory( cats[3] )
	:SetIcon( 'https://cdn.discordapp.com/attachments/765965677017169970/770364235196137563/c709d66327e5f337.png' )
	:SetDescription([[ 50k $ ]])
	:SetOnActivate( function( ePly )
		AmbStats.Players.addStats( ePly, '$', 50000 )
end )

IGS( 'Денежный Мешочек', 'm2' )
	:SetPrice( 45 )
	:SetDiscountedFrom( 100 )
	:SetTerm( 0 )
	:SetCategory( cats[3] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ 200k $ ]])
	:SetOnActivate( function( ePly )
		AmbStats.Players.addStats( ePly, '$', 200000 )
end )

IGS( 'Денежный Кейс', 'm3' )
	:SetPrice( 100 )
	:SetDiscountedFrom( 200 )
	:SetTerm( 0 )
	:SetCategory( cats[3] )
	:SetIcon( 'https://cdn.discordapp.com/attachments/765965677017169970/770364240376365076/573673bb4888623c.png' )
	:SetDescription([[ 500k $ ]])
	:SetOnActivate( function( ePly )
		AmbStats.Players.addStats( ePly, '$', 500000 )
end )

IGS( 'Бочка Денег', 'm4' )
	:SetPrice( 200 )
	:SetDiscountedFrom( 300 )
	:SetTerm( 0 )
	:SetCategory( cats[3] )
	:SetIcon( 'https://cdn.discordapp.com/attachments/765965677017169970/770364238052982814/1413c30921601831.png' )
	:SetDescription([[ 1.000.000$ ]])
	:SetOnActivate( function( ePly )
		AmbStats.Players.addStats( ePly, '$', 1000000 )
end )

IGS( 'Сейф', 'm5' )
	:SetPrice( 300 )
	:SetDiscountedFrom( 400 )
	:SetTerm( 0 )
	:SetCategory( cats[3] )
	:SetIcon( 'https://cdn.discordapp.com/attachments/765965677017169970/770364228057956372/4d61d30620d3671e.png' )
	:SetDescription([[ 2.500.000$ ]])
	:SetOnActivate( function( ePly )
		AmbStats.Players.addStats( ePly, '$', 2500000 )
end )

IGS( 'Потерянный Сундук', 'm6' )
	:SetPrice( 350 )
	:SetDiscountedFrom( 500 )
	:SetTerm( 0 )
	:SetCategory( cats[3] )
	:SetIcon( 'https://cdn.discordapp.com/attachments/765965677017169970/770364230330744882/Lost_Chest.png' )
	:SetDescription([[ 5.000.000$ + 1000 ХП + 255 Armor ]])
	:SetOnActivate( function( ePly )
		ePly:SetHealth( 1000 )
		ePly:SetArmor( 255 )
		AmbStats.Players.addStats( ePly, '$', 5000000 )
end )
--###########################################








--## Киты ###################################
IGS( 'Стандартный Набор', 'kit1' )
	:SetPrice( 15 )
	:SetDiscountedFrom( 25 )
	:SetPerma()
	:SetCategory( cats[4] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ /kit standart
	• Набор выдаётся навсегда | Задержка: 1 час
	
	• 2500$
	• Здоровье: 120
	• Броня: 100 ]])
	:SetOnActivate( function( ePly )
		ePly:SetHealth( 200 )
end )

IGS( 'Оружейный Набор #1', 'kit2a' )
	:SetPrice( 35 )
	:SetDiscountedFrom( 75 )
	:SetPerma()
	:SetCategory( cats[4] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ /kit gun1
	• Набор выдаётся навсегда | Задержка: 1 час
	
	• Оружия: 
		arccw_fml_automag
		arccw_db_sawnoff
		arccw_melee_fists
		arccw_melee_machete
	• Броня: 50 ]])
	:SetOnActivate( function( ePly )
		ePly:SetHealth( 200 )
end )

IGS( 'Оружейный Набор #2', 'kit2b' )
	:SetPrice( 50 )
	:SetDiscountedFrom( 100 )
	:SetPerma()
	:SetCategory( cats[4] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ /kit gun2
	• Набор выдаётся навсегда | Задержка: 50 мин
	
	• Оружия: 
		arccw_g18
		weapon_shotgun
		arccw_mp5
		arccw_nade_frag
		arccw_melee_knife
		weapon_stunstick
	• Здоровье: 200
	• Броня: 150 ]])
	:SetOnActivate( function( ePly )
		ePly:SetHealth( 200 )
		ePly:SetArmor( 150 )
end )

IGS( 'Оружейный Набор #3', 'kit2c' )
	:SetPrice( 75 )
	:SetDiscountedFrom( 150 )
	:SetPerma()
	:SetCategory( cats[4] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ /kit gun3
	• Набор выдаётся навсегда | Задержка: 45 мин
	
	• Оружия: 
		arccw_deagle357
		arccw_m1014
		arccw_ak47
		arccw_winchester1873
		arccw_nade_semtex
		med_kit
		weapon_slam
	• Здоровье: 350
	• Броня: 255 ]])
	:SetOnActivate( function( ePly )
		ePly:SetHealth( 200 )
end )

IGS( 'Набор Мутанта', 'kit3' )
	:SetPrice( 120 )
	:SetDiscountedFrom( 250 )
	:SetPerma()
	:SetCategory( cats[4] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ /kit gun3
	• Набор выдаётся навсегда | Задержка: 2 часа
	
	• Оружия: 
		arccw_melee_knife
		weapon_crowbar
		arccw_melee_machete
		arccw_melee_fists
	• Здоровье: 600
	• Броня: 255 
	• Скорость бега * 2
	• Скорость хождения * 1.4
	• Изменяется модель (после смерти теряется)
	• Бессмертие на 1 минуту]])
	:SetOnActivate( function( ePly )
		ePly:SetHealth( 200 )
end )

IGS( 'Снайперский Набор', 'kit4' )
	:SetPrice( 120 )
	:SetDiscountedFrom( 200 )
	:SetPerma()
	:SetCategory( cats[4] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ /kit sniper
	• Набор выдаётся навсегда | Задержка: 2 часа
	
	• Оружия: 
		arccw_m107
		arccw_awm
		arccw_scout
		arccw_melee_fists
	• Броня: 255]])
	:SetOnActivate( function( ePly )
		ePly:SetHealth( 200 )
end )

IGS( 'Набор Gauss Rifle', 'kit5' )
	:SetPrice( 200 )
	:SetDiscountedFrom( 400 )
	:SetPerma()
	:SetCategory( cats[4] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ /kit sniper
	• Набор выдаётся навсегда | Задержка: 6 часов
	
	• Оружия: 
		arccw_gauss_rifle
	• Здоровье: 800
	• Броня: 255]])
	:SetOnActivate( function( ePly )
		ePly:SetHealth( 200 )
end )

IGS( 'Набор RPG-7', 'kit6' )
	:SetPrice( 150 )
	:SetDiscountedFrom( 350 )
	:SetPerma()
	:SetCategory( cats[4] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ /kit rpg
	• Набор выдаётся навсегда | Задержка: 3 часа
	
	• Оружия: 
		arccw_rpg7
	• Здоровье: 320
	• Броня: 255]])
	:SetOnActivate( function( ePly )
		ePly:SetHealth( 200 )
end )

IGS( 'Воровской Набор', 'kit7b' )
	:SetPrice( 25 )
	:SetDiscountedFrom( 45 )
	:SetPerma()
	:SetCategory( cats[4] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ /kit theif
	• Набор выдаётся навсегда | Задержка: 1 час 20 мин
	
	• Оружия: 
		arccw_tmp
		arccw_winchester1873
		arccw_makarov
		lockpick
	• Здоровье: 200]])
	:SetOnActivate( function( ePly )
		ePly:SetHealth( 200 )
end )

IGS( 'Полицейский Набор', 'kit7c' )
	:SetPrice( 25 )
	:SetDiscountedFrom( 50 )
	:SetPerma()
	:SetCategory( cats[4] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ /kit policeman
	• Набор выдаётся навсегда | Задержка: 1 час 20 мин
	
	• Оружия: 
		arccw_usp
		arccw_shorty
		arccw_g36c
		stunstick
		door_ram
		med_kit
	• Здоровье: 200
	• Броня: 100]])
	:SetOnActivate( function( ePly )
		ePly:SetHealth( 200 )
end )

IGS( 'Набор Охотника', 'kit7d' )
	:SetPrice( 50 )
	:SetDiscountedFrom( 100 )
	:SetPerma()
	:SetCategory( cats[4] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ /kit hunter
	• Набор выдаётся навсегда | Задержка: 1 час 20 мин
	
	• Оружия: 
		arccw_winchester1873
		arccw_ragingbull
		arccw_db_sawnoff
		arccw_scout]])
	:SetOnActivate( function( ePly )
		ePly:SetHealth( 200 )
end )

IGS( 'Набор Бога', 'kit8' )
	:SetPrice( 250 )
	:SetDiscountedFrom( 500 )
	:SetPerma()
	:SetCategory( cats[4] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ /kit god
	• Набор выдаётся навсегда | Задержка: 1 день
	
	• Оружия: 
		arccw_melee_fists
	• Здоровье: 16k HP
	И ДОСТУП К БОЖЕСТВЕННЫМ ВЕЩАМ, о ДАААА]])
	:SetOnActivate( function( ePly )
		ePly:SetHealth( 200 )
end )
--###########################################










--## Кейсы ##################################
IGS( 'Ключ', 'key_case' )
	:SetPrice( 50 )
	:SetDiscountedFrom( 100 )
	:SetPerma()
	:SetCategory( cats[5] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ Ключ от Кейсов:
	• Выдаётся навсегда
	• Позволяет открыть все виды Кейсов]])
	:SetOnActivate( function( ePly )
		ePly:ChatPrint( 'Теперь Кейсы доступны Вам!' )
end )
--###########################################









--## Кастомизация ###########################
IGS( 'Картинка в TAB 30д', 'tab1' )
	:SetPrice( 50 )
	:SetDiscountedFrom( 100 )
	:SetTerm( 30 )
	:SetCategory( cats[6] )
	:SetIcon( 'https://cdn.discordapp.com/attachments/765965677017169970/770365161654976512/TAB.png' )
	:SetDescription([[ Картинка в TAB Меню

		• Ваша собственная картинка!
		• На Ваш вкус и цвет.
		• Ограничения только на: эротику, порнографию, расчленёнку,
		пиар других серверов.]])
	:SetOnActivate( function( ePly )

		ePly:ChatPrint('Пожалуйста, обратитесь к Titanovsky!')

end )

IGS( 'Картинка в TAB', 'tab1f' )
	:SetPrice( 150 )
	:SetDiscountedFrom( 350 )
	:SetPerma()
	:SetCategory( cats[6] )
	:SetIcon( 'https://cdn.discordapp.com/attachments/765965677017169970/770365161654976512/TAB.png' )
	:SetDescription([[ Картинка в TAB Меню

		• Ваша собственная картинка!
		• На Ваш вкус и цвет.
		• Ограничения только на: эротику, порнографию, расчленёнку,
		пиар других серверов.]])
	:SetOnActivate( function( ePly )

		ePly:ChatPrint('Пожалуйста, обратитесь к Titanovsky!')

end )

IGS( "Изменить имя", "name1" )
	:SetPrice( 5 )
	:SetTerm( 0 )
	:SetCategory( cats[6] )
	:SetIcon( 'https://cdn.discordapp.com/attachments/765965677017169970/770365169388748840/Change_Name.png' )
	:SetDescription([[ • Изменить игровое имя навсегда]])
	:SetOnActivate( function( ePly )

		ePly:SendLua( 'AmbChangeName.OpenForm()' )
		
end )

IGS( "Снять Предупреждение", "warn1" )
	:SetPrice( 25 )
	:SetTerm( 0 )
	:SetCategory( cats[6] )
	:SetIcon( 'https://i.imgur.com/YvjWlFS.png' )
	:SetDescription([[ Снять Предупреждение:
	• Снимает один Warn ]])
	:SetOnActivate( function( ePly )

		if ( tonumber( ePly:GetNWInt( 'Warns' ) ) > 0 ) then

			AmbWarn.SetWarn( ePly, -1 )
			AmbLib.notifySend( ePly, '-1 Предупреждение', 0, 4, 'buttons/button9.wav' )

		end

end )

IGS( 'Своя Профессия', "create_prof1" )
	:SetPrice( 300 )
	:SetTerm( 0 )
	:SetCategory( cats[6] )
	:SetIcon( 'https://cdn.discordapp.com/attachments/765965677017169970/770365159880261632/Your_profession.png' )
	:SetDescription([[ Создать профессию навсегда
		• Кастомная модель не больше 32 мб]])
	:SetOnActivate( function( ePly )

		ePly:ChatPrint('Пожалуйста, обратитесь к Titanovsky! Данная функция ещё не готова :(')

end )
--###########################################