--[[-----------------------------------------------------------------------
English (example) language file
---------------------------------------------------------------------------
This is the english language file. The things on the left side of the equals sign are the things you should leave alone
The parts between the quotes are the parts you should translate. You can also copy this file and create a new language.

= Warning =
Sometimes when DarkRP is updated, new phrases are added.
If you don't translate these phrases to your language, it will use the English sentence.
To fix this, join your server, open your console and enter darkp_getphrases yourlanguage
For English the command would be:
    darkrp_getphrases "en"
because "en" is the language code for English.

You can copy the missing phrases to this file and translate them.

= Note =
Make sure the language code is right at the bottom of this file

= Using a language =
Make sure the convar gmod_language is set to your language code. You can do that in a server CFG file.
---------------------------------------------------------------------------]]

local my_language = {
    -- Admin things
    need_admin = "Вам нужен админ %s",
    need_sadmin = "You need super admin privileges in order to be able to %s",
    no_privilege = "Вам не хватает ранга",
    no_jail_pos = "Это не тюрьма",
    invalid_x = "Не существует %s! %s",

    -- Money things:
    price = "Цена: %s%d",
    priceTag = "Цена: %s",
    reset_money = "%s вайпнул игрокам деньги!",
    has_given = "%s дал вам %s $",
    you_gave = "Вы дали %s %s $",
    npc_killpay = "%s За убийство NPC!",
    profit = "Профит",
    loss = "Проигрыш",

    -- backwards compatibility
    deducted_x = "Списано %s%d",
    need_x = "Нужно %s%d",

    deducted_money = "Списано %s",
    need_money = "Нужно %s",

    payday_message = "%s!",
    payday_unemployed = "!",
    payday_missed = "!",

    property_tax = "Налог! %s",
    property_tax_cant_afford = "Вы не смогли оплатить налог, Ваше имущество изьято!",
    taxday = "Налоги! %s%% вычтено!",

    found_cash = "Вы подобрали %s%d!", -- backwards compatibility
    found_money = "Вы подобрали %s!",

    owner_poor = "The %s owner is too poor to subsidize this sale!",

    -- Police
    Wanted_text = "Розыск!",
    wanted = "Розыскивается полицией!\nПричина: %s",
    youre_arrested = "Вы арестованы. Ждите: %d секунд!",
    youre_arrested_by = "Вы были арестованы %s.",
    youre_unarrested_by = "Вы были выпщуены из тюрьмы %s.",
    hes_arrested = "%s has been arrested for %d seconds!",
    hes_unarrested = "%s has been released from jail!",
    warrant_ordered = "%s ordered a search warrant for %s. Reason: %s",
    warrant_request = "%s requests a search warrant for %s\nReason: %s",
    warrant_request2 = "Search warrant request sent to Mayor %s!",
    warrant_approved = "Search warrant approved for %s!\nReason: %s\nOrdered by: %s",
    warrant_approved2 = "You are now able to search his house.",
    warrant_denied = "Mayor %s has denied your search warrant request.",
    warrant_expired = "The search warrant for %s has expired!",
    warrant_required = "You need a warrant in order to be able to open this door.",
    warrant_required_unfreeze = "You need a warrant in order to be able to unfreeze this prop.",
    warrant_required_unweld = "You need a warrant in order to be able to unweld this prop.",
    wanted_by_police = "%s is wanted by the police!\nReason: %s\nOrdered by: %s",
    wanted_by_police_print = "%s has made %s wanted, reason: %s",
    wanted_expired = "%s is no longer wanted by the Police.",
    wanted_revoked = "%s is no longer wanted by the Police.\nRevoked by: %s",
    cant_arrest_other_cp = "You cannot arrest other CPs!",
    must_be_wanted_for_arrest = "The player must be wanted in order to be able to arrest them.",
    cant_arrest_fadmin_jailed = "You cannot arrest a player who has been jailed by an admin.",
    cant_arrest_no_jail_pos = "You cannot arrest people since there are no jail positions set!",
    cant_arrest_spawning_players = "You cannot arrest players who are spawning.",

    suspect_doesnt_exist = "Suspect does not exist.",
    actor_doesnt_exist = "Actor does not exist.",
    get_a_warrant = "get a warrant",
    remove_a_warrant = "remove a warrant",
    make_someone_wanted = "make someone wanted",
    remove_wanted_status = "remove wanted status",
    already_a_warrant = "There already is a search warrant for this suspect.",
    not_warranted = "There is no search warrant for this person.",
    already_wanted = "The suspect is already wanted.",
    not_wanted = "The suspect is not wanted.",
    need_to_be_cp = "You have to be a member of the police force.",
    suspect_must_be_alive_to_do_x = "The suspect must be alive in order to %s.",
    suspect_already_arrested = "The suspect is already in jail.",

    -- Players
    disconnected_player = "Disconnected player",
    player = "player",

    -- Teams
    need_to_be_before = "You need to be %s first in order to be able to become %s",
    need_to_make_vote = "You need to make a vote to become a %s!",
    team_limit_reached = "Can not become %s as the limit is reached",
    wants_to_be = "%s\nwants to be\n%s",
    has_not_been_made_team = "%s has not been made %s!",
    job_has_become = "%s has been made a %s!",


    -- Keys, vehicles and doors
    keys_allowed_to_coown = "You are allowed to co-own this\n(Press Reload with keys or press F2 to co-own)\n",
    keys_other_allowed = "Allowed to co-own:",
    keys_allow_ownership = "(Press Reload with keys or press F2 to allow ownership)",
    keys_disallow_ownership = "(Press Reload with keys or press F2 to disallow ownership)",
    keys_owned_by = "Владеет: ",
    keys_unowned = "Unowned\n(Press Reload with keys or press F2 to own)",
    keys_everyone = "(Press Reload with keys or press F2 to enable for everyone)",
    door_unown_arrested = "You can not own or unown things while arrested!",
    door_unownable = "This door cannot be owned or unowned!",
    door_sold = "You have sold this for %s",
    door_already_owned = "This door is already owned by someone!",
    door_cannot_afford = "You can not afford this door!",
    door_hobo_unable = "You can not buy a door if you are a hobo!",
    vehicle_cannot_afford = "You can not afford this vehicle!",
    door_bought = "You've bought this door for %s%s",
    vehicle_bought = "You've bought this vehicle for %s%s",
    door_need_to_own = "You need to own this door in order to be able to %s",
    door_rem_owners_unownable = "You can not remove owners if a door is non-ownable!",
    door_add_owners_unownable = "You can not add owners if a door is non-ownable!",
    rp_addowner_already_owns_door = "%s already owns (or is already allowed to own) this door!",
    add_owner = "Добавить Со-Владельца",
    remove_owner = "Удалить Со-Владельца",
    coown_x = "Со-Владельцы %s",
    allow_ownership = "Allow ownership",
    disallow_ownership = "Disallow ownership",
    edit_door_group = "Edit door group",
    door_groups = "Door groups",
    door_group_doesnt_exist = "Door group does not exist!",
    door_group_set = "Door group set successfully.",
    sold_x_doors_for_y = "Вы продали %d дверь за %s%d!", -- backwards compatibility
    sold_x_doors = "Вы продали %d за %s!",

    -- Entities

    sign_this_letter = "Sign this letter",
    signed_yours = "Yours,",

    money_printer_exploded = "Your money printer has exploded!",
    money_printer_overheating = "Your money printer is overheating!",

    contents = "Contents: ",
    amount = "Amount: ",

    picking_lock = "Picking lock",

    cannot_pocket_x = "You cannot put this in your pocket!",
    object_too_heavy = "This object is too heavy.",
    pocket_full = "Your pocket is full!",
    pocket_no_items = "Your pocket contains no items.",
    drop_item = "Drop item",

    bonus_destroying_entity = "destroying this illegal entity.",

    switched_burst = "Switched to burst-fire mode.",
    switched_fully_auto = "Switched to fully automatic fire mode.",
    switched_semi_auto = "Switched to semi-automatic fire mode.",

    keypad_checker_shoot_keypad = "Shoot a keypad to see what it controls.",
    keypad_checker_shoot_entity = "Shoot an entity to see which keypads are connected to it",
    keypad_checker_click_to_clear = "Right click to clear.",
    keypad_checker_entering_right_pass = "Entering the right password",
    keypad_checker_entering_wrong_pass = "Entering the wrong password",
    keypad_checker_after_right_pass = "after having entered the right password",
    keypad_checker_after_wrong_pass = "after having entered the wrong password",
    keypad_checker_right_pass_entered = "Right password entered",
    keypad_checker_wrong_pass_entered = "Wrong password entered",
    keypad_checker_controls_x_entities = "This keypad controls %d entities",
    keypad_checker_controlled_by_x_keypads = "This entity is controlled by %d keypads",
    keypad_on = "ON",
    keypad_off = "OFF",
    seconds = "seconds",

    persons_weapons = "%s's illegal weapons:",
    returned_persons_weapons = "Returned %s's confiscated weapons.",
    no_weapons_confiscated = "%s had no weapons confiscated!",
    no_illegal_weapons = "%s had no illegal weapons.",
    confiscated_these_weapons = "Confiscated these weapons:",
    checking_weapons = "Confiscating weapons",

    shipment_antispam_wait = "Please wait before spawning another shipment.",
    createshipment = "Create a shipment",
    splitshipment = "Split this shipment",
    shipment_cannot_split = "Cannot split this shipment.",

    -- Talking
    hear_noone = "No-one can hear you %s!",
    hear_everyone = "Everyone can hear you!",
    hear_certain_persons = "Players who can hear you %s: ",

    whisper = "шёпот",
    yell = "крик",
    broadcast = "[Broadcast!]",
    radio = "radio",
    request = "(REQUEST!)",
    group = "(group)",
    demote = "(DEMOTE)",
    ooc = "OOC",
    radio_x = "Radio %d",

    talk = "talk",
    speak = "говорить",

    speak_in_ooc = "Сказать в Глобальный Чат",
    perform_your_action = "perform your action",
    talk_to_your_group = "talk to your group",

    channel_set_to_x = "Channel set to %s!",
    channel = "channel",

    -- Notifies
    disabled = "%s has been disabled! %s",
    gm_spawnvehicle = "The spawning of vehicles",
    gm_spawnsent = "The spawning of scripted entities (SENTs)",
    gm_spawnnpc = "The spawning of Non-Player Characters (NPCs)",
    see_settings = "Please see the DarkRP settings.",
    limit = "You have reached the %s limit!",
    have_to_wait = "You need to wait another %d seconds before using %s!",
    must_be_looking_at = "You need to be looking at a %s!",
    incorrect_job = "You do not have the right job to %s",
    unavailable = "This %s is unavailable",
    unable = "You are unable to %s. %s",
    cant_afford = "Вы не можете позволить %s",
    created_x = "%s created a %s",
    cleaned_up = "Your %s were cleaned up.",
    you_bought_x = "Вы купили %s за %s%d.", -- backwards compatibility
    you_bought = "Вы купили %s за %s.",
    you_got_yourself = "У вас уже есть %s.",
    you_received_x = "Вы получили %s за %s.",

    created_first_jailpos = "You have created the first jail position!",
    added_jailpos = "You have added one extra jail position!",
    reset_add_jailpos = "You have removed all jail positions and you have added a new one here.",
    created_spawnpos = "You have added a spawn position for %s.",
    updated_spawnpos = "You have removed all spawn positions for %s and added a new one here.",
    remove_spawnpos = "You have removed all spawn positions for %s.",
    do_not_own_ent = "You do not own this entity!",
    cannot_drop_weapon = "Can't drop this weapon!",
    job_switch = "Jobs switched successfully!",
    job_switch_question = "Switch jobs with %s?",
    job_switch_requested = "Job switch requested.",
    switch_jobs = "switch jobs",

    cooks_only = "Cooks only.",

    -- Misc
    unknown = "Unknown",
    arguments = "arguments",
    no_one = "no one",
    door = "Дверь",
    vehicle = "Автомобиль",
    door_or_vehicle = "door/vehicle",
    driver = "Driver: %s",
    name = "Имя: %s",
    locked = "Закрыто.",
    unlocked = "Открыто.",
    player_doesnt_exist = "Player does not exist.",
    job_doesnt_exist = "Job does not exist!",
    must_be_alive_to_do_x = "You must be alive in order to %s.",
    banned_or_demoted = "Banned/demoted",
    wait_with_that = "Wait with that.",
    could_not_find = "Could not find %s",
    f3tovote = "Hit F3 to vote",
    listen_up = "Listen up:", -- In rp_tell or rp_tellall
    nlr = "New Life Rule: Do Not Revenge Arrest/Kill.",
    reset_settings = "You have reset all settings!",
    must_be_x = "You must be a %s in order to be able to %s.",
    agenda = "agenda",
    agenda_updated = "The agenda has been updated",
    job_set = "%s has set his/her job to '%s'",
    demote_vote = "demote",
    demoted = "%s has been demoted",
    demoted_not = "%s has not been demoted",
    demote_vote_started = "%s has started a vote for the demotion of %s",
    demote_vote_text = "Demotion nominee:\n%s", -- '%s' is the reason here
    cant_demote_self = "You cannot demote yourself.",
    i_want_to_demote_you = "I want to demote you. Reason: %s",
    tried_to_avoid_demotion = "You tried to escape demotion. You failed and have been demoted.", -- naughty boy!
    lockdown_started = "The mayor has initiated a Lockdown, please return to your homes!",
    lockdown_ended = "The lockdown has ended",
    gunlicense_requested = "%s has requested %s a gun license",
    gunlicense_granted = "%s has granted %s a gun license",
    gunlicense_denied = "%s has denied %s a gun license",
    gunlicense_question_text = "Grant %s a gun license?",
    gunlicense_remove_vote_text = "%s has started a vote for the gun license removal of %s",
    gunlicense_remove_vote_text2 = "Revoke gunlicense:\n%s", -- Where %s is the reason
    gunlicense_removed = "%s's license has been removed!",
    gunlicense_not_removed = "%s's license has not been removed!",
    vote_specify_reason = "You need to specify a reason!",
    vote_started = "The vote has been created",
    vote_alone = "You have won the vote since you are alone in the server.",
    you_cannot_vote = "You cannot vote!",
    x_cancelled_vote = "%s cancelled the last vote.",
    cant_cancel_vote = "Could not cancel the last vote as there was no last vote to cancel!",
    jail_punishment = "Punishment for disconnecting! Jailed for: %d seconds.",
    admin_only = "Admin only!", -- When doing /addjailpos
    chief_or = "Chief or ",-- When doing /addjailpos
    frozen = "Frozen.",
    recipient = "recipient",
    forbidden_name = "Forbidden name.",
    illegal_characters = "Illegal characters.",
    too_long = "Too long.",
    too_short = "Too short.",

    dead_in_jail = "You now are dead until your jail time is up!",
    died_in_jail = "%s has died in jail!",

    credits_for = "CREDITS FOR %s\n",
    credits_see_console = "DarkRP credits printed to console.",

    rp_getvehicles = "Available vehicles for custom vehicles:",

    data_not_loaded_one = "Your data has not been loaded yet. Please wait.",
    data_not_loaded_two = "If this persists, try rejoining or contacting an admin.",

    cant_spawn_weapons = "You cannot spawn weapons.",
    drive_disabled = "Drive disabled for now.",
    property_disabled = "Property disabled for now.",

    not_allowed_to_purchase = "You are not allowed to purchase this item.",

    rp_teamban_hint = "rp_teamban [player name/ID] [team name/id]. Use this to ban a player from a certain team.",
    rp_teamunban_hint = "rp_teamunban [player name/ID] [team name/id]. Use this to unban a player from a certain team.",
    x_teambanned_y_for_z = "%s has banned %s from being a %s for %s minutes.",
    x_teamunbanned_y = "%s has unbanned %s from being a %s.",

    -- Backwards compatibility:
    you_set_x_salary_to_y = "You set %s's salary to %s%d.",
    x_set_your_salary_to_y = "%s set your salary to %s%d.",
    you_set_x_money_to_y = "You set %s's money to %s%d.",
    x_set_your_money_to_y = "%s set your money to %s%d.",

    you_set_x_salary = "You set %s's salary to %s.",
    x_set_your_salary = "%s set your salary to %s.",
    you_set_x_money = "You set %s's money to %s.",
    x_set_your_money = "%s set your money to %s.",
    you_set_x_name = "You set %s's name to %s",
    x_set_your_name = "%s set your name to %s",

    someone_stole_steam_name = "Someone is already using your Steam name as their RP name so we gave you a '1' after your name.", -- Uh oh
    already_taken = "Already taken.",

    job_doesnt_require_vote_currently = "This job does not require a vote at the moment!",

    x_made_you_a_y = "%s has made you a %s!",

    cmd_cant_be_run_server_console = "This command cannot be run from the server console.",

    -- The lottery
    lottery_started = "There is a lottery! Participate for %s%d?", -- backwards compatibility
    lottery_has_started = "There is a lottery! Participate for %s?",
    lottery_entered = "You entered the lottery for %s",
    lottery_not_entered = "%s did not enter the lottery",
    lottery_noone_entered = "No-one has entered the lottery",
    lottery_won = "%s has won the lottery! He has won %s",
    lottery = "lottery",
    lottery_please_specify_an_entry_cost = "Please specify an entry cost ($%i-%i)",

    -- Animations
    custom_animation = "Анимация",
    bow = "Моё Уважение",
    sexy_dance = "Стриптиз",
    follow_me = "За мной!",
    laugh = "Смеяться",
    lion_pose = "Поза Льва",
    nonverbal_no = "Нет",
    thumbs_up = "Да",
    wave = "Поздороваться",
    dance = "Танцевать",

    -- Hungermod
    starving = "Starving!",

    -- AFK
    afk_mode = "AFK Mode",
    unable_afk_spam_prevention = "Please wait before going AFK again.",
    salary_frozen = "Your salary has been frozen.",
    salary_restored = "Welcome back, your salary has now been restored.",
    no_auto_demote = "You will not be auto-demoted.",
    youre_afk_demoted = "You were demoted for being AFK for too long. Next time use /afk.",
    hes_afk_demoted = "%s has been demoted for being AFK for too long.",
    afk_cmd_to_exit = "Type /afk to exit AFK mode.",
    player_now_afk = "%s is now AFK.",
    player_no_longer_afk = "%s is no longer AFK.",

    -- Hitmenu
    hit = "hit",
    hitman = "Hitman",
    current_hit = "Hit: %s",
    cannot_request_hit = "Cannot request hit! %s",
    hitmenu_request = "Request",
    player_not_hitman = "This player is not a hitman!",
    distance_too_big = "Distance too big.",
    hitman_no_suicide = "The hitman won't kill himself.",
    hitman_no_self_order = "A hitman cannot order a hit for himself.",
    hitman_already_has_hit = "The hitman already has a hit ongoing.",
    price_too_low = "Price too low!",
    hit_target_recently_killed_by_hit = "The target was recently killed by a hit,",
    customer_recently_bought_hit = "The customer has recently requested a hit.",
    accept_hit_question = "Accept hit from %s\nregarding %s for %s%d?", -- backwards compatibility
    accept_hit_request = "Accept hit from %s\nregarding %s for %s?",
    hit_requested = "Hit requested!",
    hit_aborted = "Hit aborted! %s",
    hit_accepted = "Hit accepted!",
    hit_declined = "The hitman declined the hit!",
    hitman_left_server = "The hitman has left the server!",
    customer_left_server = "The customer has left the server!",
    target_left_server = "The target has left the server!",
    hit_price_set_to_x = "Hit price set to %s%d.", -- backwards compatibility
    hit_price_set = "Hit price set to %s.",
    hit_complete = "Hit by %s complete!",
    hitman_died = "The hitman died!",
    target_died = "The target has died!",
    hitman_arrested = "The hitman was arrested!",
    hitman_changed_team = "The hitman changed team!",
    x_had_hit_ordered_by_y = "%s had an active hit ordered by %s",
    place_a_hit = "place a hit!",
    hit_cancel = "hit cancellation!",
    hit_cancelled = "The hit was cancelled!",
    no_active_hit = "You have no active hit!",

    -- Vote Restrictions
    hobos_no_rights = "Hobos have no voting rights!",
    gangsters_cant_vote_for_government = "Gangsters cannot vote for government things!",
    government_cant_vote_for_gangsters = "Government officials cannot vote for gangster things!",

    -- VGUI and some more doors/vehicles
    vote = "Голосовать",
    time = "Время: %d",
    yes = "Да",
    no = "Нет",
    ok = "Ладно",
    cancel = "Отмена",
    add = 'Добавить',
    remove = "Удалить",
    none = "Ничего",

    x_options = "%s настройки",
    sell_x = "Продать %s",
    set_x_title = "Сделать для %s заголовок",
    set_x_title_long = "Установить для %s заголовок.",
    jobs = "Jobs",
    buy_x = "Купить %s",

    -- F4menu
    ammo = "ammo",
    weapon_ = "weapon",
    no_extra_weapons = "This job has no extra weapons.",
    become_job = "Become job",
    create_vote_for_job = "Create vote",
    shipment = "shipment",
    Shipments = "Shipments",
    shipments = "shipments",
    F4guns = "Weapons",
    F4entities = "Miscellaneous",
    F4ammo = "Ammo",
    F4vehicles = "Vehicles",

    -- Tab 1
    give_money = "Give money to the player you're looking at",
    drop_money = "Drop money",
    change_name = "Change your DarkRP name",
    go_to_sleep = "Go to sleep/wake up",
    drop_weapon = "Drop current weapon",
    buy_health = "Buy health(%s)",
    request_gunlicense = "Request gunlicense",
    demote_player_menu = "Demote a player",

    searchwarrantbutton = "Make a player wanted",
    unwarrantbutton = "Remove the wanted status from a player",
    noone_available = "No one available",
    request_warrant = "Request a search warrant for a player",
    make_wanted = "Make someone wanted",
    make_unwanted = "Make someone unwanted",
    set_jailpos = "Set the jail position",
    add_jailpos = "Add a jail position",

    set_custom_job = "Set a custom job (press enter to activate)",

    set_agenda = "Set the agenda (press enter to activate)",

    initiate_lockdown = "Initiate a lockdown",
    stop_lockdown = "Stop the lockdown",
    start_lottery = "Start a lottery",
    give_license_lookingat = "Give <lookingat> a gun license",

    laws_of_the_land = "LAWS OF THE LAND",
    law_added = "Law added.",
    law_removed = "Law removed.",
    law_reset = "Laws reset.",
    law_too_short = "Law too short.",
    laws_full = "The laws are full.",
    default_law_change_denied = "You are not allowed to change the default laws.",

    -- Second tab
    job_name = "Name: ",
    job_description = "Description: ",
    job_weapons = "Weapons: ",

    -- Entities tab
    buy_a = "Buy %s: %s",

    -- Licenseweaponstab
    license_tab = [[License weapons

    Tick the weapons people should be able to get WITHOUT a license!
    ]],
    license_tab_other_weapons = "Other weapons:",
}

-- The language code is usually (but not always) a two-letter code. The default language is "en".
-- Other examples are "nl" (Dutch), "de" (German)
-- If you want to know what your language code is, open GMod, select a language at the bottom right
-- then enter gmod_language in console. It will show you the code.
-- Make sure language code is a valid entry for the convar gmod_language.
DarkRP.addLanguage("en", my_language)
