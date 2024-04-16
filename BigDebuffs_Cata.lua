local addonName, addon = ...

local BUFF_DEFENSIVE = "buffs_defensive"
local BUFF_OFFENSIVE = "buffs_offensive"
local BUFF_OTHER = "buffs_other"
local INTERRUPT = "interrupts"
local CROWD_CONTROL = "cc"
local ROOT = "roots"
local IMMUNITY = "immunities"
local IMMUNITY_SPELL = "immunities_spells"

-- Show one of these when a big debuff is displayed
addon.WarningDebuffs = {
    30108, -- Unstable Affliction
    34914, -- Vampiric Touch
}

-- Make sure we always see these debuffs, but don't make them bigger
addon.PriorityDebuffs = {
    770, -- Faerie Fire
    16857, -- Faerie Fire (Feral)
    12294, -- Mortal Strike
    9035, -- Hex of Weakness
    19281, -- Hex of Weakness
    23230, -- Blood Fury Debuff
    23605, -- Nightfall, Spell Vulnerability
}

addon.Spells = {
    -- Death Knight
    [48792] = { type = BUFF_DEFENSIVE, },  -- Icebound Fortitude
    [50461] = { type = BUFF_DEFENSIVE, },  -- Anti-Magic Zone
    [47484] = { type = BUFF_DEFENSIVE, }, -- Huddle (Ghoul)
    [49028] = { type = BUFF_OFFENSIVE, },  -- Dancing Rune Weapon // might not work - spell id vs aura
    [47476] = { type = CROWD_CONTROL, },  -- Strangulate
    [47481] = { type = CROWD_CONTROL, },  -- Gnaw
    [49203] = { type = CROWD_CONTROL, }, -- Hungering Cold
    [48707] = { type = IMMUNITY_SPELL, },  -- Anti-Magic Shell
    [49039] = { type = IMMUNITY_SPELL, },  -- Lichborne
    [53550] = { type = INTERRUPT, duration = 4, },  -- Mind Freeze
    -- Druid
    [22842] = { type = BUFF_DEFENSIVE, },  -- Frenzied Regeneration
    [17116] = { type = BUFF_DEFENSIVE, }, -- Nature's Swiftness
    [61336] = { type = BUFF_DEFENSIVE, },  -- Survival Instincts
    [22812] = { type = BUFF_DEFENSIVE, },  -- Barkskin
    [29166] = { type = BUFF_OFFENSIVE, },  -- Innervate
    [50334] = { type = BUFF_OFFENSIVE, },  -- Berserk
    [69369] = { type = BUFF_OFFENSIVE, }, -- Predator's Swiftness
    [77761] = { type = BUFF_OTHER }, -- Stampeding Roar (Bear)
    [77764] = { type = BUFF_OTHER }, -- Stampeding Roar (Cat)
    [48505] = { type = BUFF_OFFENSIVE, }, -- Starfall
    [16689] = { type = BUFF_OTHER, }, -- Nature's Grasp
    [1850] = { type = BUFF_OTHER, },  -- Dash
    [768] = { type = BUFF_OTHER, }, -- Cat Form
    [5487] = { type = BUFF_OTHER, }, -- Bear Form
    [783] = { type = BUFF_OTHER, }, -- Travel Form
    [24858] = { type = BUFF_OTHER, }, -- Moonkin Form
    [33891] = { type = BUFF_OTHER, }, -- Tree of Life
    [22570] = { type = CROWD_CONTROL },  -- Maim
    [5211] = { type = CROWD_CONTROL, },  -- Bash
    [2637] = {type = CROWD_CONTROL}, -- Hibernate
    [9005] = { type = CROWD_CONTROL, },  -- Pounce
    [33786] = { type = IMMUNITY },  -- Cyclone
    [45334] = { type = ROOT, },  -- Feral Charge Effect (Immobilize)
    [339] = { type = ROOT, },  -- Entangling Roots
    [19975] = { type = ROOT, }, -- Entangling Roots (From Nature's Grasp)
    [93985] = { type = INTERRUPT, duration = 4, },  -- Skull Bash (Interrupt)
    -- Hunter
    [3045] = { type = BUFF_OFFENSIVE, }, -- Rapid Fire
    [53480] = { type = BUFF_DEFENSIVE, },  -- Roar of Sacrifice (Hunter Pet Skill)
    [5384] = { type = BUFF_DEFENSIVE, },  -- Feign Death
    [53271] = { type = BUFF_DEFENSIVE, },  -- Master's Call
    [53476] = { type = BUFF_DEFENSIVE, }, -- Intervene (Pet)
    [1742] = { type = BUFF_DEFENSIVE, }, -- Cower (Pet)
    [26064] = { type = BUFF_DEFENSIVE, }, -- Shell Shield (Pet)
    [34471] = { type = IMMUNITY, },  -- The Beast Within
    [19263] = { type = IMMUNITY, },  -- Deterrence
    [19574] = { type = IMMUNITY, }, -- Bestial Wrath (Pet)
    [24394] = { type = CROWD_CONTROL, },  -- Intimidation (Stun)
        [19577] = { type = BUFF_OFFENSIVE, }, -- Intimidation (Pet Buff)
    [19386] = { type = CROWD_CONTROL, },  -- Wyvern Sting
    [19503] = { type = CROWD_CONTROL, },  -- Scatter Shot
    [3355] = { type = CROWD_CONTROL, },  -- Freezing Trap
    [1513] = { type = CROWD_CONTROL, }, -- Scare Beast
    [35101] = { type = CROWD_CONTROL, }, -- Chimera Shot - Daze
    [50518] = { type = CROWD_CONTROL, }, -- Ravage (Pet)
    [91644] = { type = CROWD_CONTROL, }, -- Snatch (Pet Disarm)
    [34490] = { type = CROWD_CONTROL, }, -- Silencing Shot
    [19306] = { type = ROOT, }, -- Counterattack
    [19185] = { type = ROOT, }, -- Entrapment
        [64803] = { type = ROOT, },
        [19184] = { type = ROOT, },
    [50245] = { type = ROOT, }, -- Pin (Pet)
    [4167] = { type = ROOT, }, -- Web (Pet)
    [26090] = { type = INTERRUPT, duration = 2, }, -- Pummel (Pet)
    -- Mage
    [11426] = { type = BUFF_OTHER, },  -- Ice Barrier
    [12472] = { type = BUFF_OFFENSIVE, },  -- Icy Veins
    [12042] = { type = BUFF_OFFENSIVE, },  -- Arcane Power
    [12043] = { type = BUFF_OFFENSIVE, },  -- Presence of Mind
    [12051] = { type = BUFF_OFFENSIVE, },  -- Evocation
    [44544] = { type = BUFF_OFFENSIVE, }, -- Fingers of Frost
    [66] = { type = BUFF_OFFENSIVE, },  -- Invisibility
    [118] = { type = CROWD_CONTROL, },  -- Polymorph
        [71319] = { type = CROWD_CONTROL, },
        [28271] = { type = CROWD_CONTROL, },
        [28272] = { type = CROWD_CONTROL, },
        [61305] = { type = CROWD_CONTROL, },
        [61721] = { type = CROWD_CONTROL, },
    [31661] = { type = CROWD_CONTROL, },  -- Dragon's Breath
    [44572] = { type = CROWD_CONTROL, }, -- Deep Freeze
    [12355] = { type = CROWD_CONTROL, }, -- Impact
    [55021] = { type = CROWD_CONTROL, }, -- Improved Counterspell
    [64346] = { type = CROWD_CONTROL, }, -- Fiery Payback (Fire Mage Disarm)
    [45438] = { type = IMMUNITY, },  -- Ice Block
    [122] = { type = ROOT, },  -- Frost Nova
    [2139] = { type = INTERRUPT, duration = 6, },  -- Counterspell (Mage)
    -- Paladin
    [54428] = { type = BUFF_OTHER, }, -- Divine Plea
    [96263] = { type = BUFF_OTHER, }, -- Sacred Shield Proc
    [59578] = { type = BUFF_OTHER, }, -- The Art of War
    [1022] = { type = BUFF_DEFENSIVE, }, -- Hand of Protection
    [31850] = { type = BUFF_DEFENSIVE, },  -- Ardent Defender
    [31821] = { type = BUFF_DEFENSIVE, },  -- Aura Mastery
    [498] = { type = BUFF_DEFENSIVE, },  -- Divine Protection
    [6940] = { type = BUFF_DEFENSIVE, },  -- Hand of Sacrifice
    [1044] = { type = BUFF_DEFENSIVE, },  -- Hand of Freedom
    [64205] = { type = BUFF_DEFENSIVE, }, -- Divine Sacrifice
    [31884] = { type = BUFF_OFFENSIVE, },  -- Avenging Wrath
    [20066] = { type = CROWD_CONTROL, },  -- Repentance
    [853] = { type = CROWD_CONTROL, },  -- Hammer of Justice
    [63529] = { type = CROWD_CONTROL, }, -- Silenced - Shield of the Templar
    [10326] = { type = CROWD_CONTROL, }, -- Turn Evil
    [2812] = { type = CROWD_CONTROL, }, -- Holy Wrath
    [20170] = { type = CROWD_CONTROL, }, -- Seal of Justice Stun
    [642] = { type = IMMUNITY, },  -- Divine Shield
    -- Priest
    [47585] = { type = BUFF_DEFENSIVE, },  -- Dispersion
    [20711] = { type = BUFF_DEFENSIVE, },  -- Spirit of Redemption
    [47788] = { type = BUFF_DEFENSIVE, },  -- Guardian Spirit
    [14751] = { type = BUFF_DEFENSIVE, },  -- Inner Focus
    [33206] = { type = BUFF_DEFENSIVE, },  -- Pain Suppression
    [64843] = { type = BUFF_DEFENSIVE, },  -- Divine Hymn
    [64901] = { type = BUFF_DEFENSIVE, }, -- Hymn of Hope
    [10060] = { type = BUFF_OFFENSIVE, },  -- Power Infusion
    [6346] = { type = BUFF_OTHER, },  -- Fear Ward
    [17] = { type = BUFF_OTHER, }, -- Power Word: Shield
    [64044] = { type = CROWD_CONTROL, }, -- Psychic Horror (Horrify)
    [64058] = { type = CROWD_CONTROL, }, -- Psychic Horror (Disarm)
    [8122] = { type = CROWD_CONTROL, },  -- Psychic Scream
    [15487] = { type = CROWD_CONTROL, },  -- Silence
    [605] = { type = CROWD_CONTROL, },  -- Mind Control
    [9484] = { type = CROWD_CONTROL, },  -- Shackle Undead
    [96231] = { type = INTERRUPT, duration = 4 }, -- Rebuke
    -- Rogue
    [51713] = { type = BUFF_OFFENSIVE, }, -- Shadow Dance
    [13750] = { type = BUFF_OFFENSIVE, },  -- Adrenaline Rush
    [51690] = { type = BUFF_OFFENSIVE, },  -- Killing Spree
    [14177] = { type = BUFF_OFFENSIVE, }, -- Cold Blood
    [2983] = { type = BUFF_OTHER, },  -- Sprint
    [5277] = { type = BUFF_DEFENSIVE, },  -- Evasion
    [1776] = { type = CROWD_CONTROL, },  -- Gouge
    [51722] = {type = CROWD_CONTROL, }, -- Dismantle
    [2094] = { type = CROWD_CONTROL, },  -- Blind
    [408] = { type = CROWD_CONTROL, },  -- Kidney Shot
    [6770] = { type = CROWD_CONTROL, },  -- Sap
    [1330] = { type = CROWD_CONTROL, },  -- Garrote - Silence
    [1833] = { type = CROWD_CONTROL, },  -- Cheap Shot
    [18425] = { type = CROWD_CONTROL, }, -- Silence (Improved Kick)
    [31224] = { type = IMMUNITY_SPELL, },  -- Cloak of Shadows
    [1766] = { type = INTERRUPT, duration = 5, },  -- Kick
    [1856] = { type = BUFF_OTHER, }, -- Vanish
    -- Shaman
    [16166] = { type = BUFF_OFFENSIVE, }, -- Elemental Mastery (Instant Cast)
    [2825] = { type = BUFF_OFFENSIVE, },  -- Bloodlust
    [32182] = { type = BUFF_OFFENSIVE, },  -- Heroism
    [16191] = { type = BUFF_OFFENSIVE, }, -- Mana Tide Totem
    [30823] = { type = BUFF_DEFENSIVE, }, -- Shamanistic Rage
    [16188] = { type = BUFF_DEFENSIVE, }, -- Nature's Swiftness
    [58861] = { type = CROWD_CONTROL, }, -- Bash (Spirit Wolf)
    [51514] = { type = CROWD_CONTROL, },  -- Hex
    [39796] = { type = CROWD_CONTROL, }, -- Stoneclaw Stun
    [8178] = { type = IMMUNITY_SPELL, }, -- Grounding Totem Effect
    [63685] = { type = ROOT, }, -- Freeze (Enhancement)
    [64695] = { type = ROOT, }, -- Earthgrab (Elemental)
    [58875] = { type = BUFF_OTHER, }, -- Spirit Walk (Spirit Wolf)
    [55277] = { type = BUFF_OTHER, }, -- Stoneclaw Totem (Absorb)
    [57994] = { type = INTERRUPT, duration = 2, },  -- Wind Shear
    -- Warlock
    [47241] = { type = BUFF_OFFENSIVE, }, -- Metamorphosis
    [18708] = { type = BUFF_OTHER, },  -- Fel Domination
    [7812] = { type = BUFF_OTHER, }, -- Sacrifice
    [60995] = { type = CROWD_CONTROL, }, -- Demon Charge (Metamorphosis)
    [30283] = { type = CROWD_CONTROL, },  -- Shadowfury
    [31117] = { type = CROWD_CONTROL, },  -- Unstable Affliction (Silence)
    [710] = { type = CROWD_CONTROL, },  -- Banish
    [47541] = { type = CROWD_CONTROL, },  -- Death Coil
    [6358] = { type = CROWD_CONTROL, },  -- Seduction
    [5782] = { type = CROWD_CONTROL, },  -- Fear
    [5484] = { type = CROWD_CONTROL, },  -- Howl of Terror
    [24259] = { type = CROWD_CONTROL, }, -- Spell Lock (Silence)
    [89766] = { type = CROWD_CONTROL, }, -- Axe Toss (Felguard)
    [19647] = { type = INTERRUPT, duration = 6, },  -- Spell Lock (Interrupt)
    -- Warrior
    [12975] = { type = BUFF_DEFENSIVE, },  -- Last Stand
    [55694] = { type = BUFF_DEFENSIVE, },  -- Enraged Regeneration
    [871] = { type = BUFF_DEFENSIVE, },  -- Shield Wall
    [3411] = { type = BUFF_DEFENSIVE, },  -- Intervene
    [2565] = { type = BUFF_DEFENSIVE, }, -- Shield Block
    [20230] = { type = BUFF_DEFENSIVE, }, -- Retaliation
    [60503] = { type = BUFF_OFFENSIVE, }, -- Taste for Blood
    [65925] = { type = BUFF_OFFENSIVE, }, -- Unrelenting Assault
    [1719] = { type = BUFF_OFFENSIVE, },  -- Recklessness
    [12292] = { type = BUFF_OFFENSIVE, }, -- Death Wish
    [18499] = { type = BUFF_OTHER, },  -- Berserker Rage
    [2457] = { type = BUFF_OTHER, }, -- Battle Stance
    [2458] = { type = BUFF_OTHER, }, -- Berserker Stance
    [71] = { type = BUFF_OTHER, }, -- Defensive Stance
    [12809] = { type = CROWD_CONTROL, }, -- Concussion Blow
    [676] = { type = CROWD_CONTROL, },  -- Disarm
    [46968] = { type = CROWD_CONTROL, },  -- Shockwave
    [5246] = { type = CROWD_CONTROL, },  -- Intimidating Shout (Non - Target)
    [20511] = { type = CROWD_CONTROL, }, -- Intimidating Shout (Target)
    [7922] = { type = CROWD_CONTROL, }, -- Charge
    [20253] = { type = CROWD_CONTROL, }, -- Intercept
    [18498] = { type = CROWD_CONTROL, }, -- Silenced - Gag Order
    [46924] = { type = IMMUNITY, },  -- Bladestorm
    [23920] = { type = IMMUNITY_SPELL, },  -- Spell Reflection
    [6552] = { type = INTERRUPT, duration = 4, },  -- Pummel
    -- Misc
    [5215] = { type = BUFF_OTHER, },  -- Prowl
    [1784] = { type = BUFF_OTHER, },  -- Stealth
    [58984] = { type = BUFF_OTHER, }, -- Shadowmeld
    [43183] = { type = BUFF_OTHER, },  -- Drink (Arena/Lvl 80 Water)
        [57073] = { type = BUFF_OTHER }, -- (Mage Water)
    [20549] = { type = CROWD_CONTROL, },  -- War Stomp
    [28730] = { type = CROWD_CONTROL, }, -- Arcane Torrent (Mana)
    [25046] = { type = CROWD_CONTROL, }, -- Arcane Torrent (Energy)
    [50613] = { type = CROWD_CONTROL, }, -- Arcane Torrent (Runic Power)
    [69179] = { type = CROWD_CONTROL, }, -- Arcane Torrent (Rage)
    [80483] = { type = CROWD_CONTROL, }, -- Arcane Torrent (Focus)
}