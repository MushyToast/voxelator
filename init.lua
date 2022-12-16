--[[
Random voxel generator, made by MushyToast
set the mx-my values to accomadate your workspace, change the max variable to how many voxels MAX
Put this script inside ServerScriptService, put a part called 'voxel' in the dimensions that you want the voxel in ServerStorage
Finally, put a folder called 'voxels' in workspace, this is where all voxels go.
This is not a ModuleScript, this is a normal ServerScript
]]
local mx = 255
local mix = -255
local mz = 255
local miz = -255
local miy = 1
local my = 255
local maxvoxels = 50000

local folder = game.Workspace:WaitForChild('voxels')
local voxel = game:GetService('ServerStorage'):WaitForChild('voxel')
local count = 0
wait(5)

while #folder:GetChildren() <= maxvoxels do
	count = count + 1
	local x = math.random(mix, mx)
	local y = math.random(miy, my)
	local z = math.random(miz, mz)
	local clone = voxel:Clone()
	clone.Parent = folder
	clone.Position = Vector3.new(x, y, z)
	clone.Color = Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255))
	clone.Anchored = true
	clone.Name = ('Voxel#' .. tostring(count))
	wait()
end
