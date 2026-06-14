-- https://lua.expert/
local v1 = 100
local v2 = shared
local v3 = shared

v2.a = v1
v3.b = v1

local function f4() --[[ Line: 4 ]] end

shared.b123 = f4
shared.a123 = f4

local v5 = glob()

glob1 = v5
glob2 = v5;
(function(p1, p2, p3, ...) --[[ Line: 13 ]]
	return p1 - p3
end)()

local v6 = 73

_G.a = v6

for i = 1, 100 do
	for j = i, 100 do
		for k = j, 100 do
			for n = k, 100 do
				for m = n, 100 do
					for i2 = m, 100 do
						for i3 = i2, 100 do
							print(i3 + i2 - v6)
						end
					end
				end
			end
		end
	end
end

local _, v7, _2, _3, _4 = (function() --[[ Line: 36 ]]
	return 1, 2, 3
end)()

print(v7 + 3)
print(foo() - 3)
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

local _5 = (function() --[[ Line: 50 ]] end)() + 0
local t = {}
local t2 = {}

glob = t
glob2 = t
glob3 = t2
glob4 = t2

local function f9() --[[ Line: 60 ]]
	return 1
end

glob5 = f9
glob6 = f9

local goodcharacters = game:WaitForChild("goodcharacters")
local v10 = shared
local v11 = shared

v10.a = goodcharacters
v11.b = goodcharacters

local v12 = game:WaitForChild("bad characters")
local v13 = shared
local v14 = shared

v13.a = v12
v14.b = v12

local v15 = game:WaitForChild("bad-characters")
local v16 = shared
local v17 = shared

v16.a = v15
v17.b = v15

local v18 = game:WaitForChild("1badcharacters")
local v19 = shared
local v20 = shared

v19.a = v18
v20.b = v18;
(function(p1) --[[ Line: 73 ]]
	local v1 = game:FindFirstChild(p1)
	local v2 = game:FindFirstChild(p1)
	local v3 = game:WaitForChild(p2)
	local v4 = v1:WaitForChild("700")

	return v1, v3, v4, v3:WaitForChild(v2), v4:WaitForChild(), v2
end)(workspace)

local Testinglol = workspace:GetService("Testinglol")

print(Testinglol)
shared.a = Testinglol

local fakeservice123 = (100):GetService("fakeservice123")

print(fakeservice123)
shared.a = fakeservice123

local fakeservice1232 = (100):FindFirstChild("fakeservice123")

print(fakeservice1232)
shared.a = fakeservice1232
game:WaitForChild({
	[setmetatable({}, {
		__metatable = "The metatable is locked",
		__tostring = function() --[[ Line: 105 | Upvalues: v18 (ref), t (ref) ]]
			for i = 1, 15 do
				if not pcall(function() --[[ Line: 108 | Upvalues: i (copy), v18 (ref), t (ref) ]]
					if getfenv(i).script == script or not v18 then
						return
					end

					v18 = 1
					t = 30
					v375[1][v375[3]] = "Namecall Detected"
				end) then
					break
				end
			end
		end
	})] = ""
}, 1)

local somethingcool = game.somethingcool

shared.a = somethingcool
shared.b = somethingcool

local somethingcool2 = game.somethingcool

shared.a = somethingcool2
shared.b = somethingcool2
