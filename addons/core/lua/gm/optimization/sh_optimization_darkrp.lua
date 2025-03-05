AmbOptimization = AmbOptimization or {}

AmbOptimization.distRender = 3600

if ( CLIENT ) then

    function AmbOptimization.distRenderEnt( ent )

    	timer.Simple( 0, function()
    		ent.RenderOverride = function()
    		    if ( LocalPlayer():GetPos():Distance( ent:GetPos() ) < AmbOptimization.distRender ) then 
					ent:DrawModel() 
				end
            end
    	end )
    end
    hook.Add( "NetworkEntityCreated", "amb_0x9001", AmbOptimization.distRenderEnt )

elseif (SERVER) then

	function AmbOptimization.frogStart()
		local fog = ents.Create( "env_fog_controller" )
		fog:SetKeyValue( "fogenable", '1' )
		fog:SetKeyValue( "fogstart", "2500.0")
		fog:SetKeyValue( "fogend", "3900.0")
		fog:SetKeyValue( "farz", "3900")
		fog:Spawn()
	end

	AmbOptimization.frogStart()
end