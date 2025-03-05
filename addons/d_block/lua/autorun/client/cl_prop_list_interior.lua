if ( CLIENT ) then 

    local proplist_other = {
        "models/Items/ammoCrate_Rockets.mdl",
        "models/Items/ammocrate_smg1.mdl",
        "models/Items/battery.mdl",
        "models/Items/combine_rifle_ammo01.mdl",
        "models/Items/combine_rifle_cartridge01.mdl",
        "models/Items/HealthKit.mdl",
        "models/Items/BoxMRounds.mdl",
        "models/Items/BoxSRounds.mdl",
        "models/props/CS_militia/footlocker01_closed.mdl",
        "models/props/CS_militia/haybale_target.mdl",
        "models/props/CS_militia/haybale_target_02.mdl",
        "models/props/CS_militia/haybale_target_03.mdl",
        "models/props/CS_militia/gun_cabinet.mdl",
        "models/props/CS_militia/sawhorse.mdl",
        "models/props/CS_militia/crate_stackmill.mdl",
        "models/Gibs/HGIBS.mdl",
        "models/Gibs/HGIBS_spine.mdl",
        "models/props_c17/doll01.mdl",
        "models/maxofs2d/cube_tool.mdl",
        "models/maxofs2d/hover_rings.mdl",
        "models/maxofs2d/button_02.mdl",
        "models/maxofs2d/button_04.mdl",
        "models/maxofs2d/gm_painting.mdl",
        "models/maxofs2d/balloon_mossman.mdl",
        "models/maxofs2d/camera.mdl",
        "models/items/cs_gift.mdl",
        "models/weapons/w_c4_planted.mdl",
        "models/weapons/w_crossbow.mdl",
        "models/weapons/w_eq_fraggrenade_thrown.mdl",
        "models/weapons/w_mach_m249para.mdl",
        "models/weapons/w_knife_t.mdl",
        "models/weapons/w_pist_elite.mdl",
        "models/weapons/w_pist_deagle.mdl",
        "models/weapons/w_physics.mdl",
        "models/weapons/w_pist_usp_silencer.mdl",
        "models/weapons/w_rif_ak47.mdl",
        "models/weapons/w_rif_aug.mdl",
        "models/weapons/w_rif_galil.mdl",
        "models/weapons/w_rif_m4a1.mdl",
        "models/weapons/w_rif_m4a1_silencer.mdl",
        "models/weapons/w_rif_sg552.mdl",
        "models/weapons/w_smg_mp5.mdl",
        "models/weapons/w_smg_mac10.mdl",
        "models/weapons/w_smg_p90.mdl",
        "models/weapons/w_smg_tmp.mdl",
        "models/weapons/w_snip_awp.mdl",
        "models/weapons/w_stunbaton.mdl",
        "models/props_phx/misc/bunker01.mdl",
    }

    local proplist_room = {
        "models/chairs/armchair.mdl",
        "models/props_interiors/Furniture_Couch01a.mdl",
        "models/props_interiors/Furniture_Couch02a.mdl",
        "models/props_interiors/Furniture_Desk01a.mdl",
        "models/props_interiors/Furniture_Lamp01a.mdl",
        "models/props_combine/breendesk.mdl",
        "models/props_combine/breenchair.mdl",
        "models/props_c17/chair_office01a.mdl",
        "models/props_c17/computer01_keyboard.mdl",
        "models/props_lab/monitor02.mdl",
        "models/props_lab/monitor01a.mdl",
        "models/props_lab/harddrive02.mdl",
        "models/props_lab/citizenradio.mdl",
        "models/props_lab/clipboard.mdl",
        "models/props_lab/crematorcase.mdl",
        "models/props_lab/huladoll.mdl",
        "models/props_lab/frame002a.mdl",
        "models/props_lab/securitybank.mdl",
        "models/props_lab/workspace002.mdl",
        "models/props_wasteland/controlroom_filecabinet002a.mdl",
        "models/props_combine/breenglobe.mdl",
        "models/props_c17/FurnitureCouch002a.mdl",
        "models/props_c17/FurnitureCouch001a.mdl",
        "models/props_c17/FurnitureRadiator001a.mdl",
        "models/props/cs_office/Bookshelf1.mdl",
        "models/props/cs_office/file_cabinet1.mdl",
        "models/props/cs_office/file_cabinet3.mdl",
        "models/props/cs_office/Fire_Extinguisher.mdl",
        "models/props/cs_office/phone.mdl",
        "models/props/cs_office/paperbox_pile_01.mdl",
        "models/props/cs_office/plant01.mdl",
        "models/props/cs_office/sofa.mdl",
        "models/props/cs_office/sofa_chair.mdl",
        "models/props/cs_office/TV_plasma.mdl",
        "models/props/CS_militia/television_console01.mdl",
        "models/props/CS_militia/table_shed.mdl",
        "models/props/CS_militia/boxes_garage_lower.mdl",
        "models/props/CS_militia/shelves_wood.mdl",
        "models/props_phx/rt_screen.mdl",
    }

    local proplist_bathroom = {
        "models/props_c17/FurnitureSink001a.mdl",
        "models/props_c17/FurnitureBathtub001a.mdl",
        "models/props_c17/FurnitureToilet001a.mdl",
        "models/props_c17/FurnitureWashingmachine001a.mdl",
        "models/props_wasteland/laundry_cart001.mdl",
        "models/props_wasteland/laundry_dryer001.mdl",
        "models/props_wasteland/laundry_dryer002.mdl",
        "models/props_wasteland/prison_heater001a.mdl",
        "models/props/CS_militia/toilet.mdl",
        "models/props/CS_militia/urine_trough.mdl",
    }

    local proplist_kitchen = {
        "models/props_interiors/refrigerator01a.mdl",
        "models/props_interiors/refrigeratorDoor01a.mdl",
        "models/props_interiors/Radiator01a.mdl",
        "models/props_interiors/pot02a.mdl",
        "models/props_interiors/pot01a.mdl",
        "models/props_interiors/SinkKitchen01a.mdl",
        "models/props_junk/MetalBucket01a.mdl",
        "models/props_junk/PlasticCrate01a.mdl",
        "models/props_junk/PopCan01a.mdl",
        "models/props_c17/display_cooler01a.mdl",
        "models/props_c17/FurnitureFireplace001a.mdl",
        "models/props_c17/furnitureStove001a.mdl",
        "models/props_c17/FurnitureFridge001a.mdl",
        "models/props_junk/PlasticCrate01a.mdl",
        "models/props_wasteland/kitchen_counter001a.mdl",
        "models/props_wasteland/kitchen_counter001b.mdl",
        "models/props_wasteland/kitchen_counter001c.mdl",
        "models/props_wasteland/kitchen_counter001d.mdl",
        "models/props_wasteland/kitchen_fridge001a.mdl",
    }

    local proplist_fences = {
        "models/props_c17/fence01a.mdl",
        "models/props_c17/fence01b.mdl",
        "models/props_c17/fence02a.mdl",
        "models/props_c17/fence02b.mdl",
        "models/props_c17/fence03a.mdl",
        "models/props_wasteland/exterior_fence001b.mdl",
        "models/props_wasteland/exterior_fence002a.mdl",
        "models/props_wasteland/exterior_fence002b.mdl",
        "models/props_wasteland/exterior_fence002c.mdl",
        "models/props_wasteland/exterior_fence002d.mdl",
        "models/props_wasteland/exterior_fence002e.mdl",
        "models/props_wasteland/exterior_fence003a.mdl",
        "models/props_wasteland/exterior_fence003b.mdl",
        "models/props_wasteland/interior_fence002c.mdl",
        "models/props_wasteland/interior_fence002d.mdl",
        "models/props_wasteland/interior_fence002e.mdl",
        "models/props_wasteland/interior_fence002f.mdl",
        "models/props_wasteland/interior_fence003f.mdl",
        "models/props_wasteland/wood_fence01a.mdl",
        "models/props_wasteland/wood_fence01b.mdl",
        "models/props/cs_militia/fencewoodlog01_short.mdl",
        "models/props/cs_militia/fencewoodlog03_long.mdl",
        "models/props/cs_militia/fence_ranch.mdl",
    }

    local proplist_street = { 
        "models/props_borealis/borealis_door001a.mdl",
        "models/props_c17/door01_left.mdl",
        "models/props_c17/door02_double.mdl",
        "models/props_c17/concrete_barrier001a.mdl",
        "models/props_c17/gravestone002a.mdl",
        "models/props_c17/gravestone004a.mdl",
        "models/props_c17/metalladder001.mdl",
        "models/props_c17/oildrum001.mdl",
        "models/props_c17/pulleywheels_small01.mdl",
        "models/props_c17/pulleywheels_large01.mdl",
        "models/props_phx/construct/concrete_barrier01.mdl",
        "models/props_phx/construct/concrete_barrier00.mdl",
        "models/props_debris/metal_panel02a.mdl",
        "models/props_docks/channelmarker_gib02.mdl",
        "models/props_docks/channelmarker_gib03.mdl",
        "models/props_docks/dock01_pole01a_256.mdl",
        "models/props_foliage/tree_poplar_01.mdl",
        "models/props_interiors/VendingMachineSoda01a.mdl",
        "models/props_lab/blastdoor001a.mdl",
        "models/props_lab/blastdoor001c.mdl",
        "models/props_junk/TrashDumpster02b.mdl",
        "models/props_junk/TrashDumpster01a.mdl",
        "models/props_junk/TrashBin01a.mdl",
        "models/props_junk/TrafficCone001a.mdl",
        "models/props_junk/PushCart01a.mdl",
        "models/props_junk/iBeam01a_cluster01.mdl",
        "models/props_lab/kennel_physics.mdl",
        "models/props_trainstation/TrackSign02.mdl",
        "models/props_trainstation/bench_indoor001a.mdl",
        "models/props_trainstation/TrackSign03.mdl",
        "models/props_trainstation/trainstation_clock001.mdl",
        "models/props_trainstation/trainstation_post001.mdl",
        "models/props_trainstation/trashcan_indoor001a.mdl",
        "models/props_trainstation/trashcan_indoor001b.mdl",
        "models/props/cs_assault/Billboard.mdl",
        "models/props/cs_assault/BarrelWarning.mdl",
        "models/props/cs_assault/TicketMachine.mdl",
        "models/props/cs_assault/pylon.mdl",
        "models/props/CS_militia/bar01.mdl",
        "models/props/CS_militia/barstool01.mdl",
        "models/props/CS_militia/crate_extrasmallmill.mdl",
        "models/props/CS_militia/logpile2.mdl",
        "models/props/CS_militia/tree_large_militia.mdl",
        "models/props/de_nuke/cinderblock_stack.mdl",
        "models/props/de_nuke/crate_large.mdl",
        "models/props/de_nuke/NuclearTestCabinet.mdl",
        "models/props/de_nuke/NuclearControlBox.mdl",
    }

    local props = {}
    props[ "Комната" ] = {}
    props[ "Комната" ].Model = proplist_room

    props[ "Ванна" ] = {}
    props[ "Ванна" ].Model = proplist_bathroom

    props[ "Кухня" ] = {}
    props[ "Кухня" ].Model = proplist_kitchen

    props[ "Заборы" ] = {}
    props[ "Заборы" ].Model = proplist_fences

    props[ "Улица" ] = {}
    props[ "Улица" ].Model = proplist_street

    props[ "Остальное" ] = {}
    props[ "Остальное" ].Model = proplist_other


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

            for k, v in pairs( props[CategoryName].Model ) do
              
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
    end;
    spawnmenu.AddCreationTab("Интерьер", CreateContentPanel, "icon16/bullet_delete.png", 2)
end