local v1 = 100
local v2 = shared
local v3 = shared
v2.a = v1
v3.b = v1
local function v4() end
shared.b123 = v4
shared.a123 = v4
local v5 = glob()
glob1 = v5
glob2 = v5;
(function(p6, _, p7, ...)
	return p6 - p7
end)()
local v8 = 72 + 1
_G.a = v8
for v9 = 1, 100 do
	for v10 = v9, 100 do
		for v11 = v10, 100 do
			for v12 = v11, 100 do
				for v13 = v12, 100 do
					for v14 = v13, 100 do
						for v15 = v14, 100 do
							print(v15 + v14 - v8)
						end
					end
				end
			end
		end
	end
end
local _, v16, _, _, _ = (function()
	return 1, 2, 3
end)()
print(v16 + 3)
local v17 = foo()
print(v17 - 3)
print({ 1 })
print({ fowersfewrwewewerewrwerrwwrwrrwwr3322qweruqiweriuqweiurwerqwerqweryuiqweriuqweriuqweuirqwuierw3() })
print({
	[2] = 100
})
print({
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	23432432414432,
	2.3423414324242424e16
})
local _ = (function() end)() + 0
local v_u_18 = {}
local v19 = {}
glob = v_u_18
glob2 = v_u_18
glob3 = v19
glob4 = v19
local function v20()
	return 1
end
glob5 = v20
glob6 = v20
local v21 = game:WaitForChild("goodcharacters")
local v22 = shared
local v23 = shared
v22.a = v21
v23.b = v21
local v24 = game:WaitForChild("bad characters")
local v25 = shared
local v26 = shared
v25.a = v24
v26.b = v24
local v27 = game:WaitForChild("bad-characters")
local v28 = shared
local v29 = shared
v28.a = v27
v29.b = v27
local v_u_30 = game:WaitForChild("1badcharacters")
local v31 = shared
local v32 = shared
v31.a = v_u_30
v32.b = v_u_30;
(function(p33)
	local v34 = game:FindFirstChild(p33)
	local v35 = game:FindFirstChild(p33)
	local v36 = game:WaitForChild(p2)
	local v37 = v34:WaitForChild("700")
	return v34, v36, v37, v36:WaitForChild(v35), v37:WaitForChild(), v35
end)(workspace)
local v38 = workspace:GetService("Testinglol")
print(v38)
shared.a = v38
local v39 = (100):GetService("fakeservice123")
print(v39)
shared.a = v39
local v40 = (100):FindFirstChild("fakeservice123")
print(v40)
shared.a = v40
local v41 = game
local v42 = {}
local v44 = {
	["__metatable"] = "The metatable is locked",
	["__tostring"] = function()
		-- upvalues: (ref) v_u_30, (ref) v_u_18
		for v_u_43 = 1, 15 do
			if not pcall(function()
				-- upvalues: (copy) v_u_43, (ref) v_u_30, (ref) v_u_18
				if getfenv(v_u_43).script ~= script and v_u_30 then
					v_u_30 = 1
					v_u_18 = 30
					v375[1][v375[3]] = "Namecall Detected"
				end
			end) then
				return
			end
		end
	end
}
v42[setmetatable({}, v44)] = ""
v41:WaitForChild(v42, 1)
local v45 = game.somethingcool
shared.a = v45
shared.b = v45
local v46 = game.somethingcool
shared.a = v46
shared.b = v46
