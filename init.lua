--[[
Random voxel generator, made by MushyToast, updated by UziDesu
set the mx-my values to accomadate your workspace, change the max variable to how many voxels MAX
Put this script inside ServerScriptService, put a part called 'voxel' in the dimensions that you want the voxel in ServerStorage
Finally, put a folder called 'voxels' in workspace, this is where all voxels go.
This is not a ModuleScript, this is a normal ServerScript
Recommend not to go over 20,000 to prevent lagging out
]]
local mx = 255
local mix = -255
local mz = 255
local miz = -255
local miy = 1
local my = 255
local maxvoxels = 10000
local voxelname = "Voxel%s"

local folder = game.Workspace:WaitForChild("voxels")
local voxel = game:GetService("ServerStorage"):WaitForChild("voxel")
local count = 0
task.wait(5)

local cooldowntimer = 0

while #folder:GetChildren() <= maxvoxels do
	cooldowntimer = cooldowntimer + 1
	if cooldowntimer == 100 then
		cooldowntimer = 0
		task.wait()
	end

	coroutine.resume(
		coroutine.create(
			function()
				count = count + 1
				local x = math.random(mix, mx)
				local y = math.random(miy, my)
				local z = math.random(miz, mz)
				local clone = voxel:Clone()
				clone.Parent = folder
				clone.Position = Vector3.new(x, y, z)
				clone.Color = Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255))
				clone.Anchored = true
				clone.Name = voxelname:format(tostring(count))
			end
		)
	)
end
