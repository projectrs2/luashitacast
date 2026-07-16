local profile = {}

local fastCastValue = 0.07 -- 0% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

local heal_hp_threshold_whm = 879
local heal_hp_threshold_rdm = 889

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local ethereal_earring = {
    Ear2 = 'Ethereal Earring',
}
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}

local sets = {
    Idle = {
        Head = 'dream ribbon',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'barone corazza',
        Hands = 'dst. mittens +1',
        Ring1 = 'sattva Ring',
        Ring2 = 'merman\'s Ring',
        Back = 'boxer\'s mantle',
        Waist = 'jungle sash',
        Legs = 'gavial Cuisses +1',
        Feet = 'gavial greaves +1',
        Ammo = 'happy egg',
    },
    IdleALT = {
        Head = 'gavial mask +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'barone corazza',
        Hands = 'dst. mittens +1',
        Ring1 = 'sattva Ring',
        Ring2 = 'merman\'s Ring',
        Back = 'boxer\'s mantle',
        Waist = 'jungle sash',
        Legs = 'gavial Cuisses +1',
        Feet = 'gavial greaves +1',
        Ammo = 'happy egg',
    },

    IdleDT = { -- Disabled on horizon_safe_mode
        Head = 'gavial mask +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'gavial mail +1',
        Hands = 'dst. mittens +1',
        Ring1 = 'sattva Ring',
        Ring2 = 'merman\'s Ring',
        Back = 'boxer\'s mantle',
        Waist = 'jungle sash',
        Legs = 'gavial Cuisses +1',
        Feet = 'gavial greaves +1',
        Ammo = 'happy egg',
    },

    IdleALTDT = { -- Disabled on horizon_safe_mode
    },

    Resting = {
        Head = 'homam zucchetto',
        Neck = 'Jeweled Collar',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'homam corazza',
        Hands = 'homam manopolas',
        Ring1 = 'Astral Ring',
        Ring2 = 'Ether Ring',
        Back = 'boxer\'s mantle',
        Waist = 'Swift Belt',
        Legs = 'homam cosciales',
        Feet = 'homam gambieras',
    },
    Town = {
		-- Main = 'Caduceus',
		-- Body = 'Alchemist\'s Apron',
	},
    Movement = {
        Legs = 'blood cuisses',
    },

    Movement_TP = {
        Legs = 'blood cuisses',
    },

    DT = {
        Head = 'dream ribbon',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'gavial mail +1',
        Hands = 'dst. mittens +1',
        Ring1 = 'sattva Ring',
        Ring2 = 'merman\'s Ring',
        Back = 'boxer\'s mantle',
        Waist = 'jungle sash',
        Legs = 'gavial Cuisses +1',
        Feet = 'gavial greaves +1',
        Ammo = 'happy egg',
    },
    MDT = { -- Shell IV provides 23% MDT
        Head = 'dream ribbon',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'gavial mail +1',
        Hands = 'dst. mittens +1',
        Ring1 = 'sattva Ring',
        Ring2 = 'merman\'s Ring',
        Back = 'boxer\'s mantle',
        Waist = 'jungle sash',
        Legs = 'gavial Cuisses +1',
        Feet = 'gavial greaves +1',
        Ammo = 'happy egg',
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {
        Ear2 = 'Loquac. Earring',

},
    SIRD = { -- Only used for Idle sets and not while Override sets are active
	},
    
	Haste = { -- Used for Utsusemi cooldown
        Head = 'homam zucchetto',
        Hands = 'homam manopolas',
        Waist = 'Swift Belt',
        Body = 'wym. mail +1',
        Legs = 'homam cosciales',
        Feet = 'homam gambieras',
	Ring1 = 'blitz ring',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = 'homam zucchetto',
        Neck = 'love torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Body = 'wym. mail +1',
        Hands = 'homam manopolas',
	Ring1 = 'blitz ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'forager\'s mantle',
        Waist = 'Swift Belt',
        Legs = 'homam cosciales',
        Feet = 'homam gambieras',
        Ammo = 'tiphia sting',
    },
    TP_HighAcc = {
        Head = 'homam zucchetto',
        Neck = 'love torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Body = 'homam corazza',
        Hands = 'homam manopolas',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'forager\'s mantle',
        Waist = 'Swift Belt',
        Legs = 'homam cosciales',
        Feet = 'homam gambieras',
        Ammo = 'tiphia sting',
    },

    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},


    MaxHP = {
        Head = 'drn. armet +1',
        Neck = 'bloodbead amulet',
        Ear1 = 'bloodbead earring',
        Ear2 = {Name = 'cassie earring', Priority =-1},
	Body = {Name = 'Bloody Aketon', Priority=-1},
        Hands = 'river gauntlets',
        Ring1 = 'sattva Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Waist = 'Jungle sash',
        Legs = 'blood cuisses',
        Feet = 'homam gambieras',
	Ammo = 'happy egg',
    },
    BreathBonus = {
        Head = 'wym. armet +1',
        Body = 'Wyvern Mail',
        Hands = 'Ostreger Mitts',
        Legs = 'drn. brais +1',
        Feet = 'Homam Gambieras',
    },
    Stoneskin = {
        Neck = 'stone gorget',
        Ear1 = 'Ryakho\'s Earring',
        -- Ear2 = 'Cmn. Earring',
        Hands = 'savage gauntlets',
        Ring1 = 'sapphire Ring',
        Ring2 = 'sapphire Ring',
        Back = 'Merciful Cape',
        Legs = 'homam cosciales',
        Feet = 'river gaiters',
    },

    BreathBonus_NonMage = {
        Head = 'wym. armet +1',
        Body = 'Wyvern Mail',
        Hands = 'Ostreger Mitts',
        Legs = 'drn. brais +1',
        Feet = 'Homam Gambieras',
},

    ['Ancient Circle'] = {
        Legs = 'drn. brais +1',
    },
    ['Jump'] = {
        Head = 'wym. armet +1',
        Neck = 'love torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Triumph Earring',
        Body = 'barone corazza',
        Hands = 'alkyoneus\'s brc.',
        Ring1 = 'flame Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'forager\'s mantle',
        Waist = 'wyrm Belt',
        Legs = 'Conte Cosciales',
        Feet = 'drn. greaves +1',
    },
    ['High Jump'] = {
        Head = 'wym. armet +1',
        Neck = 'love torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Triumph Earring',
        Body = 'barone corazza',
        Hands = 'alkyoneus\'s brc.',
        Ring1 = 'vaulter\'s ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'forager\'s mantle',
        Waist = 'wyrm Belt',
        Legs = 'Conte Cosciales',
        Feet = 'Hct. Leggings',
    },

    ['Super Jump'] = {},

    ['Call Wyvern'] = {
        Body = 'wym. Mail +1',
    },

    ['Spirit Link'] = {
        Head = 'drn. armet +1',
        Body = 'Wyvern Mail',
        Hands = 'Ostreger Mitts',
        Legs = 'drn. brais +1',
        Feet = 'Homam Gambieras',
    },
   
    ['Jump Accuracy'] = {
        Head = 'wym. armet +1',
        Neck = 'love torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Triumph Earring',
        Body = 'barone corazza',
        Hands = 'alkyoneus\'s brc.',
        Ring1 = 'flame Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'forager\'s mantle',
        Waist = 'wyrm Belt',
        Legs = 'Conte Cosciales',
        Feet = 'drn. greaves +1',
},

    ['High Jump Accuracy'] = {
        Head = 'wym. armet +1',
        Neck = 'love torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Triumph Earring',
        Body = 'hecatomb harness',
        Hands = 'alkyoneus\'s brc.',
        Ring1 = 'vaulter\'s ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'forager\'s mantle',
        Waist = 'wyrm Belt',
        Legs = 'Conte Cosciales',
        Feet = 'Hct. Leggings',
},

    WS = {
        Head = 'wym. armet +1',
        Neck = 'light gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'triumph Earring',
        Body = 'hecatomb harness',
        Hands = 'alkyoneus\'s brc.',
        Ring1 = 'flame Ring',
        Ring2 = 'Thunder Ring',
        Back = 'forager\'s mantle',
        Waist = 'warwolf Belt',
        Legs = 'Conte Cosciales',
        Feet = 'hct. leggings',
    },

    WS_HighAcc = {
        Head = 'wym. armet +1',
        Neck = 'light gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'triumph Earring',
        Body = 'hecatomb harness',
        Hands = 'alkyoneus\'s brc.',
        Ring1 = 'flame Ring',
        Ring2 = 'Thunder Ring',
        Back = 'forager\'s mantle',
        Waist = 'warwolf Belt',
        Legs = 'Conte Cosciales',
        Feet = 'hct. leggings',
    },


    ['Penta Thrust'] = {
        Head = 'optical hat',
        Neck = 'love torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Triumph Earring',
        Body = 'homam corazza',
        Hands = 'hecatomb mittens',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'forager\'s mantle',
        Waist = 'wyrm Belt',
        Legs = 'drn. brais +1',
        Feet = 'hct. leggings',
    },
    ['Wheeling Thrust'] = {
        Head = 'wym. armet +1',
        Neck = 'light gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Triumph Earring',
        Body = 'hecatomb harness',
        Hands = 'alkyoneus\'s brc.',
        Ring1 = 'flame Ring',
        Ring2 = 'Thunder Ring',
        Back = 'forager\'s mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Conte Cosciales',
        Feet = 'hct. leggings',
    },
    ['Impulse Drive'] = {
        Head = 'wym. armet +1',
        Neck = 'soil gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Triumph Earring',
        Body = 'hecatomb harness',
        Hands = 'alkyoneus\'s brc.',
        Ring1 = 'flame Ring',
        Ring2 = 'Thunder Ring',
        Back = 'forager\'s mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Conte Cosciales',
        Feet = 'hct. leggings',
    },
    ['Skewer'] = {
        Head = 'wym. armet +1',
        Neck = 'light gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Triumph Earring',
        Body = 'hecatomb harness',
        Hands = 'alkyoneus\'s brc.',
        Ring1 = 'flame Ring',
        Ring2 = 'Thunder Ring',
        Back = 'forager\'s mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Conte Cosciales',
        Feet = 'hct. leggings',
    },
    ['Geirskogul'] = {
        Head = 'Wym. Armet +1',
        Neck = 'Light Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Triumph Earring',
        Body = 'Hecatomb Harness',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'flame Ring',
        Ring2 = 'Thunder Ring',
        Back = 'forager\'s mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Conte Cosciales',
        Feet = 'Hct. Leggings',
    },

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},


    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {},

    VileElixir = {},
}

profile.SetMacroBook = function()
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro book 4')
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

sets.ethereal_earring = ethereal_earring
sets.warlocks_mantle = warlocks_mantle
profile.Sets = gcmelee.AppendSets(sets)

local JobAbilities = T{
    'Jump',
    'High Jump',
    'Super Jump',
    'Spirit Link',
    'Call Wyvern',
    'Ancient Circle',
}

local WeaponSkills = T{
    'Impulse Drive',
    'Wheeling Thrust',
    'Skewer',
    'Penta Thrust',
    'Geirskogul',
}

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Steady Wing') then
        gFunc.EquipSet(sets.BreathBonus)
    elseif (JobAbilities:contains(action.Name)) then
        gFunc.EquipSet(sets[action.Name])
    end

    if (gcmelee.GetAccuracyMode() == 'HighAcc') then
        if (action.Name == 'Jump') then
            gFunc.EquipSet('Jump Accuracy')
        elseif (action.Name == 'High Jump') then
            gFunc.EquipSet('High Jump Accuracy')
        end
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gcmelee.DoPreshot(sets.Preshot, gFunc.Combine(sets.Preshot, sets.Ranged), snapShotValue)
end

profile.HandleMidshot = function()
    gcmelee.DoMidshot(sets, gFunc.Combine(sets.Preshot, sets.Ranged))
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (WeaponSkills:contains(action.Name)) then
      gFunc.EquipSet(sets[action.Name])
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)

    local player = gData.GetPlayer()
    local isWHM = player.SubJob == 'WHM'
    local isRDM = player.SubJob == 'RDM'
    local isMage = isWHM or isRDM
    local weakened = gData.GetBuffCount('Weakness')

    if (isWHM and player.HP <= heal_hp_threshold_whm and weakened < 1) then
        gFunc.EquipSet(sets.DT)
    end
    if (isRDM and player.HP <= heal_hp_threshold_rdm and weakened < 1) then
        gFunc.EquipSet(sets.DT)
    end

    if (isMage) then
        gFunc.EquipSet('ethereal_earring')
    end

    gcmelee.DoDefaultOverride()

    local petAction = gData.GetPetAction()
    if (petAction ~= nil) then
        if (isMage) then
            gFunc.EquipSet(sets.BreathBonus)
        else
            gFunc.EquipSet(sets.BreathBonus_NonMage)
        end
        return
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        gcmelee.DoPrecast(fastCastValue + 0.02)
        gFunc.EquipSet('warlocks_mantle')
    else
        gcmelee.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local player = gData.GetPlayer()
    local action = gData.GetAction()
    if (player.SubJob == 'WHM' or player.SubJob == 'RDM') then
        if (action.Name == 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin)
        else
            gFunc.EquipSet(sets.MaxHP)
        end
    end
end

return profile
