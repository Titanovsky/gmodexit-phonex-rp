
-----------------------------------------------------
--I moved everything  to one file.

-- Drawing 3D2D things distance.
EML_DrawDistance = 512;

EML_Stove_Consumption = 1;
EML_Stove_Heat = 1;
-- Amount of gas inside.
EML_Stove_Storage = 1024;
-- Can grab with gravity gun?
EML_Stove_GravityGun = true;
-- 0 - Can't be exploded/destroyed; 1 - Can be destroyed without explosion; 2 - Explodes after taking amount of damage.
EML_Stove_ExplosionType = 2;
-- Stove health if type 1 or 2.
EML_Stove_Health = 1200;
-- Stove explosion damage if type 2.
EML_Stove_ExplosionDamage = 200;
-- Stove smoke color.
EML_Stove_SmokeColor_R = 0;
EML_Stove_SmokeColor_G = 0;
EML_Stove_SmokeColor_B = 200;
-- Stove indicator color.
EML_Stove_IndicatorColor = Color(255, 222, 0, 255);


-- Pot default time.
EML_Pot_StartTime = 60;
EML_Pot_OnAdd_MuriaticAcid = 10;
EML_Pot_OnAdd_LiquidSulfur = 10;
EML_Pot_DestroyEmpty = true;


EML_SpecialPot_StartTime = 60;
EML_SpecialPot_OnAdd_RedPhosphorus = 20;
EML_SpecialPot_OnAdd_CrystallizedIodine = 20;
EML_SpecialPot_DestroyEmpty = true;


local COLOR_SULFUR = Color(243, 213, 19, 255);
EML_Sulfur_Amount = 2;
EML_Sulfur_Color = COLOR_SULFUR;

local COLOR_ACID = Color(160, 221, 99, 255);
EML_MuriaticAcid_Amount = 2;
EML_MuriaticAcid_Color = COLOR_ACID;

local COLOR_IODINE = Color(137, 69, 54, 255);
EML_Iodine_Amount = 2;
EML_Iodine_Color = COLOR_IODINE;

local COLOR_WATER = Color(133, 202, 219, 255);
EML_Water_Amount = 2;
EML_Water_Color = COLOR_WATER;


EML_Meth_ValueModifier = 1200;

EML_Meth_UseSalesman = true;
EML_Meth_SalesmanText = true;
EML_Meth_Salesman_Name = 'Таинственный Покупатель';
EML_Meth_Salesman_Name_Color = Color(1, 241, 249, 255);
EML_Meth_Salesman_NoMeth = {
	"я шепну тебе на ушко.. АНИГИЛЯТОРНАЯ ПУШКА",
	};
EML_Meth_Salesman_GotMeth = {
	'Теперь убирайся отседева!'
};
EML_Meth_Salesman_GotMeth_Sound = {
	"vo/npc/male01/gethellout.wav",
	"vo/npc/male01/no02.wav",
	"vo/npc/male01/no01.wav",
	"vo/npc/male01/ohno.wav"
};

EML_Jar_StartProgress = 0;
EML_Jar_MinShake = 80;
EML_Jar_MaxShake = 1600;
EML_Jar_CorrectShake = 4;
EML_Jar_WrongShake = 1;
EML_Jar_DestroyEmpty = true;


EML_Gas_Amount = 900;
EML_Gas_ExplosionType = 1;
EML_Gas_Remove = true;