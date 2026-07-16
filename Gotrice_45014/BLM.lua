local profile = {}

local fastCastValue = 0.04 -- 4% from gear listed in Precast set

local ninSJMaxMP = 658 -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 736 -- The Max MP you have when /whm in your idle set
local rdmSJMaxMP = 717 -- The Max MP you have when /rdm in your idle set

local nukeExtraThreshold = 840 -- The minimum MP for which NukeExtra StoneskinExtra, and PhalanxExtra set will be used instead of regular sets (to allow additional nukes using max mp sets)

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local republic_circlet = {
    -- Head = { 'Republic Circlet', Priority = 50 },
}
local opuntia_hoop = {
    -- Ring1 = 'Opuntia Hoop',
}
local diabolos_pole = {
    Main = 'Diabolos\'s Pole',
}
local sorcerers_ring = {
    Ring1 = 'Sorcerer\'s Ring', -- This is Ring1 instead of Ring2 to allow Ice Ring to work as well in gcmage.lua
}
local sorcerers_tonban = {
    Legs = { 'Sorcerer\'s Tonban', Priority = 50 },
}

local sorcerers_earring_hp_threshold = 0 -- HP at which Sorcerer's Earring set is equipped
local sorcerers_earring = { -- 1440
    Main = 'Terra\'s Staff',
    Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
    Head = 'Genie Tiara',
    Neck = { Name = 'Pch. Collar', Priority = 60 },
    Ear1 = { Name = 'Cassie Earring', Priority = 20 },
    Ear2 = 'Sorcerer\'s Earring',
    Body = { Name = 'Src. Coat +1', Priority = 70 },
    Hands = { Name = 'Garden Bangles', Priority = 60 },
    Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
    Ring2 = { Name = 'Sattva Ring', Priority = 60 },
    Back = { Name = 'Gigant Mantle', Priority = 60 },
    Waist = { Name = 'Ocean Sash', Priority = 70 },
    Legs = 'Igqira Lappas',
    Feet = { Name = 'Marine M Boots', Priority = 60 },
}

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Src. Coat +1', Priority = 70 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Merman\'s Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Umbra Cape',
        Waist = { Name = 'Penitent\'s Rope', Priority = -20 },
        Legs = 'Igqira Lappas',
		Feet = { Name = 'Hydra Gaiters'},
        -- Feet = { Name = 'Herald\'s Gaiters', Priority = 50 },
    },

    IdleALT = {},
    
    IdleDT = {}, -- Disabled on horizon_safe_mode

    IdleALTDT = {}, -- Disabled on horizon_safe_mode

    IdleMaxMP = {
        Head = { Name = 'Wzd. Petasos +1', Priority = 50 },
        Neck = { Name = 'Uggalepih Pendant', Priority = 50 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Morion Earring +1', Priority = 50 },
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Ring2 = { Name = 'Ether Ring', Priority = 10 },
        Hands = { Name = 'Zenith Mitts', Priority = 10 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Wzd. Tonban +1', Priority = 50 },
        Back = { Name = 'Merciful Cape', Priority = 50 },
    },


    Resting = {
        Main = 'Pluto\'s Staff',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Wzd. Petasos +1', Priority = 50 },
        Neck = { Name = 'Checkered Scarf', Priority = -20 },
        Ear1 = 'Relaxing Earring',
        Ear2 = 'boroka Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Zenith Mitts', Priority = 10 },
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Ring2 = { Name = 'Ether Ring', Priority = 10 },
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Wzd. Tonban +1', Priority = 50 },
        Feet = 'Hydra Gaiters',
    },
    Town = {
		-- Main = 'Caduceus',
		-- Body = 'Alchemist\'s Apron',
	},

    Movement = {
        -- Feet = { Name = 'Herald\'s Gaiters', Priority = 50 },
    },

    Movement_TP = {
        -- Feet = { Name = 'Herald\'s Gaiters', Priority = 50 },
    },

    DT = {
        Main = 'Terra\'s Staff',
        Head = 'Genie Tiara',
        Body = { Name = 'Src. Coat +1', Priority = 70 },
        Ring1 = 'Merman\'s Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Umbra Cape',
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 60 },
        Legs = 'Igqira Lappas',
    },

    DTNight = {
    },

    MDT = {
        Main = 'Terra\'s Staff',
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Src. Coat +1', Priority = 70 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Merman\'s Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Hexerei Cape',
        Waist = { Name = 'Jungle Sash', Priority = 60 },
        Feet = { Name = 'Hydra Gaiters'},
        -- Feet = { Name = 'Herald\'s Gaiters', Priority = 50 },
		
    },
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = { Name = 'Src. Coat +1', Priority = 70 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Water Belt', -- 20
        Legs = 'Igqira Lappas',
        Feet = 'Power Sandals', -- 7
    },
    IceRes = {
    },
    LightningRes = {
        Main = 'Terra\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = { Name = 'Src. Coat +1', Priority = 70 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Adroit Ring', -- 10
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Earth Belt', -- 20
        Legs = 'Igqira Lappas',
        Feet = { Name = 'Marine M Boots', Priority = 60 },
    },
    EarthRes = {
    },
    WindRes = {
    },
    WaterRes = {
    },
    Evasion = {
    },

    Override = { -- An additional override set explicitly to be used for sets such as crafting, HELM, fishing, or any other special sets such as DRK 2HR, MNK Counter etc. n.b. Any unused Resist or Evasion set can be used similarly.
    },

    Precast = {
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Feet = { Name = 'Rostrum Pumps', Priority = 10 },
    },

    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts regardless of Override set. If you wish to remain in FireRes etc. during casts, leave empty.
        Main = { Name = 'Eremite\'s Wand', Priority = 50 }, -- 25
        Sub = 'Genbu\'s Shield',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        -- Ear2 = 'Magnetic Earring', -- 8
        Ring1 = 'Merman\'s Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Waist = 'Druid\'s Rope', -- 10
        Feet = {'Wzd. Sabots +1', Priority = 50 }, -- 20
        Back = 'Umbra Cape',
    },

    Yellow = { -- This will override Precast if /lag is turned on or the spell casting time is too short. e.g. Tier 1: "Stone"
        Head = 'Zenith Crown', -- 50
        Neck = 'Checkered Scarf', -- 12
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Zenith Mitts',
        Ring1 = 'Serket Ring',
        Ring2 = 'Ether Ring',
        -- Back = 'Blue Cape',
        Waist = 'Penitent\'s Rope',
        Feet = 'Rostrum Pumps',
        -- Ammo = 'Tiphia Sting',
        Body = 'igqira weskit',
    },


		
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Head = 'Nashira Turban',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Body = 'Nashira Manteel',
        Hands = 'Nashira Gages',
        -- Back = 'Shadow Mantle',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
    },

    ConserveMP = {
        -- Ammo = 'Dream Sand',
        -- Ear2 = 'Magnetic Earring',
        Body = 'Igqira Weskit',
        -- Back = 'Maledictor\'s Shawl',
        Feet = { Name = 'Src. Sabots +1', Priority = 50 },
    },

    Cure = {
        Ammo = 'Hedgehog Bomb',
        Head = 'Nashira Turban',
        -- Ammo = { Name = 'Dream Sand', Priority = 50 },
        -- Head = 'Hydra Beret', -- 8
        -- Neck = 'Benign Necklace', -- 2
        Ear1 = 'Novia Earring', -- 7
        Ear2 = 'Ryakho\'s Earring',
        Body = 'mahatma hpl.',
        Hands = { Name = 'Dvt. Mitts +1', Priority = 50 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = { Name = 'Penitent\'s Rope', Priority = -20 }, -- 3
        Legs = 'Mahatma Slops',
        Feet = 'Igqira Huaraches',
    },

    Cursna = {
        Back = { Name = 'Altruistic Cape', Priority = 50 },
        Body = 'Nashira Manteel',
    },



    Enhancing = {
        Main = { Name = 'Eremite\'s Wand', Priority = 50 },
        Sub = 'Genbu\'s Shield',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
		-- Ammo = { Name = 'Dream Sand', Priority = 50 },
         Head = 'Nashira Turban',
		Neck = 'Enhancing Torque',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        -- Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = 'Nashira Manteel',
        Hands = 'Nashira Gages',
        Ring1 = 'Merman\'s Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Igqira Huaraches',
    },

    Stoneskin = {
        Main = { Name = 'Kirin\'s Pole', Priority = 70 },
        Head = { Name = 'Zenith Crown', Priority = 10 },
        Neck = 'Stone Gorget',
        Ear1 = 'Ryakho\'s Earring',
        -- Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Dvt. Mitts +1', Priority = 50 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Waist = 'Penitent\'s Rope',
        Back = { Name = 'Prism Cape', Priority = 70 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Mahatma Pigaches', Priority = 10 },
    },

    StoneskinExtra = {
        Main = { Name = 'Kirin\'s Pole', Priority = 70 },
        Sub = 'displaced',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Zenith Crown', Priority = 10 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = 'Ryakho\'s Earring',
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
		Feet = { Name = 'River Gaiters', Priority = 50 }		
    },

    
    PhalanxExtra = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Zenith Crown', Priority = 10 },
        Body = { Name = 'Wzd. Coat +1', Priority = 50 },
        Hands = { Name = 'Src. Gloves +1', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Wzd. Tonban +1', Priority = 50 },
    },


    Spikes = {
        Main = { Name = 'Kirin\'s Pole', Priority = 70 },
        Sub = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = 'Demon Helm +1',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Zenith Mitts', Priority = 10 },
        Ring1 = 'Snow Ring',
        Ring1 = 'Snow Ring',
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 60 },
        Legs = 'Mahatma Slops',
    },


    Enfeebling = {
        Head = 'Genie Tiara',
        Neck = 'Enfeebling Torque',
        Ear1 = { Name = 'Morion Earring +1', Priority = 60 },
        Ear2 = 'abyssal Earring',
        -- Ear1 = 'Enfeebling Earring',
        -- Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Wzd. Coat +1', Priority = 50 },
        Hands = 'Nashira Gages',
        Ring1 = { Name = 'Sattva Ring', Priority = 60 },
        Ring2 = { Name = 'Serket Ring', Priority = 10 },
        Back = { Name = 'Altruistic Cape', Priority = 50 },
        Waist = 'Swift Belt',
        Legs = 'Igqira Lappas',
        Feet = 'Nashira Crackows',
    },


    EnfeeblingMND = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Ear2 = 'Ryakho\'s Earring',
        Hands = { Name = 'Dvt. Mitts +1', Priority = 50 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Waist = { Name = 'Penitent\'s Rope', Priority = -20 },
        Feet = { Name = 'Mahatma Pigaches', Priority = 10 },
    },


    EnfeeblingINT = {
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Ear2 = { Name = 'Morion Earring +1', Priority = 60 },
        Hands = { Name = 'Mahatma Cuffs', Priority = 10 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 60 },
		Feet = { Name = 'River Gaiters', Priority = 50 }		
    },


    EnfeeblingACC = {
    },


    Divine = {},
    Banish = {},
    Dark = {
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Dark Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Nashira Manteel',
        Hands = { Name = 'Src. Gloves +1', Priority = 50 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 60 },
        Legs = { Name = 'Wzd. Tonban +1', Priority = 50 },
        Feet = 'Igqira Huaraches',
    },

    Stun = {
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Hands = 'Nashira Gages',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
    },


    Nuke = {
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = 'Demon Helm +1',
        Neck = 'Prudence Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Igqira Weskit',
        Hands = { Name = 'Zenith Mitts', Priority = 10 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = { Name = 'Prism Cape', Priority = 70 },
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 60 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Src. Sabots +1', Priority = 50 },

    },


    NukeHNM = {
        Head = { Name = 'Wzd. Petasos +1', Priority = 50 },
        Ear2 = 'Novia Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Wzd. Gloves +1', Priority = 50 },
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -20 },
    },


    NukeACC = {
        Head = { Name = 'Src. Petasos +1', Priority = 50 },
        Neck = 'Elemental Torque',
        Hands = { Name = 'Wzd. Gloves +1', Priority = 50 },
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Feet = 'Nashira Crackows',
    },


    NukeDOT = {
        Main = { Name = 'Kirin\'s Pole', Priority = 70 },
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = 'Demon Helm +1',
        Neck = 'Prudence Torque',
        Ear1 = { Name = 'Morion Earring +1', Priority = 60 },        
	    Ear2 = 'Abyssal Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Mahatma Cuffs', Priority = 10 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = { Name = 'Prism Cape', Priority = 70 },
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 60 },
        Legs = 'Mahatma Slops',
		Feet = { Name = 'River Gaiters', Priority = 50 }		
    },

    NukeExtra = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Zenith Crown', Priority = 100 },
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = { Name = 'Jungle Rope', Priority = 50 },
    },

    MB = {
        -- Ammo = 'Dream Sand',
        Hands = 'Src. Gloves +1',
        -- Back = 'Maledictor\'s Shawl',
    },

    MBHNM = {
        Hands = 'Wzd. Gloves +1',
        -- Back = 'Mahatma Cape',
    },
    VileElixir = {},
    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},
}

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 8')

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 //stun')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 //dia')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

sets.warlocks_mantle = warlocks_mantle
sets.republic_circlet = republic_circlet
sets.opuntia_hoop = opuntia_hoop
sets.diabolos_pole = diabolos_pole
sets.sorcerers_ring = sorcerers_ring
sets.sorcerers_tonban = sorcerers_tonban
sets.sorcerers_earring = sorcerers_earring
profile.Sets = gcmage.AppendSets(sets)

profile.HandleAbility = function()
    gcmage.DoAbility()
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gcmage.DoPreshot(sets.Preshot, gFunc.Combine(sets.Preshot, sets.Ranged), snapShotValue)
end

profile.HandleMidshot = function()
    gcmage.DoMidshot(sets, gFunc.Combine(sets.Preshot, sets.Ranged))
end

profile.HandleWeaponskill = function()
end

profile.OnLoad = function()
    gcmage.Load(310)
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args, sets)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(sets, ninSJMaxMP, whmSJMaxMP, nil, rdmSJMaxMP, nil)

    local spikes = gData.GetBuffCount('Blaze Spikes') + gData.GetBuffCount('Shock Spikes') + gData.GetBuffCount('Ice Spikes')
    local isPhysical = gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate' or gcdisplay.IdleSet == 'DT'
    if (spikes > 0 and isPhysical) then
        gFunc.EquipSet('opuntia_hoop')
    end

    local player = gData.GetPlayer()
    if (not gcinclude.horizon_safe_mode) then
        if (player.HP <= sorcerers_earring_hp_threshold) then
            gFunc.EquipSet('sorcerers_earring')
        end
    end

    gcmage.DoDefaultOverride()

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        gcmage.DoPrecast(sets, fastCastValue + 0.02, 0)
        gFunc.EquipSet('warlocks_mantle')
    else
        gcmage.DoPrecast(sets, fastCastValue, 0)
    end
end

local ElementalDebuffs = T{ 'Burn','Rasp','Drown','Choke','Frost','Shock' }

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, extraThreshold, rdmSJMaxMP, nil)

    local player = gData.GetPlayer()
    local action = gData.GetAction()
    if (republic_circlet.Head) then
        if (action.Skill == 'Elemental Magic' and gcdisplay.GetCycle('Mode') == 'Potency') then
            if (gcdisplay.GetToggle('Extra') and player.MP >= extraThreshold) then
                do return end
            end
            if (not ElementalDebuffs:contains(action.Name)) then
                if (conquest:GetInsideControl() and gcdisplay.GetToggle('HNM') == false and gcdisplay.GetCycle('Mode') ~= 'Accuracy') then
                    print(chat.header('LAC - BLM'):append(chat.message('In Region - Using Republic Circlet')))
                    gFunc.EquipSet('republic_circlet')
                end
            end
        end
    end
end

return profile
