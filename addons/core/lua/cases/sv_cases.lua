function AmbCases.spawnCase( ePlayer, nType )

    local pos = ePlayer:GetEyeTrace().HitPos

    local case = ents.Create( 'amb_cases_case' )
    case:SetPos( ePlayer:GetShootPos() + ePlayer:GetAimVector() * 36 )
    case:Spawn()

    case:SetNWInt('type', nType)
    case:SetNWString('name', AmbCases.cases[nType].name )

end