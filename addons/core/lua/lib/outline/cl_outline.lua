local List = {}
local RenderEnt = NULL

local CopyMat		= Material("pp/copy")
local OutlineMat	= CreateMaterial("OutlineMat","UnlitGeneric",{["$ignorez"] = 1,["$alphatest"] = 1})
local StoreTexture	= render.GetScreenEffectTexture(0)
local DrawTexture	= render.GetScreenEffectTexture(1)


CreateClientConVar( 'amb_outline', '1', true )

--[[-------------------------------
	Modes:
	0 - Always draw
	1 - Draw if not visible
	2 - Draw if visible
--]]-------------------------------

function AmbLib.Add(ents,color,mode)
	if !istable(ents) then ents = {ents} end	--Support for passing Entity as first argument
	if table.IsEmpty(ents) then return end		--Do not pass empty tables
    if #List>=255 then return end

	table.insert(List,{
        Ents = ents,
		Color = color,
		Mode = mode
	})
end

function AmbLib.RenderEnt()
	return RenderEnt
end

local function Render()
	local scene = render.GetRenderTarget()
	render.CopyRenderTargetToTexture(StoreTexture)

	render.Clear(0,0,0,0,true,true)

	render.SetStencilEnable(true)
		cam.IgnoreZ(true)
		render.SuppressEngineLighting(true)

		render.SetStencilWriteMask(255)
		render.SetStencilTestMask(255)

		render.SetStencilCompareFunction(STENCIL_ALWAYS)
		render.SetStencilFailOperation(STENCIL_KEEP)
		render.SetStencilZFailOperation(STENCIL_REPLACE)
		render.SetStencilPassOperation(STENCIL_REPLACE)

		cam.Start3D()
			for k,v in ipairs(List) do
            render.SetStencilReferenceValue(k)

				for k2,v2 in ipairs(v.Ents) do
					if !IsValid(v2) then continue end

					local visible = LocalPlayer():IsLineOfSightClear(v2)
                    if v.Mode==1 and visible or v.Mode==2 and !visible then continue end

					RenderEnt = v2
					v2:DrawModel()
					RenderEnt = NULL
				end
			end
		cam.End3D()

		render.SetStencilCompareFunction(STENCIL_EQUAL)

		cam.Start2D()
			for k,v in ipairs(List) do
				render.SetStencilReferenceValue(k)

				surface.SetDrawColor(v.Color)
				surface.DrawRect(0,0,ScrW(),ScrH())
			end
		cam.End2D()

		render.SuppressEngineLighting(false)
		cam.IgnoreZ(false)
	render.SetStencilEnable(false)

	render.CopyRenderTargetToTexture(DrawTexture)

	render.SetRenderTarget(scene)
	CopyMat:SetTexture("$basetexture",StoreTexture)
	render.SetMaterial(CopyMat)
	render.DrawScreenQuad()

	render.SetStencilEnable(true)
		render.SetStencilReferenceValue(0)
		render.SetStencilCompareFunction(STENCIL_EQUAL)

		OutlineMat:SetTexture("$basetexture",DrawTexture)
		render.SetMaterial(OutlineMat)

		for x=-1,1 do
			for y=-1,1 do
				if x==0 and x==0 then continue end

				render.DrawScreenQuadEx(x,y,ScrW(),ScrH())
			end
		end
	render.SetStencilEnable(false)
end

hook.Add("PostDrawEffects","RenderOutlines",function()
	hook.Run("PreDrawOutlines")

	if #List==0 then return end

	Render()

	List = {}
end)



local classes = {
	['prop_physics'] = true,
	['prop_dynamic'] = true
}

local max_dist = 400

hook.Add( 'PostRender', 'amb_0x128', function()
	if GetConVar('amb_outline'):GetBool() then
		if IsValid( LocalPlayer():GetEyeTrace().Entity ) then 
			if ( classes[LocalPlayer():GetEyeTrace().Entity:GetClass()] ) and LocalPlayer():GetPos():Distance( LocalPlayer():GetEyeTrace().Entity:GetPos() ) < max_dist then
				AmbLib.Add( LocalPlayer():GetEyeTrace().Entity, AMB_COLOR_GREEN, 2 )
			end
		end
	end
end)