if ( CLIENT ) then

    local proplist_robot = { 
        "models/Mechanics/robotics/a1.mdl",
        "models/Mechanics/robotics/a2.mdl",
        "models/Mechanics/robotics/a3.mdl",
        "models/Mechanics/robotics/b1.mdl",
        "models/Mechanics/robotics/b2.mdl",
        "models/Mechanics/robotics/b3.mdl",
        "models/Mechanics/robotics/d1.mdl",
        "models/Mechanics/robotics/d2.mdl",
        "models/Mechanics/robotics/d3.mdl",
        "models/Mechanics/robotics/foot.mdl",
        "models/Mechanics/robotics/g1.mdl",
        "models/Mechanics/robotics/g2.mdl",
        "models/Mechanics/robotics/i1.mdl",
        "models/Mechanics/robotics/i2.mdl",
        "models/Mechanics/robotics/i3.mdl",
        "models/Mechanics/robotics/k1.mdl",
        "models/Mechanics/robotics/k2.mdl",
        "models/Mechanics/robotics/k3.mdl",
        "models/Mechanics/robotics/l1.mdl",
        "models/Mechanics/robotics/l2.mdl",
        "models/Mechanics/robotics/l3.mdl",
        "models/Mechanics/robotics/m3.mdl",
        "models/Mechanics/robotics/stand.mdl",
        "models/Mechanics/robotics/xfoot.mdl",
        "models/Mechanics/roboticslarge/xfoot.mdl",
        "models/mechanics/roboticslarge/claw2l.mdl",
        "models/mechanics/roboticslarge/clawl.mdl",
        "models/mechanics/roboticslarge/claw_guide2l.mdl",
        "models/mechanics/roboticslarge/claw_hub_8.mdl",
    }

    local proplist_spec = { 
        "models/props_phx/construct/metal_plate_curve360.mdl",
        "models/props_phx/construct/metal_plate_curve2.mdl",
        "models/props_phx/construct/metal_plate_curve2x2.mdl",
        "models/props_phx/construct/metal_plate_curve360x2.mdl",
        "models/props_phx/construct/metal_wire_angle180x1.mdl",
        "models/props_phx/construct/metal_wire_angle180x2.mdl",
        "models/props_phx/construct/metal_wire_angle360x1.mdl",
        "models/props_phx/construct/metal_wire_angle360x2.mdl",
        "models/props_phx/construct/metal_angle180.mdl",
        "models/props_phx/construct/metal_angle360.mdl",
        "models/props_phx/construct/windows/window_dome360.mdl",
        "models/props_phx/construct/glass/glass_angle360.mdl",
        "models/XQM/panel360.mdl",
        "models/XQM/cylinderx1big.mdl",
    }

    local proplist_steels = { 
        "models/mechanics/solid_steel/i_beam2_8.mdl",
        "models/mechanics/solid_steel/i_beam2_16.mdl",
        "models/mechanics/solid_steel/crossbeam_4.mdl",
        "models/mechanics/solid_steel/crossbeam_8.mdl",
        "models/mechanics/solid_steel/step_beam_16.mdl",
        "models/mechanics/solid_steel/step_beam_32.mdl",
        "models/mechanics/solid_steel/sheetmetal_box90_4.mdl",
        "models/mechanics/solid_steel/sheetmetal_h90_4.mdl",
        "models/mechanics/solid_steel/sheetmetal_h_4.mdl",
        "models/mechanics/solid_steel/sheetmetal_plusb_4.mdl",
        "models/mechanics/solid_steel/sheetmetal_t_4.mdl",
        "models/mechanics/solid_steel/steel_beam45_3.mdl",
        "models/mechanics/solid_steel/steel_beam45_4.mdl",
        "models/mechanics/solid_steel/steel_beam45_8.mdl",
        "models/mechanics/solid_steel/steel_support_24_4.mdl",
        "models/mechanics/solid_steel/type_a_2_2.mdl",
        "models/mechanics/solid_steel/type_a_2_4.mdl",
        "models/mechanics/solid_steel/type_a_2_6.mdl",
        "models/mechanics/solid_steel/type_c_3_4.mdl",
        "models/mechanics/solid_steel/type_c_3_6.mdl",
        "models/mechanics/solid_steel/type_c_3_8.mdl",
        "models/Mechanics/gears2/pinion_40t3.mdl",
    }

    local proplist_1 = { 
        "models/hunter/geometric/hex1x1.mdl",
        "models/hunter/geometric/para1x1.mdl",
        "models/hunter/geometric/pent1x1.mdl",
        "models/hunter/geometric/tri1x1eq.mdl",
        "models/hunter/misc/lift2x2.mdl",
        "models/hunter/misc/sphere025x025.mdl",
        "models/hunter/misc/stair1x1.mdl",
        "models/hunter/misc/stair1x1inside.mdl",
        "models/hunter/misc/stair1x1outside.mdl",
        "models/hunter/tubes/circle2x2.mdl",
        "models/hunter/tubes/circle2x2b.mdl",
        "models/hunter/tubes/circle2x2c.mdl",
        "models/hunter/tubes/circle2x2d.mdl",
        "models/hunter/tubes/tube2x2x1.mdl",
        "models/hunter/tubes/tube2x2xt.mdl",
        "models/hunter/tubes/tubebend2x2x90.mdl",
    }

	local proplist_2 = { 
        "models/hunter/plates/plate025x025.mdl",
        "models/hunter/plates/plate025x05.mdl",
        "models/hunter/plates/plate025x075.mdl",
        "models/hunter/plates/plate025x1.mdl",
        "models/hunter/plates/plate025x125.mdl",
        "models/hunter/plates/plate025x150.mdl",
        "models/hunter/plates/plate05x05.mdl",
        "models/hunter/plates/plate05x05_rounded.mdl",
        "models/hunter/plates/plate1x1.mdl",
        "models/hunter/plates/plate1x2.mdl",
        "models/hunter/plates/plate1x3.mdl",
        "models/hunter/plates/plate1x4.mdl",
        "models/hunter/plates/plate1x5.mdl",
        "models/hunter/plates/plate2x2.mdl",
        "models/hunter/plates/plate2x3.mdl",
        "models/hunter/plates/plate2x4.mdl",
        "models/hunter/plates/plate2x5.mdl",
        "models/hunter/plates/plate3x3.mdl",
        "models/hunter/plates/plate3x4.mdl",
        "models/hunter/plates/plate3x5.mdl",
        "models/hunter/plates/plate4x4.mdl",
        "models/hunter/plates/plate4x5.mdl",
        "models/hunter/plates/plate5x5.mdl",
        "models/hunter/plates/plate6x6.mdl",
        "models/hunter/plates/platehole1x2.mdl",
        "models/hunter/plates/platehole2x2.mdl"
    }

	local proplist_3 = {
        "models/hunter/blocks/cube025x025x025.mdl",
        "models/hunter/blocks/cube025x05x025.mdl",
        "models/hunter/blocks/cube025x075x025.mdl",
        "models/hunter/blocks/cube025x125x025.mdl",
        "models/hunter/blocks/cube025x1x025.mdl",
        "models/hunter/blocks/cube025x2x025.mdl",
        "models/hunter/blocks/cube025x3x025.mdl",
        "models/hunter/blocks/cube025x4x025.mdl",
        "models/hunter/blocks/cube05x05x025.mdl",
        "models/hunter/blocks/cube05x05x05.mdl",
        "models/hunter/blocks/cube05x075x025.mdl",
        "models/hunter/blocks/cube05x105x05.mdl",
        "models/hunter/blocks/cube05x1x025.mdl",
        "models/hunter/blocks/cube05x1x05.mdl",
        "models/hunter/blocks/cube05x2x025.mdl",
        "models/hunter/blocks/cube05x2x05.mdl",
        "models/hunter/blocks/cube05x3x025.mdl",
        "models/hunter/blocks/cube05x3x05.mdl",
        "models/hunter/blocks/cube05x4x05.mdl",
        "models/hunter/blocks/cube05x5x025.mdl",
        "models/hunter/blocks/cube05x5x05.mdl",
        "models/hunter/blocks/cube075x075x025.mdl",
        "models/hunter/blocks/cube075x075x075.mdl",
        "models/hunter/blocks/cube075x1x025.mdl",
        "models/hunter/blocks/cube075x1x075.mdl",
        "models/hunter/blocks/cube075x1x1.mdl",
        "models/hunter/blocks/cube075x2x025.mdl",
        "models/hunter/blocks/cube075x2x1.mdl",
        "models/hunter/blocks/cube075x3x025.mdl",
        "models/hunter/blocks/cube075x3x075.mdl",
        "models/hunter/blocks/cube075x3x1.mdl",
        "models/hunter/blocks/cube075x4x025.mdl",
        "models/hunter/blocks/cube075x4x075.mdl",
        "models/hunter/blocks/cube075x5x075.mdl",
        "models/hunter/blocks/cube075x6x025.mdl",
        "models/hunter/blocks/cube3x3x025.mdl",
        "models/hunter/blocks/cube3x3x05.mdl",
        "models/hunter/blocks/cube3x4x025.mdl",
        "models/hunter/blocks/cube3x4x025.mdl",
        "models/hunter/blocks/cube3x8x025.mdl",
        "models/hunter/blocks/cube4x4x05.mdl",
    }

    local obj_spec = {
        'models/scarecrow/scarecrow.mdl',
        'models/pumpkin_3/pumpkin_3.mdl',
        'models/pumpkin_3/pumpkin_3_phys.mdl',
        'models/m_skel/m_skel.mdl',
        'models/m_pump/m_pump.mdl',
        'models/m_dead/m_dead.mdl',
        'models/kerze/kerze.mdl',
        'models/candy_01/candy_01.mdl',
        'models/bag/bag.mdl',
        'models/apple/apple.mdl'
    }


    local props = {}

    props[ 'Halloween' ] = { Model = obj_spec }

    props[ "Заброшенный робот" ] = {}
    props[ "Заброшенный робот" ].Model = proplist_robot

    props[ "Специальные" ] = {}
    props[ "Специальные" ].Model = proplist_spec

    props[ "Сталь" ] = {}
    props[ "Сталь" ].Model = proplist_steels

    props[ "Остальное" ] = {}
    props[ "Остальное" ].Model = proplist_1

    props[ "Панели" ] = {}
    props[ "Панели" ].Model = proplist_2

    props[ "Блоки" ] = {}
    props[ "Блоки" ].Model = proplist_3

    local props_two = {}
    props_two[ "Заброшенный робот" ] = {}
    props_two[ "Заброшенный робот" ].Model = proplist_robot


    local PANEL = {}

    function PANEL:Init()
        self.PanelList = vgui.Create( "DPanelList", self )
        self.PanelList:SetPadding( 4 )
        self.PanelList:SetSpacing( 2 )
        self.PanelList:EnableVerticalScrollbar( true )
        self:ToBuildPanels()
    end

    function PANEL:ToBuildPanels()
        self.PanelList:Clear()
        local Categorised = {}

        for k, v in pairs( props )  do
            v.Category = k
            Categorised[v.Category] = Categorised[v.Category] or {}
            table.insert(Categorised[v.Category], v)
        end

        for CategoryName, v in SortedPairs(Categorised) do
            local Category = vgui.Create("DCollapsibleCategory", self)
            self.PanelList:AddItem( Category )
            Category:SetExpanded( false )
            Category:SetLabel( CategoryName )
            Category:SetCookieName("EntitySpawn." .. CategoryName)
            local Content = vgui.Create( "DPanelList" )
            Category:SetContents( Content )
            Content:EnableHorizontal( true )
            Content:SetDrawBackground( false )
            Content:SetSpacing(2)
            Content:SetPadding(2)
            Content:SetAutoSize(true)
            num = 1

            for k, v in SortedPairs( props[CategoryName].Model ) do
              
                local Icon = vgui.Create("SpawnIcon", self)
                local Model = props[CategoryName].Model[num]

                if ( props[CategoryName].Model[num] ~= nil ) then
                    Icon:SetModel( props[CategoryName].Model[num] )
                else
                    Icon:SetModel("models/error.mdl")
                end

                Icon.DoClick = function()
                    RunConsoleCommand("gm_spawn", Model)
                end

                local lable = vgui.Create( "DLabel", Icon )
                lable:SetFont( "DebugFixedSmall" )
                lable:SetTextColor( color_black )
                lable:SetText( Model )
                lable:SetContentAlignment( 5 )
                lable:SetWide( self:GetWide() )
                lable:AlignBottom( -42 )
                Content:AddItem( Icon )
                num = num + 1
            end
        end

        self.PanelList:InvalidateLayout()
    end

    function PANEL:PerformLayout()
        self.PanelList:StretchToParent( 0, 0, 0, 0 )
    end
    local CreationSheet = vgui.RegisterTable( PANEL, "Panel" )

    local function CreateContentPanel()
        local ctrl = vgui.CreateFromTable(CreationSheet) 
        return ctrl
    end
 
    spawnmenu.AddCreationTab( 'Строительство', CreateContentPanel, "icon16/bullet_add.png", 1 )

end