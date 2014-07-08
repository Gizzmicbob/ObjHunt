ENT.Type = "anim"
ENT.Base = "base_anim"

function ENT:Draw()

	local owner = self:GetOwner()

	if !self:IsValid() || !IsValid(owner) then return end

	self:SetPos( owner:GetPos() )

	local propAngle = owner:EyeAngles()
	propAngle:SnapTo("p",180)
	propAngle:SnapTo("y",45)
	self:SetAngles(propAngle)

	if (CLIENT) then
		if( LocalPlayer().wantThirdPerson ) then
			self:DrawModel()
		end
	end
end

function ENT:Think()
	self:Draw()
end