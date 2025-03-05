RMETH = RMETH or {}

RMETH.PerfRedP = 14 --Perfect amount of Red Phosporus required to achieve 100% of the recipe
RMETH.PerfCry = 8 -- Perfect amount of Crystalised Iiodine to achieve 100% of the recipe

RMETH.Award = 500

RMETH.CookTime1 = 45 -- Crystalized Iodine 
RMETH.CookTime2 = 210 -- Meth

RMETH.DegradeT = 2.5 -- How many seconds does it take for meth to degrade by 1%

RMETH.DamagePerSecond = 3 

RMETH.DropOnDeath = true

RMETH.BatchBonus = 2 --If selling in a batch quantity - if the user is selling more than 10 meth crystals, each next one grants him this amount of money.

RMETH.HighTime = 25 --How long is the person high after using meth?
RMETH.ScaleDamage = .64 

RMETH.Hazmat = "models/hazmat/bmhaztechs.mdl" 

RMETH.PainSounds = {
	"vo/npc/male01/pain02.wav",
	"vo/npc/male01/pain04.wav",
	"vo/npc/male01/pain06.wav",
	"vo/npc/male01/pain07.wav"
} 

RMETH.skin_buyer = 'models/odessa.mdl'
RMETH.random_phrases_unknow = {
	'Ты кто?',
	'Не доставай меня!',
	'Я не знаю тебя и твою собаку!',
	'Ааа! Напугал, блин..',
	'Хватит меня трогать'
}

timer.Simple( 16, function() -- for DarkRP

	RMETH.AccessTeam = {
		[ Tdrug1 ] = true,
		[ Tchemic1 ] = true
	} 

end )
