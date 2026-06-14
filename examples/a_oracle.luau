local n1 = 100
local _shared = shared
local _shared2 = shared

_shared.a = n1
_shared2.b = n1

local function v4() -- line: 4
end

shared.b123 = v4
shared.a123 = v4

local v5 = glob()

glob1 = v5
glob2 = v5;
(function(p1, _, p3, ...) -- line: 13
	return p1 - p3
end)()

local v6 = 72 + 1

_G.a = v6

for i = 1, 100 do
	for j = i, 100 do
		for k = j, 100 do
			for n = k, 100 do
				for n2 = n, 100 do
					for n3 = n2, 100 do
						for n4 = n3, 100 do
							print(n4 + n3 - v6)
						end
					end
				end
			end
		end
	end
end

local _, v15, _, _, _ = (function() -- line: 36
	return 1, 2, 3
end)()

print(v15 + 3)

local v19 = foo()

print(v19 - 3)
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
	23423414324242424
})

local _ = (function() -- line: 50
end)() + 0
local t1 = {}
local t2 = {}

glob = t1
glob2 = t1
glob3 = t2
glob4 = t2

local function v23() -- line: 60
	return 1
end

glob5 = v23
glob6 = v23

local goodcharacters = game:WaitForChild("goodcharacters")
local _shared3 = shared
local _shared4 = shared

_shared3.a = goodcharacters
_shared4.b = goodcharacters

local v27 = game:WaitForChild("bad characters")
local _shared5 = shared
local _shared6 = shared

_shared5.a = v27
_shared6.b = v27

local v30 = game:WaitForChild("bad-characters")
local _shared7 = shared
local _shared8 = shared

_shared7.a = v30
_shared8.b = v30

local u33 = game:WaitForChild("1badcharacters")
local _shared9 = shared
local _shared10 = shared

_shared9.a = u33
_shared10.b = u33;
(function(p4) -- line: 73
	local p4_2 = game:FindFirstChild(p4)
	local p4_3 = game:FindFirstChild(p4)
	local p2_2 = game:WaitForChild(p2)
	local v48 = p4_2:WaitForChild("700")

	return p4_2, p2_2, v48, p2_2:WaitForChild(p4_3), v48:WaitForChild(), p4_3
end)(workspace)

local Testinglol = workspace:GetService("Testinglol")

print(Testinglol)
shared.a = Testinglol

local fakeservice123 = (100):GetService("fakeservice123")

print(fakeservice123)
shared.a = fakeservice123

local fakeservice123_2 = (100):FindFirstChild("fakeservice123")

print(fakeservice123_2)
shared.a = fakeservice123_2
game:WaitForChild({
	[setmetatable({}, {
		__metatable = "The metatable is locked",
		__tostring = function() -- line: 105
			-- upvalues: u33 (ref), t1 (ref)
			for i = 1, 15 do
				if not pcall(function() -- line: 108
					-- upvalues: i (copy), u33 (ref), t1 (ref)
					if getfenv(i).script ~= script and u33 then
						u33 = 1
						t1 = 30
						v375[1][v375[3]] = "Namecall Detected"
					end
				end) then
					return
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

