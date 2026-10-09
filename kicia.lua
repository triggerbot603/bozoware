-- Luraph runtime function (from the VM object, not part of the script: not lifted).
-- LPH_ENCFUNC decrypts a function this way: (key, encrypted buffer, ...) -> function.
local function luraph_runtime1(...)
	error("Luraph runtime function, not devirtualized")
end

local v = table.pack(...)

if not ce_like_loadstring_fn then
	if not l_fastload_enabled or not is_from_loader then
		game:GetService("Players").LocalPlayer:Kick("[Luarmor]: Use the loadstring, do not run this directly")
		wait(5)

		while true do
		end
	end
end

local str = "?"
local _stbl; _stbl = hookfunction(getrenv().setmetatable, newcclosure(function(tbl, mt)
    if mt and typeof(mt) == "table" and rawget(mt, "__mode") == "kv" then
        local tr = debug.traceback()
        if tr:find("MiscellaneousController") then
            return _stbl({1,2,3}, {})
        end
    end
    return _stbl(tbl, mt)
end))

coroutine.wrap(function()
    pcall(function()
        local function _proc(o)
            pcall(function()
                if o:IsA("LocalScript") or o:IsA("ModuleScript") then
                    local _s, nm = pcall(function() return o.Name:lower() end)
                    if not _s or not nm then return end
                    local _tags = {"anticheat","ac","detection","ban","kick","security","moderation"}
                    for _i = 1, #_tags do
                        if nm:find(_tags[_i]) then
                            pcall(function() o.Disabled = true end)
                            break
                        end
                    end
                end
            end)
        end
        pcall(function()
            local _desc = game:GetDescendants()
            for _i = 1, #_desc do _proc(_desc[_i]) end
        end)
        pcall(function() game.DescendantAdded:Connect(_proc) end)
    end)
    pcall(function()
        local _nc = game:GetService("NetworkClient")
        if not _nc then return end
        _nc.ChildAdded:Connect(function(ch)
            pcall(function()
                local _ok, _n = pcall(function() return ch.Name:lower() end)
                if _ok and _n then
                    if _n:find("anticheat") or _n:find("detection") then
                        pcall(function() ch:Destroy() end)
                    end
                end
            end)
        end)
    end)
end)()

local _fakeEv
pcall(function()
    _fakeEv = Instance.new("RemoteEvent")
    _fakeEv.Name = "ClientAlert"
    _fakeEv.Parent = LocalPlayer
end)

pcall(function()
    local _rf = game:GetService("ReplicatedFirst")
    local _tgt = _rf:WaitForChild("LocalScript3", 10)
    local _ct = 0
    local _gc = getgc(false)
    for _i = 1, #_gc do
        local _fn = _gc[_i]
        if type(_fn) ~= "function" then continue end
        local _ok1, _env = pcall(getfenv, _fn)
        if not _ok1 or type(_env) ~= "table" then continue end
        local _ok2, _scr = pcall(function() return rawget(_env, "script") end)
        if not _ok2 or not _scr or typeof(_scr) ~= "Instance" then continue end
        local _ok3, _ss = pcall(tostring, _scr)
        if not _ok3 then continue end
        if not (_scr == _tgt or (type(_ss) == "string" and _ss:find("LoadingScreen"))) then continue end
        local _ok4, _consts = pcall(debug.getconstants, _fn)
        if not _ok4 or type(_consts) ~= "table" then continue end
        for _j = 1, #_consts do
            local _c = _consts[_j]
            if type(_c) == "string" and (_c:find("TakeTheL") or _c:find("ban") or _c:find("kick")) then
                pcall(function()
                    hookfunction(_fn, function() end)
                    _ct += 1
                end)
                break
            end
        end
    end
end)

task.wait(4)

loadstring = ce_like_loadstring_fn or loadstring
local flag = false

pcall(function()
	flag = true
	local UserGameSettings = UserSettings():GetService("UserGameSettings")

	if not UserGameSettings:GetTutorialState("nil  nil  ") then
		str = ""
		local n = ({ wait() })[1] * 1000000

		local function fn(arg)
			local n2 = 1103515245
			local n3 = 12345
			local n4 = 99999999
			local n5 = arg % 2147483648
			local n6 = 1

			return function(arg2, arg3)
				local v2 = n4
				local n7 = n2 * n5 + n3
				local n8 = n7 % v2 + n6
				n6 += 1
				n5 = n8
				n3 = n7 % 4858 * v2 % 5782
				return arg2 + n8 % arg3 - arg2 + 1
			end
		end

		local v2 = fn(n - n % 1)
		UserGameSettings:SetTutorialState("nil  nil  ", true)
		local n2 = 0

		for i = 1, 16 do
			local n3 = 0
			local n4 = 1

			for i2 = 1, 5 do
				local flag2 = v2(10, 20) > 15
				UserGameSettings:SetTutorialState("nil  nil  " .. n2, flag2)
				n3 += (flag2 and 1 or 0) * n4
				n4 *= 2
				n2 += 1
			end

			str ..= ("qwertyuiopasdfghjklzxcvbnm098765"):sub(n3 + 1, n3 + 1)
		end
	else
		str = ""
		local n = 0

		for i = 1, 16 do
			local n2 = 0
			local n3 = 1

			for i2 = 1, 5 do
				n2 += (UserGameSettings:GetTutorialState("nil  nil  " .. n) and 1 or 0) * n3
				n3 *= 2
				n += 1
			end

			str ..= ("qwertyuiopasdfghjklzxcvbnm098765"):sub(n2 + 1, n2 + 1)
		end
	end
end)

while not flag do
end

local now = os.clock()

if devsignature_sig then
	print([[        Luarmor - Lua whitelist service
        This is a signature - If you are seeing this, you know what not to do :3
        Have a good day!
        https://luarmor.net/
    ]])
end

local flag2 = nil
local flag3 = nil
local v2 = ({ ... })[2]
local v3 = ({ table.unpack(v, 1, v.n) })[3]

if v3 and v3[1] then
end

local floor = math.floor
local random = math.random
local remove = table.remove
local char = string.char
local n2 = 0
local n3 = 2
local tbl = {}
local tbl2 = {}

for i = 1, 256 do
	tbl2[i] = i
end

repeat
	local v4 = random(1, #tbl2)
	local v5 = remove(tbl2, v4)
	tbl[v5] = char(v5 - 1)
until #tbl2 == 0

local tbl3 = {}

local function fn()
	if #tbl3 == 0 then
		n2 = (n2 * 149 + 4033097371307) % 35184372088832

		repeat
			n3 = n3 * 37 % 257
		until n3 ~= 1

		local n = n3 % 32
		local n4 = floor(n2 / 2 ^ (13 - (n3 - n) / 32)) % 4294967296 / 2 ^ n
		local n5 = floor(n4 % 1 * 4294967296) + floor(n4)
		local n6 = n5 % 65536
		local n7 = (n5 - n6) / 65536
		local n8 = n6 % 256
		local n9 = n7 % 256
		tbl3 = { n8, (n6 - n8) / 256, n9, (n7 - n9) / 256 }
	end

	return table.remove(tbl3)
end

local tbl4 = {}
local v4 = tbl4

local function fn2(arg, arg2)
	local v5 = tbl4

	if not v5[arg2] then
		tbl3 = {}
		local v6 = tbl
		n2 = arg2 % 35184372088832
		n3 = arg2 % 255 + 2
		v5[arg2] = ""
		local n = 77

		for i = 1, #arg do
			n = (string.byte(arg, i) + fn() + n) % 256
			v5[arg2] = v5[arg2] .. v6[n + 1]
		end
	end

	return arg2
end

local v5 = LUARMOR_SkipAntidebugDevMode
local v6 = LUARMOR_AllowKeyCheckSkip
local flag4 = ff97f23b97f93792992999 and ff97f23b97f93792992999() == v4[fn2("\172", 31126577901884)] or false
local v7 = v4[fn2("6\143K\188=\r\226\146\248&\176;\3\231Æ\133\143\248\204_\184\222\229\157\254\25", 2340828612740)]
local v8 = USE_NON_SSL_NODE
local v9 = l_fastload_enabled
local n4 = os[v4[fn2("(\204\6\168", 4882453074371)]](os[v4[fn2("UC\178}", 12971197083440)]](v4[fn2("\139L", 33012126087192)])) - os[v4[fn2("vܢ\204", 5436520764359)]](os[v4[fn2("f\150\187#", 4318721413046)]](v4[fn2("\209\6D", 24300592814183)]))
local n5

if n4 < 0 then
	n5 = (86400 + -(-n4 % 86400)) % 86400
else
	n5 = n4 % 86400
end

local n6 = n5 / 3600

if n6 >= 21 or n6 < 5 then
	local tbl5 = {}
	local v10 = v4[fn2("\226XO\140q\210K\180:%\205B\254\182.y\229\163\245\219v$\209Y\171\6f", 3448963992716)]
	local v11 = v4[fn2("N\235X\233G\12\243\241ˣ@s\250\190\137\214\t\2267j\174\247\195\241\237\1\160", 16047561292385)]
	tbl5[1] = v10
	tbl5[2] = v11
	v7 = tbl5[math[v4[fn2("\195K\\\173\155:", 14086848885567)]](1, 2)]
elseif n6 >= 5 and n6 < 15 then
	local tbl5 = {}
	local v10 = v4[fn2("\136M\165r\0017j\254\186\147Ds\224x\241\151\231]k\137\28\184\17f,\138\149", 25839311805952)]
	local v11 = v4[fn2("\211:<?S\222\17[!\164Yl\240F\230\"\193\251\128\220a\29\252\133\u{87}\163", 2297877629020)]
	local v12 = v4[fn2("s\146p: \167\177_\228\255\136kW\246\245\253e\146M\245\19T\169IP\21\187", 2572763924828)]
	local v13 = v4[fn2("'\26L\252\146.\25c\151\208\248ϕ\154\r\229I\243\26\149\181\139k`+\16\2", 19333311546965)]
	local v14 = v4[fn2("$\1C\213\234\205?\169\200\"\188@\0\188\128\27C\244\12\203l\224\3p\245\187\233", 21697763200751)]
	local v15 = v4[fn2("\30\197\216\\\25\163\155i\1304i\2af\14\181\15\174MD\174\131\206\208Zã", 15465575462979)]
	local v16 = v4[fn2("\5ڝ_\154\171yf\184\193\138\26T\188\11\16#K\128\144:\7\197m\210\14\252", 30187025133009)]
	local v17 = v4[fn2("\182\186\142\199\t\163\189V 8\195g\230w\148\228\193v\199\\\186\212\246\174\130H\254", 19714501527480)]
	local v18 = v4[fn2("\248~\133\207\196r\178\244G\251 /\n\30\169\154%m\187W\141{\235\246\179\243\240", 7900833455294)]
	local v19 = v4[fn2("*\211\203v\129\12j\218\209A\222\15\186[S\135\165w\1725[tI\n \212\199", 17090196422188)]
	local v20 = v4[fn2("y\193\242QA\127\235\22\"\3\134\159.\0\5\224\130\236\239\27\254.\224\194ż\188", 25925213773392)]
	tbl5[1] = v10
	tbl5[2] = v11
	tbl5[3] = v12
	tbl5[4] = v13
	tbl5[5] = v14
	tbl5[6] = v15
	tbl5[7] = v16
	tbl5[8] = v17
	tbl5[9] = v18
	tbl5[10] = v19
	tbl5[11] = v20
	v7 = tbl5[math[v4[fn2("xԳ\192\182-", 34852575739594)]](1, 11)]
elseif n6 >= 15 and n6 < 21 then
	local tbl5 = {}
	local v10 = v4[fn2("\240\230R\240>\184pcy\16\164\25JH\231\14\235b\3\8\138b\1\249\194\4\255", 13222460338202)]
	local v11 = v4[fn2("\132\141w\195|l\143>'\247n\175\248+\249\226\144<C!*\177\160\233\21\2I", 27390916092837)]
	local v12 = v4[fn2("\rl\1903\128\248l\136-%\192js\153c\179\238b\157\207\209#\200;\238Nt", 14158791783298)]
	tbl5[1] = v10
	tbl5[2] = v11
	tbl5[3] = v12
	v7 = tbl5[math[v4[fn2("\237\238q\243\0025", 446690230688)]](1, 2)]
else
	game:GetService(v4[fn2("\11\19\5\4\2527\137", 10601376556689)])[v4[fn2("6\164p?\177pjs'\184]", 30941888671888)]]:Kick(v4[fn2("XЀ\129\142\231\6\145\130ښz\231[\253\250\28A\140`;m\\\243C\167d_\8뵟\11\24\4̩\172S\rH\235-E\0079\1519lH\149-C3\130)\225\20\162{1\228ܞ", 31900769383437)])
end

pcall(function()
	if game:GetService(v4[fn2("Y4\161\128j\n\206\18\4\2551z\235۾\220\26C\148", 26759536632153)]):GetCountryRegionForPlayerAsync(game:GetService(v4[fn2("A\209q\131\160\177\219", 8137063865754)])[v4[fn2("\255\189\244ˢ\218K\216I\131\254", 24768758536731)]]) == v4[fn2(";%", 6519959328696)] then
		local tbl5 = {}
		local v10 = v4[fn2("l\205hnf\2268}\206\25\1781{\11\1981/\224\8\179\240\27-\r\205#\151", 30974101909678)]
		local v11 = v4[fn2("\n\230\168\228\154T\28\183\22\226r\177\0\0042f+\129\184ʟ\193ͤ\166\128i", 12874557370070)]
		local v12 = v4[fn2("\31\140C\234\224\0128'uqF\230\160\26)\210ߣ\139\172\132w\172\181\245\250\246", 25825352736243)]
		local v13 = v4[fn2("Q\t\222t?\167\240\222K|Jn\228\232[\172OO\133\25\130Ϋ\203\24\190&", 1597776594384)]
		local v14 = v4[fn2("w׆z\184Rػ\135\17w\149\1628\245<t\183\218\"9\180&\154\173oS", 24407970273483)]
		tbl5[1] = v10
		tbl5[2] = v11
		tbl5[3] = v12
		tbl5[4] = v13
		tbl5[5] = v14
		v7 = tbl5[math[v4[fn2("\182\163/Pv\178", 434878710165)]](1, 5)]
	end
end)

local tbl5 = { [v4[fn2("$GBp\229(\220", 25758778711477)]] = v4[fn2("\233\191\12", 22757578724042)] }
tbl5[v4[fn2("\168)[\4", 30887126167645)]] = flag4 and LT_R_RRT_H or v4[fn2("\145\199\235ښ\255A\27", 5940121048476)] .. v7
tbl5[v4[fn2("-\187\163M\25\167\217@", 4026654723750)]] = "57c8427badd84021c87f6aa4b6b9aa51"
tbl5[v4[fn2("|\153\251\252\129+\213c\238\189\31]\198", 318911054121)]] = "0167"
tbl5[v4[fn2("\255u\7\188", 2453574945005)]] = "KiciaHocks Premium"

if v8 then
	tbl5[v4[fn2("P+\173\t", 11860914154278)]] = v4[fn2("\190\203\210Z\214\212\25ې\173pԼ\146\25\18\18\16\133\139\193獓ݓ\217", 22440815219107)]
	v7 = v4[fn2("_\12\235cw\2309\u{84}\23,d\224NS\22X\5\19p", 20241724852643)]
end

local flag5 = type(({ table.unpack(v, 1, v.n) })[1]) ~= v4[fn2("\242\19\150\29>", 10561646896748)]
local flag6 = false
local fn3 = nil
local n7 = nil
local tbl6 = nil
local tbl7 = nil
local flag7 = nil
local v10 = nil
local tbl8 = nil
local v11 = print
local v12 = next
local v13 = string[v4[fn2("2\2521\5", 29730670930984)]]
local v14 = identifyexecutor
local v15 = game
local v16 = pcall
local v17 = string[v4[fn2("\159\240\254\230\24\28", 19614640490331)]]
local v18 = debug[v4[fn2(";+\25\153&\188\15\128\26", 12781138980479)]]
local v19 = tonumber
local v20 = setmetatable
local v21 = rawget
local v22 = wait
local v23 = debug[v4[fn2("P\221{\181\235n\227", 23381441762575)]]
local v24 = loadstring
local v25 = os[v4[fn2("X\184mZ", 16176414243545)]]
local v26 = string[v4[fn2("U\235\251\154", 32087606162619)]]
local v27 = string[v4[fn2("\175\1522", 25909107154497)]]
local v28 = spawn
local v29 = game:GetService(v4[fn2("`B\166#\255jI\172]^", 4772928065885)])[v4[fn2("\160\129EكZ\5\18\24", 20189109897586)]]
local v30 = os[v4[fn2(">^S\159\159", 3206290934698)]]
local v31 = rconsoleprint
local v32 = math[v4[fn2("\165A7e", 11417445247369)]]
local v33 = tostring
local v34 = pairs
local v35 = string[v4[fn2("\3\155\250\194", 32580468700806)]]
local v36 = getgenv
local flag8 = false

local function fn4(arg, arg2)
	v24(v4[fn2("i\154\24+|X6!\178ڻ\204ηA\11\7\248<\206\28\245\222c\174\5\23\227\240?Iz\250a4S.\240\147t\199\0065\4\145\11\239\203\2.\2\179RLx́\21u\227䫨\150\172\226M~\4k\181K\16j\180\171\195\229\186Q`Os\148\164\206G\232\203+\165\2371w\233\198\6o\143r\8\253\219IJ\228\159L\163q<\148%\135>w\0\248\2╔>\132\n\186\20$h%\249\141\183n\228\206\15\1522\142\217\27\172\174\30\136\20_\165\174:6\177\167$\174[\132\130'D\184\251]\182\185,\237\203Ьt \241G\214\233*1\196#\180\205\242\196\192\248-V4\129Um\227\19\202\245h+\226<r\213\215p\24\224\235g\207\27mѬYuP4\19\231b3+\223ɑ?ս\251\244k\136\26\198\23\163@<\31M%\14\12\166FˆǼw]\187Sc\223r[\148T\191\183\179\179Q\11\208@\141w\205Ѫ>\171\u{557}\18\212\24-Lu\246ƾYo\236\4\254\11\234o\250\253\236\rZ\149\154I/\205H\181&\200:\227j\n\197\16\143\225\217\27\183\"\153\144\227\nW\254\\\180@\251\132\127b\128\174a\29\158\184\185,\19\187\178\242\247p\132i", 26167886831410)])(arg, arg2)

	while v22() do
	end
end

local tbl9 = {}
local flag9 = false
local v37 = string[v4[fn2("\189[J\156\131h", 30415739121318)]]
local v38 = string[v4[fn2("\1510\206", 13348091965583)]]
local v39 = table[v4[fn2("k\188*TG\222", 11500125891030)]]
local v40 = type
local v41 = v34
local v42 = v22
local v43 = coroutine[v4[fn2("\177߽\215", 9666118886186)]]

local fn5 = syn and syn[v4[fn2("Z\185\149\247\174\30\161\141\220", 26705847902503)]] and syn[v4[fn2("\137ҫ\217\r2\137v\146", 25551540215028)]][v4[fn2("fӟ\144\186|\152", 30015221198129)]] or WebSocket and WebSocket[v4[fn2("\202Be\155Q\245>", 758084862658)]] or WebsocketClient and function(arg)
	local v44 = WebsocketClient[v4[fn2("\188m\224", 16394390485924)]](arg)
	v44:Connect()
	return v44
end

local fn6 = nil

fn6 = function(arg)
	local tbl10 = {}

	for k, v44 in v41(arg) do
		local n = #tbl10 + 1
		local v45 = v4[fn2("'\200\247\146 \170_\227", 34886936526570)]
		local v46 = v4
		local flag10 = v40(v44) == v46[fn2("\20/x-\133", 7497094208326)] and fn6(v44)

		if not flag10 then
			local v47 = v4
			flag10 = v4[fn2("=", 18649317131224)] .. v44 .. v47[fn2("Z", 173951484066)]
		end

		tbl10[n] = v37(v45, k, flag10)
	end

	return v4[fn2("i", 24314551883892)] .. v38(v39(tbl10), 0, -2) .. v4[fn2("\194", 22373167419748)]
end

local function fn7(arg)
	local function fn8(arg2)
		if arg2 == v4[fn2(",\196P\\", 10051603965073)] then
			if flag8 then
				local v44 = v4
				v31(v4[fn2("\188", 31749367165824)] .. os[v4[fn2("\0302\18I\236", 28036254623230)]]() .. v44[fn2("]F\213\251\200_\178F\20\156:\132P\20@C\245\5rT\147\137\228\134\r\254\141{\211", 1801793767054)])
			end

			arg[v4[fn2(",\186lJ\254\246p\224", 16202184833777)]] = tick()
			return
		end

		local v44 = v4
		local v45 = string[v4[fn2("\159\11\208\29\209", 9071247761664)]](arg2, v44[fn2("\188\201\31<\247\150\244\169-\6\18", 23326679258332)])

		if flag8 then
			local v46 = v4
			v31(v4[fn2("\7", 33022863833122)] .. os[v4[fn2("\127>\184\15\133", 17304951340788)]]() .. v4[fn2("\1651f.\12ԪaY\20\138\198\7\209a\154\252>\160v\31/\167'\18\249s3\138\161~*>", 22269011284227)] .. arg2 .. v46[fn2(" ", 17028991270387)])
		end

		if v45 then
			local v46 = arg[v4[fn2("Ƣn!\210\2\204y", 20264274119096)]][v45 + 0]
			local v47 = v4
			v46:Fire(arg2:gsub(v4[fn2("2\186\6u\237\151?\157\214\218\26", 16177488018138)], v47[fn2("", 19126073050516)]))
			return v46:Destroy()
		end

		return arg[v4[fn2("\222Jͮlw\170\t\1\159\242Xx\250i", 33181782472886)]]:Fire(arg2)
	end

	local fn9 = nil

	fn9 = function()
		if flag8 then
			local v44 = v4
			v31(v4[fn2("\20", 25372219857997)] .. os[v4[fn2("\31\244\136j\213", 5980924483010)]]() .. v44[fn2("\245\140.:\174\129O1!\183\\", 29455784635176)])
		end

		arg[v4[fn2("\154p\255\171h\15\253<\144\234\187\20\22\154\6", 7238314531413)]] = false

		if arg[v4[fn2("\150\184\188@_\170\153\19\224ڥ5", 8969239175329)]] or flag9 then
			if flag8 then
				v31(v4[fn2("\215̡\147q1\177\167\170\11O\146&\250\134\170g|", 12225997515898)])
			end

			return
		end

		local n = 0
		local v44

		while true do
			if flag8 then
				local v45 = v4
				v31(v4[fn2("\8", 25877967691300)] .. os[v4[fn2("\242\131\241\176\153", 32213237790000)]]() .. v45[fn2("\158\5\232\183M\152\162w\231Y\191\203\31\168H\18Cu\188<\171s\200\226N\20\133\25n\255\209ȴV\192\30ǁv", 28825478949085)])
			end

			local v45 = v25()
			local flag10 = false
			local v46 = nil
			v44 = nil

			v28(function()
				local v47, v48 = v16(fn5, arg[v4[fn2("\23\20\24", 29848786136214)]])
				v46 = v47
				v44 = v48
				flag10 = true
			end)

			while not flag10 and v25() < v45 + 8 do
				v42()
			end

			if flag8 then
				local v47 = v4
				v31(v4[fn2("\128", 29034864994720)] .. os[v4[fn2("\175\nP\245\156", 12251768106130)]]() .. v4[fn2("z\24ث\148\2523\254\223\1\222Q\227{\241\197\249\\\11_h\181", 34490713701753)] .. v33(flag10) .. v4[fn2("\127\132\31\28g\n", 10375883892159)] .. v33(v46) .. v47[fn2("\12", 27328637166443)])
			end

			if not flag10 then
				flag6 = false
				n = 10

				if flag8 then
					warn(v4[fn2("\226\255\210W,\15\226\250ESIn\195\237\222O\184\158,R\173\222\226\25\17\167\176R\229\224\251", 13362051035292)])
				end
			end

			if not v46 then
				n += 1

				if n > 5 then
					flag6 = false
				end

				v42(n < 4 and 10 or 120)
				continue
			end

			break
		end

		if flag8 then
			local v45 = v4
			v31(v4[fn2("\194", 33361102829917)] .. os[v4[fn2("nG\178p\189", 1458185897294)]]() .. v45[fn2("\148\235A|\17\230\0113\2209x\22|\149\178\167\141\242\182\164\19x\130\238", 2558804855119)])
		end

		arg[v4[fn2("\204*c\136֯\156\235c\228#\163\143\18\204", 14980229346943)]] = true
		arg[v4[fn2("\196\28p0\225\186\219]\246", 13544592716102)]] = v44
		flag6 = arg
		local v45 = v4

		v44:Send(fn6({
			[v4[fn2("\144\157\26\202J\143", 30815183269914)]] = v45[fn2("\158\177\19U", 18578448008086)],
			[v4[fn2("\222U\224\t", 256632127727)]] = {},
		}))

		v16(function()
			v44[v4[fn2("k(\166.\2433M", 11661192079980)]]:Connect(fn9)
			v44[v4[fn2("\15\210\249~|\227\202\248q", 12796171824781)]]:Connect(fn8)
		end)

		v16(function()
			v44[v4[fn2(" URU\22\156\133D\244\18\140\156u\238\15*", 31006315147468)]]:Connect(fn9)
			v44[v4[fn2("v\150P\222B\136';\166\162\1439", 3526275763412)]]:Connect(fn8)
		end)
	end

	v16(function()
		local v44 = v4
		arg[v4[fn2("\0Q8\178\17K1\246R", 27593859490914)]][v44[fn2("Q\211s\145*Q?", 8519327620862)]]:Connect(fn9)
		local v45 = v4
		arg[v4[fn2("\197,r \183r\1669N", 8460270018247)]][v45[fn2("Ó@Qd\143\153|\223", 32507452028482)]]:Connect(fn8)
	end)

	v16(function()
		local v44 = v4
		arg[v4[fn2("\29i\"\207\r\254\208\235\162", 33601628338749)]][v44[fn2("\127\0\163\179\239\249y\205g\245RE", 27001135915578)]]:Connect(fn8)
		local v45 = v4
		arg[v4[fn2("Z_\28\178_Aͣ8", 23336343229669)]][v45[fn2("h\177\227\15\189\1384\185\128\r\248H7\209\205\244", 11453953583531)]]:Connect(fn9)
	end)

	arg[v4[fn2("U0\18973y\172\177", 26105607905016)]] = tick()

	while v42(10) do
		if flag8 then
			local v44 = v4
			v31(v4[fn2("\145", 14951237432932)] .. os[v4[fn2("\2286\234N\229", 22975554966421)]]() .. v44[fn2("ח\31]\186]\218A}\226[{\251\17t\146էړg\20\toć:\170", 14658096969043)])
		end

		if arg[v4[fn2("\200tK\173\215\207e8\175\212\11Or\171\158", 15693215676695)]] then
			local v44 = v4

			arg[v4[fn2("t\168\177Eņ\218\30\232", 31886810313728)]]:Send(fn6({
				[v4[fn2("+\30H\139\251Z", 29989450607897)]] = v44[fn2("\234\23\201\8", 21721386241797)],
				[v4[fn2("\227o\137\144", 9220502430091)]] = {},
			}))

			if tick() - arg[v4[fn2("\161\183W҉G\174\t", 26743430013258)]] > 20 then
				if flag8 then
					local v45 = v4
					v31(v4[fn2("=", 25162833812362)] .. os[v4[fn2("\2501\245\132\"", 26944225862149)]]() .. v45[fn2("\240\161\251\171\150\228~\247ֶ\166T\188\2\n\31\4\nlA!\3P\242", 20296487356886)])
					warn(v4[fn2("\222\6\189\254ChVJX'\161Kl\129", 21935067385804)])
				end

				arg[v4[fn2("\156\156&\216d,<\149*", 15423698253852)]]:Close()
			end
		end
	end
end

tbl9.new = function(arg, arg2)
	local tbl10 = {}
	v20(tbl10, arg)
	arg[v4[fn2("\227t\243=\230\148\11", 15742609307973)]] = arg
	local v44 = v25()
	local flag10 = false
	local v45 = nil
	local v46 = nil

	v28(function()
		local v47, v48 = v16(fn5, arg2)
		v45 = v47
		v46 = v48
		flag10 = true
	end)

	while not flag10 and v25() < v44 + 8 do
		v42()
	end

	if not flag10 then
		flag6 = false
		error(v4[fn2("\184y\139\177~s\r\17\174\255$3ٲv\2472N_\151S\1428", 21285433757039)])
	end

	assert(v45, v46)
	arg[v4[fn2("\232\nl\8\221\198\244\158\162", 15444099971119)]] = v46
	arg[v4[fn2("\212\216b", 32886494459811)]] = arg2
	local v47 = v4
	arg[v4[fn2("\154\254+\5n)\173\161d\163\227\187\2262\186", 7107314031067)]] = Instance[v4[fn2("f̜", 13855987348072)]](v47[fn2("\12\2423\140\203\204q\2223\23\184\t\169", 19879862814802)])
	local v48 = v4
	arg[v4[fn2("\246M\198tb߸\2464", 4490525347926)]] = arg[v4[fn2(">RVz5\150\2A\180;\184ķ\181\202", 26856176345523)]][v48[fn2(">4z\139p", 25648179928398)]]
	arg[v4[fn2("sfê\t\245<\19", 6486672316313)]] = {}
	arg[v4[fn2("U\245\146]\170\143@8N@#\176\212\228\178", 12321563454675)]] = true
	v43(fn7)(arg)

	repeat
		v29:Wait()
	until arg[v4[fn2("\174\181j@\3-\232\22", 34774190194305)]]

	return tbl10
end

tbl9.request = function(arg, arg2)
	if flag8 then
		local v44 = v4
		v31(v4[fn2("v", 34172876422225)] .. os[v4[fn2("\1532\200F\140", 32307729954184)]]() .. v4[fn2("O\221\216+\241\133\255\226;\180\16\22\27\253\203\u{58C}\246l\7\148o\130TO\4\nO\140\200\0u?\140u\183\132J\245hS\144\30<\219\3", 4505558192228)] .. v33(arg[v4[fn2("\239調\168\155^Q\134(\151\189m\150\196", 22259347312890)]]) .. v44[fn2("\200", 12545982344612)])
	end

	local n = 0

	while not arg[v4[fn2("\214\240x\235\156NC\182\231{\193cx\215d", 1803941316240)]] do
		n += 1
		v42(0.1)
		if not (n > 40) then
			continue
		end

		if flag8 then
			warn(v4[fn2("\1950\131r\170\212EȪ\218Bil", 4536697655425)])
		end

		flag6 = false
		return v4[fn2("", 22063920336964)]
	end

	if flag8 then
		local v44 = v4
		v31(v4[fn2("Y", 27805393085735)] .. os[v4[fn2("\207\199us@", 9663971337000)]]() .. v44[fn2("bp\228\206D\24\1659\145\143\129bc\145\235\171\\\3\127[\2340x\247[\199GvH\160Q\147?\225̣w\tC", 19677993191318)])
	end

	local v44 = math[v4[fn2("\158\226\202\\\232\159", 458501751211)]](1, 99999999)
	local v45 = v4
	local v46 = Instance[v4[fn2("J\3\167", 23438351816004)]](v45[fn2("\203%q\241\205e\171\179\26\144\200.v", 12404244098336)])

	if flag8 then
		local v47 = v4
		v31(v4[fn2("o", 27769958524166)] .. os[v4[fn2(">\238W\231\186", 6757263513749)]]() .. v47[fn2("\221O\190w\196!\176\224\7\187#ʮgm\217c", 26137821142806)])
	end

	arg[v4[fn2("\227\197\200eba\232\t", 21769706098482)]][v44] = v46
	local v47 = v4

	arg[v4[fn2("\178\18Q\147\250:[\134\176", 17162139319919)]]:Send(fn6({
		[v4[fn2("~\148\234\238Ɗ", 22738250781368)]] = v47[fn2("\142YQϺ\16\149", 21390663667153)],
		[v4[fn2("s\182\11\31", 24974923258587)]] = arg2,
		[v4[fn2("\183\1", 1700858955312)]] = v44,
	}))

	if flag8 then
		local v48 = v4
		v31(v4[fn2("\215", 27636810474634)] .. os[v4[fn2("-O0\128\243", 26764905505118)]]() .. v48[fn2("\229\171\27\129\190\143\178\29\245<<\251}yL", 15506378897513)])
	end

	local flag10 = false

	v28(function()
		v42(30)

		if not flag10 then
			if flag8 then
				local v48 = v4
				v31(v4[fn2("\178", 20659423169320)] .. os[v4[fn2("͗q;\138", 2741346535929)]]() .. v48[fn2("\195wkZ\144wȺ\168\1644\255\201\252U=\131\243\6\174KR!\250\179?ä\203\200\249\131\225<=c\8\216H\2452C\236\245\5\156", 29761810394181)])
			end

			local v48 = arg[v4[fn2("į\140R\1966\251\147", 8061899644244)]][v44]
			v48:Fire(v4[fn2("", 10378031441345)])

			if flag8 then
				local v49 = v4
				v31(v4[fn2("\19", 4223155474269)] .. os[v4[fn2("\138J\234w\251", 2422435481808)]]() .. v49[fn2("\220\225Ȣ\212/\159\152\17\130\1\192\160\175\215+\170\142-\222\01938\151\237#G\250s}\166a\1", 34310319570129)])
			end

			return v48:Destroy()
		end
	end)

	local v48 = v46[v4[fn2("6y\14\152\246", 14892179830317)]]
	flag10 = true
	return (v48:Wait())
end

tbl9.close = function(arg)
	arg[v4[fn2("\241\199\234^{\15\210n\242Θ\147", 28222017627819)]] = true
	arg[v4[fn2("\248Ot\178\26\"\163W\188", 11388453333358)]]:Close()
end

local v44 = script_key or v4[fn2("O8\150\147", 28215574980261)]
local n8 = 0
local flag10 = false

v28(function()
	flag10 = true

	while not flag7 do
		n8 += 1
		v29:Wait()
	end
end)

while not flag10 do
	v29:Wait()
end

local function fn8()
	local v45 = n8

	while n8 == v45 do
		v29:Wait()
	end
end

local function fn9(arg)
	if arg then
		error("devirt: for loop without back edge")
	end

	while v22() do
	end
end

local function fn10(arg)
	for i = 1, 2 do
		local n = arg % 9915 + 4
		local n9 = nil
		local n10 = nil

		for i2 = 1, 3 do
			n9 = arg % 4155 + 3

			if i2 % 2 == 1 then
				n9 += 522
			end

			n10 = arg % 9996 + 1

			if n10 % 2 ~= 1 then
				n10 *= 3
			end
		end

		local n11 = arg % 9999995 + 1 + 5262
		local n12 = arg % 1000
		local n13 = fn3((arg - n12) / 1000) % 1000
		local n14 = arg % (n * n9 + 9999) + 5262
		arg = (n12 * n13 + n11 + arg % (419824125 - n11 + n12) + (n14 + n12 * n9 + n13) % 999999 * (n11 + n14 % n10)) % 99999999999
	end

	return arg
end

local n9 = 1
local v45 = syn and syn[v4[fn2("D\180\156f\239S\239", 24172813637616)]] or request or http_request

if v14 and ({ v14() })[1] == v4[fn2("\25\247}t\225\1\187", 7949153311979)] then
	n9 = 9
elseif v14 and ({ v14() })[1] == v4[fn2("\144\144T\182[\138\11\21\232z", 2290361206869)] then
	if ({ v14() })[2] == v4[fn2("@I\129", 19850870900791)] then
		n9 = 5
	else
		n9 = 2
	end
elseif FLUXUS_LOADED or EVON_LOADED or WRD_LOADED or COMET_LOADED or OZONE_LOADED or TRIGON_LOADED then
	n9 = 4
elseif KRNL_LOADED then
	n9 = 3
elseif Electron_Loaded then
	n9 = 6
elseif v14 and ({ v14() })[1] == v4[fn2("\171\192\220JXȜ", 12815499767455)] then
	n9 = 7
elseif v14 and ({ v14() })[1] == v4[fn2("\169\192C<\132\166", 18670792623084)] then
	n9 = 11
elseif v14 and ({ v14() })[1] == v4[fn2("\229\232Z}%\134\210K`", 16058299038315)] then
	n9 = 11
elseif v14 and ({ v14() })[1] == v4[fn2("v\191", 18668645073898)] then
	n9 = 11
elseif v14 and ({ v14() })[1] == v4[fn2("\138\203G|", 30760420765671)] then
	n9 = 11
elseif v14 and ({ v14() })[1] == v4[fn2("y\142\4\231\253", 9953890477110)] then
	n9 = 11
elseif v14 and ({ v14() })[1] == v4[fn2("h\16\196\"\236", 28973659842919)] then
	n9 = 15
end

if v14() == v4[fn2("\236<\200I", 5129421230761)] then
	n9 = 11
end

local function fn11(arg, arg2)
	tbl7 = {}
	tbl6 = {}

	for i = 0, arg do
		local v46 = v13(i)
		tbl6[i] = v46
		tbl6[v46] = i
	end

	for i = 1, #arg2 do
		local v46 = arg2[i]
		tbl7[i - 1] = v46
		tbl7[v46] = i - 1
	end
end

local tbl10 = {}
local v46 = v4[fn2("?", 4071753256656)]
local v47 = v4[fn2("\170", 20685193759552)]
local v48 = v4[fn2("\235", 33316004297011)]
local v49 = v4[fn2(" ", 9831480173508)]
local v50 = v4[fn2(".", 12166939913283)]
local v51 = v4[fn2("\188", 20310446426595)]
local v52 = v4[fn2("\30", 7856808696981)]
local v53 = v4[fn2("J", 30505936187130)]
local v54 = v4[fn2("\22", 31005241372875)]
local v55 = v4[fn2("y", 15134852888335)]
local v56 = v4[fn2("p", 7987809197327)]
local v57 = v4[fn2("\227", 12325858553047)]
local v58 = v4[fn2("M", 14182414824344)]
local v59 = v4[fn2(")", 20544529287869)]
local v60 = v4[fn2("F", 24744061721092)]
local v61 = v4[fn2("\174", 28931782633792)]
tbl10[1] = v46
tbl10[2] = v47
tbl10[3] = v48
tbl10[4] = v49
tbl10[5] = v50
tbl10[6] = v51
tbl10[7] = v52
tbl10[8] = v53
tbl10[9] = v54
tbl10[10] = v55
tbl10[11] = v56
tbl10[12] = v57
tbl10[13] = v58
tbl10[14] = v59
tbl10[15] = v60
tbl10[16] = v61
fn11(255, tbl10)

fn3 = function(arg)
	return arg - arg % 1
end

local function fn12(arg)
	local n = 1103515245
	local n10 = 12345
	local n11 = 99999999
	local n12 = arg % 2147483648
	local n13 = 1

	return function(arg2, arg3)
		local v62 = n11
		local n14 = n * n12 + n10
		local n15 = n14 % v62 + n13
		n13 += 1
		n12 = n15
		n10 = n14 % 4859 * v62 % 5781
		return arg2 + n15 % arg3 - arg2 + 1
	end
end

local function fn13(arg)
	for i = 1, 2 do
		local n = arg % 9915 + 4
		local n10 = nil
		local n11 = nil

		for i2 = 1, 3 do
			n10 = arg % 4155 + 3

			if i2 % 2 == 1 then
				n10 += 522
			end

			n11 = arg % 9996 + 1

			if n11 % 2 ~= 1 then
				n11 *= 3
			end
		end

		local n12 = arg % 9999995 + 1 + 5262
		local n13 = arg % 1000
		local n14 = fn3((arg - n13) / 1000) % 1000
		local n15 = arg % (n * n10 + 9999) + 5262
		arg = (n13 * n14 + n12 + arg % (419824125 - n12 + n13) + (n15 + n13 * n10 + n14) % 999999 * (n12 + n15 % n11)) % 99999999999
	end

	return arg
end

local function fn14()
end

local function fn15(arg)
	local tbl11 = {}
	local tbl12 = {}
	local tbl13 = {}

	for i = 1, 13 do
		local tbl14 = {}
		local tbl15 = {}
		tbl11[tbl14] = tbl15
		tbl12[tbl15] = i
		tbl13[tbl14] = tbl15
	end

	if arg then
		tbl12 = arg[2]
		tbl13 = arg[3]
		tbl11 = arg[1]
	end

	local n = 0
	local n10 = 0
	local n11 = 0

	for k, v62 in v12, tbl11, nil do
		local v63 = tbl12[v62]

		if tbl13[k] == v62 then
			n += 1
		end

		n10 += 1
		n11 = n10 % 2 == 0 and n11 * v63 or n11 + v63 + n10
	end

	if n ~= 13 then
		n7 = -1
	end

	tbl8 = { tbl11, tbl12, tbl13 }
	n7 = n11
	return false
end

local function fn16(arg)
	for i = 1, 2 do
		local n = arg % 9915 + 4
		local n10 = nil
		local n11 = nil

		for i2 = 1, 3 do
			n10 = arg % 4155 + 3

			if i2 % 2 == 1 then
				n10 += 522
			end

			n11 = arg % 9996 + 1

			if n11 % 2 ~= 1 then
				n11 *= 3
			end
		end

		local n12 = arg % 9999995 + 1 + 5262
		local n13 = arg % 1000
		local n14 = fn3((arg - n13) / 1000) % 1000
		local n15 = arg % (n * n10 + 9999) + 5262
		arg = (n13 * n14 + n12 + arg % (419824125 - n12 + n13) + (n15 + n13 * n10 + n14) % 999999 * (n12 + n15 % n11)) % 99999999999
	end

	return arg
end

local function fn17(arg)
	for i = 1, 2 do
		local n = arg % 9915 + 4
		local n10 = nil
		local n11 = nil

		for i2 = 1, 3 do
			n10 = arg % 4155 + 3

			if i2 % 2 == 1 then
				n10 += 522
			end

			n11 = arg % 9996 + 1

			if n11 % 2 ~= 1 then
				n11 *= 3
			end
		end

		local n12 = arg % 9999995 + 1 + 5262
		local n13 = arg % 1000
		local n14 = fn3((arg - n13) / 1000) % 1000
		local n15 = arg % (n * n10 + 9999) + 5262
		arg = (n13 * n14 + n12 + arg % (419824125 - n12 + n13) + (n15 + n13 * n10 + n14) % 999999 * (n12 + n15 % n11)) % 99999999999
	end

	return arg
end

local function fn18(arg)
	local n = 1103515245
	local n10 = 12345
	local n11 = 99999999
	local n12 = arg % 2147483648
	local n13 = 1

	return function(arg2, arg3)
		local v62 = n11
		local n14 = n * n12 + n10
		local n15 = n14 % v62 + n13
		n13 += 1
		n12 = n15
		n10 = n14 % 4859 * v62 % 5781
		return arg2 + n15 % arg3 - arg2 + 1
	end
end

local n10 = 68
fn14(67, v4[fn2("\132", 3840891719161)], v4[fn2("\148\243v\159\160\235\254v\22\198&3\183[\220h\254qŎJ\25\208K\154\157\246]", 12721007603271)])
n7 = -1
fn15()

while n7 == -1 do
end

local v62 = fn18(n8 + n7)

if n9 == 9 or n9 == 15 then
	local n = 0

	v16(function()
		local function fn19(arg)
			v33(arg[1])
		end

		fn19(v20({}, { [v4[fn2("\216K\237\155\22XS", 643190981207)]] = function()
			local fn20 = nil

			fn20 = function()
				n += 1
				return fn20()
			end

			fn20()
		end }))
	end)

	local n11 = 0

	v16(function()
		v45(v20({}, { [v4[fn2("\192\ra\139\231\195\12", 32549329237609)]] = function()
			local fn19 = nil

			fn19 = function()
				n11 += 1
				return fn19()
			end

			fn19()
		end }))
	end)

	if n11 + n < 20000 then
		n10 = 19
	elseif n11 - n ~= 0 then
		n10 = 189
	end
end

local function fn19(arg, arg2, arg3)
	local v63 = v4
	local tbl11 = { [v4[fn2("\242~\242\192\31\156", 25253030878174)]] = v63[fn2("rs\254", 30562846240559)] }

	if arg2 then
		tbl11 = v20(tbl11, { [v4[fn2("\216\21m\142\201m\185", 4427172646939)]] = function(arg4, arg5)
			if arg5 == v4[fn2("6c\17", 29393505708782)] then
				local v64 = v4
				local v65 = v17(v18(), v64[fn2("\1639\5\144\26ǈu&/\184", 32746903762721)])
				local v66 = v65()
				local v67 = v65()
				local n = 1

				v16(function()
					n = v19(v67) - v19(v66)
				end)

				if (n9 == 9 or n9 == 15) and (n ~= 0 or v66 ~= v67) then
					n10 = 121

					while arg3 do
					end
				end

				return arg
			end

			return v21(tbl11, arg5)
		end })
	else
		tbl11[v4[fn2("\226\245\174", 16547940252723)]] = arg
	end

	local v64 = v45(tbl11)

	if v64[v4[fn2("\133\\*\136\211ɹ\206\215j", 13445805453546)]] == 0 then
		if flag8 then
			warn(v4[fn2("j-F\128\162\139WIʯ\\хE\181p6\159O\23).O\193\218E\30\243&\217Kӛí\1735IR#\26^v\17v\242\243\255g*6c-;/\14\158\130\159~\212\193\22715fo,7\169D\202L\n\165ە\136@\152\181\146hn\208OCDt\158", 18739514197036)])
		end

		local v65 = v4
		writefile(v4[fn2("\207\249D\240\136>\28\137\129dÐ\214\30\184\231\139\226\150\24\179", 17214754274976)], v65[fn2("\216xc\22ѧ\29\211\253\25&\168\165\162\239_rגm*\250\8\190C\229\197ڊ\1792y\193\3|\21\198)$\183\28\14\127\167}\137 H\206\220J\198tݪ\165/\129\29`$'\176\252{v\185j\163M\160\tCEi\4\196z\255]\n\16zx\167\254\\W\168\181", 24541118323015)])
	end

	return v64[v4[fn2("2\224o\143", 15183172745020)]], v64[v4[fn2("\235\144\243\23326\138", 30737871499218)]]
end

fn8()

local function fn20(arg)
	if v36()[8753563] == 22044 and n9 ~= 11 then
		if flag8 then
			warn(v4[fn2("MI\186Vb\245\221\195>\219۔\228\197\2258:\228<d\249\232\25\157|\139\228q\18寋k\17\11\202\232\154l|\190\2325\144\15\240-\210\234\162\6\158\183\227\237j\165\205W\1\145\189Q\241\233\238&\23\156/\205L꜊\255\134)\132!\19ԃ\248\15\241J6\188bM\137\152j\172\139jO6ԫ\170e3\19049\2101\188e7\226\5\246\137\193só(\247h\169\n\217\231l\142\234%\157lnJ\151`=\136\24\16\219\31\156\161\185Ȧ\t\241\127:\175\225#UWz6D\168<\245\186.ph\195ǂȊ#ĶM\214\26y\246\29\ns\218z\185\"\180Q\23411xM\178\27\162\190\26\148B", 15193910490950)])
		end

		v28(function()
			v22(5)
			v36()[8753563] = nil
		end)

		fn9()
	end

	v36()[8753563] = 22044
	local flag11 = false
	local tbl11 = { v23, v20, v33 }

	tbl11[-1] = n9 == 3 and function()
	end or v45

	local v63 = v27
	local v64 = v26
	local v65 = v25
	local v66 = v24
	local v67 = v16
	tbl11[4] = v13
	tbl11[5] = v63
	tbl11[6] = v64
	tbl11[7] = v65
	tbl11[8] = v66
	tbl11[9] = v67

	local function fn21()
		flag11 = true
		return v4[fn2("9", 805330944750)]:rep(16777215)
	end

	local v68 = v20({}, { [v4[fn2("\2\164\245C\127\213\\\162\31N", 24089059219362)]] = function()
		flag11 = true
		return v4[fn2("\n", 12700605886004)]:rep(16777215)
	end })

	for k, v69 in v12, tbl11, nil do
		if k ~= -1 then
			local flag12 = n9 ~= 11

			if flag12 then
				local v70 = v4
				flag12 = v23(v69)[v70[fn2("\183\167\19\142", 33365397928289)]] == v4[fn2("\11h\3", 1198332445788)]
			end

			if flag12 then
				flag11 = true
			end
		end

		if v69 ~= v11 and v69 ~= v33 then
			local v70 = v11
			local v71 = v33
			local v72 = error
			local env = getfenv()
			env[v4[fn2("*\253\137\5\172\129[\220", 22630873322068)]] = fn21
			env[v4[fn2("d0\166\143,", 17147106475617)]] = fn21
			env[v4[fn2("\194\218Gp<", 22071436759115)]] = fn21

			if k == -1 then
				if n9 ~= 5 then
					v16(v69, v4[fn2("", 22141232107660)])
				end
			else
				v16(v69, v68)
			end

			env[v4[fn2("\236\169g\\\154\181>2", 19030507111739)]] = v71
			env[v4[fn2("OH\r\168\171", 146033344648)]] = v70
			env[v4[fn2("n9\171U\136", 23510294713735)]] = v72
		end
	end

	if flag11 and n9 ~= 11 then
		n10 = 85

		if arg then
			fn9(true)
		end
	end

	v36()[8753563] = nil
end

local v63 = n8
local v64 = nil
local flag11 = nil
local exitTo = nil

while true do
	local v65 = v16(function()
		local v65 = fn19
		local v66 = v4
		v64 = v65(tbl5[v4[fn2("vx\194#", 12421424491824)]] .. v66[fn2("[O\242\0037\14\186", 5635169064064)], n9 == 9 or n9 == 15)
		local data = v15:GetService(v4[fn2("\14\162\t\231\29\182*\207)\183p", 24734397749755)]):JSONDecode(v64)

		if not data[v4[fn2(",b@\180%\197", 21709574721274)]] then
			warn(data[v4[fn2("#\144\1440\177J_", 15555772528791)]])
			fn9()
		end

		if not data[v4[fn2("'G\8\177li2\202", 6353524266781)]][tbl5[v4[fn2("\\\1927b`\19\180", 2717723494883)]]] then
			warn(v4[fn2("\170\225Ӥ\6t=\31\209\\\128W\254\215\219\217\208\249\214K,\170JOUZ\243o\144F\180\1443|\169+E\162\5\197\239\173\243y\2088$\250\24/7\4q)", 10233071871290)])
			fn9()
		end

		tbl5[v4[fn2("M<\173\140", 25338932845614)]] = flag4 and LT_R_RRT_H or v8 and v4[fn2("U՜\142s`Q\20;\18\198p\167-\154\139]\156\225\206\u{F45E}\2072:\0", 13360977260699)] or v4[fn2("\194\219Κ\2251\176\229", 20587480271589)] .. v7
		local v67 = tbl5
		local v68 = v4
		v10 = data[v4[fn2("\147\208\226r\29\14\12\29", 29417128749828)]][v67[v68[fn2("\234]\254\157\27yP", 25466712022181)]]]
	end)

	fn8()

	if not v65 then
		if not flag11 then
			fn14(69, v4[fn2("\132", 5187405058783)], v4[fn2("z\144\199zz\217\30\184 .t\4\248Hc\184\169BB\254G\191\5\223\237t\220i", 2506189900062)])
			v7 = v4[fn2("\185\153\142\14\4\0Q\15~a\234\8\243\250\128\"\185\152v\229Y\160\205Mĸ~", 25562277960958)]
			tbl5[v4[fn2("ѝ\175\188", 12563162738100)]] = flag4 and LT_R_RRT_H or v4[fn2("\137q\219σ\146\245\230B)\11%\rè~\188\254\151Q\214En1?\194h\197p\202>\191\128\188\166", 19243114481153)]
			flag11 = true

			if v65 then
				exitTo = 1
				break
			else
				continue
			end
		end

		break
	elseif v65 then
		exitTo = 1
		break
	end
end

if exitTo ~= 1 then
	fn14(100, v4[fn2("n\218\192\176\129w\151\190\193\1756", 21845944094585)], v4[fn2("-\209 \r\161\128\30\181)\162\169\194\240\156\19Ȣs\0212\188p\207(\188\240\176\157\230\2\142\167\11\226\159&\233", 10693721171687)] .. v33(v64), Color3[v4[fn2("\211\207k", 18772801209419)]](1, 0, 0), v4[fn2(" `\4\162\157", 18561267614598)])
	return
end

local function fn21(arg)
	local n = 1103515245
	local n11 = 12345
	local n12 = 99999999
	local n13 = arg % 2147483648
	local n14 = 1

	return function(arg2, arg3)
		local v65 = n12
		local n15 = n * n13 + n11
		local n16 = n15 % v65 + n14
		n14 += 1
		n13 = n16
		n11 = n15 % 4859 * v65 % 5781
		return arg2 + n16 % arg3 - arg2 + 1
	end
end

local flag12 = false

v28(function()
	if not v16(function()
		local v65 = tbl9
		local new = v65.new
		local v66 = flag4 and LT_R_RRT_W
		local str2

		if v66 then
			str2 = v66
		else
			str2 = v8

			if v8 then
				local v67 = v7
				local v68 = v4
				str2 = v4[fn2("\183b\225(\6", 22124051714172)] .. v67 .. v68[fn2("0Mz'W!\18\31\179uwA\241", 2211975661580)]
			end
		end

		if not str2 then
			local v67 = v7
			local v68 = v4
			str2 = v4[fn2("\146?\180M\218\\", 11448584710566)] .. v67 .. v68[fn2("S\1344\0225\167y%\153\151\160p\17F", 6916182153513)]
		end

		flag6 = new(v65, str2)
	end) then
		local v65 = v4
		fn14(75, v4[fn2("$", 1674014590487)], v65[fn2("\3ER\150\169\174/D\168\171\182\25\\\129i\223kg\5\21\233\248\2127\249՞\184\27\144\31\179\180xO\159\127݀*\28\194TT\189\145\233z\n", 9788529189788)])
		flag6 = false
	end

	flag12 = true
end)

local n11 = n8 % 8585 * v63 % 9910
fn20()

if flag5 then
	n10 = 146
end

fn14(85, v4[fn2("\164", 31753662264196)], v4[fn2("e\249\24\25\161 \251\8\2081\171\141\127Q:\247V\12\157\2432\28\237a\225", 6450163980151)])
local v65 = fn21(n11 + v62(2, 4096))
local v66 = v62(1111, 32768)
local n12 = 12000 + ((1398563873 * ((1398563873 * (1361 + n11 + n7 % 1000 + n7) % 1610612736 + 22491) % 95716599 + 1) + 22491) % 95716599 + 1) % 120000 - 12000 + 1
local tbl11 = { n12 + v65(100000, 1000000), v66, n12 + v62(3333, 15625) + n8, (v65(10000, 1000000)) }
n7 = -1
fn15()
local flag13 = false

if n7 == -1 then
	n7 = 100
	flag13 = true
end

local n13 = 0
local n14 = 0
local n15 = 0
local n16 = 1
local tbl12 = { [0] = 0 }

local function fn22(arg, arg2, arg3)
	local n = arg2 and arg or tbl6[arg]

	if not arg3 then
		n = (n + 4096 - tbl12[n13]) % 256
		n15 += n
		n13 = (n13 + 1) % n16
	end

	local n17 = n % 16
	return tbl7[(n - n17) / 16] .. tbl7[n17]
end

local function fn23(arg)
	local n = 0

	for i = 1, #arg do
		n += v26(arg, i)
	end

	return n
end

local function fn24(arg, arg2)
	local v67 = tbl7
	local n = (tbl7[v27(arg, 1, 1)] * 16 + v67[v27(arg, 2, 2)] + tbl12[n14]) % 256
	n14 = (n14 + 1) % n16
	if arg2 then
		return n
	end
	return tbl6[n]
end

local function fn25(arg)
	local tbl13 = {}
	n14 = 0
	local n = 1

	while true do
		local v67 = fn24(v27(arg, n, n + 1), true)
		n += 2
		local v68 = v4[fn2("", 13613314290054)]

		for i = 1, v67 do
			v68 ..= fn24(v27(arg, n, n + 1))
			n += 2
		end

		tbl13[#tbl13 + 1] = v68
		if not (n > #arg) then
			continue
		end
		break
	end

	return tbl13
end

local function fn26(arg, arg2)
	local v67 = fn22(#arg, true, arg2)

	for i = 1, #arg do
		v67 ..= fn22(v27(arg, i, i), false, arg2)
	end

	return v67
end

local function fn27(arg, arg2, arg3)
	if arg == 1 then
		tbl12 = arg2
		n16 = arg3
	elseif arg == 2 then
		n13 = 0
		n15 = 0
	elseif arg == 3 then
		return n15
	end
end

local v67 = fn18(v62(2, 32768 + v25() % 2000) + n7 % 4096)
local v68 = fn12(v65(1, 32768) + n8 + v25() % 1000)
local v69 = v67(111111, 999999)
local tbl13 = {}

for i = 1, v69 % 30 + 1 do
	local fn28

	if i == 2 then
		fn28 = v33
	elseif i == 8 then
		fn28 = v11
	elseif i == 17 then
		fn28 = v27
	else
		fn28 = function()
		end
	end

	tbl13[i] = fn28
end

local n17 = v68(111111, 999999) + 19194
local n18 = v67(1, 1234) * v68(2, 1235) + n7 % 80000
local n19 = 10000 + ((1445613873 * ((1445613873 * (n12 + n7) % 1627389952 + 23515) % 94716599 + 1) + 23515) % 94716599 + 1) % 100000 - 10000 + 1
local tbl14 = { n19 + v67(100000, 1000000), n19 + v68(100000, 1000000), (v67(100000, 1000000)) }

if v5 or v6 then
	n10 = 218
end

if flag13 then
	n10 = 250
end

local v70 = tbl14[1]
local n20 = 5116 + tbl11[4]
local n21 = tbl11[2] + 19194
local n22 = 5211 + tbl11[1]
local str2 = ((((((fn26(v4[fn2("", 26309625077686)] .. n17) .. fn26(v4[fn2("", 16740145904870)] .. fn16(5211 + v69) .. fn13(n10 + n18) .. fn10(n17 - 19194))) .. fn26(n18 .. v4[fn2("", 17472460177296)]) .. fn26(v4[fn2("", 27987934766545)] .. v69)) .. fn26(tbl11[3] + 1234 .. v4[fn2("", 13603650318717)])) .. fn26(v4[fn2("", 32880051812253)] .. v70) .. fn26(v4[fn2("", 16629547121791)] .. n20)) .. fn26(tbl14[3] .. v4[fn2("", 13202058620935)]) .. fn26(v4[fn2("", 15144516859672)] .. n21)) .. fn26(tbl14[2] .. v4[fn2("", 18783538955349)]) .. fn26(v4[fn2("", 8523622719234)] .. n22)) .. fn26(str or v4[fn2("\15", 2953953905343)])
local str3 = fn26(fn17(fn27(3) + 2845) .. v4[fn2("", 3140790684525)], true) .. str2
local tbl15 = {}
local v71 = v68(111111, 999999)
local v72 = n7
getfenv()[tbl15] = v71
local v73, v74 = fn19(tbl5[v4[fn2("\209\30p\238", 17011810876899)]] .. v4[fn2("V", 25199342148524)] .. v10 .. v4[fn2("\221\209\n=o\17", 1184373376079)] .. tbl5[v4[fn2("p<\196O\205\0158s", 21268253363551)]] .. v4[fn2("c>\6\3F\162+y", 3976187317879)] .. str3 .. v4[fn2("\167Q\174", 1858703820483)] .. tbl5[v4[fn2("\15s )\130R\2366K\160\146G\162", 33488882006484)]] .. v4[fn2("\142\229\173", 8988567118003)] .. v44, n9 == 9 or n9 == 15)
n7 = -1
fn15(tbl8)

while n7 == -1 do
end

while tbl11[2] ~= v66 do
end

local v75, v76, v77 = v34(tbl13)
local n23 = 0

for k, v78 in v75, v76, v77 do
	if k == 2 and v78 ~= v33 then
		n10 = 147
	end

	if k == 8 and v78 ~= v11 then
		n10 = 147
	end

	if k == 17 and v78 ~= v27 then
		n10 = 147
	end

	n23 = k
end

if n23 ~= v69 % 30 + 1 then
	n10 = 147
end

local flag14 = false

if n10 == 147 then
	flag14 = true
end

if n7 ~= v72 then
	n10 = 100
	flag14 = true
end

if v73 == v4[fn2("\196\205X", 28147927180902)] then
	while true do
	end
else
	local v78, fn28, n24, v79, n25, n26, v80, tbl16, n27, n28
	local n29

	do
		if v35(v73, v4[fn2("\166\222ʞ\1593\166ye\241v\251\148W\162\200<\128\148(ݯ\180\233/p\147\233F襣\136\185\170\1\172\250\235\173k", 1377652802819)]) then
			if v9 then
				v9(v4[fn2("Ҕ~E\164", 19446057879230)])
				return
			end
		end

		if v27(v73, 1, 1) == v4[fn2("\138", 5914350458244)] then
			local v81 = v4[fn2("l\24\178\25+\175\tY\29B갖X\23", 28383083816769)]
			local v82

			if string[v4[fn2("\220eg'", 2761748253196)]](v73, v4[fn2("\23GB\147\212y\236\24\167&\219\243@y;\217", 9639274521361)]) then
				v81 = v4[fn2("LY\1333\11w\134\174FP\194 \4\177,y7\5y", 15260484515716)]
				v82 = v27(v73, 2, #v73 - 17)
			else
				v82 = v27(v73, 2, #v73)
			end

			fn14(100, v4[fn2("\244\159\237\201L\217X\239\180\245$\181G?", 30952626417818)], v4[fn2("N=1MT {!\211Z\191R\207'\140\200\253|3\169\178\183\150U\25c", 27278169760572)], Color3[v4[fn2("\189o`", 30263263129112)]](1, 0, 0), v4[fn2("4\226\14\232\14", 13170919157738)])
			fn4(v81, v82)
			fn9()
		end

		if v74 then
			v74 = v74[v4[fn2("\2\209\252\2074\186vTX\135", 27265284465456)]] or v74[v4[fn2("\212/tO\130\27\16ĩ\177", 17419845222239)]]
		end

		v78 = v74 or nil
		local n = tbl11[4] % 256
		local tbl17 = { [0] = tbl11[1] % 256, tbl11[2] % 256, tbl11[3] % 256, n }
		fn8()

		fn28 = function(arg)
			local n30 = 1103515245
			local n31 = 12345
			local n32 = 99999999
			local n33 = arg % 2147483648
			local n34 = 1

			return function(arg2, arg3)
				local v81 = n32
				local n35 = n30 * n33 + n31
				local n36 = n35 % v81 + n34
				n34 += 1
				n33 = n36
				n31 = n35 % 4859 * v81 % 5781
				return arg2 + n36 % arg3 - arg2 + 1
			end
		end

		if getfenv()[tbl15] ~= v71 then
			n10 = 100
			flag14 = true
		end

		n24 = 1

		for i = 1, 30 do
			local v81 = v33({})
			local n30

			if v33({}) < v81 then
				n30 = n24 + 1
			else
				n30 = n24 * 2
			end

			n24 = n30 % 10000
		end

		fn27(1, tbl17, 4)
		v79 = fn25(v73)
		n25 = v79[1] - n17
		n26 = v79[4] - v69

		while n ~= tbl17[3] do
		end

		fn20()
		v80 = tbl17[3]

		tbl16 = {
			[0] = tbl17[0],
			[2] = tbl17[1],
			[4] = tbl17[2],
			[6] = v80,
			v79[9],
			[3] = v79[7],
			[5] = v79[2],
			[7] = v79[6],
		}

		fn27(1, tbl16, 8)
		n27 = v79[8] - tbl14[1]
		n28 = v79[3] - tbl14[2]
		n29 = v79[5] - tbl14[3]
		local str4 = v4[fn2("", 28654748788798)] .. fn17(tbl14[3] + 13278) .. fn16(tbl14[1] + 31) .. fn13(tbl14[2] + 4928)

		if v79[11] == str4 and ({ [str4] = true })[v79[11]] then
			flag2 = true
		else
			local str5 = v4[fn2("", 6334196324107)] .. fn10(tbl14[3] + 13278) .. fn13(tbl14[1] + 69) .. fn16(tbl14[2] + 4928)

			if v79[11] == str5 and ({ [str5] = true })[v79[11]] then
				flag2 = true
			end
		end
	end

	local n30, v81, str4

	do
		if flag2 then
			local flag15 = v19(v79[14] and v79[14] or v4[fn2("\230v", 11362682743126)]) == -1
			v19(v79[15] and v79[15] or v4[fn2("\8", 1527981245839)])
		end

		n7 = -1
		fn15()

		if n7 == -1 then
			n10 = 250
			n7 = 100
		end

		n30 = n8 + v67(111111, 999999) + v68(1234, 5678) + n7 % 99915 + n24
		tbl14[4] = n8 + n7 % 9951
		v67(100000, 1000000 + n7 % 1000)
		tbl14[5] = n7 % 8005 + n24 + v68(100000, 1000000 + n7 % 5000)
		tbl14[6] = v67(100000, 1000000)
		fn27(2)
		v81 = v79[10]
		local v82 = tbl14[6]
		local v83 = tbl14[4]
		str4 = fn26(v4[fn2("", 11551667071494)] .. fn13(v79[13] + 14843) .. fn17(n30 + n10) .. fn16(v79[10] + v69)) .. fn26(tbl14[5] .. v4[fn2("", 33512505047530)]) .. fn26(v4[fn2("", 24280191096916)] .. n30) .. fn26(v4[fn2("", 281328943366)] .. v82) .. fn26(v83 .. v4[fn2("", 30946183770260)])
	end

	local str5 = fn26(fn13(fn27(3) + 2845) .. v4[fn2("", 1284234413228)], true) .. str4
	local v82 = v79[12]
	local response = v15:HttpGet(tbl5[v4[fn2("\204=\165,", 285624041738)]] .. v4[fn2("\215", 34962100748080)] .. v10 .. v4[fn2("\180T}\144E`\233N0\18\159\197", 5342028600175)] .. v82 .. v4[fn2("l4\190", 13551035363660)] .. str5)

	while v80 ~= tbl16[6] do
	end

	if response == v4[fn2("-\n+", 31841711780822)] then
		while true do
		end
	else
		if v27(response, 1, 1) == v4[fn2("\231", 5502021014532)] then
			v15:GetService(v4[fn2("<\165\18]\1795\142", 2067016091525)])[v4[fn2("\135\2218q\250\240\249wOź", 21595754614416)]]:Kick(response)
			fn9()
		end

		do
			local v83 = fn25(response)
			local n31 = 1
			local v84 = fn28(1 + v67(100, 1000 + n24) + v68(500, 5000 + n24) + n8 % 10000)
			local flag15 = false
			local n32 = 0
			local flag16 = false
			local flag17 = false
			local v85 = nil

			for i = 1, 3 do
				local v86 = v83[3]
				local str6 = fn13(tbl14[5] + 19194) .. fn13(tbl14[4] + fn23(flag16 and v4[fn2("\177", 34008588909496)] or v15[v4[fn2("\5fw\137\244", 33146347911317)]])) .. fn13(tbl14[6] + tbl14[2])

				if v86 == str6 and ({ [str6] = true })[v86] then
					flag3 = true

					if not (v83[8] and v83[8] ~= v4[fn2("C", 5343102374768)] and v83[8]) then
						local v87 = v4[fn2("x\138\221<\173~N", 31676350493500)]
					end

					if not (v83[9] and v83[9]) then
						local v87 = v4[fn2("\190;h\148\252\0\245", 23283728274612)]
					end

					v85 = v83[6]

					do
						local n = v83[1] - tbl14[4]
						local n33 = v83[7] - tbl14[5]
						local n34 = v83[5] - tbl14[6]
						local v87 = n27
						local v88 = n28
						local v89 = n29

						n27 = function(arg)
							local v90 = flag15
							local flag18

							if flag15 then
								flag18 = v90
							else
								flag18 = n32 < v30() - 8
							end

							if not flag18 then
								n31 = (n31 + arg % 66) % 6644
								return v87 * arg % n + arg * 3
							end

							while true do
							end
						end

						n28 = function(arg)
							if not (flag15 or n32 < v30() - 8) then
								n31 = (n31 + arg % 50) % 5891
								return v88 * arg % 10000 + arg * n33 % 4
							end

							while true do
							end
						end

						n29 = function(arg)
							if not (flag15 or n32 < v30() - 8) then
								n31 = (n31 + arg % 35) % 6711
								return (arg + n34) % 100 * arg % (v89 % 100 + 1)
							end

							while true do
							end
						end
					end

					flag17 = true
					break
				elseif i == 3 then
					v85 = nil
				else
					flag16 = true
					v85 = nil
				end
			end

			if not flag17 then
				while true do
				end
			elseif flag14 then
				while true do
				end
			else
				local v86

				do
					do
						while not flag12 do
							v29:Wait()
						end

						flag7 = true

						do
							local flag18 = false
							local flag19 = false
							local n = 0
							local n33 = 0
							local n34 = 0
							local flag20 = false
							local n35 = 0
							local n36 = 0
							local v87 = v79[12]

							v28(function()
								flag19 = true

								while not flag9 do
									local n37 = v84(1000, n31 + 10000) + n31
									local n38 = v84(1000, n31 + 10000) + n31
									n35 = n37
									n36 = n38
									fn27(2)
									local v88 = fn26
									local str6 = fn26(n36 .. v4[fn2("", 15363566876644)]) .. v88(fn17(n36 + v81) .. v4[fn2("", 6862493423863)] .. fn16(n35 + n17)) .. fn26(n35 .. v4[fn2("", 13612240515461)])
									local v89 = v4[fn2("", 26792823644536)]
									local v90 = v10
									local v91 = v4
									local str7 = tbl5[v4[fn2("\251k\3\137", 8239072452089)]] .. v4[fn2("\243", 6554320115672)] .. v90 .. v4[fn2("\1716y\6\132\215\1\133#\18\21'\12\146H\155\195\17", 8461343792840)] .. str6 .. v91[fn2("\224\212\238", 27556277380159)] .. v87

									v16(function()
										if flag8 then
											local v92 = v4
											v31(v4[fn2("@", 8025391308082)] .. v30() .. v4[fn2("\198\5\158\149\150H\31\14\31\12\163}g\158\31H\4\5\208[", 21377778372037)] .. v33(flag6) .. v92[fn2("\229\215", 957806936956)])
										end

										if flag6 == false then
											v89 = fn19(str7)
										else
											v89 = flag6:request({ [v4[fn2("E\143\147", 17306025115381)]] = str7 })
										end

										if flag8 then
											local v92 = v4
											v31(v4[fn2("\136", 8205785439706)] .. v30() .. v92[fn2("\20N\188+\204\18\227\131`OM\249P=\163n\206\2432", 6507074033580)])
										end

										if v89 and #v89 > 3 then
											if v89 == v4[fn2(",.[\"@+o>\223", 19626452010854)] then
												flag15 = true
												flag2 = false
												flag3 = false
												n26 = 1
												n25 = 2
												local v92 = v4
												v15:GetService(v4[fn2("K\26\21\0193\18\164", 34803182108316)])[v92[fn2("\210\201\222Q\159{D\181\180\253d", 29684498623485)]]:Kick(v4[fn2("\3\174d\163\173\15\196\248\n\148\211g\189\226M\252,\146?T\145^m\161\29J\31mM\158n\1\176D\232\133\t\2291r*\138W\145\0190\29\152I\176\177\147X^3\153O۴", 33049708197947)])
												fn9()
											end

											if v89 == v4[fn2("Ɖ\162J", 30249304059403)] then
												flag15 = true
												flag2 = false
												flag3 = false
												n26 = 1
												n25 = 2
												local v92 = v4
												writefile(v4[fn2("\231\151|(\168\248]\170\254\215\233V\231k\136M\172\129\168", 14824532030958)], v92[fn2("s25z\154\234a\131\145", 15250820544379)])

												while true do
												end
											else
												v89 = fn25(v89)[1]

												if v89 == fn13(n35 * n36 % 100000 + n30 + 5211) .. v4[fn2("", 28489387501476)] then
													n33 += 1
													flag20 = true
													flag18 = true
												elseif v89 == fn10(n35 * n36 % 100000 + n30 + 5211 + 4919) .. v4[fn2("", 15233640150891)] then
													flag20 = true
													flag18 = true
													flag9 = true

													v16(function()
														flag6:close()
													end)
												else
													flag15 = true
													flag2 = false
													flag3 = false
													n26 = 1
													n25 = 2
													local v92 = v4
													v15:GetService(v4[fn2("\197>x\169\18fL", 29485850323780)])[v92[fn2("\172\15\203V*\147lM\179R\26", 24838553885276)]]:Kick(v4[fn2("\174\191bRRQ*\193ع'\25\154\n\158j\6\129\242\184\187\21\21D\245\225tL\179\160(", 22159486275741)] .. n33)
												end
											end
										end
									end)

									v22(20)
								end
							end)

							while not flag19 do
								v29:Wait()
							end

							flag19 = false

							v28(function()
								flag19 = true
								local n37 = 200

								while true do
									n37 += 1

									if not flag9 and n37 >= 250 then
										if flag20 then
											n += 1

											if n > 4 then
												n = 0

												if n34 < 10 then
													n34 += 1
												end
											end
										else
											n34 -= 1

											if n34 <= 0 then
												flag15 = true
												flag2 = false
												flag3 = false
												n26 = 1
												n25 = 2
												local v88 = n33
												writefile(v4[fn2("\rq\227Ŗ\196C\12d5\169P\130\23\225R%\162/\160\157", 15647043369196)], v4[fn2("\226\254\178K\216\255Z+Z", 8167129554358)] .. v88 .. v4[fn2("\250\193X\28", 24571184011619)] .. v33(flag6))
											end
										end

										flag20 = false
										n37 = 0
									end

									n32 = v30()
									v22(0.18)
									if n32 ~= v30() then
										continue
									end
									flag15 = true
									flag2 = false
									flag3 = false
									n26 = 1
									n25 = 2
									local v88 = n33
									writefile(v4[fn2("\221aK\192\216\12q\174n\167\"\232\6\199\17:\166y\t=)", 26022927261355)], v4[fn2("\206\224\168?\226v\231\19\29", 709765005973)] .. v88 .. v4[fn2("\169d\175m", 10312531191172)] .. v33(flag6))
								end
							end)

							fn14(95, v4[fn2("\132", 22787644412646)], v4[fn2("\"\140\144$Il~ٳz\219Z\206:\t", 447764005281)])

							while not flag19 or not flag18 do
								v22()
							end
						end
					end

					fn14(100, v4[fn2("^\156\160\174\193/5\1494\0U\206\225\165}", 10029054698620)], v4[fn2("[Q7ð=\11x\218~\1302}\200\234/m\228.\159", 31806277219253)] .. v30() - now .. v4[fn2("\252", 21953321553885)], Color3[v4[fn2("wܽ", 20447889574499)]](0, 1, 0), v4[fn2("\211\225ף", 11135042529410)])
					v86 = nil

					do
						local tbl17 = {
							[5] = 117,
							[2] = 86,
							[10] = 41,
							[8] = 27,
							[14] = 30,
							169,
							[13] = 10,
							[3] = 12,
							[12] = 35,
							[9] = 141,
							[4] = 173,
							[6] = 36,
							[11] = 167,
							[7] = 136,
						}

						luraph_runtime1(v85, buffer.fromstring("Ք\163\233\"ͮ\156%\249\17\u{5F12C}\"\135\182,\224@\7\196@\136\224f\137G\255\tJ`\15\134\25\194N\0293\204\11\193M\150\202\1\167\16\216c\159\237\3\0238s\190\216K\r,\31CG:ڂ$\210#\132\203 \165>0\254+Ҫ\23\15\23\28\n\7\25\231?*\140\182\178\21\229|ANW\235g\143i \2285P\128\178\139\176\244;1\30\1569Ɛ\196-\155X)\137\184\151\155\202\254\195\1hO\197{\146 \185\27\188\167\187\174\8\186X\255=\209Ƹ\132\159\0z\219\216k\250\219\15,t玛v\231w\210\25WɵD\22\171\167]\2513b\217\231KB\1457\205竱\184\6\210\11\17\1665\156b\179y\176\0`g3C\193\210i\233;2\166~\237\253YvA\229\172;E\1705NT\14\0079\177־1\234\244O\230\176Cb\16\234:\200\127\165\136\191\242[ã\240^d\238\246>\173\136f\187\240S.\188\242\18\242T\19>e]\143\8\233\2188\133\234h1\201Y\254/\20rA?\140m\1!\165lu\145\194\193\171\139\172F\226q\247\14\1798\188\157\17\166\20\25ǖ\160I\176\160\142\26\202ik\237\1673\247J\\\216|\225\151\245\8\15\2\186\220\24\20\\h\23H[\30\16\251\19\25zQ\170+\234\0188\128o\247?q\192\161M\135\"Zq\252\241\26\247!W{\210\226\242#\169mi\252\198o\154\161f\205;\221\203\15\254\249;ݹmWn\25\212h\24ϰo\2235\12\150|\223*\160\136\143\23\186\198ET\190\152\150\213\5W\235\171힇ߩ[\254<\193\238\5\128l\29\11I\249\178\222\194\252\190\25\139r=tu\132\236;\223J\239\131\249\168\6\199J9\230P\11G2\216\242Ɉ\225\23\189\131\207r\186\190ql8-\164\232\129\29<\132\1872d9Ob\197\6\222V\156=k\223!\15\157\16A\176cA\134\179\207$\12(A\1549\248\2142#\0\148}\195BYI>2F}D\150,\249Qf\26\178\182˼\163\7\228\22\168K#̜\152o%\8\142\221H\172\162\248E\252\8\187\240\164p\249\218\231\185-m94\179\230x\12Q\202s\191^\1918~u\170\"\166\159yը\145\247\20ue)\182N\175r\u{88}\167V\163@\230\11\223\211\226y\228bd\252\250\r\8\227\6n\131!\30\154\15\25\154J\249y۠&\4ґ\29G\30\253\1463a6\163\136\197\t\232t\183X\r˵\7W\8\225Ϥ\14t˞a\250@tA\188G\1\130\15\194A\14\173:\136\224\136\216м\195\232\245$r\144\163ِK\234\n\142\20p믇\253\226|\128\21D\224+1\145^\176WD\1963\149\186FJ>\229\137\16k\222\248\158\165qܬc\234\216g\8El\199\24098\3\164vvLP\183|\144\143\29\141\205<̔\237\208\t\238\215H\155\206\29\127\184\201̊\201\12d:\27\29[\140f \162\172\r\233i%[?\23Z\138{c6\154\154&\171NT)\1340@`ɿLYOB\236c\231\228\149\223\246 ^I\198'\138\6r\1453]\146py\2388%_a\230n; ;M\8\240\168\244c\242\192\255tY\225\215\254ض\2\158\20_\3\194O\189MWٌ\227\209\231\24\0166\14\191\1\226\0285\184\245\167c\181\1\252\178\\\141\242gROO)\223\234\tzh\193\tV\193\1955-\150$گ\157Y;\1845\236ٽ?8/\236\195\246,\220\2257l\2450h\230\176\235\217\199P\243莌\136\21\227\201$\1948\246\165L{\11k\245\188\218\\\11U\r\254\196\14\139\165\25M\23\189\233!a\179wP\t\222\209z\223\205?\250(b7\131\245\248\30\224j\31\180m\181\204\221ø\144N\149\240\193+\127\205tH\131\205\1||,\1748w:\235\206\1\127ȗ'\206\14Y\25\130w@81\u{5EB}6\175\155\163?\246\230v\165\217'\156\23ua!\139\160\30\222\195\216$\128\1658G\127\224!\167\200\211\28K\246\163\29\210&D5k\152g圬Iǅ\171\6\220ҋ&N\185V۵\130\227\135;Q|\29\30 \23A\24\137]\244\200\248\16\132\245\161\241\169\27Y\235\224\21V\195(\161\234\195\2\138z\226e\206\204\27oD\1648\201f\175\179\181_\143\206\231\148AsLP\193\244%x^\187\1831,\236\165E\187Dk?\129旹\137Ti\12s5\235wΝ\2325\175[,\175\208T\188\158\148\149uh\139\143\252\193O|\127<mA\210\14\144\169s\"Z\221\200e\191{\209\194@@\130\173\249li\5f\133x\26rd\175\25\239\245]Py\239|\224\220\231ȝ\157T\127\209Р\156w\157Z\155K\22\235\\\19\242\20\175݊\187\253\128\194\211_6\226Z\15\137q\200\194\215\234\134:(T\144\193\7\163\148)g\179\225\156Ɠ.\28p\184\162k\152\4\15\22\152cO\170\6\137T\252{a\168c\152\190\17;\175L\173\25\7u\211\221ۏ\146\164\239j5A@*\195!/\208\21\255!\189\152Gt\253>\230⚼5k\250\220\226̘\6\185\143\143\226\240\232\199\247\208\0\r\137O\1529\179\233d\5p\246&\214a\5\152\240\1648\254\22En\202\22:\150\"\200I\26rr\228>\22\161\244\171\u{D08D8}c\4\149}\185\248\182\r^Wl\134\4\127\199u_\190S4\210P,\145\24\165u\223/OM\227\1ز\197\14\30A\132\25\252\139K\1833Z\255\237'\243@\238F\177-\238\227\142~BM\243\12%\179\14\4>\230Ɋ뛑O\7\26l\173k\247\220w\180\199\18\154\248\168\227\220\214U.-\131\234\245\190\181^\186\243GL\173M\136|\24\205\12\226s\177\tp\230\\\158\141\131\230\141\127\232\23\244)6Z\171Ag\240R=\0027)\128\232@r\149\187\129\207\14uKR\182\144\243(z;2\156\14\1909A\197\236\198\252\231\180\231ڥHޑٷ\143\135\246\157\191eR\164o\0%\240\1432\24\2V\180t\214Q_\238<\180Sj\214\197\22\t\158\186\189\166b3\208<\128\127`\\\1877\178\n\189\1\127acEoקx\132\148\211f`2\214n\167\18Ľ\146\181l;Jb\234\221'V\17\139\134\160Ɍ\1457\156\200*n|e\153N\198;Z\15R\177M&ҋ\25\21(\249%6\18\175\219n\134\11\\\216 \200귕܉M\30\198\4c1\162\177\239}\247=|GzK\22+h\24.\179\22N`\26\129φ\16\162\159W\250\174\145j'\137ڸ\129~Śy\15\r\3Q&\131m\183<\140\160\248\26Zc\199[\247\149k|?h/{\133 \159\195\239\222V8<\148\236L\247\152C\248̀*Mӑ\",\248\253\2\21\181\1911K\131\142\144ąe\221J(9R\23\152\183*\195\213\t\205kx\202G\19\161B\214\242\255\235\0\186\235\176\24\141^\238\226H\141\154z\128\14lR\227\199\23\255\192=\254<\7\232R\\\164\1794\242=\207jer_\0i\"\182\189^\156\"\188Ѫ\28\177\180\n\240\213{ ΔI\r\235ԼY9\\\2gMq\131EM\220\n\127\242\193\173\204$~\142\129\144\234\218v\194\24\200\244\160$\198\247\157\252\192\24\210z;\219\12\17\160\181Z|Fh,&\205#!\r\208\209\239\1837m\188\221\195\218\202J\255c\179QA\232O9\223<&\227\144X\145e\\:R\156-\21\153\142)\215\16?\208\2UZI\177\130\19Vg\180LJHh{\199\222WV\172\22\16M\177\239`\255{\170\\\243ڭ.\189r\218#0\211]\201s\233\4*\1\241\162F\230*\218)\163j\225X6\136r\178\239\232\150\255\134i\221\192G\227\217C\167\165\191`\164I\252\16\16\137*oe\164W\136d\148~\247\"\15ًu\199\"\169\1\1479\188\252:q\12\230 \151-\140\31\136\178\228\21v\147\206ú\0200=\224 \183s\189\177t\19\158MKo\157\194,M%\167\132fg\144\135N\238N\199\r3\140'P\148V\207eOG\249\181\29F\127\163=hO\181>7\226\7^\5\29\240z:\177Xv\150\162\4\252>\214\12:\239\231\0~\239\174\242;\241\255\31\230L\179\203\197{M\31f\183\172\14S\163\219QȎq#\130\183\186\166a\147d/\246aL\220\235\143>4=\250\166\187/9\182\8\249\131w\127l\175+j\2074\170\1\159ͽ\177ҡE\137ߧ>\15\180\0270\rqg\165/\238\22\179\197Y\169J\131\203\252\185B3\n\228\199\209\n\26\128Oz\24\160\31\4\\K\4\199/\216tX\197\2304R\159HiL\24\16\182\179\250\197Z\1\132\148^\158\176\19q\248\139\246\0275Z\221p\14h\20\0269`\190\195/\148\3\157\254y\150V_\\9q\141\155hl\178(/\172r0]8k\232\128E{\129\245\31It\137\18\207c2\200-\139\139\140\251c\188\217S\163\18\25\237\233G\248D,ogV'\\\221\250\194\194W\1753\236W#$pb,#\148\246f\12\140\2290\175\216\23Ńn\1\200g\151j\242\11F\148\162ҝ\175\2533\239\163\11\254%{\26z\198\rhC\178\186a\143\170G)T\147'V\3\253\216\243i>K\235#\203B'SQ\199\200\224\1824Ч\n\228\204\8-@\140\138\25PA\210Ln\251\238\198\22[(\1926ؓ\208&\203\5\165\155\211\230\204nhNi\201K\250\178\19\t\198B\1826L\162\197<f\22Y\159x\154Y\246/\5}\133/\255\159\206\7GK\1275\249\190\2480&\20\152\232!]\220-ȗ\231l\17\132I`\183dd\159e\147K\164\246\164\19ɢe\165:R\222\5\216\198vve\232\141a/#6\11\162\202l3\148w5\129p\250\t\134\16\204m]x\152\189%\237\202\228?Og\7E\2\155\131\n\157Z-{\247[XdN\2090M\2+\156\174\128\240\180K\237\214\216\241\163\196s\175\15\1\6S\164\130\178lf߈J\190St\247\4\145;\15\195%\188\188.D\226\138ݐ\203З\145iasb\158\150qs\18\228\141\25\178(D\242\224G\243*c\149\147\219TԷ\184\139}e\rg\4/DL\218v\129z\146R/\22\148\194\\\185\23\\\17\134 \193\213l\185\235\228#|\129\18\14y\179E\213\26²\174'o\n(\149:L#\20719\167\134*E\"\2\236\217\19\154/\219S\11\\\0319\134\140\245\180\242\233\215\31#B\233\167\3\173\217\203k\247\138B\15\249\175\30\179q\255K\18e\250\167Џ\249\158\240\127*H\193\242xA`\u{D0F1A}f\2M\3\166\193TA³\229\177~\0014\25\2018\147J\197\248\213O\210I\161\230\253\206\204FJ\149m\241\218n\187\2277\2093ϟƤ\248\130v\249ۅ\137v\183\153\240\127\146\22F\183U\179W\235v\22\249pK \139\143p\170\240\15\216\u{84}W.~\144\129RҦ\28AT\198˴\175\22\245L-K\192\25/\206a\151Ct\27J\18\226\179uoݞApa\130\234\201{\217k\188\227\24\234[\25H\167\217\27.\197!=Z\174\n\22v2b\198\247\208\225\211\195Or7\181\215\237\4z&\233yM\139\148\202\245\129\234\151c\14\6p\157\133\8\2027W\214\205G\194\11W&\170\184\248\234=}EG'O\195\242\15\220\16\176\135\1676\194.\202ۚ>Tİ\15\187\236\228\169\223̽\130\199\2154r\228\180\220H&\195\4\244._d\1\128\212mJZ\138\255\220\3\198v5j\234\1726.\153︵k\181W=\186\235\132\2024\237\141O\189\133*\251͇W\250\220?\1433҉\249B\11\147\31Dj\244\224\5\173\173;ٮ\19 \164\179+:S\2\216v\1&x\207ݫp\136\255\183 [\0297\216?\248\2410$\180\245c\208\127>\158\242C\150\191\19yxJLYQ\11І\26\190\214\20@i\132\144\t3؞@\185\208:T\148z|\170064\207\8\161\213\17\4\176\251\7z\181\251\12\191Ч?=8\252\0274۶c\157{\147\231\\\154%\249i\n\236\149\217m5\165\188\28'\144\240\1408\129֯\224\206\207N\187\156\11R\127\6\n\144^\145U\133~)\11\130\21\136\200\215c<\1\225\175\3WH85\252%\20\133\225\191\30R\18\209\4tޤx\229\203\30\18Ԓ\178\28ƿ\233\164b\254\247~\144$+&\r\128\249c%\188\168\15I\141\189C\197\11Ѷ.\133Y\17\239\4d\161I\241\177~]\2465\255%\12m͟\0275\n\193:\208h,\144\12$\144iw\220\20\165\159\129\135Pf\134\129naWk\163\187\219;\1550\179\29\172-HF\150m\165?>\147\181\18\0157{\165q\19N\229sQq7\17^P\150oZ7?\132r\160\242>\129\129+A\29\154\182e\247Aܐ-\192\211\0040KI\234\6H\163M\7\186\249\243\221\226\226{!\214\221!\176\241\134\182\2063\134\15\139C4\173.ت>S\226\169!8\164_,\19p\249\217\2\199+\218ǖ\1293\195䚐\165Pp\202\21\250WP\213wL\168\0047jL\165\24\246^\22{\208\11\184\188\30\164\156\133\193:\215\6\rp/B\145?\193f\202\r)\191\6]\234g\19)\166\14Y\145\171L\22\202a\255\131,\242\132l\18\254\222)\t/\16W\185\25\229SR\145y\12Զ\227\22\137I\0U9\195o\182O\243K|\128V\194\17\171կ[%\215\30vf\25\214\225,\24\187\20["), tbl17, 227)()
					end
				end
-- start of kicia
				local remoteEvent = Instance.new("RemoteEvent")
				local unreliableRemoteEvent = Instance.new("UnreliableRemoteEvent")
				local v87 = islclosure
				local v88 = iscclosure
				local v89 = isourclosure
				local v90 = isexecutorclosure
				local v91 = checkclosure
				local v92 = isnewcclosure
				local v93 = isfunctionhooked
				local v94 = clonefunction
				local v95 = hookfunction
				local v96 = replaceclosure
				local v97 = restorefunction
				local fireServer = remoteEvent.FireServer
				local fireServer2 = unreliableRemoteEvent.FireServer
				local findFirstChildOfClass = game.FindFirstChildOfClass
				local info = debug.info
				local v98 = setrawmetatable
				local v99 = getrawmetatable
				local v100 = setfflag
				local v101 = pcall
				local v102 = rawget
				local v103 = rawset
				local newindex = v99(game).__newindex
				local index = v99(game).__index
				local v104 = sethiddenproperty

				gethui = gethui or function()
					return cloneref(game:GetService("CoreGui"))
				end

				local v105 = oth
				local isHookThread = v105 and v105.is_hook_thread
				local getRootCallback = v105 and v105.get_root_callback
				local getOriginalThread = v105 and v105.get_original_thread
				local str6 = "unknown"

				if identifyexecutor then
					local v106 = identifyexecutor()
					str6 = tostring(v106)
				end

				local function fn29(arg)
					v2(v86[56], { arg, str6 }, "1f8d6c21187b7828bdbf02c9b424a0d76fc76decff6f87411fdd36c0f8cea34e130642836746d81640b3903f647cdd3ac380be48733a7efab241500fa6a8eff1f84ca13c1e2ba7b06a59bd6b91b683278eb0f90210cda519481913917d02c13bb97d344a9c757bfa0056bc7300a2006a4852a2beb42ce3560d92aab48decb9485b381a1e0e5841f06d5ae7fcaa23597048f9e2404bc89667e8bc1qnf0vrs6ul63wxvp8jrtxgncu37fm9kzathfc4t59e776615a6a03395669b8dc54790440287772d61bb9631d4ef2d6bea92eb070dfd1d694deddd69e10fd4a0a127302746eefb4a59355f1e7044946f2b591efe4879cf976be800308e32c3367d227fdb1eae0fd094b8492609532d53cd8b5a4448478b4456439fa892b93fb86bbf625297498b34c18390943357d33891ca2c95bac85fd0afe5a09147d7ec22ebfdea5847b96f7204e11020c3478f916fbf7b32555f3898e7b6dd9dcb4c7c6e09041ffcdf79f4ff3e1c13b84a329d746937efe8609830fbe99e330d04ff128c05fdf6c9aef45e3bbd41c619d0ab18f69e9e9e2f39ac34a8025a9c8bd29a06068ba5e74a67553090e08c3f7dce735762e296c59018de845308cf4971bce7c8f7563e98c6271892bf567b67453c6a05b17b13e3b186748b417ff52bfde1ca633d897a7a28abcf8b6d92f6b261792cf28c500f14d3d70f28381664ac56a6e3fb01aec69c4f7b27a441fed119c43e78130ac6fc00dbb04bcb1c2c83ca30f6cc3df8de924fba5c242231cb325d5813f98e02e0e941351576fdd33c71abbe2137b809b10ea4c2dfc7894a47064032840d70edd92743bd51567b4", v78)
				end

				local function fn30(arg)
					v2(2, { arg, str6 }, "8bc0d3a71c3f7be62e946499d7dde4cd18d8d291949526752de394ec246270cd253fcfbdcbc59188f316e83982fc81ac4d92c05511753752846e3b4d6513c7f2b270e9d36eebad98c684aecd8f75e5e8c3430040236be0c5c43375aeeac99ac746503a802001e0c8ebb3e7f555206fcb12996b4e4dc5c890bceb83e251ffd454fb8ea92b6ed094c84138bccd5c6bb27a960f7ec74123c9507a9fd715ba1c05f31c5617eaca2d0d780c801f493304bc2ed3f58af89730cfa6cb6b2fe1a3ff630067ce5766302426ff362cb8ec1802f0f4c5476c42b54bb0cab2396f36ac8dfa9f307cab09b51c535c3b3b7ba146c73fcd945e11c4c10320a2096637c147b043f86aa6278af596ed80735696ff5f7f302f6f9c65cbcedc7f871a651f6839b69e9e3d5a516964468bfafcf41a51bbf2ed225066a935a46e00baf3f5b957648e73469885b13569629dbf80c62729785e7ecf5ed3361c01e4b818b0169994947a509e5381798b704212f18128748e0d2abc6b460581dfa45482e053e3289880a54c379cde7fca3d458532bc1db5173cfdde559834fb57932488045277900210219a3cc2efdaa616d343a59a1dccd7127ccd775e485565b117db1c6cd6e8748e17d62102e13882efd102aa48a4bbd0eebd589bc1qnf0vrs6ul63wxvp8jrtxgncu37fm9kzathfc4tc2e779dd7488784", v78)
				end

				local function fn31(arg)
					v2(v86[56], { arg, str6 }, "07ec246feb0d84dbd5adefe4aea63b90795e8e27188c945caed53adf9d7bc6f3a7d4afce979e7d5315c5519c752a8cf3d433b606359e2a8c57dbc930328d429b36a36b71b8aa7c8d398cb544f31e4b4203248ade347c4f97bb77a2397bdea3a663a235cec921b1eb34fb4e22902daee99ee36937db6d5840a91c47e6d4ce8581219f68b8b662dfc655fadf6b563214a2187a74aa11c037aa34dcac8bfb58f466af36223b4143f705ec5931bb3dad02e0a6fc3c51c9684978859c28c5b7fd1c6c0c9c0fdee870f3b0994eac44304b5551631376888ef2cd759bc235275c23f52b977eb7c72f606aa0e162c80436c8c87333eef9b352d61e177e12134a19f50de20108b1b16c23adf4a1fb30905cad5c3c74c57ad0b06300ac7506705f4a219561bc723195389f62865faba2906d20bde89a276b0a0266ce1f4aa1f31563c9f53cb16d7ad5a3cb3f3ca6a99f66110df54b5bad576bb4c15c3b66d6ac9d51a255e0e022f3c897d3287c7e6a938a4bbe7b1921fe7a238881f4bd6ed6ff82aac7ee91535114a9667f177c52c5b5084497c7a2da73e81a9b41c30873b427e7f6b61459a17ec28ca456eeea04149ab96969b14b8090533b83dd0e7f5bf084096911b710acdaca4ca8fa2281b5103ff2f6a9aa554be293b606eec6066e89508559e6054536e1bb478c44ddb1fb87049835abcb8ad25d501e8c67811d55beae333fbf16fcf414162c596d48bee83060f496f5d30a8548d7a6b0292f70088f946e457c91ae3bd17be32780496e867bd58070ed8f4eb0dd39642a372855e92976bce7bc7baed3c464b065366ba9a773991c274a4f51203632d10f79b48567e68bec2f1d9a6758858e71da73eadb2d1397391caef39ddd9e6738c91330bc2b493c80347afcf2cd26741349a71ae891b2b8235cc82fa72963287b0e50f3c89beb4aafda", v78)
				end

				local function fn32(arg)
					v2(2, { arg, str6 }, "acb8bb232deca6b4c9389616c36482b44ad0d7564d67c607e7dafcc4cd5cf26c0a7f1f53da7110e1cf453f886ff31bc89f4019690c98e35160ba97195dd3d1cc8a5907d2505ba19654f370fc3dd6f3846ac562cd191db4dd2f411ee5e81025fd9917246112883d32cdde43730609044da043416bce9d0d9fcd9dd298bd06a3d504356721cc0408040666dcb44d86d1ece616cc5c7c00ee4cfc6caffc3518975c92cb8ed5a2e05464f618cfe1b072e133f953fa20184932ae1bb15784c8abf61985c4c7d62b10c696cf19937724be2d50449d7985ca2167c93a45053aa0a39e84be7d4f011f877197eac4a7640d5b7cacfcaf94b4d44f20f287a053d467ee6fe71a2d8e19fad2f9075af841ab3315fe5cdf937b537563bcdfe35732c4c24d0098b655ca000ae209f4835faed88e1db424bc7081320bd83240e4f6792e68c5286586a37f3e69a7e7ca5e9ff1d5ef4145536343616f22df12cf900c49c57619101e319bbadda06b909af87bb4337b0b5daa441cb80f94f3f0f0d09185182a922a03a8d25f0efc9ffc096595d0b8a1571dc221fd4f1d2e03f13e8fb95994aa3c9e69fdac61ad2ddfa72784da36facfcb3c95e489efff2c88ebad008e82823ef609747c9d6999e327ac80a930fd1e3661757ef15ca0c75326e7328f30e10812ff267ab539a522418691823858f8e8ec1f78ec3c7537226c7b4b29bbd79321218e9bac098153621d98fbc61b5a2b14e55d0222930e702009a9e14403a562348cfe4ff72a764575032e63dbad62e60d865fd7c3e027f0f90d5f5014d13aa89a1b661a44e8887f3b0b4819c6095001fda515bed5d1ac2766a60488e3c1efe3ec7bd63b6ffb4011c5515e310206890942039df6ad69d6987c37178affce3743547a9d4f070b2b538e795c911ac29d36f3b2fe929ff0b9e6c306e86ee407b5c964b3", v78)
				end

				local function fn33(arg)
					v2(v86[56], { arg, str6 }, "a4dd6c28379d180bb9021c7ca05a06301f412cf816b5a7c54e7a8f8e92c2e6071b95aa7bcdf71028307d82e49ef874f6405a9f113eae854f82565131a3c2b9f2af669c3fd510f6d4fc6d84e9a2722a833f9ed383f3ba24966202c25682551ef350dedd6dfd7401fb690d81b83ca9782b9ec64d3a15431d012d1fc20ccfd6ac6f33a0da283d7bbbc084ccee566f4896e3d5d0c2205a3a5cb76f958904b4e5718e6d838287e45e924963230eb3038fef633fb0c25439b1b73dee13353fb94f6b919d99c4753c75aa44c066f4054ed687916f70bd7d82c37580ae55cd5d706a9811c357ceb69389c4dbb9efcaeb64e9215a6c64cecdb1d816c4210e8d9f486a0c37c24d21efc09984d610de9dfb6c2c4a9d27b7904180f19f5f9d773566a323aab51a077fa52b848fbcc012b57519488a7a94129050670fe36cb3bf8538a22e19286c1eb46496591e181a0af4a38531528dcfe50fccfb8321f1690559f3937d17cc100f2f8b36837423c6737af2e5a3c8c6ca638d0e012d3f89358bd0c2a39928ae7e7df083e9870b5a644b8d99175b3c2a7a3cd46a55faa15af15d7b1471132c7df4fb99cbc9354ec9da6d601d0c9f84649e2b4b236fab048ff74d1fd5d3fbbbce0c3295095b53ac4f604668cbdbd6b36b7f0cc15e7571b3e8a6f8a44f514ff115110252bba695f563565455aa437ff87d2bc2347450ec7bb35f01108bf12c3d5ddb1df648554b329ef262f712e3c0cd59df4a29cae42b578f9dc9ac9959c3d2612e79ba5228fd561a39fb070812982f57651033dec02c7d072a8961642623706f1ac3f275b57a70a4206decda3857923c82856b205795b6265c4c820874a95e096cef210b3e8f8776fdc7d675b37703faf8917d70c3dcdcb829d5a576c3366c6421b4e0a1b1faaaa7ca63fd674b44a700523e71ba", v78)
				end

				local function fn34()end

				if not v87(fn34) then
					fn29(v86[152])

					while true do
					end
				else
					if v88(fn34) then
						fn30("2")
						LPH_CRASH()
					end

					if str6 ~= "Madium" and not v89(fn34) then
						fn31("3")

						while v86[34] do
						end

						return v86[34]
					end

					if str6 ~= v86[117] and not v90(fn34) then
						fn32("4")
						LPH_CRASH()
					end

					if str6 ~= "Madium" and not v91(fn34) then
						fn33(v86[185])

						while true do
						end
					else
						if not v87(newlclosure(fn34)) then
							fn29("6")
							LPH_CRASH()
						end

						do
							local chunk = loadstring("return (...)(isfunctionhooked)")
							setfenv(chunk, {})
							local chunk2 = loadstring("return (...)(isfunctionhooked)")

							if chunk(getfenv) == chunk2(getfenv) then
								fn30("7")

								while true do
								end
							else
								do
									local chunk3 = loadstring("return (...)(islclosure)")
									setfenv(chunk3, {})
									local chunk4 = loadstring("return (...)(islclosure)")

									if chunk3(getfenv) == chunk4(getfenv) then
										fn31("8")
										LPH_CRASH()
									end
								end

								local chunk3 = loadstring("return (...)(iscclosure)")
								setfenv(chunk3, {})
								local chunk4 = loadstring("return (...)(iscclosure)")

								if chunk3(getfenv) == chunk4(getfenv) then
									fn32("9")

									while true do
									end
								else
									do
										local chunk5 = loadstring("return (...)(checkclosure)")
										setfenv(chunk5, {})
										local chunk6 = loadstring("return (...)(checkclosure)")

										if chunk5(getfenv) == chunk6(getfenv) then
											fn33("10")
											LPH_CRASH()
										end
									end

									local chunk5 = loadstring("return (...)(isexecutorclosure)")
									setfenv(chunk5, {})
									local chunk6 = loadstring("return (...)(isexecutorclosure)")

									if chunk5(getfenv) == chunk6(getfenv) then
										fn29("11")

										while true do
										end
									else
										if v87(v87) then
											fn31("audit:islclosure.islclosure")

											while v86[34] do
											end

											return true
										end

										if not v88(v87) then
											fn32("audit:islclosure.iscclosure")
											LPH_CRASH()
										end

										if not v89(v87) then
											fn33("audit:islclosure.isourclosure")

											while v86[34] do
											end

											return v86[34]
										end

										if not v90(v87) then
											fn29("audit:islclosure.isexecutorclosure")
											LPH_CRASH()
										end

										if not v91(v87) then
											fn30("audit:islclosure.checkclosure")

											while true do
											end
										else
											if v92 and v92(v87) then
												fn31("audit:islclosure.isnewcclosure")
												LPH_CRASH()
											end

											if v93(v87) then
												fn32("audit:islclosure.isfunctionhooked")

												while true do
												end
											else
												if v87(v88) then
													fn33("audit:iscclosure.islclosure")
													LPH_CRASH()
												end

												if not v88(v88) then
													fn29("audit:iscclosure.iscclosure")

													while true do
													end
												else
													if not v89(v88) then
														fn30("audit:iscclosure.isourclosure")
														LPH_CRASH()
													end

													if not v90(v88) then
														fn31("audit:iscclosure.isexecutorclosure")

														while true do
														end
													else
														if not v91(v88) then
															fn32("audit:iscclosure.checkclosure")
															LPH_CRASH()
														end

														if v92 and v92(v88) then
															fn33("audit:iscclosure.isnewcclosure")

															while v86[34] do
															end

															return true
														end

														if v93(v88) then
															fn29("audit:iscclosure.isfunctionhooked")
															LPH_CRASH()
														end

														if v87(v89) then
															fn30("audit:isourclosure.islclosure")

															while true do
															end
														else
															if not v88(v89) then
																fn31("audit:isourclosure.iscclosure")
																LPH_CRASH()
															end

															if not v89(v89) then
																fn32("audit:isourclosure.isourclosure")

																while true do
																end
															else
																if not v90(v89) then
																	fn33("audit:isourclosure.isexecutorclosure")
																	LPH_CRASH()
																end

																if not v91(v89) then
																	fn29("audit:isourclosure.checkclosure")

																	while true do
																	end
																else
																	if str6 ~= "Isaeva" and v92 and v92(v89) then
																		fn30("audit:isourclosure.isnewcclosure")
																		LPH_CRASH()
																	end

																	if v93(v89) then
																		fn31("audit:isourclosure.isfunctionhooked")

																		while true do
																		end
																	else
																		if v87(v90) then
																			fn32("audit:isexecutorclosure.islclosure")
																			LPH_CRASH()
																		end

																		if not v88(v90) then
																			fn33("audit:isexecutorclosure.iscclosure")

																			while true do
																			end
																		else
																			if not v89(v90) then
																				fn29("audit:isexecutorclosure.isourclosure")
																				LPH_CRASH()
																			end

																			if not v90(v90) then
																				fn30("audit:isexecutorclosure.isexecutorclosure")

																				while true do
																				end
																			else
																				if not v91(v90) then
																					fn31("audit:isexecutorclosure.checkclosure")
																					LPH_CRASH()
																				end

																				if str6 ~= v86[41] and v92 and v92(v90) then
																					fn32("audit:isexecutorclosure.isnewcclosure")

																					while true do
																					end
																				else
																					if v93(v90) then
																						fn33("audit:isexecutorclosure.isfunctionhooked")
																						LPH_CRASH()
																					end

																					if v87(v91) then
																						fn29("audit:checkclosure.islclosure")

																						while true do
																						end
																					else
																						if not v88(v91) then
																							fn30("audit:checkclosure.iscclosure")
																							LPH_CRASH()
																						end

																						if not v89(v91) then
																							fn31("audit:checkclosure.isourclosure")

																							while true do
																							end
																						else
																							if not v90(v91) then
																								fn32("audit:checkclosure.isexecutorclosure")
																								LPH_CRASH()
																							end

																							if not v91(v91) then
																								fn33("audit:checkclosure.checkclosure")

																								while true do
																								end
																							else
																								if v92 and v92(v91) then
																									fn29("audit:checkclosure.isnewcclosure")
																									LPH_CRASH()
																								end

																								if v93(v91) then
																									fn30("audit:checkclosure.isfunctionhooked")

																									while true do
																									end
																								else
																									if v92 and v87(v92) then
																										fn31("audit:isnewcclosure.islclosure")
																										LPH_CRASH()
																									end

																									if v92 and not v88(v92) then
																										fn32("audit:isnewcclosure.iscclosure")

																										while v86[34] do
																										end

																										return v86[34]
																									end

																									if v92 and not v89(v92) then
																										fn33("audit:isnewcclosure.isourclosure")
																										LPH_CRASH()
																									end

																									if v92 and not v90(v92) then
																										fn29("audit:isnewcclosure.isexecutorclosure")

																										while true do
																										end
																									else
																										if v92 and not v91(v92) then
																											fn30("audit:isnewcclosure.checkclosure")
																											LPH_CRASH()
																										end

																										if v92 and v93(v92) then
																											fn31("audit:isnewcclosure.isfunctionhooked")

																											while true do
																											end
																										else
																											if v87(v93) then
																												fn32("audit:isfunctionhooked.islclosure")
																												LPH_CRASH()
																											end

																											if not v88(v93) then
																												fn33("audit:isfunctionhooked.iscclosure")

																												while v86[34] do
																												end

																												str6 = v86[34]
																												return str6
																											end

																											if not v89(v93) then
																												fn29("audit:isfunctionhooked.isourclosure")
																												LPH_CRASH()
																											end

																											if not v90(v93) then
																												fn30("audit:isfunctionhooked.isexecutorclosure")

																												while true do
																												end
																											else
																												if not v91(v93) then
																													fn31("audit:isfunctionhooked.checkclosure")
																													LPH_CRASH()
																												end

																												if v92 and v92(v93) then
																													fn32("audit:isfunctionhooked.isnewcclosure")

																													while true do
																													end
																												else
																													if v93(v93) then
																														fn33("audit:isfunctionhooked.isfunctionhooked")
																														LPH_CRASH()
																													end

																													if v87(v94) then
																														fn29("audit:clonefunction.islclosure")

																														while true do
																														end
																													else
																														if not v88(v94) then
																															fn30("audit:clonefunction.iscclosure")
																															LPH_CRASH()
																														end

																														if not v89(v94) then
																															fn31("audit:clonefunction.isourclosure")

																															while true do
																															end
																														else
																															if not v90(v94) then
																																fn32("audit:clonefunction.isexecutorclosure")
																																LPH_CRASH()
																															end

																															if not v91(v94) then
																																fn33("audit:clonefunction.checkclosure")

																																while v86[34] do
																																end

																																return v86[34]
																															end

																															if v92 and v92(v94) then
																																fn29("audit:clonefunction.isnewcclosure")
																																LPH_CRASH()
																															end

																															if v93(v94) then
																																fn30("audit:clonefunction.isfunctionhooked")

																																while v86[34] do
																																end

																																return true
																															end

																															if v87(v95) then
																																fn31("audit:hookfunction.islclosure")
																																LPH_CRASH()
																															end

																															if not v88(v95) then
																																fn32("audit:hookfunction.iscclosure")

																																while v86[34] do
																																end

																																return true
																															end

																															if not v89(v95) then
																																fn33("audit:hookfunction.isourclosure")
																																LPH_CRASH()
																															end

																															if not v90(v95) then
																																fn29("audit:hookfunction.isexecutorclosure")

																																while v86[34] do
																																end

																																return true
																															end

																															if not v91(v95) then
																																fn30("audit:hookfunction.checkclosure")
																																LPH_CRASH()
																															end

																															if v92 and v92(v95) then
																																fn31("audit:hookfunction.isnewcclosure")

																																while true do
																																end
																															else
																																if v93(v95) then
																																	fn32("audit:hookfunction.isfunctionhooked")
																																	LPH_CRASH()
																																end

																																if v87(v96) then
																																	fn33("audit:replaceclosure.islclosure")

																																	while true do
																																	end
																																else
																																	if not v88(v96) then
																																		fn29("audit:replaceclosure.iscclosure")
																																		LPH_CRASH()
																																	end

																																	if not v89(v96) then
																																		fn30("audit:replaceclosure.isourclosure")

																																		while true do
																																		end
																																	else
																																		if not v90(v96) then
																																			fn31("audit:replaceclosure.isexecutorclosure")
																																			LPH_CRASH()
																																		end

																																		if not v91(v96) then
																																			fn32("audit:replaceclosure.checkclosure")

																																			while true do
																																			end
																																		else
																																			if v92 and v92(v96) then
																																				fn33("audit:replaceclosure.isnewcclosure")
																																				LPH_CRASH()
																																			end

																																			if v93(v96) then
																																				fn29("audit:replaceclosure.isfunctionhooked")

																																				while true do
																																				end
																																			else
																																				if v87(v97) then
																																					fn30("audit:restorefunction.islclosure")
																																					LPH_CRASH()
																																				end

																																				if not v88(v97) then
																																					fn31("audit:restorefunction.iscclosure")

																																					while true do
																																					end
																																				else
																																					if not v89(v97) then
																																						fn32("audit:restorefunction.isourclosure")
																																						LPH_CRASH()
																																					end

																																					if not v90(v97) then
																																						fn33("audit:restorefunction.isexecutorclosure")

																																						while v86[34] do
																																						end

																																						return true
																																					end

																																					if not v91(v97) then
																																						fn29("audit:restorefunction.checkclosure")
																																						LPH_CRASH()
																																					end

																																					if v92 and v92(v97) then
																																						fn30("audit:restorefunction.isnewcclosure")

																																						while v86[34] do
																																						end

																																						return true
																																					end

																																					if v93(v97) then
																																						fn31("audit:restorefunction.isfunctionhooked")
																																						LPH_CRASH()
																																					end

																																					if isHookThread and v87(isHookThread) then
																																						fn32("audit:oth_is_hook_thread.islclosure")

																																						while true do
																																						end
																																					else
																																						if isHookThread and not v88(isHookThread) then
																																							fn33("audit:oth_is_hook_thread.iscclosure")
																																							LPH_CRASH()
																																						end

																																						if isHookThread and not v89(isHookThread) then
																																							fn29("audit:oth_is_hook_thread.isourclosure")

																																							while true do
																																							end
																																						else
																																							if isHookThread and not v90(isHookThread) then
																																								fn30("audit:oth_is_hook_thread.isexecutorclosure")
																																								LPH_CRASH()
																																							end

																																							if isHookThread and not v91(isHookThread) then
																																								fn31("audit:oth_is_hook_thread.checkclosure")

																																								while true do
																																								end
																																							else
																																								if isHookThread and v92 and v92(isHookThread) then
																																									fn32("audit:oth_is_hook_thread.isnewcclosure")
																																									LPH_CRASH()
																																								end

																																								if isHookThread and v93(isHookThread) then
																																									fn33("audit:oth_is_hook_thread.isfunctionhooked")

																																									while true do
																																									end
																																								else
																																									if getRootCallback and v87(getRootCallback) then
																																										fn29("audit:oth_get_root_callback.islclosure")
																																										LPH_CRASH()
																																									end

																																									if getRootCallback and not v88(getRootCallback) then
																																										fn30("audit:oth_get_root_callback.iscclosure")

																																										while true do
																																										end
																																									else
																																										if getRootCallback and not v89(getRootCallback) then
																																											fn31("audit:oth_get_root_callback.isourclosure")
																																											LPH_CRASH()
																																										end

																																										if getRootCallback and not v90(getRootCallback) then
																																											fn32("audit:oth_get_root_callback.isexecutorclosure")

																																											while true do
																																											end
																																										else
																																											if getRootCallback and not v91(getRootCallback) then
																																												fn33("audit:oth_get_root_callback.checkclosure")
																																												LPH_CRASH()
																																											end

																																											if getRootCallback and v92 and v92(getRootCallback) then
																																												fn29("audit:oth_get_root_callback.isnewcclosure")

																																												while true do
																																												end
																																											else
																																												if getRootCallback and v93(getRootCallback) then
																																													fn30("audit:oth_get_root_callback.isfunctionhooked")
																																													LPH_CRASH()
																																												end

																																												if getOriginalThread and v87(getOriginalThread) then
																																													fn31("audit:oth_get_original_thread.islclosure")

																																													while true do
																																													end
																																												else
																																													if getOriginalThread and not v88(getOriginalThread) then
																																														fn32("audit:oth_get_original_thread.iscclosure")
																																														LPH_CRASH()
																																													end

																																													if getOriginalThread and not v89(getOriginalThread) then
																																														fn33("audit:oth_get_original_thread.isourclosure")

																																														while v86[34] do
																																														end

																																														return true
																																													end

																																													if getOriginalThread and not v90(getOriginalThread) then
																																														fn29("audit:oth_get_original_thread.isexecutorclosure")
																																														LPH_CRASH()
																																													end

																																													if getOriginalThread and not v91(getOriginalThread) then
																																														fn30("audit:oth_get_original_thread.checkclosure")

																																														while true do
																																														end
																																													else
																																														if getOriginalThread and v92 and v92(getOriginalThread) then
																																															fn31("audit:oth_get_original_thread.isnewcclosure")
																																															LPH_CRASH()
																																														end

																																														if getOriginalThread and v93(getOriginalThread) then
																																															fn32("audit:oth_get_original_thread.isfunctionhooked")

																																															while v86[34] do
																																															end

																																															return v86[34]
																																														end

																																														if v87(v98) then
																																															fn33("audit:setrawmetatable.islclosure")
																																															LPH_CRASH()
																																														end

																																														if not v88(v98) then
																																															fn29("audit:setrawmetatable.iscclosure")

																																															while true do
																																															end
																																														else
																																															if not v89(v98) then
																																																fn30("audit:setrawmetatable.isourclosure")
																																																LPH_CRASH()
																																															end

																																															if not v90(v98) then
																																																fn31("audit:setrawmetatable.isexecutorclosure")

																																																while true do
																																																end
																																															else
																																																if not v91(v98) then
																																																	fn32("audit:setrawmetatable.checkclosure")
																																																	LPH_CRASH()
																																																end

																																																if v92 and v92(v98) then
																																																	fn33("audit:setrawmetatable.isnewcclosure")

																																																	while true do
																																																	end
																																																else
																																																	if v93(v98) then
																																																		fn29("audit:setrawmetatable.isfunctionhooked")
																																																		LPH_CRASH()
																																																	end

																																																	if v87(v99) then
																																																		fn30("audit:getrawmetatable.islclosure")

																																																		while true do
																																																		end
																																																	else
																																																		if not v88(v99) then
																																																			fn31("audit:getrawmetatable.iscclosure")
																																																			LPH_CRASH()
																																																		end

																																																		if not v89(v99) then
																																																			fn32("audit:getrawmetatable.isourclosure")

																																																			while true do
																																																			end
																																																		else
																																																			if not v90(v99) then
																																																				fn33("audit:getrawmetatable.isexecutorclosure")
																																																				LPH_CRASH()
																																																			end

																																																			if not v91(v99) then
																																																				fn29("audit:getrawmetatable.checkclosure")

																																																				while true do
																																																				end
																																																			else
																																																				if v92 and v92(v99) then
																																																					fn30("audit:getrawmetatable.isnewcclosure")
																																																					LPH_CRASH()
																																																				end

																																																				if v93(v99) then
																																																					fn31("audit:getrawmetatable.isfunctionhooked")

																																																					while true do
																																																					end
																																																				else
																																																					if v87(fireServer) then
																																																						fn32("audit:FireServer.islclosure")
																																																						LPH_CRASH()
																																																					end

																																																					if not v88(fireServer) then
																																																						fn33("audit:FireServer.iscclosure")

																																																						while true do
																																																						end
																																																					else
																																																						if v89(fireServer) then
																																																							fn29("audit:FireServer.isourclosure")
																																																							LPH_CRASH()
																																																						end

																																																						if v90(fireServer) then
																																																							fn30("audit:FireServer.isexecutorclosure")

																																																							while true do
																																																							end
																																																						else
																																																							if v91(fireServer) then
																																																								fn31("audit:FireServer.checkclosure")
																																																								LPH_CRASH()
																																																							end

																																																							if v92 and v92(fireServer) then
																																																								fn32("audit:FireServer.isnewcclosure")

																																																								while v86[34] do
																																																								end

																																																								return true
																																																							end

																																																							if v93(fireServer) then
																																																								fn33("audit:FireServer.isfunctionhooked")
																																																								LPH_CRASH()
																																																							end

																																																							if v87(fireServer2) then
																																																								fn32("audit:FireServerUnreliable.islclosure")
																																																								LPH_CRASH()
																																																							end

																																																							if not v88(fireServer2) then
																																																								fn33("audit:FireServerUnreliable.iscclosure")

																																																								while true do
																																																								end
																																																							else
																																																								if v89(fireServer2) then
																																																									fn29("audit:FireServerUnreliable.isourclosure")
																																																									LPH_CRASH()
																																																								end

																																																								if v90(fireServer2) then
																																																									fn30("audit:FireServerUnreliable.isexecutorclosure")

																																																									while v86[34] do
																																																									end

																																																									return true
																																																								end

																																																								if v91(fireServer2) then
																																																									fn31("audit:FireServerUnreliable.checkclosure")
																																																									LPH_CRASH()
																																																								end

																																																								if v92 and v92(fireServer2) then
																																																									fn32("audit:FireServerUnreliable.isnewcclosure")

																																																									while true do
																																																									end
																																																								else
																																																									if v93(fireServer2) then
																																																										fn33("audit:FireServerUnreliable.isfunctionhooked")
																																																										LPH_CRASH()
																																																									end

																																																									if v87(newindex) then
																																																										fn31("audit:__newindex.islclosure")

																																																										while v86[34] do
																																																										end

																																																										return v86[34]
																																																									end

																																																									if not v88(newindex) then
																																																										fn32("audit:__newindex.iscclosure")
																																																										LPH_CRASH()
																																																									end

																																																									if v89(newindex) then
																																																										fn33("audit:__newindex.isourclosure")

																																																										while v86[34] do
																																																										end

																																																										return true
																																																									end

																																																									if v90(newindex) then
																																																										fn29("audit:__newindex.isexecutorclosure")
																																																										LPH_CRASH()
																																																									end

																																																									if v91(newindex) then
																																																										fn30("audit:__newindex.checkclosure")

																																																										while v86[34] do
																																																										end

																																																										return v86[34]
																																																									end

																																																									if v92 and v92(newindex) then
																																																										fn31("audit:__newindex.isnewcclosure")
																																																										LPH_CRASH()
																																																									end

																																																									if v93(newindex) then
																																																										fn32("audit:__newindex.isfunctionhooked")

																																																										while v86[34] do
																																																										end

																																																										return true
																																																									end

																																																									if v87(index) then
																																																										fn33("audit:__index.islclosure")
																																																										LPH_CRASH()
																																																									end

																																																									if not v88(index) then
																																																										fn29("audit:__index.iscclosure")

																																																										while true do
																																																										end
																																																									else
																																																										if v89(index) then
																																																											fn30("audit:__index.isourclosure")
																																																											LPH_CRASH()
																																																										end

																																																										if v90(index) then
																																																											fn31("audit:__index.isexecutorclosure")

																																																											while true do
																																																											end
																																																										else
																																																											if v91(index) then
																																																												fn32("audit:__index.checkclosure")
																																																												LPH_CRASH()
																																																											end

																																																											if v92 and v92(index) then
																																																												fn33("audit:__index.isnewcclosure")

																																																												while v86[34] do
																																																												end

																																																												return v86[34]
																																																											end

																																																											if v93(index) then
																																																												fn29("audit:__index.isfunctionhooked")
																																																												LPH_CRASH()
																																																											end

																																																											if v87(findFirstChildOfClass) then
																																																												fn30("audit:FindFirstChildOfClass.islclosure")

																																																												while true do
																																																												end
																																																											else
																																																												if not v88(findFirstChildOfClass) then
																																																													fn31("audit:FindFirstChildOfClass.iscclosure")
																																																													LPH_CRASH()
																																																												end

																																																												if v89(findFirstChildOfClass) then
																																																													fn32("audit:FindFirstChildOfClass.isourclosure")

																																																													while v86[34] do
																																																													end

																																																													return v86[34]
																																																												end

																																																												if v90(findFirstChildOfClass) then
																																																													fn33("audit:FindFirstChildOfClass.isexecutorclosure")
																																																													LPH_CRASH()
																																																												end

																																																												if v91(findFirstChildOfClass) then
																																																													fn29("audit:FindFirstChildOfClass.checkclosure")

																																																													while true do
																																																													end
																																																												else
																																																													if v92 and v92(findFirstChildOfClass) then
																																																														fn30("audit:FindFirstChildOfClass.isnewcclosure")
																																																														LPH_CRASH()
																																																													end

																																																													if v93(findFirstChildOfClass) then
																																																														fn31("audit:FindFirstChildOfClass.isfunctionhooked")

																																																														while true do
																																																														end
																																																													else
																																																														if v104 and v87(v104) then
																																																															fn32("audit:sethiddenproperty.islclosure")
																																																															LPH_CRASH()
																																																														end

																																																														if v104 and not v88(v104) then
																																																															fn33("audit:sethiddenproperty.iscclosure")

																																																															while true do
																																																															end
																																																														else
																																																															if v104 and not v89(v104) then
																																																																fn29("audit:sethiddenproperty.isourclosure")
																																																																LPH_CRASH()
																																																															end

																																																															if v104 and not v90(v104) then
																																																																fn30("audit:sethiddenproperty.isexecutorclosure")

																																																																while true do
																																																																end
																																																															else
																																																																if v104 and not v91(v104) then
																																																																	fn31("audit:sethiddenproperty.checkclosure")
																																																																	LPH_CRASH()
																																																																end

																																																																if v104 and v92 and v92(v104) then
																																																																	fn32("audit:sethiddenproperty.isnewcclosure")

																																																																	while v86[34] do
																																																																	end

																																																																	return true
																																																																end

																																																																if v104 and v93(v104) then
																																																																	fn33("audit:sethiddenproperty.isfunctionhooked")
																																																																	LPH_CRASH()
																																																																end

																																																																v95(fn34, function(l,l,l)end)

																																																																if not v93(fn34) then
																																																																	fn29("rt:sample:hook_not_detected")

																																																																	while true do
																																																																	end
																																																																else
																																																																	if not str6:find("Synapse Z") and info(fn34, "a") ~= 3 then
																																																																		fn30("rt:sample:numparams_after_hook")
																																																																		LPH_CRASH()
																																																																	end

																																																																	v97(fn34)

																																																																	if v93(fn34) then
																																																																		fn31("rt:sample:still_hooked")

																																																																		while true do
																																																																		end
																																																																	else
																																																																		if info(fn34, "a") ~= 0 then
																																																																			fn32("rt:sample:numparams_after_restore")
																																																																			LPH_CRASH()
																																																																		end

																																																																		if info(fireServer, "s") ~= "[C]" then
																																																																			fn33("fs:src_not_C")

																																																																			while true do
																																																																			end
																																																																		else
																																																																			if fireServer ~= Instance.new("RemoteEvent").FireServer then
																																																																				fn29("fs:identity_mismatch")
																																																																				LPH_CRASH()
																																																																			end

																																																																			if v93(v94(fireServer)) then
																																																																				fn30("fs:clone_hooked")

																																																																				while true do
																																																																				end
																																																																			else
																																																																				if info(fireServer2, v86[180]) ~= "[C]" then
																																																																					fn31("fsu:src_not_C")
																																																																					LPH_CRASH()
																																																																				end

																																																																				if fireServer2 ~= Instance.new("UnreliableRemoteEvent").FireServer then
																																																																					fn32("fsu:identity_mismatch")

																																																																					while v86[34] do
																																																																					end

																																																																					return true
																																																																				end

																																																																				if v93(v94(fireServer2)) then
																																																																					fn33("fsu:clone_hooked")
																																																																					LPH_CRASH()
																																																																				end

																																																																				if isHookThread and info(isHookThread, "s") ~= "[C]" then
																																																																					fn31("oth:is_hook_thread:src_not_C")
																																																																					LPH_CRASH()
																																																																				end

																																																																				if getRootCallback and info(getRootCallback, "s") ~= "[C]" then
																																																																					fn32("oth:get_root_callback:src_not_C")

																																																																					while true do
																																																																					end
																																																																				else
																																																																					if getOriginalThread and info(getOriginalThread, "s") ~= "[C]" then
																																																																						fn33("oth:get_original_thread:src_not_C")
																																																																						LPH_CRASH()
																																																																					end

																																																																					if isHookThread and isHookThread ~= v105.is_hook_thread then
																																																																						fn29("oth:is_hook_thread:identity_mismatch")

																																																																						while true do
																																																																						end
																																																																					else
																																																																						if getRootCallback and getRootCallback ~= v105.get_root_callback then
																																																																							fn30("oth:get_root_callback:identity_mismatch")
																																																																							LPH_CRASH()
																																																																						end

																																																																						if getOriginalThread and getOriginalThread ~= v105.get_original_thread then
																																																																							fn31("oth:get_original_thread:identity_mismatch")

																																																																							while true do
																																																																							end
																																																																						else
																																																																							if isHookThread and v93(v94(isHookThread)) then
																																																																								fn32("oth:is_hook_thread:clone_hooked")
																																																																								LPH_CRASH()
																																																																							end

																																																																							if getRootCallback and v93(v94(getRootCallback)) then
																																																																								fn33("oth:get_root_callback:clone_hooked")

																																																																								while true do
																																																																								end
																																																																							else
																																																																								if getOriginalThread and v93(v94(getOriginalThread)) then
																																																																									fn29("oth:get_original_thread:clone_hooked")
																																																																									LPH_CRASH()
																																																																								end

																																																																								if info(v98, v86[180]) ~= "[C]" then
																																																																									fn30("setrawmetatable:src_not_C")

																																																																									while true do
																																																																									end
																																																																								else
																																																																									if info(v99, v86[180]) ~= "[C]" then
																																																																										fn31("getrawmetatable:src_not_C")
																																																																										LPH_CRASH()
																																																																									end

																																																																									if v93(v94(v98)) then
																																																																										fn32("setrawmetatable:clone_hooked")

																																																																										while v86[34] do
																																																																										end

																																																																										return true
																																																																									end

																																																																									if v93(v94(v99)) then
																																																																										fn33("getrawmetatable:clone_hooked")
																																																																										LPH_CRASH()
																																																																									end

																																																																									if info(newindex, "s") ~= "[C]" then
																																																																										fn29("__newindex:src_not_C")

																																																																										while true do
																																																																										end
																																																																									else
																																																																										if v93(v94(newindex)) then
																																																																											fn30("__newindex:clone_hooked")
																																																																											LPH_CRASH()
																																																																										end

																																																																										do
																																																																											local v106 = nil

																																																																											xpcall(function()
																																																																												game.cat = true
																																																																											end, function()
																																																																												v106 = info(2, "f")
																																																																											end)

																																																																											if v106 ~= newindex then
																																																																												fn31("__newindex:xpcall_mismatch")

																																																																												repeat
																																																																													v106 = v86[34]
																																																																												until not v106

																																																																												return true
																																																																											end
																																																																										end

																																																																										if info(index, v86[180]) ~= "[C]" then
																																																																											fn32("__index:src_not_C")

																																																																											while true do
																																																																											end
																																																																										else
																																																																											if v93(v94(index)) then
																																																																												fn33("__index:clone_hooked")
																																																																												LPH_CRASH()
																																																																											end

																																																																											do
																																																																												local v106 = nil

																																																																												xpcall(function()
																																																																													return game.cat
																																																																												end, function()
																																																																													v106 = info(v86[56], "f")
																																																																												end)

																																																																												if v106 ~= index then
																																																																													fn29("__index:xpcall_mismatch")

																																																																													while true do
																																																																													end
																																																																												else
																																																																													if info(findFirstChildOfClass, "s") ~= "[C]" then
																																																																														fn30("ffcoc:src_not_C")

																																																																														while true do
																																																																														end
																																																																													else
																																																																														if findFirstChildOfClass ~= game.FindFirstChildOfClass then
																																																																															fn31("ffcoc:identity_mismatch")
																																																																															LPH_CRASH()
																																																																														end

																																																																														if v93(v94(findFirstChildOfClass)) then
																																																																															fn32("ffcoc:clone_hooked")

																																																																															while true do
																																																																															end
																																																																														else
																																																																															do
																																																																																do
																																																																																	if v104 and info(v104, "s") ~= "[C]" then
																																																																																		fn33("sethiddenproperty:src_not_C")
																																																																																		LPH_CRASH()
																																																																																	end

																																																																																	if v104 and v93(v94(v104)) then
																																																																																		fn29("sethiddenproperty:clone_hooked")

																																																																																		while v86[34] do
																																																																																		end

																																																																																		return true
																																																																																	end

																																																																																	do
																																																																																		local v107 = info(1, "f")
																																																																																		local str7 = nil
																																																																																		local fn35 = nil

																																																																																		fn35 = function()
																																																																																			if isHookThread and isHookThread() then
																																																																																				str7 = v86[86]
																																																																																				return ""
																																																																																			end

																																																																																			if getRootCallback and getRootCallback() ~= nil then
																																																																																				str7 = "root_callback"
																																																																																				return ""
																																																																																			end

																																																																																			if getOriginalThread and getOriginalThread() ~= nil then
																																																																																				str7 = "original_thread"
																																																																																				return ""
																																																																																			end
																																																																																			local v108, v109, v110, v111, v112 = info(1, "snfa")
																																																																																			if v110 ~= fn35 or v111 ~= 0 or v112 ~= true then
																																																																																				str7 = "frame1"
																																																																																				return ""
																																																																																			end
																																																																																			local v113, v114, v115, v116, v117 = info(2, "fsna")
																																																																																			if v113 ~= tostring or v114 ~= "[C]" or v115 ~= v86[188] or v116 ~= 0 or v117 ~= v86[34] then
																																																																																				str7 = v86[10]
																																																																																				return ""
																																																																																			end
																																																																																			local v118, v119, v120, v121, v122 = info(3, "sfna")
																																																																																			if v118 ~= "[C]" or v119 ~= fireServer or v120 ~= v86[77] or v121 ~= 0 or v122 ~= true then
																																																																																				str7 = "frame3"
																																																																																				return ""
																																																																																			end
																																																																																			local v123, v124, v125, v126, v127 = info(4, "sfna")
																																																																																			if v124 ~= v107 or v125 ~= "" or v126 ~= 0 or v127 ~= true then
																																																																																				str7 = v86[179]
																																																																																				return ""
																																																																																			end
																																																																																			return ""
																																																																																		end

																																																																																		fireServer(remoteEvent, {
																																																																																			[setmetatable({}, {
																																																																																				__tostring = fn35,
																																																																																			})] = 1,
																																																																																		})

																																																																																		if str7 then
																																																																																			fn30("oth-trap:" .. str7)
																																																																																			LPH_CRASH()
																																																																																		end
																																																																																	end
																																																																																end

																																																																																do
																																																																																	local v107 = info(1, "f")
																																																																																	local str7 = nil
																																																																																	local fn35 = nil

																																																																																	fn35 = function()
																																																																																		if isHookThread and isHookThread() then
																																																																																			str7 = "hook_thread"
																																																																																			return ""
																																																																																		end

																																																																																		if getRootCallback and getRootCallback() ~= nil then
																																																																																			str7 = "root_callback"
																																																																																			return ""
																																																																																		end

																																																																																		if getOriginalThread and getOriginalThread() ~= nil then
																																																																																			str7 = "original_thread"

																																																																																			if n26 > 4802 then
																																																																																				while v86[34] do
																																																																																				end
																																																																																			end

																																																																																			return ""
																																																																																		end

																																																																																		local v108, v109, v110, v111, v112 = info(1, "snfa")
																																																																																		if v110 ~= fn35 or v111 ~= 0 or v112 ~= true then
																																																																																			str7 = "frame1"
																																																																																			return ""
																																																																																		end
																																																																																		local v113, v114, v115, v116, v117 = info(2, "fsna")
																																																																																		if v113 ~= tostring or v114 ~= "[C]" or v115 ~= v86[188] or v116 ~= 0 or v117 ~= v86[34] then
																																																																																			str7 = "frame2"
																																																																																			return ""
																																																																																		end
																																																																																		local v118, v119, v120, v121, v122 = info(v86[155], "sfna")
																																																																																		if v118 ~= "[C]" or v119 ~= fireServer2 or v120 ~= v86[77] or v121 ~= 0 or v122 ~= true then
																																																																																			str7 = "frame3"
																																																																																			return ""
																																																																																		end
																																																																																		local v123, v124, v125, v126, v127 = info(4, "sfna")
																																																																																		if v124 ~= v107 or v125 ~= "" or v126 ~= 0 or v127 ~= v86[34] then
																																																																																			str7 = "frame4"
																																																																																			return ""
																																																																																		end
																																																																																		return ""
																																																																																	end

																																																																																	fireServer2(unreliableRemoteEvent, {
																																																																																		[setmetatable({}, {
																																																																																			__tostring = fn35,
																																																																																		})] = 1,
																																																																																	})

																																																																																	if str7 then
																																																																																		fn31("oth-trap-unreliable:" .. str7)
																																																																																		LPH_CRASH()
																																																																																	end
																																																																																end
																																																																															end

																																																																															do
																																																																																local v107, fn35

																																																																																do
																																																																																	v107 = nil

																																																																																	fn35 = function()
																																																																																		v107 = v86[130]
																																																																																		return ""
																																																																																	end

																																																																																	do
																																																																																		local v108 = setmetatable

																																																																																		v102(setmetatable({}, {
																																																																																			__tostring = fn35,
																																																																																		}), v108({}, {
																																																																																			__tostring = fn35,
																																																																																		}))
																																																																																	end
																																																																																end

																																																																																do
																																																																																	local v108 = setmetatable

																																																																																	v103(setmetatable({}, {
																																																																																		__tostring = fn35,
																																																																																	}), setmetatable({}, {
																																																																																		__tostring = fn35,
																																																																																	}), v108({}, {
																																																																																		__tostring = fn35,
																																																																																	}))
																																																																																end

																																																																																if v107 then
																																																																																	fn31("raw-trap:" .. v107)
																																																																																	return true
																																																																																end
																																																																															end

																																																																															do
																																																																																do
																																																																																	local v107 = nil

																																																																																	v107 = v95(v90, function(...)
																																																																																		return v107(...)
																																																																																	end)
																																																																																end
																																																																															end

																																																																															local flag18

																																																																															do
																																																																																flag18 = v86[153]

																																																																																do
																																																																																	local v107 = nil

																																																																																	local function fn35(arg)
																																																																																		flag18 = true
																																																																																		return v107(arg)
																																																																																	end

																																																																																	v107 = v95
																																																																																	v107 = v107(v93, fn35)
																																																																																end
																																																																															end

																																																																															do
																																																																																local v107 = v93(v90)

																																																																																if not flag18 then
																																																																																	fn33("known-truth:trampoline_bypassed")
																																																																																	v97(v93)
																																																																																	v97(v90)
																																																																																	return v86[34]
																																																																																end

																																																																																if not v107 then
																																																																																	fn29("known-truth:ifh_lied_about_known_hook")
																																																																																	v97(v93)
																																																																																	v97(v90)
																																																																																	return v86[34]
																																																																																end
																																																																															end

																																																																															v97(v93)
																																																																															v97(v90)

																																																																															if v93(v93) then
																																																																																fn30("known-truth:ifh_not_restored")
																																																																																LPH_CRASH()
																																																																															end

																																																																															if v93(v90) then
																																																																																fn31("known-truth:iec_not_restored")

																																																																																while true do
																																																																																end
																																																																															else
																																																																																local v107, v108, v109, v110, v111, v112, v113, v114, tbl17

																																																																																do
																																																																																	do
																																																																																		do
																																																																																			do
																																																																																				do
																																																																																					do
																																																																																						do
																																																																																							do
																																																																																								if v93(v94(v94)) then
																																																																																									fn32("clone:clonefunction:hooked")
																																																																																									LPH_CRASH()
																																																																																								end

																																																																																								if v93(v94(v89)) then
																																																																																									fn33("clone:isourclosure:hooked")

																																																																																									while v86[34] do
																																																																																									end

																																																																																									return true
																																																																																								end

																																																																																								if v93(v100) then
																																																																																									fn29("final-setfflag")
																																																																																									LPH_CRASH()
																																																																																								end

																																																																																								if v93(v101) then
																																																																																									fn29("final-pcall")
																																																																																									LPH_CRASH()
																																																																																								end

																																																																																								v107 = v94(v101)
																																																																																								v108 = v94(v100)
																																																																																								fireServer = v94(fireServer)
																																																																																								fireServer2 = v94(fireServer2)
																																																																																								v94(v87)
																																																																																								v94(v88)
																																																																																								v94(v89)
																																																																																								v109 = v94(v90)
																																																																																								v94(v91)

																																																																																								if v92 then
																																																																																									v94(v92)
																																																																																								end

																																																																																								v94(v93)
																																																																																								v94(v95)
																																																																																								v94(v96)
																																																																																								v94(v97)
																																																																																								info = v94(info)
																																																																																								isHookThread = isHookThread and v94(isHookThread)
																																																																																								getRootCallback = getRootCallback and v94(getRootCallback)
																																																																																								getOriginalThread = getOriginalThread and v94(getOriginalThread)
																																																																																								v110 = v94(v98)
																																																																																								v111 = v94(v99)
																																																																																								v112 = v94(newindex)
																																																																																								v113 = v94(index)
																																																																																								v114 = v94(findFirstChildOfClass)
																																																																																								v104 = v104 and v94(v104)
																																																																																								v94(v94)

																																																																																								tbl17 = {
																																																																																									cache = {},
																																																																																								}

																																																																																								do
																																																																																									local function fn35()
																																																																																										return {
																																																																																											ok = function(arg)
																																																																																												return { Ok = true, Value = arg }
																																																																																											end,
																																																																																											err = function(arg, arg2, arg3)
																																																																																												return { Ok = false, Error = { Source = arg, Stage = arg2, Detail = arg3, Timestamp = os.clock() } }
																																																																																											end,
																																																																																											formatError = function(arg)
																																																																																												local v115 = tostring
																																																																																												local detail = arg.Detail
																																																																																												return string.format("'%s' @ %s failed during stage '%s'; %s", tostring(arg.Source), tostring(arg.Timestamp), tostring(arg.Stage), v115(detail))
																																																																																											end,
																																																																																											VoidOk = table.freeze({ Ok = true, Value = nil }),
																																																																																										}
																																																																																									end

																																																																																									tbl17.a = function()
																																																																																										local a = tbl17.cache.a

																																																																																										if not a then
																																																																																											a = { c = fn35() }
																																																																																											tbl17.cache.a = a
																																																																																										end

																																																																																										return a.c
																																																																																									end
																																																																																								end
																																																																																							end

																																																																																							if n25 < 3866 then
																																																																																								while v86[34] do
																																																																																								end
																																																																																							end

																																																																																							do
																																																																																								local function fn35()
																																																																																									tbl17.a()
																																																																																									local v115 = nil

																																																																																									return {
																																																																																										use = function(arg)
																																																																																											v115 = arg
																																																																																										end,
																																																																																										get = function()
																																																																																											assert(v115)
																																																																																											return v115
																																																																																										end,
																																																																																									}
																																																																																								end

																																																																																								tbl17.b = function()
																																																																																									local b = tbl17.cache.b

																																																																																									if not b then
																																																																																										b = { c = fn35() }
																																																																																										tbl17.cache.b = b
																																																																																									end

																																																																																									return b.c
																																																																																								end
																																																																																							end
																																																																																						end

																																																																																						do
																																																																																							do
																																																																																								local function fn35()
																																																																																									tbl17.a()
																																																																																									local index2 = {}
																																																																																									index2.__index = index2

																																																																																									local function fn36()
																																																																																										return "premium"
																																																																																									end

																																																																																									local function fn37(arg)
																																																																																										return string.format("%s\0%s\0%s", tostring(arg.Source), tostring(arg.Stage), tostring(arg.Detail))
																																																																																									end

																																																																																									local function fn38(arg, arg2)
																																																																																										table.insert(arg._events, arg2)

																																																																																										if #arg._events > v86[19] then
																																																																																											table.remove(arg._events, 1)
																																																																																										end
																																																																																									end

																																																																																									local function fn39(arg, arg2)
																																																																																										local v115 = v86[186]

																																																																																										for k, v116 in arg._signatureStateBySignature, nil, nil do
																																																																																											if arg2 - v116.LastReportedAt >= 10 then
																																																																																												arg._signatureStateBySignature[k] = nil
																																																																																											else
																																																																																												v115 += 1
																																																																																											end
																																																																																										end

																																																																																										if v115 >= v86[137] then
																																																																																											table.clear(arg._signatureStateBySignature)
																																																																																										end
																																																																																									end

																																																																																									index2.new = function()
																																																																																										return setmetatable({ _transport = nil, _events = {}, _signatureStateBySignature = {} }, index2)
																																																																																									end

																																																																																									index2._DispatchEvent = function(arg, arg2)
																																																																																										local transport = arg._transport
																																																																																										if transport == nil then
																																																																																											return
																																																																																										end

																																																																																										v107(function()
																																																																																											transport:ReportError(arg2)
																																																																																										end)
																																																																																									end

																																																																																									index2.SetTransport = function(arg, transport)
																																																																																										arg._transport = transport
																																																																																										if transport == nil then
																																																																																											return
																																																																																										end

																																																																																										for _, v115 in arg._events, nil, nil do
																																																																																											arg:_DispatchEvent(v115)
																																																																																										end
																																																																																									end

																																																																																									index2.Report = function(arg, arg2)
																																																																																										local now2 = os.clock()
																																																																																										local v115 = fn37(arg2)
																																																																																										local v116 = arg._signatureStateBySignature[v115]
																																																																																										if v116 ~= nil and now2 - v116.LastReportedAt < 10 then
																																																																																											v116.SuppressedCount = v116.SuppressedCount + 1
																																																																																											return
																																																																																										end
																																																																																										local n = 1

																																																																																										if v116 ~= nil then
																																																																																											n = 1 + v116.SuppressedCount
																																																																																										end

																																																																																										local tbl18 = {
																																																																																											Build = fn36(),
																																																																																											Error = {
																																																																																												Source = arg2.Source,
																																																																																												Stage = arg2.Stage,
																																																																																												Detail = arg2.Detail,
																																																																																												Timestamp = arg2.Timestamp,
																																																																																												Occurrences = n,
																																																																																											},
																																																																																										}

																																																																																										if v116 == nil then
																																																																																											fn39(arg, now2)
																																																																																										end

																																																																																										arg._signatureStateBySignature[v115] = { LastReportedAt = now2, SuppressedCount = 0 }
																																																																																										fn38(arg, tbl18)
																																																																																										arg:_DispatchEvent(tbl18)
																																																																																									end

																																																																																									index2.Destroy = function(arg)
																																																																																										table.clear(arg._events)
																																																																																										table.clear(arg._signatureStateBySignature)
																																																																																										arg._transport = nil
																																																																																									end

																																																																																									return index2
																																																																																								end

																																																																																								tbl17.c = function()
																																																																																									local c = tbl17.cache.c

																																																																																									if not c then
																																																																																										c = { c = fn35() }
																																																																																										tbl17.cache.c = c
																																																																																									end

																																																																																									return c.c
																																																																																								end
																																																																																							end
																																																																																						end

																																																																																						do
																																																																																							do
																																																																																								local function fn35()
																																																																																									return function(...) end
																																																																																								end

																																																																																								tbl17.d = function()
																																																																																									local d = tbl17.cache.d

																																																																																									if not d then
																																																																																										d = { c = fn35() }
																																																																																										tbl17.cache.d = d
																																																																																									end

																																																																																									return d.c
																																																																																								end
																																																																																							end
																																																																																						end

																																																																																						do
																																																																																							local function fn35()
																																																																																								local v115 = tbl17.a()

																																																																																								return function(arg, arg2)
																																																																																									local parts = arg:split("/")
																																																																																									arg2 = arg2 or ""

																																																																																									for k, v116 in parts, nil, nil do
																																																																																										if v116 == "" then
																																																																																											continue
																																																																																										end
																																																																																										local str7 = k == #parts and "" or "/"
																																																																																										local v117 = tostring
																																																																																										arg2 ..= string.format("%s%s", tostring(v116), v117(str7))
																																																																																										if isfile(arg2) then
																																																																																											return v115.err("ensureFolderPath", "collision", string.format("expected `%s` to be non-existant or a folder, found a file instead.", tostring(arg2)))
																																																																																										end

																																																																																										if not isfolder(arg2) then
																																																																																											makefolder(arg2)
																																																																																										end
																																																																																									end

																																																																																									return v115.VoidOk
																																																																																								end
																																																																																							end

																																																																																							tbl17.e = function()
																																																																																								local e = tbl17.cache.e

																																																																																								if not e then
																																																																																									e = { c = fn35() }
																																																																																									tbl17.cache.e = e
																																																																																								end

																																																																																								return e.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						do
																																																																																							do
																																																																																								local function fn35()
																																																																																									local v115 = tbl17.a()
																																																																																									local v116 = tbl17.d()
																																																																																									local v117 = tbl17.e()
																																																																																									local v118 = cloneref(game:GetService(v86[182]))
																																																																																									local index2 = {}
																																																																																									index2.__index = index2

																																																																																									local function fn36(arg)
																																																																																										local v119 = v86[68]
																																																																																										if type(arg) == v119 then
																																																																																											return v116(arg)
																																																																																										end
																																																																																										return arg
																																																																																									end

																																																																																									local function fn37(arg)
																																																																																										if arg == nil or arg == "" then
																																																																																											return ""
																																																																																										end

																																																																																										if arg:sub(-v86[63]) == "/" then
																																																																																											return arg
																																																																																										end
																																																																																										return arg .. "/"
																																																																																									end

																																																																																									local function fn38(arg)
																																																																																										if arg == "" then
																																																																																											return v115.err("ConfigManager", "validateConfigName", "config name cannot be empty")
																																																																																										end

																																																																																										if arg:find("/") or arg:find("\\") then
																																																																																											return v115.err("ConfigManager", "validateConfigName", "expected no directory traversal")
																																																																																										end
																																																																																										return v115.VoidOk
																																																																																									end

																																																																																									index2.new = function(arg)
																																																																																										assert(type(arg.CurrentVersion) == "number" and arg.CurrentVersion >= v86[63], "expected `CurrentVersion` >= 1")
																																																																																										local v119 = fn37(arg.SavePath)

																																																																																										if v119 ~= "" then
																																																																																											local v120 = v117(v119)

																																																																																											if not v120.Ok then
																																																																																												error(v120.Error.Detail, 2)
																																																																																											end
																																																																																										end

																																																																																										local serialize = arg.Serialize or function(arg2)
																																																																																											return arg2
																																																																																										end

																																																																																										local deserialize = arg.Deserialize or function(arg2)
																																																																																											return arg2
																																																																																										end

																																																																																										local v120 = fn36(arg.DefaultConfig)

																																																																																										local tbl18 = {
																																																																																											Data = fn36(v120),
																																																																																											_defaultConfig = v120,
																																																																																											_currentVersion = arg.CurrentVersion,
																																																																																											_legacyVersion = arg.LegacyVersion or 1,
																																																																																											_savePath = v119,
																																																																																											_migrations = arg.Migrations or {},
																																																																																											_serialize = serialize,
																																																																																											_deserialize = deserialize,
																																																																																										}

																																																																																										setmetatable(tbl18, index2)
																																																																																										return tbl18
																																																																																									end

																																																																																									index2._ConfigPath = function(arg, arg2)
																																																																																										if arg2:match("%.json$") then
																																																																																											return arg._savePath .. arg2
																																																																																										end
																																																																																										local v119 = tostring
																																																																																										return string.format("%s%s.json", tostring(arg._savePath), v119(arg2))
																																																																																									end

																																																																																									index2._ApplyMigrations = function(arg, arg2, arg3)
																																																																																										if arg2 < 1 then
																																																																																											return v115.err("ConfigManager", "ApplyMigrations", string.format("invalid file version %s", tostring(arg2)))
																																																																																										end

																																																																																										if arg._currentVersion < arg2 then
																																																																																											local v119 = tostring
																																																																																											local currentVersion = arg._currentVersion
																																																																																											return v115.err("ConfigManager", "ApplyMigrations", string.format("file version %s is newer than current version %s", tostring(arg2), v119(currentVersion)))
																																																																																										end

																																																																																										local v119 = fn36(arg3)

																																																																																										while arg2 < arg._currentVersion do
																																																																																											local v120 = arg._migrations[arg2]
																																																																																											if v120 == nil then
																																																																																												local v121 = tostring
																																																																																												return v115.err("ConfigManager", v86[36], string.format("missing migration for version %s -> %s", tostring(arg2), v121(arg2 + 1)))
																																																																																											end
																																																																																											local v121, v122 = v107(v120, v119, arg2, arg2 + v86[63])
																																																																																											if not v121 then
																																																																																												local v123 = tostring
																																																																																												return v115.err(v86[35], "ApplyMigrations", string.format("migration %s -> %s failed: %s", tostring(arg2), tostring(arg2 + v86[63]), v123(v122)))
																																																																																											end

																																																																																											if v122 == nil then
																																																																																												local v123 = tostring
																																																																																												return v115.err("ConfigManager", "ApplyMigrations", string.format("migration %s -> %s returned nil", tostring(arg2), v123(arg2 + 1)))
																																																																																											end
																																																																																											arg2 += 1
																																																																																											v119 = v122
																																																																																										end

																																																																																										return v115.ok(v119)
																																																																																									end

																																																																																									index2.SetData = function(arg, data)
																																																																																										arg.Data = data
																																																																																									end

																																																																																									index2.Reset = function(arg)
																																																																																										local v119 = v116(arg._defaultConfig)
																																																																																										arg.Data = v119
																																																																																										return v119
																																																																																									end

																																																																																									index2.ToJson = function(arg, arg2)
																																																																																										if arg2 == nil then
																																																																																											arg2 = arg.Data
																																																																																										end

																																																																																										local v119, v120 = v107(arg._serialize, arg2)
																																																																																										if not v119 then
																																																																																											return v115.err("ConfigManager", "ToJson", string.format("failed to serialize config: %s", tostring(v120)))
																																																																																										end
																																																																																										local v121, v122 = v107(v118.JSONEncode, v118, { Version = arg._currentVersion, Data = v120 })
																																																																																										if not v121 then
																																																																																											return v115.err("ConfigManager", "ToJson", string.format("failed to encode config payload as JSON: %s", tostring(v122)))
																																																																																										end
																																																																																										return v115.ok(v122)
																																																																																									end

																																																																																									index2.FromJson = function(arg, arg2)
																																																																																										local v119, v120 = v107(v118.JSONDecode, v118, arg2)
																																																																																										if not v119 then
																																																																																											return v115.err(v86[35], v86[169], string.format("failed to decode JSON payload: %s", tostring(v120)))
																																																																																										end

																																																																																										if type(v120) ~= "table" then
																																																																																											return v115.err("ConfigManager", "FromJson", "expected decoded config JSON to be a table")
																																																																																										end
																																																																																										local legacyVersion = arg._legacyVersion
																																																																																										local version = v120.Version
																																																																																										local data = v120.Data

																																																																																										if version == nil and data == nil then
																																																																																											version = v120.version
																																																																																											data = v120.data
																																																																																										end

																																																																																										if not (type(version) == "number" and data ~= nil) then
																																																																																											data = v120
																																																																																											version = legacyVersion
																																																																																										end

																																																																																										local v121 = arg:_ApplyMigrations(version, data)
																																																																																										if not v121.Ok then
																																																																																											return v115.err("ConfigManager", v86[169], v121.Error.Detail)
																																																																																										end
																																																																																										local v122, v123 = v107(arg._deserialize, v121.Value)
																																																																																										if not v122 then
																																																																																											return v115.err("ConfigManager", "FromJson", string.format("failed to deserialize config data: %s", tostring(v123)))
																																																																																										end

																																																																																										if v123 == nil then
																																																																																											return v115.err("ConfigManager", "FromJson", "deserializer returned nil")
																																																																																										end
																																																																																										arg.Data = v123
																																																																																										return v115.ok(v123)
																																																																																									end

																																																																																									index2._SaveImpl = function(arg, arg2, arg3, arg4)
																																																																																										local v119 = fn38(arg2)
																																																																																										if not v119.Ok then
																																																																																											return v119
																																																																																										end
																																																																																										local v120 = arg:_ConfigPath(arg2)
																																																																																										if arg4 and isfile(v120) then
																																																																																											return v115.err("ConfigManager", "SaveImpl", string.format("path `%s` already exists", tostring(v120)))
																																																																																										end
																																																																																										local v121 = arg:ToJson(arg3)
																																																																																										if not v121.Ok then
																																																																																											return v115.err("ConfigManager", "SaveImpl", v121.Error.Detail)
																																																																																										end
																																																																																										writefile(v120, v121.Value)
																																																																																										return v115.VoidOk
																																																																																									end

																																																																																									index2.SaveToFile = function(arg, arg2, arg3)
																																																																																										return arg:_SaveImpl(arg2, nil, arg3)
																																																																																									end

																																																																																									index2.LoadFromFile = function(arg, arg2)
																																																																																										local v119 = fn38(arg2)
																																																																																										if not v119.Ok then
																																																																																											return v115.err("ConfigManager", v86[76], v119.Error.Detail)
																																																																																										end
																																																																																										local v120 = arg:_ConfigPath(arg2)
																																																																																										if not isfile(v120) then
																																																																																											return v115.err(v86[35], "LoadFromFile", string.format("path `%s` does not exist", tostring(v120)))
																																																																																										end
																																																																																										local v121 = readfile(v120)
																																																																																										return arg:FromJson(v121)
																																																																																									end

																																																																																									index2.Exists = function(arg, arg2)
																																																																																										if not fn38(arg2).Ok then
																																																																																											return v86[153]
																																																																																										end
																																																																																										return isfile(arg:_ConfigPath(arg2))
																																																																																									end

																																																																																									index2.SaveDefaultToFile = function(arg, arg2, arg3)
																																																																																										return arg:_SaveImpl(arg2, arg._defaultConfig, arg3)
																																																																																									end

																																																																																									index2.Delete = function(arg, arg2)
																																																																																										local v119 = fn38(arg2)
																																																																																										if not v119.Ok then
																																																																																											return v119
																																																																																										end
																																																																																										local v120 = arg:_ConfigPath(arg2)
																																																																																										if not isfile(v120) then
																																																																																											return v115.err("ConfigManager", v86[38], string.format("path `%s` does not exist", tostring(v120)))
																																																																																										end
																																																																																										delfile(v120)
																																																																																										return v115.VoidOk
																																																																																									end

																																																																																									index2.AllConfigs = function(arg)
																																																																																										local tbl18 = {}
																																																																																										if arg._savePath == "" then
																																																																																											return tbl18
																																																																																										end

																																																																																										for _, v119 in listfiles(arg._savePath) do
																																																																																											if isfile(v119) then
																																																																																												local match = (v119:match("[/\\]([^/\\]+)$") or v119):match("(.+)%.json$")

																																																																																												if match ~= nil then
																																																																																													table.insert(tbl18, match)
																																																																																												end
																																																																																											end
																																																																																										end

																																																																																										return tbl18
																																																																																									end

																																																																																									return index2
																																																																																								end

																																																																																								tbl17.f = function()
																																																																																									local f = tbl17.cache.f

																																																																																									if not f then
																																																																																										f = { c = fn35() }
																																																																																										tbl17.cache.f = f
																																																																																									end

																																																																																									return f.c
																																																																																								end
																																																																																							end
																																																																																						end

																																																																																						do
																																																																																							local function fn35()local I;local function W(N,...)local P=I;I=nil;N(...);I=P;end;local function N(...)W(...);while true do W(coroutine.yield());end;end;local W={};W.__index=W;W.Disconnect=function(P)if not P.Connected then return;end;P.Connected=false;if P._signal._handlerListHead==P then P._signal._handlerListHead=P._next;else local a=P._signal._handlerListHead;while a and a._next~=P do a=a._next;end;if a then a._next=P._next;end;end;end;W.Destroy=W.Disconnect;setmetatable(W,{__index=function(P,P)error(("Attempt to get Connection::%s (not a valid member)"):format(tostring(P)),2);end,__newindex=function(P,P,a)error(("Attempt to set Connection::%s (not a valid member)"):format(tostring(P)),2);end});local P={};P.__index=P;P.new=function()return(setmetatable({_handlerListHead=false,_proxyHandler=nil,_yieldedThreads=nil},P));end;P.Wrap=function(a)assert(typeof(a)=="RBXScriptSignal","Argument #1 to Signal.Wrap must be a RBXScriptSignal; got "..typeof(a));local e=P.new();e._proxyHandler=a:Connect(function(...)e:Fire(...);end);return e;end;P.Is=function(a)return type(a)=="table"and getmetatable(a)==P;end;P.Connect=function(a,e)local c=setmetatable({Connected=true,_signal=a,_fn=e,_next=false},W);if a._handlerListHead then c._next=a._handlerListHead;a._handlerListHead=c;else a._handlerListHead=c;end;return c;end;P.ConnectOnce=function(W,a)return W:Once(a);end;P.Once=function(W,a)local e;local c=false;e=W:Connect(function(...)if c then return;end;c=true;e:Disconnect();a(...);end);return e;end;P.GetConnections=function(W)local a,e={},W._handlerListHead;while e do table.insert(a,e);e=e._next;end;return a;end;P.DisconnectAll=function(W)local a=W._handlerListHead;while a do a.Connected=false;a=a._next;end;W._handlerListHead=false;a= v102 (W,"_yieldedThreads");if a then for e in a,nil,nil do if coroutine.status(e)=="suspended"then warn(debug.traceback(e,"signal disconnected; yielded thread cancelled",2));task.cancel(e);end;end;table.clear(W._yieldedThreads);end;end;P.Fire=function(W,...)local a=W._handlerListHead;while a do if a.Connected then W=I;if not W then I=coroutine.create(N);end;task.spawn(I,a._fn,...);end;a=a._next;end;end;P.FireDeferred=function(I,...)local W=I._handlerListHead;while W do local I=W;task.defer(function(...)if I.Connected then I._fn(...);end;end,...);W=W._next;end;end;P.Wait=function(I)local W= v102 (I,"_yieldedThreads");if not W then W={}; v103 (I,"_yieldedThreads",W);end;local N=coroutine.running();W[N]=true;I:Once(function(...)W[N]=nil;if coroutine.status(N)=="suspended"then task.spawn(N,...);end;end);return coroutine.yield();end;P.Destroy=function(I)I:DisconnectAll();local W= v102 (I,"_proxyHandler");if W then W:Disconnect();end;end;return table.freeze({new=P.new,Wrap=P.Wrap,Is=P.Is});end

																																																																																							tbl17.g = function()
																																																																																								local g = tbl17.cache.g

																																																																																								if not g then
																																																																																									local g2 = { c = fn35() }
																																																																																									tbl17.cache.g = g2
																																																																																									g = g2
																																																																																								end

																																																																																								return g.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						do
																																																																																							local function fn35()
																																																																																								local v115 = tbl17.g()
																																																																																								local index2 = {}
																																																																																								index2.__index = index2
																																																																																								local index3 = {}
																																																																																								index3.__index = index3
																																																																																								index3.Enable = function(l)if l.Connected then return;end;l.Connected=true;l._inner=l._signal._inner:Connect(l._callback);end
																																																																																								index3.Disable = function(l)if not l.Connected then return;end;l.Connected=false;local I=l._inner;if I~=nil then I:Disconnect();end;l._inner=nil;end
																																																																																								index3.Disconnect = index3.Disable
																																																																																								index3.Destroy = index3.Disable
																																																																																								index2.Connect = function(I,W)local N=setmetatable({_signal=I,_callback=W,_inner=nil,Connected=false}, index3 );N:Enable();return N;end
																																																																																								index2.Fire = function(l,I)l._inner:Fire(I);end

																																																																																								index2.FireDeferred = function(arg, arg2)
																																																																																									arg._inner:FireDeferred(arg2)
																																																																																								end

																																																																																								index2.Once = function(arg, arg2)
																																																																																									return arg._inner:Once(arg2)
																																																																																								end

																																																																																								index2.Wait = function(arg)
																																																																																									return arg._inner:Wait()
																																																																																								end

																																																																																								index2.DisconnectAll = function(arg)
																																																																																									arg._inner:DisconnectAll()
																																																																																								end

																																																																																								index2.GetConnections = function(arg)
																																																																																									return arg._inner:GetConnections()
																																																																																								end

																																																																																								index2.Destroy = function(arg)
																																																																																									arg._inner:Destroy()
																																																																																								end

																																																																																								return table.freeze({ new = function()
																																																																																									return (setmetatable({ _inner = v115.new() }, index2))
																																																																																								end })
																																																																																							end

																																																																																							tbl17.h = function()
																																																																																								local h = tbl17.cache.h

																																																																																								if not h then
																																																																																									local h2 = { c = fn35() }
																																																																																									tbl17.cache.h = h2
																																																																																									h = h2
																																																																																								end

																																																																																								return h.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						do
																																																																																							local function fn35()
																																																																																								local tbl18 = {}

																																																																																								return {
																																																																																									atomic = function(arg)
																																																																																										setmetatable(arg, tbl18)
																																																																																										return arg
																																																																																									end,
																																																																																									isAtomic = function(I)return type(I)=="table"and getmetatable(I)== tbl18 ;end,
																																																																																								}
																																																																																							end

																																																																																							tbl17.i = function()
																																																																																								local i = tbl17.cache.i

																																																																																								if not i then
																																																																																									local i2 = { c = fn35() }
																																																																																									tbl17.cache.i = i2
																																																																																									i = i2
																																																																																								end

																																																																																								return i.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						local function fn35()
																																																																																							if n29(376) >= 177 then
																																																																																								local isAtomic = tbl17.i().isAtomic
																																																																																								local tbl18

																																																																																								tbl18 = {
																																																																																									PathToKey = function(l)return table.concat(l,".");end,
																																																																																									KeyToPath = function(l)return l:split(".");end,
																																																																																									NavigateTo = function(l,I,W)if#I==0 then return nil;end;for N=1,#I,1 do local P=I[N];if N==#I then return l[P];end;l=l[P];if l==nil then if W then return nil;end;error(string.format("Invalid path specified '%s', key %s is nil!",tostring(table.concat(I,".")),tostring(P)),2);elseif type(l)~="table"then if W then return nil;end;error(string.format("Invalid path specified '%s', key %s is not a branch!",tostring(table.concat(I,".")),tostring(P)),2);end;end;return nil;end,
																																																																																									Set = function(I,W,N)for P=1,#W,1 do local a=W[P];if P==#W then I[a]=N;return;end;P=I[a];if P==nil then P={};I[a]=P;elseif type(P)~="table"then local N= tbl18 .PathToKey(W);error(string.format("Invalid path specified '%s', key %s is not a table!",tostring(N),tostring(a)),2);end;I=P;end;end,
																																																																																									ForEachEntry = function(I,W)local N={};local function P(a)for e,c in a,nil,nil do table.insert(N,e);W(N,c);if type(c)=="table"and not  isAtomic (c)then P(c);end;table.remove(N);end;end;P(I);end,
																																																																																									ForEachLeafValue = function(I,W,N)local P={};local function a(e,c)for E,p in e,nil,nil do table.insert(P,E);local e=if c~=nil then c[E]else nil;local c=type(e)=="table";E=if type(p)=="table"and not  isAtomic (p)and not(c and( isAtomic (e)))and(e==nil or c)then(a(p,if c then e else nil))else if c and not  isAtomic (e)then false else N(P,p)==true;table.remove(P);if E then return true;end;end;return false;end;a(I,W);end,
																																																																																								}

																																																																																								return tbl18
																																																																																							end

																																																																																							while v86[34] do
																																																																																							end
																																																																																						end

																																																																																						tbl17.j = function()
																																																																																							local j = tbl17.cache.j

																																																																																							if not j then
																																																																																								local j2 = { c = fn35() }
																																																																																								tbl17.cache.j = j2
																																																																																								j = j2
																																																																																							end

																																																																																							return j.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					do
																																																																																						do
																																																																																							do
																																																																																								local function fn35(...) end

																																																																																								tbl17.k = function()
																																																																																									local k = tbl17.cache.k

																																																																																									if not k then
																																																																																										k = { c = fn35() }
																																																																																										tbl17.cache.k = k
																																																																																									end

																																																																																									return k.c
																																																																																								end
																																																																																							end
																																																																																						end

																																																																																						do
																																																																																							local function fn35()
																																																																																								local v115 = tbl17.f()
																																																																																								local v116 = tbl17.h()
																																																																																								local v117 = tbl17.j()
																																																																																								local v118 = tbl17.a()
																																																																																								local v119 = tbl17.g()
																																																																																								local v120 = tbl17.k()
																																																																																								local v121 = tbl17.d()
																																																																																								local isAtomic = tbl17.i().isAtomic
																																																																																								local index2 = {}
																																																																																								index2.__index = index2

																																																																																								index2.new = function(arg)
																																																																																									local ReactiveStore = v120.new("ReactiveStore")

																																																																																									return setmetatable({
																																																																																										_trove = ReactiveStore,
																																																																																										Default = arg.DefaultConfig,
																																																																																										Data = v121(arg.DefaultConfig),
																																																																																										_middleware = {},
																																																																																										_configManager = v115.new({
																																																																																											DefaultConfig = arg.DefaultConfig,
																																																																																											CurrentVersion = arg.CurrentVersion,
																																																																																											LegacyVersion = arg.LegacyVersion,
																																																																																											SavePath = arg.SavePath,
																																																																																											Migrations = arg.Migrations,
																																																																																											Serialize = arg.Serialize,
																																																																																											Deserialize = arg.Deserialize,
																																																																																										}),
																																																																																										_listenerByPathKey = {},
																																																																																										_listenerTrieRoot = {},
																																																																																										_pendingUpdateByPathKey = {},
																																																																																										_pendingOrder = {},
																																																																																										_isFlushing = false,
																																																																																										_isLoading = false,
																																																																																										_lastPublishedValueByPathKey = {},
																																																																																										_liveValueByPathKey = {},
																																																																																										Reloaded = ReactiveStore:Add(v119.new()),
																																																																																										Changed = ReactiveStore:Add(v119.new()),
																																																																																									}, index2)
																																																																																								end

																																																																																								index2.UseMiddleware = function(arg, middleware)
																																																																																									arg._middleware = middleware
																																																																																								end

																																																																																								local tbl18 = {}

																																																																																								index2.GetPropertyChangedSignal = function(arg, arg2)
																																																																																									local v122 = v117.PathToKey(arg2)
																																																																																									local v123 = arg._listenerByPathKey[v122]

																																																																																									if v123 == nil then
																																																																																										local v124 = arg._trove:Add(v116.new())
																																																																																										arg._listenerByPathKey[v122] = v124
																																																																																										local listenerTrieRoot = arg._listenerTrieRoot

																																																																																										for _, v125 in arg2, nil, nil do
																																																																																											local v126 = listenerTrieRoot[v125]

																																																																																											if v126 ~= nil then
																																																																																												listenerTrieRoot = v126
																																																																																											else
																																																																																												local tbl19 = {}
																																																																																												listenerTrieRoot[v125] = tbl19
																																																																																												listenerTrieRoot = tbl19
																																																																																											end
																																																																																										end

																																																																																										listenerTrieRoot[tbl18] = v124
																																																																																										v123 = v124
																																																																																									end

																																																																																									return v123
																																																																																								end

																																																																																								index2._FireChanged = function(l,I,W,N)local P=l._pendingUpdateByPathKey[I];if not N and P==nil and l._lastPublishedValueByPathKey[I]==W then return;end;if P==nil then table.insert(l._pendingOrder,I);end;l._pendingUpdateByPathKey[I]={Value=W};end
																																																																																								index2._Flush = function(l)if l._isFlushing then return;end;l._isFlushing=true;while#l._pendingOrder>0 do local I,W=l._pendingOrder,l._pendingUpdateByPathKey;l._pendingUpdateByPathKey={};l._pendingOrder={};for N,N in I,nil,nil do local I,P=W[N],l._listenerByPathKey[N];if P then P:Fire(I.Value);end;l._lastPublishedValueByPathKey[N]=I.Value;end;end;l._isFlushing=false;end
																																																																																								index2._FireForChangedPaths = function(...) end
																																																																																								index2._FireListenersOnly = function(...) end
																																																																																								index2.Get = function(I,W,N)return  v117 .NavigateTo(I.Data,W,N);end
																																																																																								index2.Set = function(I,W,N)local P=I._middleware;local a=P.Set;N=if a~=nil then(a(P,W,N))else N;local e=I.Data;a= v117 .NavigateTo(e,W,true)~=N;if a then  v117 .Set(e,W,N);end;e=P.SetApplied;if e~=nil then e(P,W,N);end;if a then I:_FireForChangedPaths({W});end;e= v117 .PathToKey(W);a=I._liveValueByPathKey[e];if a~=nil then a.Base=N;end;if I._pendingUpdateByPathKey[e]==nil then I:_FireChanged(e,N);end;I:_Flush();if not I._isLoading then I.Changed:Fire(W,N);end;end
																																																																																								index2.SetLiveOverride = function(I,W,N)local P= v117 .PathToKey(W);if I._liveValueByPathKey[P]==nil then I._liveValueByPathKey[P]={Path=W,Base= v117 .NavigateTo(I.Data,W,true)};end; v117 .Set(I.Data,W,N);I:_FireListenersOnly(W,N);end

																																																																																								index2.ClearLiveOverride = function(arg, arg2)
																																																																																									local v122 = v117.PathToKey(arg2)
																																																																																									local v123 = arg._liveValueByPathKey[v122]
																																																																																									if v123 == nil then
																																																																																										return
																																																																																									end
																																																																																									arg._liveValueByPathKey[v122] = nil
																																																																																									v117.Set(arg.Data, arg2, v123.Base)
																																																																																									arg:_FireListenersOnly(arg2, v123.Base)
																																																																																								end

																																																																																								index2.GetBase = function(I,W)local N=I._liveValueByPathKey[ v117 .PathToKey(W)];if N~=nil then return N.Base;end;return  v117 .NavigateTo(I.Data,W,true);end

																																																																																								index2.RebaseLiveOverride = function(arg, arg2, base)
																																																																																									local v122 = arg._liveValueByPathKey[v117.PathToKey(arg2)]
																																																																																									if v122 == nil then
																																																																																										return v86[153]
																																																																																									end
																																																																																									v122.Base = base
																																																																																									return true
																																																																																								end

																																																																																								index2.PublishPath = function(arg, arg2)
																																																																																									arg:_FireListenersOnly(arg2, v117.NavigateTo(arg.Data, arg2, true))
																																																																																								end

																																																																																								index2._PersistableData = function(arg)
																																																																																									local data = arg.Data
																																																																																									local flag19 = true

																																																																																									if next(arg._liveValueByPathKey) ~= nil then
																																																																																										data = v121(data)

																																																																																										for _, v122 in arg._liveValueByPathKey, nil, nil do
																																																																																											v117.Set(data, v122.Path, v122.Base)
																																																																																										end

																																																																																										flag19 = false
																																																																																									end

																																																																																									local middleware = arg._middleware
																																																																																									local persistable = middleware.Persistable
																																																																																									local v122

																																																																																									if persistable ~= nil then
																																																																																										v122 = persistable(middleware, data, flag19)
																																																																																									else
																																																																																										v122 = data
																																																																																									end

																																																																																									return v122
																																																																																								end

																																																																																								index2.SaveToFile = function(arg, arg2, arg3)
																																																																																									arg._configManager:SetData(arg:_PersistableData())
																																																																																									return arg._configManager:SaveToFile(arg2, arg3)
																																																																																								end

																																																																																								index2.CreateDefault = function(arg, arg2)
																																																																																									return arg._configManager:SaveDefaultToFile(arg2, v86[34])
																																																																																								end

																																																																																								local fn36 = nil

																																																																																								fn36 = function(arg, arg2)
																																																																																									if type(arg) ~= "table" or isAtomic(arg) then
																																																																																										local v122 = (arg2 == nil and { arg } or { arg2 })[1]
																																																																																										return (type(v122) == "table" and { (v121(v122)) } or { v122 })[1]
																																																																																									end

																																																																																									if type(arg2) ~= "table" then
																																																																																										return v121(arg)
																																																																																									end
																																																																																									local v122 = table.clone(arg)

																																																																																									for k, v123 in arg, nil, nil do
																																																																																										v122[k] = fn36(v123, arg2[k])
																																																																																									end

																																																																																									for k, v123 in arg2, nil, nil do
																																																																																										if arg[k] == nil then
																																																																																											v122[k] = (type(v123) == "table" and { (v121(v123)) } or { v123 })[v86[63]]
																																																																																										end
																																																																																									end

																																																																																									return v122
																																																																																								end

																																																																																								local fn37 = nil

																																																																																								fn37 = function(arg, arg2, arg3, arg4, arg5)
																																																																																									for k, v122 in arg, nil, nil do
																																																																																										if not (arg2 ~= nil and arg2[k] ~= nil) then
																																																																																											table.insert(arg4, k)
																																																																																											local v123 = (arg3 ~= nil and { arg3[k] } or { nil })[1]

																																																																																											if type(v122) == "table" and not isAtomic(v122) and (v123 == nil or type(v123) == "table" and not isAtomic(v123)) then
																																																																																												fn37(v122, nil, v123, arg4, arg5)
																																																																																											end

																																																																																											arg[k] = nil
																																																																																											table.insert(arg5, table.clone(arg4))
																																																																																											table.remove(arg4)
																																																																																										end
																																																																																									end

																																																																																									if arg2 == nil then
																																																																																										return
																																																																																									end

																																																																																									for k, v122 in arg2, nil, nil do
																																																																																										table.insert(arg4, k)
																																																																																										local tbl19 = arg[k]
																																																																																										local v123 = (arg3 ~= nil and { arg3[k] } or { nil })[1]

																																																																																										if type(v122) == "table" and not isAtomic(v122) and (v123 == nil or type(v123) == "table" and not isAtomic(v123)) then
																																																																																											if type(tbl19) ~= "table" or isAtomic(tbl19) then
																																																																																												tbl19 = {}
																																																																																												arg[k] = tbl19
																																																																																												table.insert(arg5, table.clone(arg4))
																																																																																											end

																																																																																											fn37(tbl19, v122, v123, arg4, arg5)
																																																																																										elseif tbl19 ~= v122 then
																																																																																											if type(tbl19) == "table" and not isAtomic(tbl19) and (v123 == nil or type(v123) == "table" and not isAtomic(v123)) then
																																																																																												fn37(tbl19, nil, v123, arg4, arg5)
																																																																																											end

																																																																																											arg[k] = v122
																																																																																											table.insert(arg5, table.clone(arg4))
																																																																																										end

																																																																																										table.remove(arg4)
																																																																																									end
																																																																																								end

																																																																																								index2._ApplyLoadedData = function(arg, arg2)
																																																																																									local v122 = fn36(arg.Default, arg2)
																																																																																									arg._isLoading = true
																																																																																									table.clear(arg._lastPublishedValueByPathKey)
																																																																																									table.clear(arg._pendingUpdateByPathKey)
																																																																																									table.clear(arg._pendingOrder)
																																																																																									table.clear(arg._liveValueByPathKey)
																																																																																									local tbl19 = {}
																																																																																									fn37(arg.Data, v122, arg.Default, {}, tbl19)
																																																																																									local loaded = arg._middleware.Loaded

																																																																																									if loaded ~= nil then
																																																																																										loaded(arg._middleware, v122)
																																																																																									end

																																																																																									arg:_FireForChangedPaths(tbl19)
																																																																																									arg:_Flush()
																																																																																									arg.Reloaded:Fire()
																																																																																									arg._isLoading = v86[153]
																																																																																								end

																																																																																								index2.LoadFromFile = function(arg, arg2)
																																																																																									local v122 = arg._configManager:LoadFromFile(arg2)
																																																																																									if not v122.Ok then
																																																																																										return v118.err("ReactiveStore", "LoadFromFile", v122.Error.Detail)
																																																																																									end
																																																																																									local value = v122.Value
																																																																																									arg:_ApplyLoadedData(value)
																																																																																									return v118.ok(value)
																																																																																								end

																																																																																								index2.ExportToJson = function(arg)
																																																																																									local v122 = arg._configManager:ToJson(arg:_PersistableData())
																																																																																									if not v122.Ok then
																																																																																										return v118.err("ReactiveStore", v86[99], v122.Error.Detail)
																																																																																									end
																																																																																									return v118.ok(v122.Value)
																																																																																								end

																																																																																								index2.InstallFromJson = function(arg, arg2, arg3)
																																																																																									local v122 = arg._configManager:FromJson(arg3)
																																																																																									if not v122.Ok then
																																																																																										return v118.err("ReactiveStore", "InstallFromJson", v122.Error.Detail)
																																																																																									end
																																																																																									local v123 = arg._configManager:SaveToFile(arg2)
																																																																																									if not v123.Ok then
																																																																																										return v118.err(v86[2], "InstallFromJson", v123.Error.Detail)
																																																																																									end
																																																																																									return v118.VoidOk
																																																																																								end

																																																																																								index2.LoadFromJson = function(arg, arg2)
																																																																																									local v122 = arg._configManager:FromJson(arg2)
																																																																																									if not v122.Ok then
																																																																																										return v118.err(v86[2], "LoadFromJson", v122.Error.Detail)
																																																																																									end
																																																																																									arg:_ApplyLoadedData(v122.Value)
																																																																																									return v118.VoidOk
																																																																																								end

																																																																																								index2.DeleteFile = function(arg, arg2)
																																																																																									local v122 = arg._configManager:Delete(arg2)
																																																																																									if not v122.Ok then
																																																																																										return v118.err("ReactiveStore", "DeleteFile", v122.Error.Detail)
																																																																																									end
																																																																																									return v118.VoidOk
																																																																																								end

																																																																																								index2.AllConfigs = function(arg)
																																																																																									return arg._configManager:AllConfigs()
																																																																																								end

																																																																																								index2.Destroy = function(arg)
																																																																																									arg._trove:Destroy()
																																																																																								end

																																																																																								return index2
																																																																																							end

																																																																																							tbl17.l = function()
																																																																																								local l = tbl17.cache.l

																																																																																								if not l then
																																																																																									l = { c = fn35() }
																																																																																									tbl17.cache.l = l
																																																																																								end

																																																																																								return l.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						do
																																																																																							local function fn35()
																																																																																								local tbl18

																																																																																								tbl18 = {
																																																																																									normalize = function(arg)
																																																																																										local tbl19 = {}

																																																																																										for k, v115 in arg, nil, nil do
																																																																																											local kind = typeof(v115)
																																																																																											local tbl20

																																																																																											if kind == "Color3" then
																																																																																												tbl20 = { __type = v86[115], R = v115.R, G = v115.G, B = v115.B }
																																																																																											elseif kind == "EnumItem" then
																																																																																												tbl20 = { __type = "EnumItem", EnumType = tostring(v115.EnumType), Name = v115.Name }
																																																																																											elseif kind == "Vector3" then
																																																																																												tbl20 = { __type = v86[20], X = v115.X, Y = v115.Y, Z = v115.Z }
																																																																																											elseif kind == v86[127] then
																																																																																												tbl20 = { __type = "CFrame", Components = { v115:GetComponents() } }
																																																																																											elseif kind == "ColorSequence" then
																																																																																												local v116 = table.create(#v115.Keypoints)

																																																																																												for k2, v117 in v115.Keypoints, nil, nil do
																																																																																													v116[k2] = { Time = v117.Time, R = v117.Value.R, G = v117.Value.G, B = v117.Value.B }
																																																																																												end

																																																																																												tbl20 = { __type = v86[93], Keypoints = v116 }
																																																																																											elseif kind == "NumberSequence" then
																																																																																												local v116 = table.create(#v115.Keypoints)

																																																																																												for k2, v117 in v115.Keypoints, nil, nil do
																																																																																													v116[k2] = { Time = v117.Time, Value = v117.Value, Envelope = v117.Envelope }
																																																																																												end

																																																																																												tbl20 = { __type = "NumberSequence", Keypoints = v116 }
																																																																																											elseif kind == "table" then
																																																																																												tbl20 = tbl18.normalize(v115)
																																																																																											else
																																																																																												tbl20 = v115
																																																																																											end

																																																																																											tbl19[k] = tbl20
																																																																																										end

																																																																																										return tbl19
																																																																																									end,
																																																																																									parse = function(arg)
																																																																																										local tbl19 = {}

																																																																																										for k, v115 in arg, nil, nil do
																																																																																											if typeof(v115) == "table" then
																																																																																												local type_ = v115.__type

																																																																																												if type(type_) ~= "string" then
																																																																																													tbl19[k] = tbl18.parse(v115)
																																																																																												else
																																																																																													if type_ == "Color3" then
																																																																																														v115 = Color3.new(v115.R, v115.G, v115.B)
																																																																																													elseif type_ == "EnumItem" then
																																																																																														v115 = Enum[v115.EnumType][v115.Name]
																																																																																													elseif type_ == "Vector3" then
																																																																																														v115 = Vector3.new(v115.X, v115.Y, v115.Z)
																																																																																													elseif type_ == "CFrame" then
																																																																																														v115 = CFrame.new(unpack(v115.Components))
																																																																																													elseif type_ == v86[93] then
																																																																																														local v116 = table.create(#v115.Keypoints)

																																																																																														for k2, v117 in v115.Keypoints, nil, nil do
																																																																																															v116[k2] = ColorSequenceKeypoint.new(v117.Time, Color3.new(v117.R, v117.G, v117.B))
																																																																																														end

																																																																																														v115 = ColorSequence.new(v116)
																																																																																													elseif type_ == "NumberSequence" then
																																																																																														local v116 = table.create(#v115.Keypoints)

																																																																																														for k2, v117 in v115.Keypoints, nil, nil do
																																																																																															v116[k2] = NumberSequenceKeypoint.new(v117.Time, v117.Value, v117.Envelope)
																																																																																														end

																																																																																														v115 = NumberSequence.new(v116)
																																																																																													end

																																																																																													tbl19[k] = v115
																																																																																												end

																																																																																												continue
																																																																																											end

																																																																																											tbl19[k] = v115
																																																																																										end

																																																																																										return tbl19
																																																																																									end,
																																																																																								}

																																																																																								return tbl18
																																																																																							end

																																																																																							tbl17.m = function()
																																																																																								local m = tbl17.cache.m

																																																																																								if not m then
																																																																																									local m2 = { c = fn35() }
																																																																																									tbl17.cache.m = m2
																																																																																									m = m2
																																																																																								end

																																																																																								return m.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						do
																																																																																							local function fn35()
																																																																																								local GlobalTrove = tbl17.k().new("GlobalTrove")

																																																																																								_G.UnloadKiciahook = function()
																																																																																									GlobalTrove:Destroy()
																																																																																								end

																																																																																								return GlobalTrove
																																																																																							end

																																																																																							tbl17.n = function()
																																																																																								local n = tbl17.cache.n

																																																																																								if not n then
																																																																																									local n33 = { c = fn35() }
																																																																																									tbl17.cache.n = n33
																																																																																									n = n33
																																																																																								end

																																																																																								return n.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						local function fn35()
																																																																																							return nil
																																																																																						end

																																																																																						tbl17.o = function()
																																																																																							local o = tbl17.cache.o

																																																																																							if not o then
																																																																																								local o2 = { c = fn35() }
																																																																																								tbl17.cache.o = o2
																																																																																								o = o2
																																																																																							end

																																																																																							return o.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					do
																																																																																						do
																																																																																							local function fn35()
																																																																																								return nil
																																																																																							end

																																																																																							tbl17.p = function()
																																																																																								local p = tbl17.cache.p

																																																																																								if not p then
																																																																																									p = { c = fn35() }
																																																																																									tbl17.cache.p = p
																																																																																								end

																																																																																								return p.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						local function fn35()
																																																																																							return nil
																																																																																						end

																																																																																						tbl17.q = function()
																																																																																							local q = tbl17.cache.q

																																																																																							if not q then
																																																																																								local q2 = { c = fn35() }
																																																																																								tbl17.cache.q = q2
																																																																																								q = q2
																																																																																							end

																																																																																							return q.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					do
																																																																																						local function fn35()
																																																																																							tbl17.l()
																																																																																							tbl17.g()
																																																																																							tbl17.k()
																																																																																							return {}
																																																																																						end

																																																																																						tbl17.r = function()
																																																																																							local r = tbl17.cache.r

																																																																																							if not r then
																																																																																								r = { c = fn35() }
																																																																																								tbl17.cache.r = r
																																																																																							end

																																																																																							return r.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					do
																																																																																						local function fn35()return table.freeze({Medium=Font.new("rbxassetid://12187365364",Enum.FontWeight.Medium,Enum.FontStyle.Normal),SemiBold=Font.new("rbxassetid://12187365364",Enum.FontWeight.SemiBold,Enum.FontStyle.Normal),Bold=Font.new("rbxassetid://12187365364",Enum.FontWeight.Bold,Enum.FontStyle.Normal)});end

																																																																																						tbl17.s = function()
																																																																																							local s = tbl17.cache.s

																																																																																							if not s then
																																																																																								local s2 = { c = fn35() }
																																																																																								tbl17.cache.s = s2
																																																																																								s = s2
																																																																																							end

																																																																																							return s.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					local function fn35()return{Players=cloneref(game:GetService("Players")),GuiService=cloneref(game:GetService("GuiService")),UserInputService=cloneref(game:GetService("UserInputService")),RunService=cloneref(game:GetService("RunService")),TweenService=cloneref(game:GetService("TweenService")),HttpService=cloneref(game:GetService("HttpService")),CoreGui=cloneref(game:GetService("CoreGui"))};end

																																																																																					tbl17.t = function()
																																																																																						local t = tbl17.cache.t

																																																																																						if not t then
																																																																																							if n26 >= 4809 then
																																																																																								while true do
																																																																																								end
																																																																																							else
																																																																																								local t2 = { c = fn35() }
																																																																																								tbl17.cache.t = t2
																																																																																								t = t2
																																																																																							end
																																																																																						end

																																																																																						return t.c
																																																																																					end
																																																																																				end
																																																																																			end

																																																																																			do
																																																																																				do
																																																																																					do
																																																																																						do
																																																																																							do
																																																																																								local function fn35()local I= tbl17 .t();local l,W,N=I.GuiService,I.UserInputService,{DesignSize=UDim2.fromOffset(919,643),MinSize=UDim2.fromOffset(700,400),Scale=1};local function I()return workspace.CurrentCamera;end;local function P(a)if not a then return false;end;a=I();if a==nil then return false;end;local I=a.ViewportSize;return math.min(I.X,I.Y)>500;end;local function I(a)if a then return false;end;a=W.PreferredInput;if a==Enum.PreferredInput.Touch then return true;end;if a==Enum.PreferredInput.KeyboardAndMouse or a==Enum.PreferredInput.Gamepad then return false;end;a=W:GetLastInputType();if a==Enum.UserInputType.Touch then return true;end;if a==Enum.UserInputType.MouseButton1 or a==Enum.UserInputType.MouseButton2 or a==Enum.UserInputType.MouseMovement or a==Enum.UserInputType.Keyboard then return false;end;return W.TouchEnabled and not W.KeyboardEnabled;end;local a=l:IsTenFootInterface();local l=I(a);local I;N.IsMobile=function()return l;end;N.ForceMobileLayout=function(e)l=true;I=e==true;end;N.IsTablet=function()local l=I;if l==nil then l=P(N.IsMobile());I=l;end;return l;end;N.HasTouch=function()return not a and W.TouchEnabled;end;N.WantsMobileButtons=function()return N.HasTouch()or(N.IsMobile());end;return N;end

																																																																																								tbl17.u = function()
																																																																																									local u = tbl17.cache.u

																																																																																									if not u then
																																																																																										local u2 = { c = fn35() }
																																																																																										tbl17.cache.u = u2
																																																																																										u = u2
																																																																																									end

																																																																																									return u.c
																																																																																								end
																																																																																							end
																																																																																						end

																																																																																						do
																																																																																							local function fn35()local I,W,N,P= tbl17 .u(),{},table.freeze({IsCompact=false,Rail=table.freeze({Width=100,HeaderHeight=85,TabsTop=102,TabSize=66,TabGap=4,TabIconSize=26,LogoSize=Vector2.new(48,37),ShowLabels=true}),Page=table.freeze({HasTitleBlock=true,OuterInset=18,HorizontalInset=17,HeaderHeight=85,TabsHeight=84,BottomInset=17,TitleTextSize=18,DescriptionTextSize=13,TabMinWidth=50,TabHeight=50,TabIconSize=24,TabTextSize=16,TabGap=14,TabPaddingLeft=13,TabPaddingRight=16,SearchCollapsedWidth=90,SearchExpandedWidth=260,SearchHeight=33,SearchRightInset=14}),Navigation=table.freeze({CueDepth=12,RevealPadding=4,VisibilityEpsilon=1}),Grid=table.freeze({Gap=17,MinColumnWidth=220}),Section=table.freeze({Gap=17,TitleGap=16,InnerPadding=12,ElementGap=12,GroupGap=12,TitleTextSize=16,MultiHeaderHeight=45,MultiHeaderGap=12,MultiHeaderPadding=12,MultiPaneTop=57,MultiTabTextSize=16}),Row=table.freeze({Height=24,TextSize=16,ControlVerticalInset=0,ControlHeight=22,AttachmentGap=11,ListRowHeight=26}),Button=table.freeze({RowHeight=24,VisualHeight=22,Gap=13})}),table.freeze({IsCompact=true,Rail=table.freeze({Width=52,HeaderHeight=48,TabsTop=52,TabSize=44,TabGap=2,TabIconSize=20,LogoSize=Vector2.new(24,19),ShowLabels=false}),Page=table.freeze({HasTitleBlock=true,OuterInset=12,HorizontalInset=12,HeaderHeight=44,TabsHeight=40,BottomInset=12,TitleTextSize=16,DescriptionTextSize=10,TabMinWidth=44,TabHeight=34,TabIconSize=18,TabTextSize=13,TabGap=6,TabPaddingLeft=8,TabPaddingRight=10,SearchCollapsedWidth=32,SearchExpandedWidth=220,SearchHeight=32,SearchRightInset=8}),Navigation=table.freeze({CueDepth=12,RevealPadding=4,VisibilityEpsilon=1}),Grid=table.freeze({Gap=12,MinColumnWidth=220}),Section=table.freeze({Gap=12,TitleGap=8,InnerPadding=8,ElementGap=8,GroupGap=8,TitleTextSize=15,MultiHeaderHeight=36,MultiHeaderGap=8,MultiHeaderPadding=8,MultiPaneTop=44,MultiTabTextSize=13}),Row=table.freeze({Height=32,TextSize=14,ControlVerticalInset=4,ControlHeight=24,AttachmentGap=8,ListRowHeight=32}),Button=table.freeze({RowHeight=32,VisualHeight=30,Gap=8})});local l=table.freeze({IsCompact=true,Rail=P.Rail,Page=table.freeze({HasTitleBlock=false,OuterInset=12,HorizontalInset=12,HeaderHeight=0,TabsHeight=44,BottomInset=12,TitleTextSize=16,DescriptionTextSize=10,TabMinWidth=44,TabHeight=36,TabIconSize=18,TabTextSize=14,TabGap=6,TabPaddingLeft=8,TabPaddingRight=10,SearchCollapsedWidth=32,SearchExpandedWidth=220,SearchHeight=32,SearchRightInset=8}),Navigation=P.Navigation,Grid=table.freeze({Gap=12,MinColumnWidth=330}),Section=P.Section,Row=table.freeze({Height=40,TextSize=15,ControlVerticalInset=6,ControlHeight=28,AttachmentGap=8,ListRowHeight=40}),Button=table.freeze({RowHeight=40,VisualHeight=36,Gap=8})});W.get=function()if not I.IsMobile()then return N;end;if I.IsTablet()then return P;end;return l;end;return W;end

																																																																																							tbl17.v = function()
																																																																																								local v115 = tbl17.cache.v

																																																																																								if not v115 then
																																																																																									v115 = { c = fn35() }
																																																																																									tbl17.cache.v = v115
																																																																																								end

																																																																																								return v115.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						do
																																																																																							local function fn35(...) end

																																																																																							tbl17.w = function()
																																																																																								local w = tbl17.cache.w

																																																																																								if not w then
																																																																																									local w2 = { c = fn35() }
																																																																																									tbl17.cache.w = w2
																																																																																									w = w2
																																																																																								end

																																																																																								return w.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						do
																																																																																							local function fn35() tbl17 .k();local I,W= tbl17 .t(), tbl17 .w();local l,N,P=I.UserInputService,{},setmetatable({},{__mode="k"});N.suppressActivation=function(I)P[I]=true;end;local I=W.findScrollingAncestor;N.connectPress=function(a,e,c,E)local p,T,t,x=false;local function S(J)if not p then return;end;p,T,t=false,nil,nil;if x~=nil then x:Disconnect();x=nil;end;E(J);end;a:Add({Destroy=function()p,T,t=false,nil,nil;if x~=nil then x:Disconnect();x=nil;end;end});a:Connect(e.InputBegan,function(E)if p then return;end;local J=E.UserInputType;if J~=Enum.UserInputType.MouseButton1 and J~=Enum.UserInputType.Touch then return;end;T,t,p=E,J,true;c();x=l.InputEnded:Connect(function(c)if T==nil then return;end;if not W.matchesPointerDrag(c,T,Enum.UserInputType.MouseButton1)then return;end;S(false);end);end);a:Connect(e.MouseLeave,function()if t==Enum.UserInputType.MouseButton1 then S(true);end;end);end;N.connectClick=function(a,e,c)if e:IsA("GuiButton")then a:Connect(e.Activated,function(E,p)if P[E]then P[E]=nil;return;end;c();end);return;end;a:Connect(e.InputBegan,function(P)local a=P.UserInputType;if a==Enum.UserInputType.MouseButton1 or a==Enum.UserInputType.Touch then c();end;end);end;N.connectDrag=function(P,a,e,c)local E,p,T,t,x=c or function(c,c)end;local c,S,J,B,X=false,false,0;local function H()J+=1;if B~=nil then B:Disconnect();B=nil;end;if X~=nil then X:Disconnect();X=nil;end;p,T,t,x,c,S=nil,nil,nil,nil,false,false;end;local function k(D)local Q=c;H();if Q then E(false,D);end;end;local function D()if p==nil or c or S then return;end;c=true;E(true,false);end;P:Add({Destroy=H});P:Connect(a.InputBegan,function(P)local E=P.UserInputType;if E~=Enum.UserInputType.MouseButton1 and E~=Enum.UserInputType.Touch then return;end;H();p=P;T=P.Position;t=I(a);x=t and t.CanvasPosition or nil;J+=1;local I=J;task.delay(0.3,function()if J==I then D();end;end);X=l.InputEnded:Connect(function(I)if p==nil then return;end;if not W.matchesPointerDrag(I,p,Enum.UserInputType.MouseButton1)then return;end;J+=1;k(false);end);B=l.InputChanged:Connect(function(l)if p==nil or S then return;end;if not W.matchesPointerDrag(l,p,Enum.UserInputType.MouseMovement)then return;end;local I,W=t,x;if I~=nil and W~=nil then local P=I.CanvasPosition-W;if P.X*P.X+P.Y*P.Y>0.25 then if c then k(true);else S=true;J+=1;end;return;end;end;if not c and T~=nil then W,I=l.Position.X-T.X,l.Position.Y-T.Y;if W*W+I*I>=100 then D();end;end;if c then e(l);end;end);end);end;return N;end

																																																																																							tbl17.x = function()
																																																																																								local x = tbl17.cache.x

																																																																																								if not x then
																																																																																									x = { c = fn35() }
																																																																																									tbl17.cache.x = x
																																																																																								end

																																																																																								return x.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						local function fn35()
																																																																																							tbl17.k()
																																																																																							tbl17.r()
																																																																																							local color = Color3.fromRGB(255, v86[108], v86[108])
																																																																																							local tweenInfo = TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

																																																																																							return { attach = function(arg, arg2, parent, arg3)
																																																																																								local trigger = parent
																																																																																								local cornerRadius = nil

																																																																																								if arg3 ~= nil then
																																																																																									trigger = arg3.Trigger or parent
																																																																																									cornerRadius = arg3.CornerRadius
																																																																																								end

																																																																																								local frame = Instance.new("Frame")
																																																																																								frame.BackgroundTransparency = v86[63]
																																																																																								frame.Size = UDim2.fromScale(1, 1)
																																																																																								frame.BorderSizePixel = v86[186]
																																																																																								frame.ClipsDescendants = v86[34]
																																																																																								frame.ZIndex = 0
																																																																																								frame.Parent = parent

																																																																																								if cornerRadius ~= nil then
																																																																																									local uiCorner = Instance.new("UICorner")
																																																																																									uiCorner.CornerRadius = UDim.new(0, cornerRadius)
																																																																																									uiCorner.Parent = frame
																																																																																								end

																																																																																								arg2:Connect(trigger.InputBegan, function(arg4)
																																																																																									local userInputType = arg4.UserInputType
																																																																																									if userInputType ~= Enum.UserInputType.MouseButton1 and userInputType ~= Enum.UserInputType.Touch then
																																																																																										return
																																																																																									end
																																																																																									local absoluteSize = parent.AbsoluteSize
																																																																																									local absolutePosition = parent.AbsolutePosition
																																																																																									local n = arg4.Position.X - absolutePosition.X
																																																																																									local n33 = arg4.Position.Y - absolutePosition.Y
																																																																																									local n34 = math.max(absoluteSize.X, absoluteSize.Y) * v86[49]
																																																																																									local frame2 = Instance.new("Frame")
																																																																																									frame2.AnchorPoint = Vector2.new(0.5, v86[101])
																																																																																									frame2.Position = UDim2.fromOffset(n, n33)
																																																																																									frame2.Size = UDim2.fromOffset(0, 0)
																																																																																									frame2.BackgroundColor3 = color
																																																																																									frame2.BackgroundTransparency = 0.84
																																																																																									frame2.BorderSizePixel = 0
																																																																																									frame2.Parent = frame
																																																																																									local uiCorner = Instance.new("UICorner")
																																																																																									uiCorner.CornerRadius = UDim.new(v86[63], 0)
																																																																																									uiCorner.Parent = frame2
																																																																																									local v115 = arg:Tween(frame2, { Size = UDim2.fromOffset(n34, n34), BackgroundTransparency = 1 }, tweenInfo)

																																																																																									if v115 ~= nil then
																																																																																										v115.Completed:Once(function()
																																																																																											frame2:Destroy()
																																																																																										end)
																																																																																									else
																																																																																										frame2:Destroy()
																																																																																									end
																																																																																								end)
																																																																																							end }
																																																																																						end

																																																																																						tbl17.y = function()
																																																																																							local y = tbl17.cache.y

																																																																																							if not y then
																																																																																								local y2 = { c = fn35() }
																																																																																								tbl17.cache.y = y2
																																																																																								y = y2
																																																																																							end

																																																																																							return y.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					do
																																																																																						do
																																																																																							local function fn35()return{Accent=Color3.fromRGB(255,100,95),Outline=Color3.fromRGB(44,45,48),Background=Color3.fromRGB(14,13,12),ElementBackground=Color3.fromRGB(19,18,17),TabButtonSelected=Color3.fromRGB(27,25,24),Unselected=Color3.fromRGB(146,146,150),TextColor=Color3.fromRGB(238,237,236),ToggleCircleUnselected=Color3.fromRGB(44,41,39),ToggleBackgroundUnselected=Color3.fromRGB(20,19,18),GradientTop=Color3.fromRGB(26,24,22),GradientMid=Color3.fromRGB(15,14,13),GradientDark=Color3.fromRGB(11,10,10),GradientDeep=Color3.fromRGB(8,8,7),TabHighlight=Color3.fromRGB(43,38,36),TabShadow=Color3.fromRGB(32,28,27)};end

																																																																																							tbl17.z = function()
																																																																																								local z = tbl17.cache.z

																																																																																								if not z then
																																																																																									local z2 = { c = fn35() }
																																																																																									tbl17.cache.z = z2
																																																																																									z = z2
																																																																																								end

																																																																																								return z.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						local function fn35()
																																																																																							tbl17.k()
																																																																																							local v115 = tbl17.z()
																																																																																							local index2 = {}
																																																																																							index2.__index = index2
																																																																																							local tbl18 = {}
																																																																																							local tbl19 = { Tokens = v115 }

																																																																																							local function fn36(arg, arg2)
																																																																																								local n = #arg
																																																																																								if n == 1 then
																																																																																									return ColorSequence.new(v115[arg[1]])
																																																																																								end
																																																																																								local tbl20 = {}

																																																																																								for k, v116 in arg, nil, nil do
																																																																																									local n33

																																																																																									if arg2 ~= nil then
																																																																																										n33 = arg2[k]
																																																																																									else
																																																																																										n33 = (k - 1) / (n - 1)
																																																																																									end

																																																																																									tbl20[k] = ColorSequenceKeypoint.new(n33, v115[v116])
																																																																																								end

																																																																																								return ColorSequence.new(tbl20)
																																																																																							end

																																																																																							local function fn37(arg, arg2)
																																																																																								if arg._tokenSet[arg2] then
																																																																																									return
																																																																																								end
																																																																																								arg._tokenSet[arg2] = true
																																																																																								local tbl20 = tbl18[arg2]

																																																																																								if tbl20 == nil then
																																																																																									tbl20 = {}
																																																																																									tbl18[arg2] = tbl20
																																																																																								end

																																																																																								tbl20[arg] = v86[34]
																																																																																							end

																																																																																							index2.new = function()
																																																																																								return setmetatable({ _propBindingsByToken = {}, _gradients = {}, _statefulApplyByToken = {}, _tokenSet = {} }, index2)
																																																																																							end

																																																																																							index2.Bind = function(arg, arg2, arg3, arg4)
																																																																																								arg2[arg3] = v115[arg4]
																																																																																								local tbl20 = arg._propBindingsByToken[arg4]

																																																																																								if tbl20 == nil then
																																																																																									tbl20 = {}
																																																																																									arg._propBindingsByToken[arg4] = tbl20
																																																																																								end

																																																																																								table.insert(tbl20, { Instance = arg2, Property = arg3 })
																																																																																								fn37(arg, arg4)
																																																																																							end

																																																																																							index2.BindGradient = function(arg, arg2, arg3, arg4)
																																																																																								arg2.Color = fn36(arg3, arg4)
																																																																																								table.insert(arg._gradients, { Gradient = arg2, Tokens = arg3, Times = arg4 })

																																																																																								for _, v116 in arg3, nil, nil do
																																																																																									fn37(arg, v116)
																																																																																								end
																																																																																							end

																																																																																							index2.BindStateful = function(arg, arg2, arg3)
																																																																																								local tbl20 = arg._statefulApplyByToken[arg2]

																																																																																								if tbl20 == nil then
																																																																																									tbl20 = {}
																																																																																									arg._statefulApplyByToken[arg2] = tbl20
																																																																																								end

																																																																																								table.insert(tbl20, arg3)
																																																																																								fn37(arg, arg2)
																																																																																							end

																																																																																							index2.Destroy = function(arg)
																																																																																								for k in arg._tokenSet, nil, nil do
																																																																																									local v116 = tbl18[k]

																																																																																									if v116 ~= nil then
																																																																																										v116[arg] = nil
																																																																																									end
																																																																																								end

																																																																																								table.clear(arg._tokenSet)
																																																																																								table.clear(arg._propBindingsByToken)
																																																																																								table.clear(arg._gradients)
																																																																																								table.clear(arg._statefulApplyByToken)
																																																																																							end

																																																																																							tbl19.newBatch = function(arg)
																																																																																								local v116 = index2.new()

																																																																																								if arg ~= nil then
																																																																																									arg:Add(v116)
																																																																																								end

																																																																																								return v116
																																																																																							end

																																																																																							tbl19.get = function(arg)
																																																																																								return v115[arg]
																																																																																							end

																																																																																							local tbl20 = { "GradientTop", v86[187], v86[70], v86[141] }
																																																																																							local tbl21 = {}
																																																																																							local background = v115.Background

																																																																																							for _, v116 in tbl20, nil, nil do
																																																																																								local v117 = v115[v116]
																																																																																								tbl21[v116] = { R = v117.R / background.R, G = v117.G / background.G, B = v117.B / background.B }
																																																																																							end

																																																																																							local function fn38(I,W)if  v115 [I]==W then return;end; v115 [I]=W;local N= tbl18 [I];if N==nil then return;end;for P in N,nil,nil do local N=P._propBindingsByToken[I];if N~=nil then for a,a in N,nil,nil do a.Instance[a.Property]=W;end;end;for a,a in P._gradients,nil,nil do if table.find(a.Tokens,I)~=nil then a.Gradient.Color= fn36 (a.Tokens,a.Times);end;end;N=P._statefulApplyByToken[I];if N~=nil then for l,l in N,nil,nil do l(W);end;end;end;end

																																																																																							local function fn39(arg)
																																																																																								for _, v116 in tbl20, nil, nil do
																																																																																									local v117 = tbl21[v116]
																																																																																									fn38(v116, Color3.new(math.clamp(arg.R * v117.R, v86[186], 1), math.clamp(arg.G * v117.G, 0, 1), math.clamp(arg.B * v117.B, 0, 1)))
																																																																																								end
																																																																																							end

																																																																																							tbl19.refresh = function(arg, arg2)
																																																																																								fn38(arg, arg2)

																																																																																								if arg == "Background" then
																																																																																									fn39(arg2)
																																																																																								end
																																																																																							end

																																																																																							return tbl19
																																																																																						end

																																																																																						tbl17.A = function()
																																																																																							local a = tbl17.cache.A

																																																																																							if not a then
																																																																																								local a2 = { c = fn35() }
																																																																																								tbl17.cache.A = a2
																																																																																								a = a2
																																																																																							end

																																																																																							return a.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					do
																																																																																						local function fn35()
																																																																																							local v115 = tbl17.k()
																																																																																							tbl17.r()
																																																																																							local v116 = tbl17.s()
																																																																																							local v117 = tbl17.v()
																																																																																							local v118 = tbl17.A()
																																																																																							local index2 = {}
																																																																																							index2.__index = index2

																																																																																							index2.new = function(arg, arg2)
																																																																																								local v119 = v117.get()
																																																																																								local flag19 = arg2.Bare == v86[34]
																																																																																								local height = arg2.Height or v119.Row.Height
																																																																																								local n

																																																																																								if v119.IsCompact and not flag19 then
																																																																																									n = math.max(height, v119.Row.Height)
																																																																																								else
																																																																																									n = height
																																																																																								end

																																																																																								return setmetatable({
																																																																																									_menu = arg,
																																																																																									_metrics = v119,
																																																																																									Label = arg2.Label,
																																																																																									_tooltip = arg2.Tooltip,
																																																																																									_bare = flag19,
																																																																																									_isBareFlexRoot = false,
																																																																																									_visible = v86[34],
																																																																																									_height = n,
																																																																																									_mediumTitle = arg2.MediumTitle == true,
																																																																																									_rightOffset = arg2.RightOffset or 0,
																																																																																									_attachments = {},
																																																																																									_titleAccessories = {},
																																																																																									_titleAccessoryReserve = v86[186],
																																																																																									_isDestroyed = false,
																																																																																									_onVisibilityChanged = function()
																																																																																									end,
																																																																																									_ctx = nil,
																																																																																									_barePending = nil,
																																																																																									_isTooltipWired = false,
																																																																																									Frame = nil,
																																																																																									TitleLabel = nil,
																																																																																									Right = nil,
																																																																																									_rightLayout = nil,
																																																																																								}, index2)
																																																																																							end

																																																																																							index2.AttachRight = function(arg, arg2, arg3, arg4, arg5, arg6, arg7)
																																																																																								local tbl18 = {
																																																																																									Build = arg2,
																																																																																									BuildRoot = arg6,
																																																																																									IsFlexChild = arg7 == true,
																																																																																									IsInRight = false,
																																																																																									Widget = nil,
																																																																																									NaturalWidth = arg3,
																																																																																									Leading = arg4,
																																																																																									Trove = v115.new(),
																																																																																									Cleanup = nil,
																																																																																								}

																																																																																								local cleanup = { Destroy = function()
																																																																																									arg:_DetachAttachment(tbl18)
																																																																																								end }

																																																																																								tbl18.Cleanup = cleanup

																																																																																								if arg5 ~= nil then
																																																																																									arg5:Add(cleanup)
																																																																																								end

																																																																																								if arg._isDestroyed then
																																																																																									tbl18.Trove:Destroy()
																																																																																									return
																																																																																								end
																																																																																								table.insert(arg._attachments, tbl18)
																																																																																								local ctx = arg._ctx
																																																																																								if ctx == nil then
																																																																																									return
																																																																																								end
																																																																																								local barePending = arg._barePending

																																																																																								if barePending ~= nil then
																																																																																									arg._barePending = nil
																																																																																									arg:_BuildBareRoot(barePending.Parent, barePending.LayoutOrder, ctx)
																																																																																									return
																																																																																								end

																																																																																								arg:_RealizeAttachment(tbl18, ctx)
																																																																																							end

																																																																																							index2._DetachAttachment = function(arg, arg2)
																																																																																								local v119 = table.find(arg._attachments, arg2)
																																																																																								if v119 == nil then
																																																																																									return
																																																																																								end
																																																																																								local isInRight = arg2.IsInRight
																																																																																								table.remove(arg._attachments, v119)
																																																																																								arg2.Trove:Destroy()
																																																																																								arg2.Widget = nil
																																																																																								arg2.Cleanup = nil

																																																																																								if arg._bare and isInRight then
																																																																																									local flag19 = v86[153]

																																																																																									for _, v120 in arg._attachments, nil, nil do
																																																																																										if v120.IsInRight then
																																																																																											flag19 = true
																																																																																											break
																																																																																										end
																																																																																									end

																																																																																									if not flag19 then
																																																																																										local right = arg.Right

																																																																																										if right ~= nil then
																																																																																											right:Destroy()
																																																																																											arg.Right = nil
																																																																																											arg._rightLayout = nil
																																																																																										end
																																																																																									end
																																																																																								end

																																																																																								if #arg._attachments > 0 then
																																																																																									return
																																																																																								end
																																																																																								arg._isDestroyed = true
																																																																																								arg._barePending = nil
																																																																																								local frame = arg.Frame

																																																																																								if frame ~= nil then
																																																																																									frame:Destroy()
																																																																																									arg.Frame = nil
																																																																																								end

																																																																																								arg.TitleLabel = nil
																																																																																								arg.Right = nil
																																																																																								arg._rightLayout = nil
																																																																																								arg._isBareFlexRoot = false
																																																																																								arg._onVisibilityChanged()
																																																																																							end

																																																																																							index2.AttachTitleAccessory = function(arg, arg2, arg3, arg4)
																																																																																								local tbl18 = { Build = arg2, Trove = v115.new(), Widget = nil }

																																																																																								local tbl19 = { Destroy = function()
																																																																																									local v119 = table.find(arg._titleAccessories, tbl18)

																																																																																									if v119 ~= nil then
																																																																																										table.remove(arg._titleAccessories, v119)
																																																																																									end

																																																																																									tbl18.Trove:Destroy()
																																																																																									tbl18.Widget = nil
																																																																																								end }

																																																																																								if arg4 ~= nil then
																																																																																									arg4:Add(tbl19)
																																																																																								end

																																																																																								if arg._isDestroyed then
																																																																																									tbl18.Trove:Destroy()
																																																																																									return
																																																																																								end
																																																																																								table.insert(arg._titleAccessories, tbl18)
																																																																																								arg._titleAccessoryReserve = arg._titleAccessoryReserve + arg3
																																																																																								local ctx = arg._ctx

																																																																																								if ctx ~= nil and arg.TitleLabel ~= nil then
																																																																																									arg:_RealizeTitleAccessory(tbl18, ctx)
																																																																																								end
																																																																																							end

																																																																																							index2._RealizeTitleAccessory = function(arg, arg2, arg3)
																																																																																								arg2.Widget = arg2.Build(arg.TitleLabel, {
																																																																																									Menu = arg3.Menu,
																																																																																									Trove = arg2.Trove,
																																																																																									Batch = v118.newBatch(arg2.Trove),
																																																																																									ParentOverlay = arg3.ParentOverlay,
																																																																																								})
																																																																																							end

																																																																																							index2._EnsureRightLayout = function(arg, parent)
																																																																																								if arg._rightLayout ~= nil then
																																																																																									return
																																																																																								end
																																																																																								local uiListLayout = Instance.new("UIListLayout")
																																																																																								uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
																																																																																								uiListLayout.FillDirection = Enum.FillDirection.Horizontal
																																																																																								uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
																																																																																								uiListLayout.Padding = UDim.new(0, arg._metrics.Row.AttachmentGap)
																																																																																								uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																								uiListLayout.Parent = parent
																																																																																								arg._rightLayout = uiListLayout

																																																																																								for k, v119 in arg._attachments, nil, nil do
																																																																																									if not (arg._bare and k == 1) then
																																																																																										local widget = v119.Widget

																																																																																										if widget ~= nil then
																																																																																											widget.LayoutOrder = v119.Leading and -1 or k
																																																																																										end
																																																																																									end
																																																																																								end
																																																																																							end

																																																																																							index2._EnsureBareRight = function(arg)
																																																																																								if arg.Right ~= nil then
																																																																																									return arg.Right
																																																																																								end
																																																																																								local frame = arg.Frame
																																																																																								if frame == nil then
																																																																																									return nil
																																																																																								end
																																																																																								local frame2 = Instance.new("Frame")
																																																																																								frame2.AnchorPoint = Vector2.new(v86[63], 0.5)
																																																																																								frame2.Position = UDim2.new(1, arg._rightOffset, 0.5, 0)
																																																																																								frame2.Size = UDim2.new(0.55, 0, v86[186], arg._height)
																																																																																								frame2.BorderSizePixel = 0
																																																																																								frame2.BackgroundTransparency = 1
																																																																																								frame2.Parent = frame
																																																																																								arg.Right = frame2
																																																																																								arg:_EnsureRightLayout(frame2)
																																																																																								return frame2
																																																																																							end

																																																																																							index2._RealizeAttachment = function(arg, arg2, arg3)
																																																																																								local frame

																																																																																								if arg._bare then
																																																																																									if arg._isBareFlexRoot and arg2.IsFlexChild then
																																																																																										frame = arg.Frame
																																																																																									else
																																																																																										frame = arg:_EnsureBareRight()
																																																																																									end
																																																																																								else
																																																																																									frame = arg.Right or arg.Frame

																																																																																									if arg.Right ~= nil and #arg._attachments >= 2 then
																																																																																										arg:_EnsureRightLayout(arg.Right)
																																																																																									end
																																																																																								end

																																																																																								if frame == nil then
																																																																																									return
																																																																																								end
																																																																																								arg2.IsInRight = arg.Right ~= nil and frame == arg.Right
																																																																																								local tbl18 = {}

																																																																																								for _, v119 in frame:GetChildren() do
																																																																																									tbl18[v119] = v86[34]
																																																																																								end

																																																																																								local v119 = arg2.Build(frame, {
																																																																																									Menu = arg3.Menu,
																																																																																									Trove = arg2.Trove,
																																																																																									Batch = v118.newBatch(arg2.Trove),
																																																																																									ParentOverlay = arg3.ParentOverlay,
																																																																																								})

																																																																																								arg2.Widget = v119

																																																																																								for _, v120 in frame:GetChildren() do
																																																																																									if not tbl18[v120] then
																																																																																										arg2.Trove:Add(v120)
																																																																																									end
																																																																																								end

																																																																																								if v119 ~= nil and arg._rightLayout ~= nil then
																																																																																									local layoutOrder = table.find(arg._attachments, arg2) or #arg._attachments

																																																																																									if arg2.Leading then
																																																																																										layoutOrder = -v86[63]
																																																																																									end

																																																																																									v119.LayoutOrder = layoutOrder
																																																																																								end
																																																																																							end

																																																																																							local function fn36(arg)
																																																																																								local v119 = v86[186]

																																																																																								for k, v120 in arg._attachments, nil, nil do
																																																																																									local naturalWidth = v120.NaturalWidth
																																																																																									if naturalWidth == nil then
																																																																																										return nil
																																																																																									end
																																																																																									v119 += naturalWidth

																																																																																									if k > 1 then
																																																																																										v119 += arg._metrics.Row.AttachmentGap
																																																																																									end
																																																																																								end

																																																																																								if v119 == 0 then
																																																																																									return nil
																																																																																								end
																																																																																								return v119
																																																																																							end

																																																																																							local function fn37(arg, arg2, arg3, arg4, arg5)
																																																																																								local flag19 = false
																																																																																								local flag20 = false
																																																																																								local size = arg5.Size
																																																																																								local anchorPoint = arg5.AnchorPoint
																																																																																								local position = arg5.Position
																																																																																								local position2 = arg4.Position
																																																																																								local size2 = arg3.Size
																																																																																								local automaticSize = arg3.AutomaticSize
																																																																																								local scale = size.X.Scale
																																																																																								local n = 1

																																																																																								if scale > 0 then
																																																																																									n = v86[63] - scale
																																																																																								end

																																																																																								local n33 = arg4.TextBounds.X + arg._titleAccessoryReserve

																																																																																								local function fn38()
																																																																																									if flag20 then
																																																																																										return
																																																																																									end
																																																																																									flag20 = true
																																																																																									local x = arg3.AbsoluteSize.X
																																																																																									if x <= 0 then
																																																																																										flag20 = false
																																																																																										return
																																																																																									end
																																																																																									local n34 = x * n - v86[162]
																																																																																									local v119 = fn36(arg)

																																																																																									if v119 ~= nil then
																																																																																										n34 = x - v119 - 8
																																																																																									end

																																																																																									local flag21 = n33 > n34
																																																																																									if flag21 == flag19 then
																																																																																										flag20 = false
																																																																																										return
																																																																																									end
																																																																																									flag19 = flag21

																																																																																									if flag19 then
																																																																																										local v120 = math.round(math.max(arg4.TextBounds.Y, arg._metrics.Row.TextSize))
																																																																																										arg4.AnchorPoint = Vector2.zero
																																																																																										arg4.Position = UDim2.new(0, 0, v86[186], v86[186])
																																																																																										arg5.AnchorPoint = Vector2.zero
																																																																																										arg5.Position = UDim2.fromOffset(0, v120 + 4)
																																																																																										arg5.Size = UDim2.new(1, 0, 0, size.Y.Offset)
																																																																																										arg3.AutomaticSize = Enum.AutomaticSize.None
																																																																																										arg3.Size = UDim2.new(1, 0, 0, v120 + 4 + size.Y.Offset)
																																																																																									else
																																																																																										arg4.AnchorPoint = Vector2.zero
																																																																																										arg4.Position = position2
																																																																																										arg5.AnchorPoint = anchorPoint
																																																																																										arg5.Position = position
																																																																																										arg5.Size = size
																																																																																										arg3.AutomaticSize = automaticSize
																																																																																										arg3.Size = size2
																																																																																									end

																																																																																									flag20 = false
																																																																																								end

																																																																																								fn38()
																																																																																								arg2.Trove:Connect(arg3:GetPropertyChangedSignal("AbsoluteSize"), fn38)

																																																																																								arg2.Trove:Connect(arg4:GetPropertyChangedSignal(v86[37]), function()
																																																																																									n33 = arg4.TextBounds.X + arg._titleAccessoryReserve
																																																																																									fn38()
																																																																																								end)
																																																																																							end

																																																																																							index2._BuildBareRoot = function(arg, arg2, layoutOrder, arg3)
																																																																																								local v119 = arg._attachments[1]
																																																																																								v119.IsInRight = false
																																																																																								arg._isBareFlexRoot = v119.IsFlexChild

																																																																																								local v120 = (v119.BuildRoot or v119.Build)(arg2, {
																																																																																									Menu = arg3.Menu,
																																																																																									Trove = v119.Trove,
																																																																																									Batch = v118.newBatch(v119.Trove),
																																																																																									ParentOverlay = arg3.ParentOverlay,
																																																																																								})

																																																																																								assert(v120 ~= nil, "Row: bare row builder returned no root")
																																																																																								v120.LayoutOrder = layoutOrder
																																																																																								v120.Visible = arg._visible
																																																																																								arg.Frame = v120

																																																																																								for _, v121 in v120:GetChildren() do
																																																																																									if not v121:IsA("UIListLayout") then
																																																																																										v119.Trove:Add(v121)
																																																																																									end
																																																																																								end

																																																																																								for i = 2, #arg._attachments do
																																																																																									local v121 = arg._attachments[i]

																																																																																									if v121.Widget == nil then
																																																																																										arg:_RealizeAttachment(v121, arg3)
																																																																																									end
																																																																																								end

																																																																																								arg:_WireTooltip()
																																																																																							end

																																																																																							index2.Realize = function(arg, parent, ctx, layoutOrder)
																																																																																								if arg._ctx ~= nil or arg._isDestroyed then
																																																																																									return
																																																																																								end
																																																																																								arg._ctx = ctx

																																																																																								if arg._bare then
																																																																																									if arg._attachments[1] == nil then
																																																																																										arg._barePending = { Parent = parent, LayoutOrder = layoutOrder }
																																																																																										return
																																																																																									end
																																																																																									arg:_BuildBareRoot(parent, layoutOrder, ctx)
																																																																																								else
																																																																																									local textButton = Instance.new("TextButton")
																																																																																									textButton.BackgroundTransparency = 1
																																																																																									textButton.Size = UDim2.new(1, 0, 0, arg._height)
																																																																																									textButton.BorderSizePixel = 0
																																																																																									textButton.AutomaticSize = Enum.AutomaticSize.Y
																																																																																									textButton.AutoButtonColor = false
																																																																																									textButton.Text = ""
																																																																																									textButton.LayoutOrder = layoutOrder
																																																																																									textButton.Visible = arg._visible
																																																																																									textButton.Parent = parent
																																																																																									arg.Frame = textButton
																																																																																									local n = arg._metrics.Row.TextSize + 4
																																																																																									local textLabel = Instance.new("TextLabel")
																																																																																									textLabel.Text = arg.Label or ""
																																																																																									textLabel.AnchorPoint = Vector2.zero
																																																																																									textLabel.BackgroundTransparency = v86[63]
																																																																																									textLabel.Position = UDim2.fromOffset(v86[186], math.round((arg._height - n) / 2))
																																																																																									textLabel.Size = UDim2.fromOffset(0, n)
																																																																																									textLabel.BorderSizePixel = 0
																																																																																									textLabel.AutomaticSize = Enum.AutomaticSize.X
																																																																																									textLabel.TextSize = arg._metrics.Row.TextSize
																																																																																									textLabel.TextXAlignment = Enum.TextXAlignment.Left

																																																																																									if arg._mediumTitle then
																																																																																										textLabel.FontFace = v116.Medium
																																																																																									else
																																																																																										textLabel.FontFace = ctx.Menu.Fonts.Main
																																																																																									end

																																																																																									ctx.Batch:Bind(textLabel, "TextColor3", "TextColor")
																																																																																									textLabel.Parent = textButton
																																																																																									arg.TitleLabel = textLabel
																																																																																									local frame = Instance.new("Frame")
																																																																																									frame.AnchorPoint = Vector2.new(1, v86[186])
																																																																																									frame.Position = UDim2.new(v86[63], arg._rightOffset, 0, 0)
																																																																																									frame.Size = UDim2.new(0.55, 0, 0, arg._height)
																																																																																									frame.BorderSizePixel = 0
																																																																																									frame.AutomaticSize = Enum.AutomaticSize.Y
																																																																																									frame.BackgroundTransparency = 1
																																																																																									frame.Parent = textButton
																																																																																									local controlVerticalInset = arg._metrics.Row.ControlVerticalInset

																																																																																									if controlVerticalInset > 0 then
																																																																																										frame.AutomaticSize = Enum.AutomaticSize.None
																																																																																										local uiPadding = Instance.new("UIPadding")
																																																																																										uiPadding.PaddingTop = UDim.new(0, controlVerticalInset)
																																																																																										uiPadding.PaddingBottom = UDim.new(v86[186], controlVerticalInset)
																																																																																										uiPadding.Parent = frame
																																																																																									end

																																																																																									arg.Right = frame

																																																																																									for _, v119 in arg._attachments, nil, nil do
																																																																																										if v119.Widget == nil then
																																																																																											arg:_RealizeAttachment(v119, ctx)
																																																																																										end
																																																																																									end

																																																																																									for _, v119 in arg._titleAccessories, nil, nil do
																																																																																										if v119.Widget == nil then
																																																																																											arg:_RealizeTitleAccessory(v119, ctx)
																																																																																										end
																																																																																									end

																																																																																									fn37(arg, ctx, textButton, textLabel, frame)
																																																																																									arg:_WireTooltip()
																																																																																								end
																																																																																							end

																																																																																							index2._WireTooltip = function(arg)
																																																																																								if arg._isTooltipWired or arg._tooltip == nil then
																																																																																									return
																																																																																								end
																																																																																								local ctx = arg._ctx
																																																																																								local frame = arg.Frame
																																																																																								if ctx == nil or frame == nil then
																																																																																									return
																																																																																								end
																																																																																								arg._isTooltipWired = true

																																																																																								ctx.Menu:AttachTooltip(ctx.Trove, frame, function()
																																																																																									return arg._tooltip
																																																																																								end)
																																																																																							end

																																																																																							index2.SetLabel = function(arg, label)
																																																																																								arg.Label = label
																																																																																								arg._menu:InvalidateSearch()
																																																																																								local titleLabel = arg.TitleLabel

																																																																																								if titleLabel ~= nil then
																																																																																									titleLabel.Text = label
																																																																																								end
																																																																																							end

																																																																																							index2.SetTooltip = function(arg, tooltip)
																																																																																								arg._tooltip = tooltip
																																																																																								arg:_WireTooltip()
																																																																																							end

																																																																																							index2.SetVisible = function(arg, visible)
																																																																																								if arg._visible == visible then
																																																																																									return
																																																																																								end
																																																																																								arg._visible = visible
																																																																																								local frame = arg.Frame

																																																																																								if frame ~= nil then
																																																																																									frame.Visible = visible
																																																																																								end

																																																																																								arg._onVisibilityChanged()
																																																																																							end

																																																																																							index2.IsVisible = function(arg)
																																																																																								return arg._visible
																																																																																							end

																																																																																							index2.Destroy = function(arg)
																																																																																								arg._isDestroyed = true
																																																																																								arg._barePending = nil

																																																																																								for i = #arg._attachments, 1, -v86[63] do
																																																																																									local v119 = arg._attachments[i]
																																																																																									table.remove(arg._attachments, i)
																																																																																									v119.Trove:Destroy()
																																																																																									v119.Widget = nil
																																																																																									v119.Cleanup = nil
																																																																																								end

																																																																																								for i = #arg._titleAccessories, 1, -1 do
																																																																																									local v119 = arg._titleAccessories[i]
																																																																																									table.remove(arg._titleAccessories, i)
																																																																																									v119.Trove:Destroy()
																																																																																									v119.Widget = nil
																																																																																								end

																																																																																								local frame = arg.Frame

																																																																																								if frame ~= nil then
																																																																																									frame:Destroy()
																																																																																									arg.Frame = nil
																																																																																								end

																																																																																								arg.TitleLabel = nil
																																																																																								arg.Right = nil
																																																																																								arg._rightLayout = nil
																																																																																								arg._isBareFlexRoot = false
																																																																																								arg._onVisibilityChanged()
																																																																																							end

																																																																																							return index2
																																																																																						end

																																																																																						tbl17.B = function()
																																																																																							local b = tbl17.cache.B

																																																																																							if not b then
																																																																																								b = { c = fn35() }
																																																																																								tbl17.cache.B = b
																																																																																							end

																																																																																							return b.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					do
																																																																																						local function fn35()
																																																																																							local v115 = tbl17.g()
																																																																																							tbl17.k()
																																																																																							tbl17.r()
																																																																																							local v116 = tbl17.s()
																																																																																							local v117 = tbl17.v()
																																																																																							local v118 = tbl17.x()
																																																																																							local v119 = tbl17.y()
																																																																																							tbl17.B()
																																																																																							local v120 = tbl17.A()
																																																																																							local color = Color3.fromRGB(255, 255, 255)
																																																																																							local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
																																																																																							local tweenInfo2 = TweenInfo.new(v86[62], Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
																																																																																							local color2 = Color3.fromRGB(v86[102], 92, v86[53])

																																																																																							local function fn36(arg, arg2)
																																																																																								local clamp = math.clamp
																																																																																								local n = arg.B * arg2
																																																																																								return Color3.new(math.clamp(arg.R * arg2, v86[186], v86[63]), math.clamp(arg.G * arg2, 0, v86[63]), clamp(n, 0, 1))
																																																																																							end

																																																																																							local function fn37(arg)
																																																																																								return arg == "primary" and v120.get("Accent") or color
																																																																																							end

																																																																																							local function fn38(arg)
																																																																																								local flag19 = arg == "primary"

																																																																																								if flag19 then
																																																																																									local v121 = v86[66]
																																																																																									flag19 = fn36(v120.get("Accent"), v121)
																																																																																								end

																																																																																								return flag19 or Color3.fromRGB(v86[65], 220, 230)
																																																																																							end

																																																																																							local function fn39(arg)
																																																																																								if arg == "primary" then
																																																																																									return color
																																																																																								end

																																																																																								if arg == "ghost" then
																																																																																									return v120.get("Unselected")
																																																																																								end
																																																																																								return v120.get("TextColor")
																																																																																							end

																																																																																							local function fn40(arg)
																																																																																								return arg == "primary" and fn36(v120.get(v86[139]), 0.6) or v120.get(v86[120])
																																																																																							end

																																																																																							local index2 = {}
																																																																																							index2.__index = index2

																																																																																							local function createFrame(arg, parent, arg2)
																																																																																								local menu = arg._menu
																																																																																								local variant = arg._variant
																																																																																								local button = v117.get().Button
																																																																																								local transparency = 0
																																																																																								local n = 0

																																																																																								if variant == "primary" then
																																																																																									n = 0.6
																																																																																								elseif variant == "ghost" then
																																																																																									if n26 < 4790 then
																																																																																										while true do
																																																																																										end
																																																																																									else
																																																																																										transparency = 1
																																																																																										n = 1
																																																																																									end
																																																																																								end

																																																																																								local frame = Instance.new("Frame")
																																																																																								frame.AnchorPoint = Vector2.new(v86[63], v86[186])
																																																																																								frame.Position = UDim2.new(1, -v86[63], 0, 1)
																																																																																								frame.Size = UDim2.fromOffset(v86[186], button.VisualHeight)
																																																																																								frame.BorderSizePixel = 0
																																																																																								frame.BackgroundColor3 = fn37(variant)
																																																																																								frame.ClipsDescendants = v86[34]
																																																																																								frame.Parent = parent

																																																																																								if variant == "default" then
																																																																																									local uiGradient = Instance.new("UIGradient")
																																																																																									uiGradient.Rotation = 90
																																																																																									arg2.Batch:BindGradient(uiGradient, { "GradientMid", "GradientDark" })
																																																																																									uiGradient.Parent = frame
																																																																																								end

																																																																																								local uiCorner = Instance.new("UICorner")
																																																																																								uiCorner.CornerRadius = UDim.new(v86[186], 5)
																																																																																								uiCorner.Parent = frame
																																																																																								local uiStroke = Instance.new("UIStroke")
																																																																																								uiStroke.Color = fn40(variant)
																																																																																								uiStroke.Transparency = transparency
																																																																																								uiStroke.Parent = frame
																																																																																								local instance = Instance.new(v86[92])
																																																																																								instance.BackgroundTransparency = 1
																																																																																								instance.Size = UDim2.fromScale(1, 1)
																																																																																								instance.BorderSizePixel = 0
																																																																																								instance.Text = ""
																																																																																								instance.AutoButtonColor = false
																																																																																								instance.Parent = frame
																																																																																								v119.attach(menu, arg2.Trove, frame, { Trigger = instance })
																																																																																								local textLabel = Instance.new("TextLabel")
																																																																																								textLabel.LayoutOrder = -v86[63]
																																																																																								textLabel.FontFace = v116.SemiBold
																																																																																								textLabel.TextColor3 = fn39(variant)
																																																																																								textLabel.Text = arg.Label
																																																																																								textLabel.BackgroundTransparency = 1
																																																																																								textLabel.Size = UDim2.fromScale(1, 1)
																																																																																								textLabel.BorderSizePixel = 0
																																																																																								textLabel.TextSize = 16
																																																																																								textLabel.Parent = frame
																																																																																								arg._title = textLabel

																																																																																								if variant == "default" then
																																																																																									arg2.Batch:Bind(textLabel, "TextColor3", "TextColor")
																																																																																								elseif variant == "ghost" then
																																																																																									arg2.Batch:Bind(textLabel, "TextColor3", "Unselected")
																																																																																								end

																																																																																								arg2.Trove:Connect(instance.MouseEnter, function()
																																																																																									menu:Tween(frame, { BackgroundColor3 = fn38(variant) }, tweenInfo)

																																																																																									if variant == "default" then
																																																																																										menu:Tween(uiStroke, { Color = v120.get("Accent") }, tweenInfo)
																																																																																									elseif variant == "primary" then
																																																																																										menu:Tween(uiStroke, { Transparency = n }, tweenInfo)
																																																																																									elseif variant == "ghost" then
																																																																																										menu:Tween(textLabel, { TextColor3 = v120.get("TextColor") }, tweenInfo)
																																																																																									end
																																																																																								end)

																																																																																								arg2.Trove:Connect(instance.MouseLeave, function()
																																																																																									menu:Tween(frame, { BackgroundColor3 = fn37(variant) }, tweenInfo)

																																																																																									if variant == "default" then
																																																																																										menu:Tween(uiStroke, { Color = v120.get("Outline") }, tweenInfo)
																																																																																									elseif variant == "primary" then
																																																																																										menu:Tween(uiStroke, { Transparency = transparency }, tweenInfo)
																																																																																									elseif variant == "ghost" then
																																																																																										menu:Tween(textLabel, { TextColor3 = v120.get("Unselected") }, tweenInfo)
																																																																																									end
																																																																																								end)

																																																																																								local backgroundColor3 = nil

																																																																																								v118.connectPress(arg2.Trove, instance, function()
																																																																																									backgroundColor3 = frame.BackgroundColor3
																																																																																									menu:Tween(frame, { BackgroundColor3 = fn36(backgroundColor3, 0.85) }, tweenInfo2)
																																																																																								end, function()
																																																																																									if backgroundColor3 ~= nil then
																																																																																										menu:Tween(frame, { BackgroundColor3 = backgroundColor3 }, tweenInfo2)
																																																																																										backgroundColor3 = nil
																																																																																									end
																																																																																								end)

																																																																																								local function fn41()
																																																																																									textLabel.TextColor3 = v120.get("Accent")
																																																																																									menu:Tween(textLabel, { TextColor3 = fn39(variant) })
																																																																																									arg._onClick()
																																																																																									arg.Clicked:Fire()
																																																																																								end

																																																																																								if not arg._requiresConfirm then
																																																																																									v118.connectClick(arg2.Trove, instance, fn41)
																																																																																									return frame
																																																																																								end
																																																																																								local v121 = nil

																																																																																								local function fn42()
																																																																																									local v122 = v121
																																																																																									if v122 == nil then
																																																																																										return
																																																																																									end
																																																																																									v121 = nil
																																																																																									v122:Destroy()
																																																																																									textLabel.Text = arg.Label
																																																																																									menu:Tween(textLabel, { TextColor3 = fn39(variant) }, tweenInfo)
																																																																																								end

																																																																																								v118.connectClick(arg2.Trove, instance, function()
																																																																																									if v121 == nil then
																																																																																										local v122 = arg2.Trove:Extend()
																																																																																										v121 = v122
																																																																																										menu:Tween(textLabel, { TextColor3 = color2 }, tweenInfo)

																																																																																										v122:Add(task.spawn(function()
																																																																																											for i = v86[155], 1, -1 do
																																																																																												textLabel.Text = string.format("%s (%s)", "Are you sure?", tostring(i))
																																																																																												task.wait(v86[63])
																																																																																											end

																																																																																											fn42()
																																																																																										end))

																																																																																										return
																																																																																									end

																																																																																									fn42()
																																																																																									fn41()
																																																																																								end)

																																																																																								return frame
																																																																																							end

																																																																																							local function createTextButton()
																																																																																								local button = v117.get().Button
																																																																																								local textButton = Instance.new("TextButton")
																																																																																								textButton.BackgroundTransparency = 1
																																																																																								textButton.Size = UDim2.new(1, v86[186], 0, button.RowHeight)
																																																																																								textButton.BorderSizePixel = 0
																																																																																								textButton.Text = ""
																																																																																								textButton.AutoButtonColor = false
																																																																																								local instance = Instance.new(v86[4])
																																																																																								instance.Padding = UDim.new(0, button.Gap)
																																																																																								instance.FillDirection = Enum.FillDirection.Horizontal
																																																																																								instance.HorizontalFlex = Enum.UIFlexAlignment.Fill
																																																																																								instance.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																								instance.VerticalFlex = Enum.UIFlexAlignment.Fill
																																																																																								instance.Parent = textButton
																																																																																								return textButton
																																																																																							end

																																																																																							index2._New = function(arg, arg2, arg3, arg4, arg5)
																																																																																								local obj = setmetatable({
																																																																																									_trove = arg3,
																																																																																									_menu = arg,
																																																																																									Kind = v86[33],
																																																																																									Row = arg2,
																																																																																									Label = arg4.Label or "Button",
																																																																																									Clicked = arg3:Add(v115.new()),
																																																																																									_onClick = arg4.OnClick or function()
																																																																																									end,
																																																																																									_variant = arg4.Variant or "default",
																																																																																									_requiresConfirm = arg4.Confirm == true,
																																																																																									_title = nil,
																																																																																								}, index2)

																																																																																								if arg5 then
																																																																																									arg2:AttachRight(function(parent, arg6)
																																																																																										local v121 = createTextButton()
																																																																																										v121.Parent = parent
																																																																																										createFrame(obj, v121, arg6)
																																																																																										return v121
																																																																																									end, nil, nil, arg3, nil, v86[34])
																																																																																								else
																																																																																									arg2:AttachRight(function(arg6, arg7)
																																																																																										return createFrame(obj, arg6, arg7)
																																																																																									end, nil, nil, arg3, function(parent, arg6)
																																																																																										local v121 = createTextButton()
																																																																																										v121.Parent = parent
																																																																																										createFrame(obj, v121, arg6)
																																																																																										return v121
																																																																																									end, true)
																																																																																								end

																																																																																								return obj
																																																																																							end

																																																																																							index2.SetLabel = function(arg, label)
																																																																																								arg.Label = label
																																																																																								local title = arg._title

																																																																																								if title ~= nil then
																																																																																									title.Text = label
																																																																																								end

																																																																																								return arg
																																																																																							end

																																																																																							index2.SetTooltip = function(arg, arg2)
																																																																																								arg.Row:SetTooltip(arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.SetVisible = function(arg, arg2)
																																																																																								arg.Row:SetVisible(arg2)
																																																																																							end

																																																																																							index2.OnClick = function(arg, arg2)
																																																																																								arg._trove:Connect(arg.Clicked, arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.Connect = function(arg, arg2, arg3)
																																																																																								arg._trove:Connect(arg2, arg3)
																																																																																								return arg
																																																																																							end

																																																																																							index2.Destroy = function(arg)
																																																																																								arg._trove:Destroy()
																																																																																							end

																																																																																							return index2
																																																																																						end

																																																																																						tbl17.C = function()
																																																																																							local c = tbl17.cache.C

																																																																																							if not c then
																																																																																								local c2 = { c = fn35() }
																																																																																								tbl17.cache.C = c2
																																																																																								c = c2
																																																																																							end

																																																																																							return c.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					local function fn35() tbl17 .r();local l={};local function I(W)local N={};for P,P in W.Keypoints,nil,nil do table.insert(N,{Time=P.Time,Value=P.Value});end;return N;end;local function W(N)local P={};for a,a in N,nil,nil do table.insert(P,ColorSequenceKeypoint.new(a.Time,a.Value));end;return ColorSequence.new(P);end;local function N(P)local a=P[1].Value;for e=2,#P,1 do if P[e].Value~=a then return false;end;end;return true;end;local function P(a)if type(a)=="number"then return 1-a;end;return 1;end;l.decodeSolid=function(a,e)if typeof(a)~="Color3"then return nil;end;return{Rgb=a,Alpha=P(e),Stops={}};end;l.encodeSolid=function(a)return a.Rgb,1-a.Alpha;end;l.decodeSequence=function(a,e)if typeof(a)~="ColorSequence"then return nil;end;local c=I(a);if#c==0 then return nil;end;a=P(e);if N(c)then return{Rgb=c[1].Value,Alpha=a,Stops={}};end;return{Rgb=c[1].Value,Alpha=a,Stops=c};end;l.encodeSequence=function(I)local N=I.Stops;if N~=nil and#N>=2 then return W(N),1-I.Alpha;end;return ColorSequence.new(I.Rgb),1-I.Alpha;end;return l;end

																																																																																					tbl17.D = function()
																																																																																						local d = tbl17.cache.D

																																																																																						if not d then
																																																																																							d = { c = fn35() }
																																																																																							tbl17.cache.D = d
																																																																																						end

																																																																																						return d.c
																																																																																					end
																																																																																				end
																																																																																			end

																																																																																			do
																																																																																				do
																																																																																					do
																																																																																						do
																																																																																							local function fn35() tbl17 .r();local l;l={clone=function(I)local W={};if type(I)=="table"then for N,P in I,nil,nil do if type(P)=="table"then N=P.Value;if typeof(N)=="Color3"then table.insert(W,{Time=math.clamp(tonumber(P.Time)or 0,0,1),Value=N});end;end;end;end;return W;end,sort=function(I,W)table.sort(I,function(N,P)return N.Time<P.Time;end);if W~=nil then for N,P in I,nil,nil do if P==W then return N;end;end;end;return math.max(#I,1);end,ensure=function(I,W)local N=l.clone(I);if#N>=2 then l.sort(N);N[1].Time=0;N[#N].Time=1;return N;end;return{{Time=0,Value=W},{Time=1,Value=W}};end,toSequence=function(I)local W=l.clone(I);if#W==0 then return ColorSequence.new(Color3.new(1,1,1));end;l.sort(W);local I,N,P={},W[1],W[#W];if N.Time>0 then table.insert(I,ColorSequenceKeypoint.new(0,N.Value));end;for a,a in W,nil,nil do N=math.clamp(a.Time,0,1);table.insert(I,ColorSequenceKeypoint.new(if#I>0 then(math.max(N,I[#I].Time))else N,a.Value));end;if I[#I].Time<1 then table.insert(I,ColorSequenceKeypoint.new(1,P.Value));end;return ColorSequence.new(I);end};return l;end

																																																																																							tbl17.E = function()
																																																																																								local e = tbl17.cache.E

																																																																																								if not e then
																																																																																									e = { c = fn35() }
																																																																																									tbl17.cache.E = e
																																																																																								end

																																																																																								return e.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						local function fn35()
																																																																																							tbl17.A()

																																																																																							return {
																																																																																								addGlow = function(arg, parent, arg2)
																																																																																									local amount = arg2.Amount or v86[175]
																																																																																									local dampingFactor = arg2.DampingFactor or 0.4

																																																																																									for i = 1, amount do
																																																																																										local uiStroke = Instance.new("UIStroke")
																																																																																										uiStroke.LineJoinMode = Enum.LineJoinMode.Round
																																																																																										uiStroke.BorderOffset = UDim.new(0, i)
																																																																																										uiStroke.Transparency = 1 - (v86[63] - i / (amount + dampingFactor)) * (v86[63] - dampingFactor)
																																																																																										arg:Bind(uiStroke, "Color", "Outline")
																																																																																										uiStroke.Parent = parent
																																																																																									end
																																																																																								end,
																																																																																								bindSurfaceGradient = function(arg, arg2, arg3)
																																																																																									local n = #arg3
																																																																																									local v115 = table.clone(arg3)
																																																																																									table.insert(v115, arg3[n])
																																																																																									local tbl18 = {}

																																																																																									for i = 1, n do
																																																																																										tbl18[i] = (i - 1) / (n - 1) * v86[81]
																																																																																									end

																																																																																									tbl18[n + 1] = 1
																																																																																									arg:BindGradient(arg2, v115, tbl18)
																																																																																								end,
																																																																																							}
																																																																																						end

																																																																																						tbl17.F = function()
																																																																																							local f = tbl17.cache.F

																																																																																							if not f then
																																																																																								local f2 = { c = fn35() }
																																																																																								tbl17.cache.F = f2
																																																																																								f = f2
																																																																																							end

																																																																																							return f.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					do
																																																																																						local function fn35()
																																																																																							tbl17.k()
																																																																																							local v115 = tbl17.F()
																																																																																							tbl17.r()
																																																																																							local v116 = tbl17.A()
																																																																																							local v117 = tbl17.w()
																																																																																							local index2 = {}
																																																																																							index2.__index = index2

																																																																																							local function fn36(arg)
																																																																																								local root = arg.Root
																																																																																								local v118, v119 = arg._place(arg._trigger, root)
																																																																																								local v120 = v117.absoluteToLayerOffset(arg._layer, Vector2.new(v118, v119))
																																																																																								local absoluteSize = root.AbsoluteSize

																																																																																								if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
																																																																																									local absoluteSize2 = arg._layer.AbsoluteSize
																																																																																									absoluteSize = Vector2.new(root.Size.X.Scale * absoluteSize2.X + root.Size.X.Offset, root.Size.Y.Scale * absoluteSize2.Y + root.Size.Y.Offset)
																																																																																								end

																																																																																								local anchorPoint = root.AnchorPoint
																																																																																								local v121, v122 = v117.clampOffsetToViewport(v120.X - absoluteSize.X * anchorPoint.X, v120.Y - absoluteSize.Y * anchorPoint.Y, absoluteSize)
																																																																																								local v123 = v117.onScreenKeyboardTop()
																																																																																								local n

																																																																																								if v123 == nil then
																																																																																									n = v122
																																																																																								else
																																																																																									n = math.clamp(v122, v86[186], math.max(0, v123 - absoluteSize.Y))
																																																																																								end

																																																																																								return math.round(v121 + absoluteSize.X * anchorPoint.X), math.round(n + absoluteSize.Y * anchorPoint.Y)
																																																																																							end

																																																																																							local function fn37(arg, arg2)
																																																																																								arg._geometryTrove:Clean()
																																																																																								arg._onToggle(arg2)
																																																																																								local menu = arg._menu
																																																																																								local root = arg.Root

																																																																																								if not arg2 then
																																																																																									local v118, v119 = fn36(arg)
																																																																																									menu:Tween(root, { Position = UDim2.fromOffset(v118, v119 - 15) })
																																																																																									menu:FadeCanvasGroup(root, false, arg._fadeState)
																																																																																									return
																																																																																								end

																																																																																								v117.connectOnScreenKeyboard(arg._geometryTrove, function()
																																																																																									local updateViewport = arg._updateViewport
																																																																																									if updateViewport ~= nil then
																																																																																										updateViewport()
																																																																																										return
																																																																																									end
																																																																																									arg:Reposition()
																																																																																								end)

																																																																																								local v118, v119 = fn36(arg)
																																																																																								root.Position = UDim2.fromOffset(v118, v119 - 15)

																																																																																								arg._geometryTrove:Add(task.defer(function()
																																																																																									if not arg.Entry.Open or root.Parent == nil then
																																																																																										return
																																																																																									end
																																																																																									local v120, v121 = fn36(arg)
																																																																																									root.Position = UDim2.fromOffset(v120, v121 - 15)
																																																																																									menu:FadeCanvasGroup(root, true, arg._fadeState)
																																																																																									menu:Tween(root, { Position = UDim2.fromOffset(v120, v121) })
																																																																																								end))
																																																																																							end

																																																																																							index2.new = function(arg, arg2, arg3)
																																																																																								local v118 = arg2:Extend()
																																																																																								local v119 = v116.newBatch(v118)
																																																																																								local canvasGroup = Instance.new("CanvasGroup")
																																																																																								canvasGroup.Visible = false
																																																																																								canvasGroup.GroupTransparency = 1
																																																																																								canvasGroup.BorderSizePixel = 0
																																																																																								canvasGroup.AnchorPoint = arg3.AnchorPoint or Vector2.zero
																																																																																								canvasGroup.Size = arg3.Size
																																																																																								canvasGroup.AutomaticSize = arg3.AutomaticSize or Enum.AutomaticSize.None

																																																																																								if arg3.FlatBackground then
																																																																																									canvasGroup.BackgroundTransparency = v86[6]
																																																																																									v119:Bind(canvasGroup, "BackgroundColor3", v86[168])
																																																																																								else
																																																																																									canvasGroup.BackgroundTransparency = 1
																																																																																									local frame = Instance.new("Frame")
																																																																																									frame.Size = UDim2.fromScale(v86[63], 1)
																																																																																									frame.BorderSizePixel = 0
																																																																																									frame.ZIndex = v86[186]
																																																																																									frame.BackgroundColor3 = Color3.fromRGB(v86[108], v86[108], 255)
																																																																																									frame.Parent = canvasGroup
																																																																																									local uiGradient = Instance.new("UIGradient")
																																																																																									uiGradient.Rotation = 90
																																																																																									v115.bindSurfaceGradient(v119, uiGradient, { "GradientMid", "GradientDark" })
																																																																																									uiGradient.Parent = frame
																																																																																									local uiCorner = Instance.new("UICorner")
																																																																																									uiCorner.CornerRadius = UDim.new(0, arg3.CornerRadius or 5)
																																																																																									uiCorner.Parent = frame
																																																																																								end

																																																																																								local uiCorner = Instance.new("UICorner")
																																																																																								uiCorner.CornerRadius = UDim.new(v86[186], arg3.CornerRadius or 5)
																																																																																								uiCorner.Parent = canvasGroup
																																																																																								local uiStroke = Instance.new("UIStroke")
																																																																																								v119:Bind(uiStroke, "Color", "Outline")
																																																																																								uiStroke.Parent = canvasGroup

																																																																																								if arg3.Glow then
																																																																																									v115.addGlow(v119, canvasGroup, { Amount = 5, DampingFactor = 0.6 })
																																																																																								end

																																																																																								local overlayLayer = arg:GetOverlayLayer()
																																																																																								canvasGroup.Parent = overlayLayer
																																																																																								v118:Add(canvasGroup)
																																																																																								local v120 = nil

																																																																																								local v121 = arg:RegisterOverlay(canvasGroup, {
																																																																																									Triggers = { arg3.Trigger },
																																																																																									ParentEntry = arg3.ParentEntry,
																																																																																									OnToggle = function(arg4)
																																																																																										local v121 = v120

																																																																																										if v121 ~= nil then
																																																																																											fn37(v121, arg4)
																																																																																										end
																																																																																									end,
																																																																																								})

																																																																																								v118:Add({ Destroy = function()
																																																																																									arg:UnregisterOverlay(v121)
																																																																																								end })

																																																																																								local obj = setmetatable({
																																																																																									Trove = v118,
																																																																																									_menu = arg,
																																																																																									_layer = overlayLayer,
																																																																																									Batch = v119,
																																																																																									_trigger = arg3.Trigger,
																																																																																									_place = arg3.Place,
																																																																																									_onToggle = arg3.OnToggle or function()
																																																																																									end,
																																																																																									_fadeState = { Tweening = v86[153] },
																																																																																									_geometryTrove = v118:Extend(),
																																																																																									_updateViewport = nil,
																																																																																									Root = canvasGroup,
																																																																																									Entry = v121,
																																																																																								}, index2)

																																																																																								v120 = obj

																																																																																								v118:Connect(arg3.Trigger:GetPropertyChangedSignal("AbsolutePosition"), function()
																																																																																									obj:Reposition()
																																																																																								end)

																																																																																								v117.connectCurrentCameraViewport(v118, function()
																																																																																									obj:Reposition()
																																																																																								end)

																																																																																								return obj
																																																																																							end

																																																																																							index2.RealizeCtx = function(arg)
																																																																																								return { Menu = arg._menu, Trove = arg.Trove, Batch = arg.Batch, ParentOverlay = arg.Entry }
																																																																																							end

																																																																																							index2.placeBelow = function(arg, arg2)
																																																																																								return function(arg3)
																																																																																									local absolutePosition = arg3.AbsolutePosition
																																																																																									return math.round(absolutePosition.X) + arg, math.round(absolutePosition.Y + arg3.AbsoluteSize.Y + arg2)
																																																																																								end
																																																																																							end

																																																																																							index2.AttachScrollingList = function(arg, arg2, arg3)
																																																																																								local root = arg.Root
																																																																																								local n = 12
																																																																																								local n33 = 12
																																																																																								local n34 = 12

																																																																																								if arg3 ~= nil then
																																																																																									n = arg3.Top
																																																																																									n33 = arg3.Bottom
																																																																																									n34 = arg3.Side
																																																																																								end

																																																																																								local instance = Instance.new(v86[64])
																																																																																								instance.Active = v86[34]
																																																																																								instance.Size = UDim2.fromScale(1, 1)
																																																																																								instance.BorderSizePixel = 0
																																																																																								instance.BackgroundTransparency = 1
																																																																																								instance.AutomaticCanvasSize = Enum.AutomaticSize.Y
																																																																																								instance.CanvasSize = UDim2.fromOffset(0, 0)
																																																																																								instance.ScrollBarImageTransparency = 0.35
																																																																																								instance.ScrollBarThickness = v86[186]
																																																																																								instance.Selectable = false
																																																																																								arg.Batch:Bind(instance, "ScrollBarImageColor3", "Accent")
																																																																																								instance.Parent = root
																																																																																								local instance2 = Instance.new(v86[128])
																																																																																								instance2.Position = UDim2.fromOffset(n34, n)
																																																																																								instance2.Size = UDim2.new(1, -n34 * 2, 0, 0)
																																																																																								instance2.AutomaticSize = Enum.AutomaticSize.Y
																																																																																								instance2.BorderSizePixel = 0
																																																																																								instance2.BackgroundTransparency = v86[63]
																																																																																								instance2.Parent = instance
																																																																																								local uiListLayout = Instance.new("UIListLayout")
																																																																																								uiListLayout.Padding = UDim.new(0, v86[12])
																																																																																								uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																								uiListLayout.Parent = instance2
																																																																																								local uiPadding = Instance.new("UIPadding")
																																																																																								uiPadding.PaddingBottom = UDim.new(0, n33)
																																																																																								uiPadding.Parent = instance2
																																																																																								local v118 = nil

																																																																																								local function updateViewport()
																																																																																									local y = v118 and v118.Y or v86[78]
																																																																																									local v119 = v117.onScreenKeyboardTop()
																																																																																									local n35

																																																																																									if v119 == nil then
																																																																																										n35 = y
																																																																																									else
																																																																																										n35 = math.min(y, v119)
																																																																																									end

																																																																																									local n36 = uiListLayout.AbsoluteContentSize.Y + n + n33
																																																																																									local n37 = math.min(n36, math.max(80, n35 - v86[13]))
																																																																																									root.Size = UDim2.fromOffset(arg2, n37)
																																																																																									local scrollBarThickness = v86[186]

																																																																																									if n36 > n37 + 0.5 then
																																																																																										scrollBarThickness = 4
																																																																																									end

																																																																																									instance.ScrollBarThickness = scrollBarThickness
																																																																																									arg:Reposition()
																																																																																								end

																																																																																								arg._updateViewport = updateViewport
																																																																																								arg.Trove:Connect(uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), updateViewport)

																																																																																								v117.connectCurrentCameraViewport(arg.Trove, function(arg4)
																																																																																									v118 = arg4
																																																																																									updateViewport()
																																																																																								end)

																																																																																								return instance, instance2
																																																																																							end

																																																																																							index2.IsOpen = function(arg)
																																																																																								return arg.Entry.Open
																																																																																							end

																																																																																							index2.Toggle = function(arg)
																																																																																								arg._menu:ToggleOverlay(arg.Entry)
																																																																																							end

																																																																																							index2.SetOpen = function(arg, arg2)
																																																																																								arg._menu:SetOverlayOpen(arg.Entry, arg2)
																																																																																							end

																																																																																							index2.Reposition = function(arg)
																																																																																								if not arg.Entry.Open then
																																																																																									return
																																																																																								end
																																																																																								local v118, v119 = fn36(arg)
																																																																																								if arg._fadeState.Tweening then
																																																																																									arg._menu:Tween(arg.Root, { Position = UDim2.fromOffset(v118, v119) })
																																																																																									return
																																																																																								end
																																																																																								arg.Root.Position = UDim2.fromOffset(v118, v119)
																																																																																							end

																																																																																							index2.Destroy = function(arg)
																																																																																								arg.Trove:Destroy()
																																																																																							end

																																																																																							return index2
																																																																																						end

																																																																																						tbl17.G = function()
																																																																																							local g = tbl17.cache.G

																																																																																							if not g then
																																																																																								g = { c = fn35() }
																																																																																								tbl17.cache.G = g
																																																																																							end

																																																																																							return g.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					if not flag3 then
																																																																																						return
																																																																																					end

																																																																																					do
																																																																																						local function fn35()
																																																																																							local v115 = tbl17.g()
																																																																																							tbl17.k()
																																																																																							tbl17.r()
																																																																																							local v116 = tbl17.s()
																																																																																							local v117 = tbl17.v()
																																																																																							local v118 = tbl17.u()
																																																																																							local v119 = tbl17.x()
																																																																																							local v120 = tbl17.G()
																																																																																							tbl17.B()
																																																																																							local v121 = tbl17.A()
																																																																																							local v122 = tbl17.w()
																																																																																							local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
																																																																																							local color = Color3.fromRGB(v86[108], v86[108], v86[108])
																																																																																							local index2 = {}
																																																																																							index2.__index = index2

																																																																																							local function fn36(arg)
																																																																																								local tbl18 = {}
																																																																																								local v123 = v86[165]

																																																																																								if type(arg) == v123 then
																																																																																									tbl18[arg] = true
																																																																																								else
																																																																																									local v124 = v86[68]

																																																																																									if type(arg) == v124 then
																																																																																										for k, v125 in arg, nil, nil do
																																																																																											local v126 = v86[165]

																																																																																											if type(k) == v126 and v125 == true then
																																																																																												tbl18[k] = true
																																																																																											else
																																																																																												local v127 = v86[95]

																																																																																												if type(k) == v127 and type(v125) == "string" then
																																																																																													tbl18[v125] = v86[34]
																																																																																												end
																																																																																											end
																																																																																										end
																																																																																									end
																																																																																								end

																																																																																								return tbl18
																																																																																							end

																																																																																							local function fn37(arg)
																																																																																								table.clear(arg._indexByName)

																																																																																								for k, v123 in arg.Options, nil, nil do
																																																																																									arg._indexByName[v123] = k
																																																																																								end
																																																																																							end

																																																																																							local function fn38(arg, arg2)
																																																																																								return arg._labelByValue[arg2] or arg2
																																																																																							end

																																																																																							local function fn39(arg)
																																																																																								local value = arg.Value
																																																																																								if type(value) == "string" then
																																																																																									return fn38(arg, value)
																																																																																								end

																																																																																								if type(value) == "table" then
																																																																																									local tbl18 = {}

																																																																																									for _, v123 in arg.Options, nil, nil do
																																																																																										if value[v123] then
																																																																																											table.insert(tbl18, fn38(arg, v123))
																																																																																										end
																																																																																									end

																																																																																									if v86[186] < #tbl18 then
																																																																																										return table.concat(tbl18, ", ")
																																																																																									end
																																																																																								end

																																																																																								return "Select"
																																																																																							end

																																																																																							local function fn40(arg)
																																																																																								local rt = arg._rt

																																																																																								if rt ~= nil then
																																																																																									rt.ValueLabel.Text = fn39(arg)
																																																																																								end
																																																																																							end

																																																																																							local function fn41(arg, arg2)
																																																																																								local value = arg.Value
																																																																																								if type(value) == "table" then
																																																																																									return value[arg2] == true
																																																																																								end
																																																																																								return value == arg2
																																																																																							end

																																																																																							local function fn42(arg, arg2, arg3, arg4)
																																																																																								local Unselected = v121.get("Unselected")
																																																																																								local imageTransparency = 1

																																																																																								if arg3 then
																																																																																									Unselected = v121.get(v86[174])
																																																																																									imageTransparency = 0
																																																																																								end

																																																																																								arg2.Tick.ImageColor3 = v121.get("TextColor")

																																																																																								if arg4 then
																																																																																									arg2.Button.TextColor3 = Unselected
																																																																																									arg2.Tick.ImageTransparency = imageTransparency
																																																																																									return
																																																																																								end

																																																																																								arg._menu:Tween(arg2.Button, { TextColor3 = Unselected })
																																																																																								arg._menu:Tween(arg2.Tick, { ImageTransparency = imageTransparency })
																																																																																							end

																																																																																							local function fn43(arg, arg2)
																																																																																								local panel = arg._panel
																																																																																								if panel == nil or not panel.Popup:IsOpen() then
																																																																																									return
																																																																																								end

																																																																																								for k, v123 in panel.Rows, nil, nil do
																																																																																									local v124 = arg.Options[k]
																																																																																									fn42(arg, v123, v124 ~= nil and fn41(arg, v124), arg2)
																																																																																								end
																																																																																							end

																																																																																							local function fn44(arg, arg2)
																																																																																								local panel = arg._panel
																																																																																								if panel == nil then
																																																																																									return
																																																																																								end
																																																																																								local str7 = arg2:lower()

																																																																																								for _, v123 in panel.Rows, nil, nil do
																																																																																									v123.Button.Visible = v123.Button.Text:lower():find(str7, 1, true) ~= nil
																																																																																								end

																																																																																								panel.Scroll.CanvasPosition = Vector2.zero
																																																																																							end

																																																																																							local function fn45(arg, arg2)
																																																																																								local v123 = arg.Options[arg2]
																																																																																								if v123 == nil then
																																																																																									return
																																																																																								end

																																																																																								if arg.Multi then
																																																																																									local tbl18 = {}
																																																																																									local value = arg.Value

																																																																																									if type(value) == "table" then
																																																																																										for k in value, nil, nil do
																																																																																											tbl18[k] = true
																																																																																										end
																																																																																									end

																																																																																									if tbl18[v123] then
																																																																																										tbl18[v123] = nil
																																																																																									else
																																																																																										tbl18[v123] = true
																																																																																									end

																																																																																									arg:Set(tbl18)
																																																																																									return
																																																																																								end

																																																																																								arg:Set(v123)
																																																																																								local panel = arg._panel

																																																																																								if arg.CloseOnSelect and panel ~= nil then
																																																																																									panel.Popup:SetOpen(v86[153])
																																																																																								end
																																																																																							end

																																																																																							local function fn46(arg, arg2, layoutOrder)
																																																																																								local listRowHeight = v117.get().Row.ListRowHeight
																																																																																								local textButton = Instance.new("TextButton")
																																																																																								textButton.AutoButtonColor = false
																																																																																								textButton.BackgroundTransparency = v86[63]
																																																																																								textButton.TextColor3 = v121.get(v86[96])
																																																																																								textButton.Text = ""
																																																																																								textButton.Size = UDim2.new(1, 0, v86[186], listRowHeight)
																																																																																								textButton.ClipsDescendants = v86[34]
																																																																																								textButton.TextXAlignment = Enum.TextXAlignment.Left
																																																																																								textButton.BorderSizePixel = 0
																																																																																								textButton.TextSize = v86[13]
																																																																																								textButton.FontFace = arg._menu.Fonts.Main
																																																																																								textButton.LayoutOrder = layoutOrder
																																																																																								textButton.Parent = arg2.Scroll
																																																																																								local instance = Instance.new(v86[113])
																																																																																								instance.PaddingTop = UDim.new(0, 5)
																																																																																								instance.PaddingBottom = UDim.new(0, 5)
																																																																																								instance.PaddingRight = UDim.new(0, 5)
																																																																																								instance.PaddingLeft = UDim.new(0, 29)
																																																																																								instance.Parent = textButton
																																																																																								local imageLabel = Instance.new("ImageLabel")
																																																																																								imageLabel.Image = "rbxassetid://73347151382921"
																																																																																								imageLabel.ImageColor3 = v121.get(v86[174])
																																																																																								imageLabel.ImageTransparency = 1
																																																																																								imageLabel.BackgroundTransparency = 1
																																																																																								imageLabel.AnchorPoint = Vector2.new(0, 0.5)
																																																																																								imageLabel.Position = UDim2.new(0, -22, 0.5, 0)
																																																																																								imageLabel.Size = UDim2.fromOffset(14, 14)
																																																																																								imageLabel.BorderSizePixel = 0
																																																																																								imageLabel.Parent = textButton

																																																																																								v119.connectClick(arg._trove, textButton, function()
																																																																																									if arg2.Popup:IsOpen() then
																																																																																										fn45(arg, layoutOrder)
																																																																																									end
																																																																																								end)

																																																																																								return { Button = textButton, Tick = imageLabel }
																																																																																							end

																																																																																							local function fn47(arg)
																																																																																								local listRowHeight = v117.get().Row.ListRowHeight
																																																																																								local n = #arg.Rows
																																																																																								local scroll = arg.Scroll
																																																																																								scroll.AutomaticCanvasSize = Enum.AutomaticSize.None
																																																																																								scroll.CanvasSize = UDim2.fromOffset(0, n * listRowHeight + v86[122])

																																																																																								if n >= 10 then
																																																																																									scroll.Size = UDim2.new(v86[63], -1, 0, math.min(v86[162], n) * listRowHeight + 7)
																																																																																									scroll.AutomaticSize = Enum.AutomaticSize.None
																																																																																								else
																																																																																									scroll.Size = UDim2.new(1, -1, 0, v86[186])
																																																																																									scroll.AutomaticSize = Enum.AutomaticSize.Y
																																																																																								end
																																																																																							end

																																																																																							local function fn48(arg)
																																																																																								local panel = arg._panel
																																																																																								if panel == nil then
																																																																																									return
																																																																																								end
																																																																																								local rows = panel.Rows
																																																																																								local options = arg.Options

																																																																																								for k, v123 in options, nil, nil do
																																																																																									local v124 = rows[k]

																																																																																									if v124 == nil then
																																																																																										v124 = fn46(arg, panel, k)
																																																																																										rows[k] = v124
																																																																																									end

																																																																																									local v125 = fn38(arg, v123)

																																																																																									if v124.Button.Text ~= v125 then
																																																																																										v124.Button.Text = v125
																																																																																									end

																																																																																									if not v124.Button.Visible then
																																																																																										v124.Button.Visible = true
																																																																																									end
																																																																																								end

																																																																																								for i = #rows, #options + 1, -v86[63] do
																																																																																									rows[i].Button:Destroy()
																																																																																									rows[i] = nil
																																																																																								end

																																																																																								fn47(panel)
																																																																																								panel.RepositionTrove:Clean()

																																																																																								panel.RepositionTrove:Add(task.defer(function()
																																																																																									panel.Popup:Reposition()
																																																																																								end))
																																																																																							end

																																																																																							local function fn49(arg, arg2)
																																																																																								local listRowHeight = v117.get().Row.ListRowHeight
																																																																																								local menu = arg._menu
																																																																																								local root = arg2.Popup.Root
																																																																																								local instance = Instance.new(v86[128])
																																																																																								instance.BackgroundColor3 = v121.get(v86[168])
																																																																																								instance.BorderSizePixel = 0
																																																																																								instance.Size = UDim2.new(1, 0, 0, listRowHeight)
																																																																																								instance.ClipsDescendants = true
																																																																																								instance.Parent = root
																																																																																								local uiCorner = Instance.new("UICorner")
																																																																																								uiCorner.CornerRadius = UDim.new(v86[186], v86[175])
																																																																																								uiCorner.Parent = instance
																																																																																								local uiStroke = Instance.new("UIStroke")
																																																																																								uiStroke.Color = v121.get("Outline")
																																																																																								uiStroke.Parent = instance
																																																																																								local textBox = Instance.new("TextBox")
																																																																																								textBox.PlaceholderText = v86[190]
																																																																																								textBox.PlaceholderColor3 = v121.get("Unselected")
																																																																																								textBox.FontFace = menu.Fonts.Main
																																																																																								textBox.TextColor3 = v121.get(v86[174])
																																																																																								textBox.Text = ""
																																																																																								textBox.AnchorPoint = Vector2.new(0, 0.5)
																																																																																								textBox.Position = UDim2.new(v86[186], v86[54], 0.5, 0)
																																																																																								textBox.Size = UDim2.new(1, -12, 1, 0)
																																																																																								textBox.BackgroundTransparency = 1
																																																																																								textBox.BorderSizePixel = 0
																																																																																								textBox.TextSize = 14
																																																																																								textBox.TextXAlignment = Enum.TextXAlignment.Left
																																																																																								textBox.ClearTextOnFocus = true
																																																																																								textBox.Active = v86[34]
																																																																																								textBox.Parent = instance
																																																																																								arg2.SearchInput = textBox
																																																																																								arg2.Scroll.Position = UDim2.fromOffset(v86[186], v86[192])

																																																																																								arg._trove:Connect(textBox:GetPropertyChangedSignal("Text"), function()
																																																																																									fn44(arg, textBox.Text)
																																																																																								end)

																																																																																								arg._trove:Connect(textBox.Focused, function()
																																																																																									menu:Tween(textBox, { TextColor3 = v121.get("Accent") })
																																																																																								end)

																																																																																								arg._trove:Connect(textBox.FocusLost, function()
																																																																																									menu:Tween(textBox, { TextColor3 = v121.get("TextColor") })
																																																																																								end)
																																																																																							end

																																																																																							local function fn50(arg)
																																																																																								local panel = arg._panel
																																																																																								if panel ~= nil then
																																																																																									return panel
																																																																																								end
																																																																																								local rt = arg._rt
																																																																																								if rt == nil then
																																																																																									return nil
																																																																																								end
																																																																																								local panel2 = nil

																																																																																								local v123 = v120.new(arg._menu, arg._trove, {
																																																																																									Trigger = rt.Pill,
																																																																																									Size = UDim2.fromOffset(80, 0),
																																																																																									AutomaticSize = Enum.AutomaticSize.Y,
																																																																																									AnchorPoint = Vector2.new(1, 0),
																																																																																									Glow = v86[34],
																																																																																									ParentEntry = arg._parentOverlay,
																																																																																									Place = function(arg2, arg3)
																																																																																										local absolutePosition = arg2.AbsolutePosition
																																																																																										local n = math.floor(arg2.AbsoluteSize.X + 2 + 0.5)
																																																																																										local n33 = math.max(n, 80)
																																																																																										local n34 = v86[186]

																																																																																										for _, v123 in panel2.Rows, nil, nil do
																																																																																											if v123.Button.Visible then
																																																																																												n34 = math.max(n34, v123.Button.TextBounds.X)
																																																																																											end
																																																																																										end

																																																																																										arg3.Size = UDim2.fromOffset(math.max(n33, math.ceil(n34) + 40), v86[186])
																																																																																										return math.floor(absolutePosition.X + 0.5) + n, (math.floor(absolutePosition.Y + arg2.AbsoluteSize.Y + 4))
																																																																																									end,
																																																																																									OnToggle = function(arg2)
																																																																																										arg._menu:Tween(rt.Arrow, { Rotation = arg2 and 180 or 0 })
																																																																																										panel2.FocusTrove:Clean()

																																																																																										if not arg2 then
																																																																																											local searchInput = panel2.SearchInput

																																																																																											if searchInput ~= nil then
																																																																																												searchInput:ReleaseFocus()
																																																																																											end

																																																																																											return
																																																																																										end

																																																																																										local getOptions = arg._getOptions

																																																																																										if getOptions ~= nil then
																																																																																											arg:SetOptions(getOptions())
																																																																																										end

																																																																																										fn43(arg, true)
																																																																																										panel2.Scroll.CanvasPosition = Vector2.zero
																																																																																										local searchInput = panel2.SearchInput

																																																																																										if searchInput ~= nil then
																																																																																											searchInput.Text = ""
																																																																																											fn44(arg, "")

																																																																																											panel2.FocusTrove:Add(task.defer(function()
																																																																																												if panel2.Popup:IsOpen() then
																																																																																													searchInput:CaptureFocus()
																																																																																												end

																																																																																												if not flag2 then
																																																																																													return
																																																																																												end
																																																																																											end))
																																																																																										end
																																																																																									end,
																																																																																								})

																																																																																								local y = v122.currentViewportSize().Y
																																																																																								local n = math.floor(y * 0.6)

																																																																																								if v118.IsMobile() then
																																																																																									n = math.floor(y * 0.5)
																																																																																								end

																																																																																								local scrollingFrame = Instance.new("ScrollingFrame")
																																																																																								scrollingFrame.Active = true
																																																																																								scrollingFrame.ScrollBarImageTransparency = v86[101]
																																																																																								scrollingFrame.ScrollBarThickness = v86[26]
																																																																																								scrollingFrame.Size = UDim2.new(1, -v86[63], 0, 0)
																																																																																								scrollingFrame.BorderSizePixel = 0
																																																																																								scrollingFrame.BackgroundTransparency = v86[63]
																																																																																								scrollingFrame.AutomaticSize = Enum.AutomaticSize.Y
																																																																																								scrollingFrame.CanvasSize = UDim2.fromOffset(0, v86[186])
																																																																																								scrollingFrame.Selectable = v86[153]
																																																																																								scrollingFrame.ScrollBarImageColor3 = v121.get("Accent")
																																																																																								scrollingFrame.Parent = v123.Root
																																																																																								local instance = Instance.new(v86[176])
																																																																																								instance.MaxSize = Vector2.new(math.huge, n)
																																																																																								instance.Parent = scrollingFrame
																																																																																								local uiPadding = Instance.new("UIPadding")
																																																																																								uiPadding.PaddingBottom = UDim.new(0, v86[122])
																																																																																								uiPadding.Parent = scrollingFrame
																																																																																								local uiListLayout = Instance.new("UIListLayout")
																																																																																								uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																								uiListLayout.Parent = scrollingFrame

																																																																																								panel2 = {
																																																																																									Popup = v123,
																																																																																									Scroll = scrollingFrame,
																																																																																									SearchInput = nil,
																																																																																									Rows = {},
																																																																																									RepositionTrove = v123.Trove:Extend(),
																																																																																									FocusTrove = v123.Trove:Extend(),
																																																																																								}

																																																																																								arg._panel = panel2

																																																																																								if arg.Search then
																																																																																									fn49(arg, panel2)
																																																																																								end

																																																																																								fn48(arg)
																																																																																								return panel2
																																																																																							end

																																																																																							local function createTextButton(arg, parent, arg2)
																																																																																								local menu = arg._menu
																																																																																								local v123 = v117.get()
																																																																																								local inline = arg.Inline
																																																																																								local textButton = Instance.new("TextButton")
																																																																																								textButton.AutoButtonColor = false
																																																																																								textButton.Text = ""
																																																																																								textButton.AnchorPoint = Vector2.new(1, v86[101])
																																																																																								textButton.Position = UDim2.new(1, -v86[63], 0.5, 0)
																																																																																								textButton.BorderSizePixel = 0
																																																																																								textButton.BackgroundColor3 = color

																																																																																								if inline then
																																																																																									textButton.Size = UDim2.fromOffset(0, v123.Row.ControlHeight)
																																																																																									textButton.ClipsDescendants = true
																																																																																									textButton.AutomaticSize = Enum.AutomaticSize.X
																																																																																								else
																																																																																									textButton.Size = UDim2.fromOffset(137, 24)
																																																																																								end

																																																																																								textButton.Parent = parent
																																																																																								local uiGradient = Instance.new("UIGradient")
																																																																																								uiGradient.Rotation = v86[45]
																																																																																								arg2.Batch:BindGradient(uiGradient, { "GradientMid", "GradientDark" })
																																																																																								uiGradient.Parent = textButton
																																																																																								local uiCorner = Instance.new("UICorner")
																																																																																								uiCorner.CornerRadius = UDim.new(0, v86[175])
																																																																																								uiCorner.Parent = textButton

																																																																																								if inline then
																																																																																									local uiSizeConstraint = Instance.new("UISizeConstraint")
																																																																																									uiSizeConstraint.MaxSize = Vector2.new(arg.MaxWidth, v123.Row.ControlHeight)
																																																																																									uiSizeConstraint.Parent = textButton
																																																																																								end

																																																																																								local uiStroke = Instance.new("UIStroke")

																																																																																								if not inline then
																																																																																									uiStroke.BorderOffset = UDim.new(0, -1)
																																																																																								end

																																																																																								uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
																																																																																								arg2.Batch:Bind(uiStroke, "Color", "Outline")
																																																																																								uiStroke.Parent = textButton
																																																																																								local imageLabel = Instance.new("ImageLabel")
																																																																																								imageLabel.Image = "rbxassetid://84796267467531"
																																																																																								imageLabel.BackgroundTransparency = v86[63]
																																																																																								imageLabel.Size = UDim2.fromOffset(9, 5)
																																																																																								imageLabel.BorderSizePixel = v86[186]

																																																																																								if inline then
																																																																																									imageLabel.LayoutOrder = 1
																																																																																								else
																																																																																									imageLabel.AnchorPoint = Vector2.new(1, 0.5)
																																																																																									imageLabel.Position = UDim2.new(1, -8, 0.5, 0)
																																																																																								end

																																																																																								arg2.Batch:Bind(imageLabel, "ImageColor3", "Unselected")
																																																																																								imageLabel.Parent = textButton
																																																																																								local instance = Instance.new(v86[135])
																																																																																								instance.Text = fn39(arg)
																																																																																								instance.AnchorPoint = Vector2.new(0, v86[101])
																																																																																								instance.Position = UDim2.new(0, 5, v86[101], 0)
																																																																																								instance.BackgroundTransparency = 1
																																																																																								instance.BorderSizePixel = 0
																																																																																								instance.TextSize = v86[13]
																																																																																								instance.TextTruncate = Enum.TextTruncate.AtEnd

																																																																																								if inline then
																																																																																									instance.LayoutOrder = -1
																																																																																									instance.FontFace = menu.Fonts.Main
																																																																																									instance.AutomaticSize = Enum.AutomaticSize.XY
																																																																																								else
																																																																																									instance.ClipsDescendants = true
																																																																																									instance.FontFace = v116.Medium
																																																																																									instance.Size = UDim2.new(1, -25, 0, 0)
																																																																																									instance.TextXAlignment = Enum.TextXAlignment.Left
																																																																																									instance.AutomaticSize = Enum.AutomaticSize.Y
																																																																																								end

																																																																																								arg2.Batch:Bind(instance, "TextColor3", "TextColor")
																																																																																								instance.Parent = textButton

																																																																																								if inline then
																																																																																									local instance2 = Instance.new(v86[113])
																																																																																									instance2.PaddingBottom = UDim.new(0, 2)
																																																																																									instance2.Parent = instance
																																																																																									local uiListLayout = Instance.new("UIListLayout")
																																																																																									uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
																																																																																									uiListLayout.FillDirection = Enum.FillDirection.Horizontal
																																																																																									uiListLayout.Padding = UDim.new(0, 6)
																																																																																									uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																									uiListLayout.Parent = textButton
																																																																																									local uiPadding = Instance.new("UIPadding")
																																																																																									uiPadding.PaddingTop = UDim.new(v86[186], 2)
																																																																																									uiPadding.PaddingRight = UDim.new(0, 6)
																																																																																									uiPadding.PaddingLeft = UDim.new(v86[186], v86[54])
																																																																																									uiPadding.Parent = textButton
																																																																																									local v124 = menu:DragTweenInfo()

																																																																																									arg2.Trove:Connect(instance:GetPropertyChangedSignal("Text"), function()
																																																																																										local controlHeight = v123.Row.ControlHeight
																																																																																										menu:Tween(textButton, { Size = UDim2.fromOffset(math.min(instance.AbsoluteSize.X, arg.MaxWidth), controlHeight) }, v124)
																																																																																									end)

																																																																																									arg2.Trove:Add(task.defer(function()
																																																																																										if instance.Parent ~= nil then
																																																																																											local controlHeight = v123.Row.ControlHeight
																																																																																											textButton.Size = UDim2.fromOffset(math.min(instance.AbsoluteSize.X + v86[144], arg.MaxWidth + 22), controlHeight)
																																																																																										end
																																																																																									end))
																																																																																								end

																																																																																								arg._rt = { Pill = textButton, ValueLabel = instance, Arrow = imageLabel }

																																																																																								if arg._parentOverlay == nil then
																																																																																									arg._parentOverlay = arg2.ParentOverlay
																																																																																								end

																																																																																								v119.connectClick(arg2.Trove, textButton, function()
																																																																																									if #arg.Options == 0 and arg._getOptions == nil then
																																																																																										return
																																																																																									end
																																																																																									local v124 = fn50(arg)

																																																																																									if v124 ~= nil then
																																																																																										v124.Popup:Toggle()
																																																																																									end
																																																																																								end)

																																																																																								local v124 = nil

																																																																																								v119.connectPress(arg2.Trove, textButton, function()
																																																																																									local backgroundColor3 = textButton.BackgroundColor3
																																																																																									v124 = backgroundColor3
																																																																																									menu:Tween(textButton, { BackgroundColor3 = Color3.new(backgroundColor3.R * v86[105], backgroundColor3.G * 0.85, backgroundColor3.B * 0.85) }, tweenInfo)
																																																																																								end, function()
																																																																																									if v124 ~= nil then
																																																																																										menu:Tween(textButton, { BackgroundColor3 = v124 }, tweenInfo)
																																																																																										v124 = nil
																																																																																									end
																																																																																								end)

																																																																																								return textButton
																																																																																							end

																																																																																							local function fn51(arg, arg2, arg3, arg4, arg5, arg6, arg7)
																																																																																								local obj = setmetatable({
																																																																																									_trove = arg3,
																																																																																									_menu = arg,
																																																																																									Kind = "Dropdown",
																																																																																									Row = arg2,
																																																																																									Multi = arg5,
																																																																																									Search = arg4.Search == true,
																																																																																									Inline = arg4.Inline == true,
																																																																																									CloseOnSelect = arg4.CloseOnSelect == true,
																																																																																									MaxWidth = arg4.MaxWidth or 300,
																																																																																									Options = table.clone(arg4.Options or {}),
																																																																																									_labelByValue = arg4.Labels or {},
																																																																																									Value = arg6,
																																																																																									Changed = arg3:Add(v115.new()),
																																																																																									ValueChanged = arg3:Add(v115.new()),
																																																																																									_onChanged = arg7,
																																																																																									_getOptions = arg4.GetOptions,
																																																																																									_isOptionsPublished = arg4.Options ~= nil or arg4.GetOptions == nil,
																																																																																									_indexByName = {},
																																																																																									_rt = nil,
																																																																																									_panel = nil,
																																																																																									_parentOverlay = nil,
																																																																																								}, index2)

																																																																																								fn37(obj)
																																																																																								local n = 138

																																																																																								if obj.Inline then
																																																																																									n = nil
																																																																																								end

																																																																																								arg2:AttachRight(function(arg8, arg9)
																																																																																									return createTextButton(obj, arg8, arg9)
																																																																																								end, n, nil, arg3)

																																																																																								return obj
																																																																																							end

																																																																																							index2._New = function(arg, arg2, arg3, arg4)
																																																																																								local options = arg4.Options or {}
																																																																																								local default = arg4.Default

																																																																																								if not (default ~= nil and (not (arg4.Options ~= nil or arg4.GetOptions == nil) or table.find(options, default) ~= nil)) then
																																																																																									default = options[1]
																																																																																								end

																																																																																								local onChanged = arg4.OnChanged

																																																																																								local function fn52()
																																																																																								end

																																																																																								if onChanged ~= nil then
																																																																																									fn52 = function(arg5)
																																																																																										onChanged(arg5)
																																																																																									end
																																																																																								end

																																																																																								return (fn51(arg, arg2, arg3, arg4, false, default, fn52))
																																																																																							end

																																																																																							index2._NewMulti = function(arg, arg2, arg3, arg4)
																																																																																								local onChanged = arg4.OnChanged

																																																																																								local function fn52()
																																																																																								end

																																																																																								if onChanged ~= nil then
																																																																																									fn52 = function(arg5)
																																																																																										onChanged(arg5)
																																																																																									end
																																																																																								end

																																																																																								return (fn51(arg, arg2, arg3, arg4, v86[34], fn36(arg4.Default), fn52))
																																																																																							end

																																																																																							local function fn52(arg, arg2)
																																																																																								for k in arg, nil, nil do
																																																																																									if not arg2[k] then
																																																																																										return false
																																																																																									end
																																																																																								end

																																																																																								for k in arg2, nil, nil do
																																																																																									if not arg[k] then
																																																																																										return false
																																																																																									end
																																																																																								end

																																																																																								return true
																																																																																							end

																																																																																							index2.Set = function(I,W,N)if I.Multi then local P= fn36 (W);local a=I.Value;if type(a)=="table"and( fn52 (P,a))then return;end;I.Value=P; fn43 (I,N==true); fn40 (I);I.ValueChanged:Fire(I.Value);if not N then I._onChanged(I.Value);I.Changed:Fire(I.Value);end;return;end;local P=if type(W)=="string"and(not I._isOptionsPublished or I._indexByName[W]~=nil)then W else nil;local a=I._isOptionsPublished and W~=nil and P==nil;if P==I.Value and not a then return;end;W=I.Value;I.Value=P;a=I._panel;if a~=nil and(a.Popup:IsOpen())then local e=N==true;local c=type(W)=="string"and I._indexByName[W]or nil;if c~=nil and a.Rows[c]~=nil then  fn42 (I,a.Rows[c],false,e);end;c=P~=nil and I._indexByName[P]or nil;if c~=nil and a.Rows[c]~=nil then  fn42 (I,a.Rows[c],true,e);end;end; fn40 (I);I.ValueChanged:Fire(I.Value);if not N then I._onChanged(I.Value);I.Changed:Fire(I.Value);end;end

																																																																																							index2.SetOptions = function(arg, arg2)
																																																																																								local tbl18 = arg2 or {}
																																																																																								local options = arg.Options
																																																																																								local isOptionsPublished = arg._isOptionsPublished
																																																																																								arg._isOptionsPublished = true

																																																																																								if isOptionsPublished and #tbl18 == #options then
																																																																																									local flag19 = true

																																																																																									for k, v123 in tbl18, nil, nil do
																																																																																										if options[k] ~= v123 then
																																																																																											flag19 = v86[153]
																																																																																											break
																																																																																										end
																																																																																									end

																																																																																									if flag19 then
																																																																																										return
																																																																																									end
																																																																																								end

																																																																																								local value = arg.Value
																																																																																								arg.Options = table.clone(tbl18)
																																																																																								fn37(arg)
																																																																																								fn48(arg)

																																																																																								if arg.Multi then
																																																																																									fn43(arg, true)
																																																																																									fn40(arg)
																																																																																									arg.ValueChanged:Fire(arg.Value)
																																																																																									return
																																																																																								end

																																																																																								local value2 = arg.Value

																																																																																								if type(value2) ~= "string" or arg._indexByName[value2] == nil then
																																																																																									arg.Value = nil
																																																																																								end

																																																																																								fn43(arg, true)
																																																																																								fn40(arg)
																																																																																								arg.ValueChanged:Fire(arg.Value)

																																																																																								if value ~= arg.Value then
																																																																																									arg._onChanged(arg.Value)
																																																																																									arg.Changed:Fire(arg.Value)
																																																																																								end
																																																																																							end

																																																																																							index2.Add = function(arg, arg2)
																																																																																								local v123 = v86[165]
																																																																																								if type(arg2) ~= v123 or arg._indexByName[arg2] ~= nil then
																																																																																									return
																																																																																								end
																																																																																								local v124 = table.clone(arg.Options)
																																																																																								table.insert(v124, arg2)
																																																																																								arg:SetOptions(v124)
																																																																																							end

																																																																																							index2.Remove = function(arg, arg2)
																																																																																								local v123 = arg._indexByName[arg2]
																																																																																								if v123 == nil then
																																																																																									return
																																																																																								end
																																																																																								local v124 = table.clone(arg.Options)
																																																																																								table.remove(v124, v123)
																																																																																								arg:SetOptions(v124)
																																																																																							end

																																																																																							index2.SetOpen = function(arg, arg2)
																																																																																								local v123 = fn50(arg)

																																																																																								if v123 ~= nil then
																																																																																									v123.Popup:SetOpen(arg2)
																																																																																								end
																																																																																							end

																																																																																							index2.SetLabel = function(arg, arg2)
																																																																																								arg.Row:SetLabel(arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.SetTooltip = function(arg, arg2)
																																																																																								arg.Row:SetTooltip(arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.SetVisible = function(arg, arg2)
																																																																																								arg.Row:SetVisible(arg2)
																																																																																							end

																																																																																							index2.OnChanged = function(arg, arg2)
																																																																																								arg._trove:Connect(arg.Changed, arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.Connect = function(arg, arg2, arg3)
																																																																																								arg._trove:Connect(arg2, arg3)
																																																																																								return arg
																																																																																							end

																																																																																							index2.Destroy = function(arg)
																																																																																								arg._trove:Destroy()
																																																																																							end

																																																																																							return index2
																																																																																						end

																																																																																						tbl17.H = function()
																																																																																							local h = tbl17.cache.H

																																																																																							if not h then
																																																																																								h = { c = fn35() }
																																																																																								tbl17.cache.H = h
																																																																																							end

																																																																																							return h.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					local function fn35()
																																																																																						tbl17.r()
																																																																																						local v115 = tbl17.s()
																																																																																						tbl17.B()
																																																																																						local v116 = tbl17.w()
																																																																																						local color = Color3.fromRGB(v86[108], 255, 255)
																																																																																						local udim2 = UDim2.fromOffset(14, 14)
																																																																																						local udim22 = UDim2.fromOffset(18, 18)

																																																																																						return {
																																																																																							buildTrack = function(parent, arg, arg2)
																																																																																								local frame = Instance.new("Frame")
																																																																																								frame.AnchorPoint = Vector2.new(0, 0.5)
																																																																																								frame.Position = UDim2.fromScale(0, 0.5)
																																																																																								frame.Size = UDim2.new(1, -arg2 - 11, 0, 2)
																																																																																								frame.BorderSizePixel = 0
																																																																																								frame.BackgroundColor3 = color
																																																																																								frame.Parent = parent
																																																																																								local uiGradient = Instance.new("UIGradient")
																																																																																								arg.Batch:BindGradient(uiGradient, { "GradientDark", v86[187] })
																																																																																								uiGradient.Parent = frame
																																																																																								local uiStroke = Instance.new("UIStroke")
																																																																																								arg.Batch:Bind(uiStroke, "Color", "Outline")
																																																																																								uiStroke.Parent = frame
																																																																																								local uiCorner = Instance.new("UICorner")
																																																																																								uiCorner.CornerRadius = UDim.new(v86[63], 0)
																																																																																								uiCorner.Parent = frame
																																																																																								local instance = Instance.new(v86[128])
																																																																																								instance.AnchorPoint = Vector2.new(0.5, 0.5)
																																																																																								instance.Position = UDim2.fromScale(0.5, 0.5)
																																																																																								instance.Size = UDim2.new(1, v86[186], 0, 44)
																																																																																								instance.BackgroundTransparency = 1
																																																																																								instance.BorderSizePixel = v86[186]
																																																																																								instance.Active = true
																																																																																								instance.ZIndex = 0
																																																																																								instance.Parent = frame
																																																																																								return frame, instance
																																																																																							end,
																																																																																							buildThumb = function(parent)
																																																																																								local frame = Instance.new("Frame")
																																																																																								frame.AnchorPoint = Vector2.new(0.5, 0.5)
																																																																																								frame.Position = UDim2.fromScale(v86[186], 0.5)
																																																																																								frame.Size = udim2
																																																																																								frame.BorderSizePixel = v86[186]
																																																																																								frame.BackgroundColor3 = color
																																																																																								frame.ZIndex = 2
																																																																																								frame.Parent = parent
																																																																																								local uiCorner = Instance.new("UICorner")
																																																																																								uiCorner.CornerRadius = UDim.new(1, 0)
																																																																																								uiCorner.Parent = frame
																																																																																								return frame
																																																																																							end,
																																																																																							setThumbPressed = function(arg, arg2, arg3)
																																																																																								arg:Tween(arg2, { Size = arg3 and udim22 or udim2 })
																																																																																							end,
																																																																																							valueAt = function(arg, arg2, arg3, arg4)
																																																																																								return (arg4 - arg3) * (arg2 - arg.AbsolutePosition.X) / arg.AbsoluteSize.X + arg3
																																																																																							end,
																																																																																							newTouchBubble = function(arg, arg2)
																																																																																								local v117 = nil
																																																																																								local v118 = nil

																																																																																								local function fn36()
																																																																																									local v119 = v117
																																																																																									local v120 = v118
																																																																																									if v119 ~= nil and v120 ~= nil then
																																																																																										return v119, v120
																																																																																									end
																																																																																									local frame = Instance.new("Frame")
																																																																																									frame.AnchorPoint = Vector2.new(v86[101], 0.5)
																																																																																									frame.Size = UDim2.fromOffset(42, 28)
																																																																																									frame.BorderSizePixel = 0
																																																																																									frame.Visible = false
																																																																																									frame.ZIndex = 20
																																																																																									arg2.Batch:Bind(frame, v86[5], "Background")
																																																																																									arg2.Trove:Add(frame)
																																																																																									frame.Parent = arg:GetOverlayLayer()
																																																																																									local uiCorner = Instance.new("UICorner")
																																																																																									uiCorner.CornerRadius = UDim.new(0, 5)
																																																																																									uiCorner.Parent = frame
																																																																																									local uiStroke = Instance.new("UIStroke")
																																																																																									arg2.Batch:Bind(uiStroke, "Color", "Outline")
																																																																																									uiStroke.Parent = frame
																																																																																									local instance = Instance.new(v86[135])
																																																																																									instance.FontFace = v115.SemiBold
																																																																																									instance.BackgroundTransparency = 1
																																																																																									instance.Size = UDim2.fromScale(1, 1)
																																																																																									instance.BorderSizePixel = v86[186]
																																																																																									instance.TextSize = 14
																																																																																									instance.ZIndex = 21
																																																																																									arg2.Batch:Bind(instance, "TextColor3", "TextColor")
																																																																																									instance.Parent = frame
																																																																																									v117 = frame
																																																																																									v118 = instance
																																																																																									return frame, instance
																																																																																								end

																																																																																								return {
																																																																																									Show = function(arg3, text)
																																																																																										local v119, v120 = fn36()
																																																																																										v120.Text = text
																																																																																										v119.Size = UDim2.fromOffset(math.max(42, #text * 8 + 16), v86[25])
																																																																																										local n = arg3.AbsolutePosition + arg3.AbsoluteSize / 2
																																																																																										local v121 = v116.absoluteToLayerOffset(arg:GetOverlayLayer(), n)
																																																																																										v119.Position = UDim2.fromOffset(v121.X, v121.Y - 40)
																																																																																										v119.Visible = v86[34]
																																																																																									end,
																																																																																									Hide = function()
																																																																																										if v117 ~= nil then
																																																																																											v117.Visible = false
																																																																																										end
																																																																																									end,
																																																																																								}
																																																																																							end,
																																																																																						}
																																																																																					end

																																																																																					tbl17.I = function()
																																																																																						local i = tbl17.cache.I

																																																																																						if not i then
																																																																																							i = { c = fn35() }
																																																																																							tbl17.cache.I = i
																																																																																						end

																																																																																						return i.c
																																																																																					end
																																																																																				end
																																																																																			end

																																																																																			do
																																																																																				do
																																																																																					do
																																																																																						local function fn35()
																																																																																							local v115 = tbl17.g()
																																																																																							tbl17.k()
																																																																																							tbl17.r()
																																																																																							local v116 = tbl17.s()
																																																																																							local v117 = tbl17.v()
																																																																																							local v118 = tbl17.x()
																																																																																							tbl17.B()
																																																																																							local v119 = tbl17.I()
																																																																																							local v120 = tbl17.w()
																																																																																							local index2 = {}
																																																																																							index2.__index = index2

																																																																																							local function fn36(arg, arg2, arg3)
																																																																																								local min = arg.Min
																																																																																								local max = arg.Max
																																																																																								local n = math.clamp(v120.round(arg2, arg.Step), min, max)
																																																																																								local n33 = math.clamp(v120.round(arg3, arg.Step), arg.Min, arg.Max)

																																																																																								if not (n33 < n) then
																																																																																									local v121 = n33
																																																																																									n33 = n
																																																																																									n = v121
																																																																																								end

																																																																																								return n33, n
																																																																																							end

																																																																																							local function fn37(arg, arg2)
																																																																																								if arg.Max == arg.Min then
																																																																																									return v86[186]
																																																																																								end
																																																																																								return (arg2 - arg.Min) / (arg.Max - arg.Min)
																																																																																							end

																																																																																							local function fn38(arg, arg2)
																																																																																								local v121 = fn37(arg, arg.Value.Min)
																																																																																								local v122 = fn37(arg, arg.Value.Max)
																																																																																								arg2.MinThumb.Position = UDim2.fromScale(v121, v86[101])
																																																																																								arg2.MaxThumb.Position = UDim2.fromScale(v122, v86[101])
																																																																																								local udim2 = UDim2.fromScale(v121, 0)
																																																																																								local udim22 = UDim2.fromScale(v122 - v121, v86[63])

																																																																																								if arg._isDragging then
																																																																																									arg2.Accent.Position = udim2
																																																																																									arg2.Accent.Size = udim22
																																																																																								else
																																																																																									arg._menu:Tween(arg2.Accent, { Position = udim2, Size = udim22 }, arg._menu:DragTweenInfo())
																																																																																								end

																																																																																								local v123 = tostring
																																																																																								local max = arg.Value.Max
																																																																																								arg2.ValueLabel.Text = ("%s - %s"):format(tostring(arg.Value.Min), v123(max))
																																																																																							end

																																																																																							local function fn39(arg, parent, arg2, arg3)
																																																																																								local menu = arg._menu
																																																																																								local controlHeight = v117.get().Row.ControlHeight
																																																																																								local v121, v122 = v119.buildTrack(parent, arg2, arg3)
																																																																																								local frame = Instance.new("Frame")
																																																																																								frame.Position = UDim2.new(0, 0, 0, v86[186])
																																																																																								frame.Size = UDim2.fromScale(0, 1)
																																																																																								frame.BorderSizePixel = 0
																																																																																								arg2.Batch:Bind(frame, "BackgroundColor3", v86[139])
																																																																																								frame.Parent = v121
																																																																																								local v123 = v119.buildThumb(v121)
																																																																																								local v124 = v119.buildThumb(v121)
																																																																																								local frame2 = Instance.new("Frame")
																																																																																								frame2.AnchorPoint = Vector2.new(v86[63], 0.5)
																																																																																								frame2.Position = UDim2.fromScale(1, 0.5)
																																																																																								frame2.Size = UDim2.fromOffset(arg3, controlHeight)
																																																																																								frame2.BorderSizePixel = v86[186]
																																																																																								frame2.ClipsDescendants = v86[34]
																																																																																								arg2.Batch:Bind(frame2, "BackgroundColor3", "Background")
																																																																																								frame2.Parent = parent
																																																																																								local instance = Instance.new(v86[176])
																																																																																								instance.MinSize = Vector2.new(arg3, controlHeight)
																																																																																								instance.Parent = frame2
																																																																																								local uiCorner = Instance.new("UICorner")
																																																																																								uiCorner.CornerRadius = UDim.new(v86[186], 5)
																																																																																								uiCorner.Parent = frame2
																																																																																								local uiStroke = Instance.new("UIStroke")
																																																																																								arg2.Batch:Bind(uiStroke, "Color", "Outline")
																																																																																								uiStroke.Parent = frame2
																																																																																								local textLabel = Instance.new("TextLabel")
																																																																																								textLabel.FontFace = v116.SemiBold
																																																																																								textLabel.Text = ""
																																																																																								textLabel.BackgroundTransparency = 1
																																																																																								textLabel.Size = UDim2.fromScale(1, 1)
																																																																																								textLabel.BorderSizePixel = 0
																																																																																								textLabel.TextSize = 14
																																																																																								arg2.Batch:Bind(textLabel, v86[167], "TextColor")
																																																																																								textLabel.Parent = frame2
																																																																																								local uiPadding = Instance.new("UIPadding")
																																																																																								uiPadding.PaddingRight = UDim.new(0, 6)
																																																																																								uiPadding.PaddingLeft = UDim.new(0, 6)
																																																																																								uiPadding.Parent = textLabel
																																																																																								local rt = { Outline = v121, Accent = frame, MinThumb = v123, MaxThumb = v124, ValueLabel = textLabel }
																																																																																								arg._rt = rt
																																																																																								local v125 = nil
																																																																																								local v126 = v119.newTouchBubble(menu, arg2)

																																																																																								local function fn40(arg4)
																																																																																									return arg4 == v86[16] and v123 or v124
																																																																																								end

																																																																																								local function fn41(arg4)
																																																																																									local x = v121.AbsolutePosition.X
																																																																																									local x2 = v121.AbsoluteSize.X
																																																																																									local n = x + fn37(arg, arg.Value.Min) * x2
																																																																																									local n33 = x + fn37(arg, arg.Value.Max) * x2
																																																																																									return math.abs(arg4 - n) < math.abs(arg4 - n33) and v86[16] or "max"
																																																																																								end

																																																																																								local function fn42(arg4, arg5)
																																																																																									local v127 = v125

																																																																																									if v127 == nil then
																																																																																										v127 = arg5 or fn41(arg4.Position.X)
																																																																																										v125 = v127
																																																																																										v119.setThumbPressed(menu, fn40(v127), true)
																																																																																									end

																																																																																									local v128 = v119.valueAt(v121, arg4.Position.X, arg.Min, arg.Max)

																																																																																									if v127 == v86[16] then
																																																																																										arg:Set({ Min = v128, Max = arg.Value.Max })
																																																																																									else
																																																																																										arg:Set({ Min = arg.Value.Min, Max = v128 })
																																																																																									end

																																																																																									if arg4.UserInputType == Enum.UserInputType.Touch then
																																																																																										local min = v127 == "min" and arg.Value.Min or arg.Value.Max
																																																																																										local v129 = tostring
																																																																																										v126.Show(fn40(v127), v129(min))
																																																																																									end
																																																																																								end

																																																																																								local tbl18 = nil

																																																																																								local function fn43(isDragging, arg4)
																																																																																									arg._isDragging = isDragging
																																																																																									if isDragging then
																																																																																										tbl18 = { Min = arg.Value.Min, Max = arg.Value.Max }
																																																																																										return
																																																																																									end

																																																																																									if arg4 and tbl18 ~= nil then
																																																																																										arg:Set(tbl18, true)
																																																																																									end

																																																																																									tbl18 = nil

																																																																																									if v125 ~= nil then
																																																																																										v119.setThumbPressed(menu, fn40(v125), false)
																																																																																										v125 = nil
																																																																																									end

																																																																																									v126.Hide()
																																																																																								end

																																																																																								v118.connectDrag(arg2.Trove, v122, function(arg4)
																																																																																									fn42(arg4, nil)
																																																																																								end, fn43)

																																																																																								v118.connectDrag(arg2.Trove, v123, function(arg4)
																																																																																									fn42(arg4, "min")
																																																																																								end, fn43)

																																																																																								v118.connectDrag(arg2.Trove, v124, function(arg4)
																																																																																									fn42(arg4, "max")
																																																																																								end, fn43)

																																																																																								arg2.Trove:Connect(arg.ValueChanged, function()
																																																																																									fn38(arg, rt)
																																																																																								end)

																																																																																								fn38(arg, rt)
																																																																																							end

																																																																																							index2._New = function(arg, arg2, arg3, arg4)
																																																																																								local min = arg4.Min
																																																																																								local max = arg4.Max

																																																																																								local obj = setmetatable({
																																																																																									_trove = arg3,
																																																																																									_menu = arg,
																																																																																									Kind = "RangeSlider",
																																																																																									Row = arg2,
																																																																																									Min = min,
																																																																																									Max = max,
																																																																																									Step = arg4.Step or v86[63],
																																																																																									Value = { Min = min, Max = max },
																																																																																									Changed = arg3:Add(v115.new()),
																																																																																									ValueChanged = arg3:Add(v115.new()),
																																																																																									_onChanged = arg4.OnChanged or function()
																																																																																									end,
																																																																																									_isDragging = false,
																																																																																									_rt = nil,
																																																																																								}, index2)

																																																																																								local default = arg4.Default

																																																																																								if default ~= nil then
																																																																																									local v121, v122 = fn36(obj, default.Min, default.Max)
																																																																																									obj.Value = { Min = v121, Max = v122 }
																																																																																								end

																																																																																								local n = math.max(v86[8], (#tostring(min) + #tostring(max) + 3) * 8 + 20)

																																																																																								arg2:AttachRight(function(arg5, arg6)
																																																																																									fn39(obj, arg5, arg6, n)
																																																																																									return nil
																																																																																								end, nil, nil, arg3)

																																																																																								return obj
																																																																																							end

																																																																																							index2.Set = function(arg, arg2, arg3)
																																																																																								if type(arg2) ~= "table" then
																																																																																									return
																																																																																								end
																																																																																								local v121, v122 = fn36(arg, tonumber(arg2.Min) or arg.Value.Min, tonumber(arg2.Max) or arg.Value.Max)
																																																																																								if v121 == arg.Value.Min and v122 == arg.Value.Max then
																																																																																									return
																																																																																								end
																																																																																								arg.Value = { Min = v121, Max = v122 }
																																																																																								arg.ValueChanged:Fire(arg.Value)

																																																																																								if not arg3 then
																																																																																									arg._onChanged(arg.Value)
																																																																																									arg.Changed:Fire(arg.Value)
																																																																																								end
																																																																																							end

																																																																																							index2.SetLabel = function(arg, arg2)
																																																																																								arg.Row:SetLabel(arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.SetTooltip = function(arg, arg2)
																																																																																								arg.Row:SetTooltip(arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.SetVisible = function(arg, arg2)
																																																																																								arg.Row:SetVisible(arg2)
																																																																																							end

																																																																																							index2.OnChanged = function(arg, arg2)
																																																																																								arg._trove:Connect(arg.Changed, arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.Connect = function(arg, arg2, arg3)
																																																																																								arg._trove:Connect(arg2, arg3)
																																																																																								return arg
																																																																																							end

																																																																																							index2.Destroy = function(arg)
																																																																																								arg._trove:Destroy()
																																																																																							end

																																																																																							return index2
																																																																																						end

																																																																																						tbl17.J = function()
																																																																																							local j = tbl17.cache.J

																																																																																							if not j then
																																																																																								local j2 = { c = fn35() }
																																																																																								tbl17.cache.J = j2
																																																																																								j = j2
																																																																																							end

																																																																																							return j.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					do
																																																																																						local function fn35()
																																																																																							local v115 = tbl17.g()
																																																																																							tbl17.k()
																																																																																							tbl17.r()
																																																																																							local v116 = tbl17.s()
																																																																																							local v117 = tbl17.v()
																																																																																							local v118 = tbl17.x()
																																																																																							tbl17.B()
																																																																																							local v119 = tbl17.I()
																																																																																							local v120 = tbl17.w()
																																																																																							local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
																																																																																							local color = Color3.fromRGB(255, v86[108], 255)
																																																																																							local index2 = {}
																																																																																							index2.__index = index2

																																																																																							local function fn36(arg, arg2)
																																																																																								return math.clamp(v120.round(tonumber(arg2) or arg.Min, arg.Step), arg.Min, arg.Max)
																																																																																							end

																																																																																							local function fn37(arg)
																																																																																								local suffix = arg.Suffix
																																																																																								return tostring(arg.Value) .. suffix
																																																																																							end

																																																																																							local function fn38(arg, arg2, arg3)
																																																																																								arg2.ValueText.Text = fn37(arg)

																																																																																								if not arg._isDragging then
																																																																																									arg2.UpdateValueBoxSize()
																																																																																								end

																																																																																								local n = 0

																																																																																								if arg.Max ~= arg.Min then
																																																																																									n = (arg.Value - arg.Min) / (arg.Max - arg.Min)
																																																																																								end

																																																																																								if arg._isDragging or arg3 then
																																																																																									arg2.Accent.Size = UDim2.fromScale(n, 1)
																																																																																									return
																																																																																								end
																																																																																								arg._menu:Tween(arg2.Accent, { Size = UDim2.fromScale(n, 1) }, arg._menu:DragTweenInfo())
																																																																																							end

																																																																																							local function fn39(arg, parent, arg2, arg3)
																																																																																								local menu = arg._menu
																																																																																								local controlHeight = v117.get().Row.ControlHeight
																																																																																								local v121, v122 = v119.buildTrack(parent, arg2, arg3)
																																																																																								local frame = Instance.new("Frame")
																																																																																								frame.Size = UDim2.fromScale(v86[186], v86[63])
																																																																																								frame.BorderSizePixel = 0
																																																																																								arg2.Batch:Bind(frame, v86[5], "Accent")
																																																																																								frame.Parent = v121
																																																																																								local uiStroke = Instance.new("UIStroke")
																																																																																								arg2.Batch:Bind(uiStroke, v86[27], v86[139])
																																																																																								uiStroke.Parent = frame
																																																																																								local v123 = v119.buildThumb(frame)
																																																																																								v123.Position = UDim2.fromScale(1, 0.5)
																																																																																								local instance = Instance.new(v86[128])
																																																																																								instance.AnchorPoint = Vector2.new(1, 0.5)
																																																																																								instance.Position = UDim2.fromScale(v86[63], 0.5)
																																																																																								instance.Size = UDim2.fromOffset(arg3, controlHeight)
																																																																																								instance.BorderSizePixel = v86[186]
																																																																																								instance.ClipsDescendants = true
																																																																																								instance.BackgroundColor3 = color
																																																																																								instance.Parent = parent
																																																																																								local uiGradient = Instance.new("UIGradient")
																																																																																								uiGradient.Rotation = 90
																																																																																								arg2.Batch:BindGradient(uiGradient, { "GradientMid", "GradientDark" })
																																																																																								uiGradient.Parent = instance
																																																																																								local uiSizeConstraint = Instance.new("UISizeConstraint")
																																																																																								uiSizeConstraint.MinSize = Vector2.new(24, controlHeight)
																																																																																								uiSizeConstraint.Parent = instance
																																																																																								local uiCorner = Instance.new("UICorner")
																																																																																								uiCorner.CornerRadius = UDim.new(0, v86[175])
																																																																																								uiCorner.Parent = instance
																																																																																								local uiStroke2 = Instance.new("UIStroke")
																																																																																								arg2.Batch:Bind(uiStroke2, "Color", v86[120])
																																																																																								uiStroke2.Parent = instance
																																																																																								local textBox = Instance.new("TextBox")
																																																																																								textBox.FontFace = v116.SemiBold
																																																																																								textBox.Text = ""
																																																																																								textBox.BackgroundTransparency = 1
																																																																																								textBox.Size = UDim2.fromScale(1, 1)
																																																																																								textBox.BorderSizePixel = 0
																																																																																								textBox.TextSize = 16
																																																																																								textBox.TextScaled = false
																																																																																								arg2.Batch:Bind(textBox, "TextColor3", "TextColor")
																																																																																								textBox.Parent = instance
																																																																																								local uiPadding = Instance.new("UIPadding")
																																																																																								uiPadding.PaddingRight = UDim.new(0, 5)
																																																																																								uiPadding.PaddingLeft = UDim.new(v86[186], 5)
																																																																																								uiPadding.Parent = textBox

																																																																																								local function fn40()
																																																																																									local n = #textBox.Text
																																																																																									local n33 = 16

																																																																																									if n > 5 then
																																																																																										n33 = math.max(v86[181], 16 - n - 5)
																																																																																									end

																																																																																									if textBox.TextSize ~= n33 then
																																																																																										menu:Tween(textBox, { TextSize = n33 }, tweenInfo)
																																																																																									end

																																																																																									local n34 = math.clamp(n * n33 * 0.6 + 12, arg3, 72)

																																																																																									if instance.Size.X.Offset ~= n34 then
																																																																																										menu:Tween(instance, { Size = UDim2.fromOffset(n34, controlHeight) }, tweenInfo)
																																																																																										menu:Tween(v121, { Size = UDim2.new(v86[63], -n34 - v86[181], v86[186], 2) }, tweenInfo)
																																																																																									end
																																																																																								end

																																																																																								local rt = { Outline = v121, Accent = frame, ValueBox = instance, ValueText = textBox, UpdateValueBoxSize = fn40 }
																																																																																								arg._rt = rt

																																																																																								arg2.Trove:Connect(textBox.FocusLost, function()
																																																																																									local num = tonumber(textBox.Text:match("[%d%.%-]+"))

																																																																																									if num == nil then
																																																																																										fn38(arg, rt, true)
																																																																																									else
																																																																																										arg:Set(num)
																																																																																									end

																																																																																									fn40()
																																																																																								end)

																																																																																								local v124 = v119.newTouchBubble(menu, arg2)

																																																																																								local function fn41(arg4)
																																																																																									arg:Set(v119.valueAt(v121, arg4.Position.X, arg.Min, arg.Max))

																																																																																									if arg4.UserInputType == Enum.UserInputType.Touch then
																																																																																										v124.Show(v123, fn37(arg))
																																																																																									end
																																																																																								end

																																																																																								local value = nil

																																																																																								local function fn42(isDragging, arg4)
																																																																																									arg._isDragging = isDragging
																																																																																									v119.setThumbPressed(menu, v123, isDragging)
																																																																																									if isDragging then
																																																																																										value = arg.Value
																																																																																										return
																																																																																									end
																																																																																									v124.Hide()

																																																																																									if arg4 and value ~= nil then
																																																																																										arg:Set(value, true)
																																																																																									end

																																																																																									value = nil
																																																																																									fn40()
																																																																																								end

																																																																																								v118.connectDrag(arg2.Trove, v122, fn41, fn42)
																																																																																								v118.connectDrag(arg2.Trove, v123, fn41, fn42)

																																																																																								arg2.Trove:Connect(arg.ValueChanged, function()
																																																																																									fn38(arg, rt, false)
																																																																																								end)

																																																																																								fn38(arg, rt, true)
																																																																																								fn40()
																																																																																							end

																																																																																							index2._New = function(arg, arg2, arg3, arg4)
																																																																																								local min = arg4.Min
																																																																																								local max = arg4.Max
																																																																																								local suffix = arg4.Suffix or ""

																																																																																								local obj = setmetatable({
																																																																																									_trove = arg3,
																																																																																									_menu = arg,
																																																																																									Kind = v86[39],
																																																																																									Row = arg2,
																																																																																									Min = min,
																																																																																									Max = max,
																																																																																									Step = arg4.Step or v86[63],
																																																																																									Suffix = suffix,
																																																																																									Value = v86[186],
																																																																																									Changed = arg3:Add(v115.new()),
																																																																																									ValueChanged = arg3:Add(v115.new()),
																																																																																									_onChanged = arg4.OnChanged or function()
																																																																																									end,
																																																																																									_isDragging = false,
																																																																																									_rt = nil,
																																																																																								}, index2)

																																																																																								obj.Value = fn36(obj, arg4.Default or min)
																																																																																								local v121 = v86[183]
																																																																																								local n = math.clamp(math.max(#tostring(min) + #suffix, #tostring(max) + #suffix) * 16 * 0.6 + 12, 24, v121)

																																																																																								arg2:AttachRight(function(arg5, arg6)
																																																																																									fn39(obj, arg5, arg6, n)
																																																																																									return nil
																																																																																								end, nil, nil, arg3)

																																																																																								return obj
																																																																																							end

																																																																																							index2.Set = function(arg, arg2, arg3)
																																																																																								local v121 = fn36(arg, arg2)
																																																																																								if v121 == arg.Value then
																																																																																									return
																																																																																								end
																																																																																								arg.Value = v121
																																																																																								arg.ValueChanged:Fire(v121)

																																																																																								if not arg3 then
																																																																																									arg._onChanged(v121)
																																																																																									arg.Changed:Fire(v121)
																																																																																								end
																																																																																							end

																																																																																							index2.SetLabel = function(arg, arg2)
																																																																																								arg.Row:SetLabel(arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.SetTooltip = function(arg, arg2)
																																																																																								arg.Row:SetTooltip(arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.SetVisible = function(arg, arg2)
																																																																																								arg.Row:SetVisible(arg2)
																																																																																							end

																																																																																							index2.OnChanged = function(arg, arg2)
																																																																																								arg._trove:Connect(arg.Changed, arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.Connect = function(arg, arg2, arg3)
																																																																																								arg._trove:Connect(arg2, arg3)
																																																																																								return arg
																																																																																							end

																																																																																							index2.Destroy = function(arg)
																																																																																								arg._trove:Destroy()
																																																																																							end

																																																																																							return index2
																																																																																						end

																																																																																						tbl17.K = function()
																																																																																							local k = tbl17.cache.K

																																																																																							if not k then
																																																																																								local k2 = { c = fn35() }
																																																																																								tbl17.cache.K = k2
																																																																																								k = k2
																																																																																							end

																																																																																							return k.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					local function fn35()
																																																																																						local v115 = tbl17.E()
																																																																																						tbl17.r()
																																																																																						local v116 = tbl17.H()
																																																																																						local v117 = tbl17.s()
																																																																																						local v118 = tbl17.x()
																																																																																						tbl17.G()
																																																																																						local v119 = tbl17.J()
																																																																																						local v120 = tbl17.B()
																																																																																						local v121 = tbl17.K()
																																																																																						local v122 = tbl17.A()
																																																																																						local v123 = tbl17.w()
																																																																																						local color = Color3.fromRGB(v86[108], v86[108], 255)
																																																																																						local tbl18 = { "None", "Rainbow", "Breathing" }
																																																																																						local tbl19 = { "None", "Rainbow" }

																																																																																						local function fn36(parent, arg, arg2)
																																																																																							local n = 12

																																																																																							if arg2 then
																																																																																								n = 27
																																																																																							end

																																																																																							local frame = Instance.new("Frame")
																																																																																							frame.ClipsDescendants = v86[34]
																																																																																							frame.Size = UDim2.fromOffset(0, v86[144])
																																																																																							frame.AutomaticSize = Enum.AutomaticSize.X
																																																																																							frame.BorderSizePixel = v86[186]
																																																																																							frame.BackgroundColor3 = v122.get(v86[168])
																																																																																							frame.Parent = parent
																																																																																							local instance = Instance.new(v86[176])
																																																																																							instance.MinSize = Vector2.new(math.min(arg + n, n + 36), 22)
																																																																																							instance.MaxSize = Vector2.new(arg + n, 22)
																																																																																							instance.Parent = frame
																																																																																							local uiCorner = Instance.new("UICorner")
																																																																																							uiCorner.CornerRadius = UDim.new(0, 5)
																																																																																							uiCorner.Parent = frame
																																																																																							local instance2 = Instance.new(v86[85])
																																																																																							instance2.Color = v122.get("Outline")
																																																																																							instance2.Parent = frame
																																																																																							local textBox = Instance.new("TextBox")
																																																																																							textBox.ClearTextOnFocus = false
																																																																																							textBox.FontFace = v117.SemiBold
																																																																																							textBox.TextColor3 = v122.get("TextColor")
																																																																																							textBox.Text = ""
																																																																																							textBox.AnchorPoint = Vector2.new(v86[186], v86[101])
																																																																																							textBox.BorderSizePixel = 0
																																																																																							textBox.BackgroundTransparency = 1
																																																																																							textBox.Position = UDim2.new(0, v86[175], 0.5, 0)
																																																																																							textBox.AutomaticSize = Enum.AutomaticSize.XY
																																																																																							textBox.TextSize = v86[13]
																																																																																							textBox.Selectable = false
																																																																																							textBox.Active = true
																																																																																							textBox.Parent = frame
																																																																																							local instance3

																																																																																							if arg2 then
																																																																																								local uiListLayout = Instance.new("UIListLayout")
																																																																																								uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
																																																																																								uiListLayout.FillDirection = Enum.FillDirection.Horizontal
																																																																																								uiListLayout.Padding = UDim.new(0, v86[175])
																																																																																								uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																								uiListLayout.Parent = frame
																																																																																								local instance4 = Instance.new(v86[113])
																																																																																								instance4.PaddingRight = UDim.new(0, 5)
																																																																																								instance4.PaddingLeft = UDim.new(0, 5)
																																																																																								instance4.Parent = frame
																																																																																								instance3 = Instance.new(v86[128])
																																																																																								instance3.LayoutOrder = -1
																																																																																								instance3.Size = UDim2.fromOffset(12, 12)
																																																																																								instance3.BorderSizePixel = 0
																																																																																								instance3.Parent = frame
																																																																																								local uiCorner2 = Instance.new("UICorner")
																																																																																								uiCorner2.CornerRadius = UDim.new(0, 3)
																																																																																								uiCorner2.Parent = instance3
																																																																																								local uiPadding = Instance.new("UIPadding")
																																																																																								uiPadding.PaddingBottom = UDim.new(0, 2)
																																																																																								uiPadding.PaddingLeft = UDim.new(0, -v86[63])
																																																																																								uiPadding.PaddingRight = UDim.new(0, v86[63])
																																																																																								uiPadding.Parent = textBox
																																																																																							else
																																																																																								local uiPadding = Instance.new("UIPadding")
																																																																																								uiPadding.PaddingRight = UDim.new(0, v86[175])
																																																																																								uiPadding.PaddingLeft = UDim.new(0, 1)
																																																																																								uiPadding.Parent = textBox
																																																																																								instance3 = nil
																																																																																							end

																																																																																							return frame, textBox, instance3
																																																																																						end

																																																																																						return { build = function(arg, arg2, arg3, arg4, arg5)
																																																																																							local trove = arg2.Trove
																																																																																							local batch = arg2.Batch
																																																																																							local root = arg2.Root
																																																																																							local tbl20 = { Menu = arg, Trove = trove, Batch = batch }
																																																																																							local uiListLayout = Instance.new("UIListLayout")
																																																																																							uiListLayout.Padding = UDim.new(0, v86[170])
																																																																																							uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																							uiListLayout.Parent = root
																																																																																							local instance = Instance.new(v86[113])
																																																																																							instance.PaddingTop = UDim.new(0, 9)
																																																																																							instance.PaddingBottom = UDim.new(0, 10)
																																																																																							instance.PaddingRight = UDim.new(0, 9)
																																																																																							instance.PaddingLeft = UDim.new(0, 9)
																																																																																							instance.Parent = root
																																																																																							local frame = Instance.new("Frame")
																																																																																							frame.LayoutOrder = -1
																																																																																							frame.BackgroundTransparency = 1
																																																																																							frame.Size = UDim2.new(1, 0, 0, 23)
																																																																																							frame.BorderSizePixel = v86[186]
																																																																																							frame.Parent = root
																																																																																							local textLabel = Instance.new("TextLabel")
																																																																																							textLabel.FontFace = v117.Medium
																																																																																							textLabel.Text = v86[184]
																																																																																							textLabel.AnchorPoint = Vector2.new(0, 0.5)
																																																																																							textLabel.BackgroundTransparency = v86[63]
																																																																																							textLabel.Position = UDim2.fromScale(v86[186], 0.5)
																																																																																							textLabel.BorderSizePixel = 0
																																																																																							textLabel.AutomaticSize = Enum.AutomaticSize.XY
																																																																																							textLabel.TextSize = v86[13]
																																																																																							batch:Bind(textLabel, "TextColor3", v86[174])
																																																																																							textLabel.Parent = frame
																																																																																							local uiPadding = Instance.new("UIPadding")
																																																																																							uiPadding.PaddingBottom = UDim.new(v86[186], v86[56])
																																																																																							uiPadding.Parent = textLabel
																																																																																							local frame2 = Instance.new("Frame")
																																																																																							frame2.AnchorPoint = Vector2.new(1, 0)
																																																																																							frame2.Position = UDim2.fromScale(1, 0)
																																																																																							frame2.BackgroundTransparency = v86[63]
																																																																																							frame2.Size = UDim2.fromScale(0, 1)
																																																																																							frame2.AutomaticSize = Enum.AutomaticSize.X
																																																																																							frame2.BorderSizePixel = 0
																																																																																							frame2.Parent = frame
																																																																																							local instance2 = Instance.new(v86[4])
																																																																																							instance2.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																							instance2.Parent = frame2
																																																																																							local uiPadding2 = Instance.new("UIPadding")
																																																																																							uiPadding2.PaddingTop = UDim.new(0, 1)
																																																																																							uiPadding2.PaddingRight = UDim.new(v86[186], 1)
																																																																																							uiPadding2.PaddingLeft = UDim.new(0, 1)
																																																																																							uiPadding2.Parent = frame2
																																																																																							local v124 = nil

																																																																																							if arg4.Gradient == "editable" then
																																																																																								local v125 = v120.new(arg, { Bare = true })

																																																																																								local tbl21 = {
																																																																																									Inline = v86[34],
																																																																																									MaxWidth = 86,
																																																																																									Options = { "Solid", "Gradient" },
																																																																																									Default = arg3.Mode,
																																																																																									OnChanged = function(arg6)
																																																																																										if type(arg6) == "string" then
																																																																																											arg5.SetMode(arg6)
																																																																																										end
																																																																																									end,
																																																																																								}

																																																																																								v124 = v116._New(arg, v125, trove:Extend(), tbl21)
																																																																																								v125:Realize(frame2, tbl20, 0)
																																																																																							else
																																																																																								frame2.Visible = false
																																																																																							end

																																																																																							local frame3 = Instance.new("Frame")
																																																																																							frame3.LayoutOrder = 0
																																																																																							frame3.BackgroundTransparency = 1
																																																																																							frame3.BorderSizePixel = 0
																																																																																							frame3.AutomaticSize = Enum.AutomaticSize.XY
																																																																																							frame3.Parent = root
																																																																																							local uiListLayout2 = Instance.new("UIListLayout")
																																																																																							uiListLayout2.FillDirection = Enum.FillDirection.Horizontal
																																																																																							uiListLayout2.HorizontalFlex = Enum.UIFlexAlignment.Fill
																																																																																							uiListLayout2.Padding = UDim.new(v86[186], v86[149])
																																																																																							uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																							uiListLayout2.Parent = frame3
																																																																																							local frame4 = Instance.new("Frame")
																																																																																							frame4.Size = UDim2.fromOffset(241, 234)
																																																																																							frame4.BorderSizePixel = 0
																																																																																							frame4.BackgroundColor3 = Color3.fromRGB(v86[108], 0, 0)
																																																																																							frame4.Parent = frame3
																																																																																							local uiCorner = Instance.new("UICorner")
																																																																																							uiCorner.CornerRadius = UDim.new(0, v86[133])
																																																																																							uiCorner.Parent = frame4
																																																																																							local frame5 = Instance.new("Frame")
																																																																																							frame5.Size = UDim2.fromScale(1, 1)
																																																																																							frame5.ZIndex = v86[56]
																																																																																							frame5.BorderSizePixel = 0
																																																																																							frame5.BackgroundColor3 = color
																																																																																							frame5.Parent = frame4
																																																																																							local uiGradient = Instance.new("UIGradient")
																																																																																							uiGradient.Rotation = 270
																																																																																							uiGradient.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v86[186]), NumberSequenceKeypoint.new(1, 1) })
																																																																																							uiGradient.Color = ColorSequence.new(Color3.new(0, 0, 0))
																																																																																							uiGradient.Parent = frame5
																																																																																							local instance3 = Instance.new(v86[98])
																																																																																							instance3.CornerRadius = UDim.new(v86[186], 7)
																																																																																							instance3.Parent = frame5
																																																																																							local frame6 = Instance.new("Frame")
																																																																																							frame6.Size = UDim2.fromScale(v86[63], 1)
																																																																																							frame6.BorderSizePixel = 0
																																																																																							frame6.BackgroundColor3 = color
																																																																																							frame6.Parent = frame4
																																																																																							local uiGradient2 = Instance.new("UIGradient")
																																																																																							uiGradient2.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(v86[186], 0), NumberSequenceKeypoint.new(1, 1) })
																																																																																							uiGradient2.Parent = frame6
																																																																																							local instance4 = Instance.new(v86[98])
																																																																																							instance4.CornerRadius = UDim.new(0, 7)
																																																																																							instance4.Parent = frame6
																																																																																							local instance5 = Instance.new(v86[128])
																																																																																							instance5.BackgroundTransparency = 1
																																																																																							instance5.Position = UDim2.fromOffset(v86[122], 7)
																																																																																							instance5.Size = UDim2.new(1, -14, 1, -14)
																																																																																							instance5.ZIndex = v86[56]
																																																																																							instance5.BorderSizePixel = 0
																																																																																							instance5.Parent = frame4
																																																																																							local instance6 = Instance.new(v86[98])
																																																																																							instance6.CornerRadius = UDim.new(v86[186], 7)
																																																																																							instance6.Parent = instance5
																																																																																							local frame7 = Instance.new("Frame")
																																																																																							frame7.AnchorPoint = Vector2.new(0.5, 0.5)
																																																																																							frame7.Position = UDim2.fromScale(0.5, v86[101])
																																																																																							frame7.Size = UDim2.fromOffset(v86[12], 12)
																																																																																							frame7.ZIndex = 100
																																																																																							frame7.BorderSizePixel = 0
																																																																																							frame7.BackgroundColor3 = color
																																																																																							frame7.Parent = instance5
																																																																																							local uiCorner2 = Instance.new("UICorner")
																																																																																							uiCorner2.CornerRadius = UDim.new(v86[186], 7)
																																																																																							uiCorner2.Parent = frame7
																																																																																							local uiStroke = Instance.new("UIStroke")
																																																																																							uiStroke.Color = color
																																																																																							uiStroke.Thickness = 2
																																																																																							uiStroke.Parent = frame7
																																																																																							local frame8 = Instance.new("Frame")
																																																																																							frame8.BackgroundTransparency = 1
																																																																																							frame8.Size = UDim2.fromOffset(v86[186], 234)
																																																																																							frame8.BorderSizePixel = 0
																																																																																							frame8.AutomaticSize = Enum.AutomaticSize.XY
																																																																																							frame8.Parent = frame3
																																																																																							local uiListLayout3 = Instance.new("UIListLayout")
																																																																																							uiListLayout3.Padding = UDim.new(0, 23)
																																																																																							uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																							uiListLayout3.FillDirection = Enum.FillDirection.Horizontal
																																																																																							uiListLayout3.Parent = frame8
																																																																																							local instance7 = Instance.new(v86[113])
																																																																																							instance7.PaddingRight = UDim.new(0, v86[122])
																																																																																							instance7.PaddingLeft = UDim.new(0, v86[175])
																																																																																							instance7.Parent = frame8
																																																																																							local frame9 = Instance.new("Frame")
																																																																																							frame9.Size = UDim2.fromOffset(8, 234)
																																																																																							frame9.BorderSizePixel = 0
																																																																																							frame9.BackgroundColor3 = color
																																																																																							frame9.Parent = frame8
																																																																																							local frame10 = Instance.new("Frame")
																																																																																							frame10.AnchorPoint = Vector2.new(0.5, 0)
																																																																																							frame10.Position = UDim2.fromScale(v86[101], 0)
																																																																																							frame10.Size = UDim2.new(0, 28, 1, 0)
																																																																																							frame10.BackgroundTransparency = 1
																																																																																							frame10.Active = true
																																																																																							frame10.ZIndex = 150
																																																																																							frame10.Parent = frame9
																																																																																							local uiCorner3 = Instance.new("UICorner")
																																																																																							uiCorner3.CornerRadius = UDim.new(0, v86[155])
																																																																																							uiCorner3.Parent = frame9
																																																																																							local uiGradient3 = Instance.new("UIGradient")
																																																																																							uiGradient3.Rotation = v86[45]
																																																																																							local colorSequence = ColorSequence.new
																																																																																							local tbl21 = {}
																																																																																							local v125 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, v86[186]))
																																																																																							local v126 = ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0))
																																																																																							local v127 = ColorSequenceKeypoint.new(0.33, Color3.fromRGB(v86[186], 255, 0))
																																																																																							local v128 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255))
																																																																																							local v129 = ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255))
																																																																																							local v130 = ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, v86[108]))
																																																																																							tbl21[1] = v125
																																																																																							tbl21[2] = v126
																																																																																							tbl21[3] = v127
																																																																																							tbl21[4] = v128
																																																																																							tbl21[5] = v129
																																																																																							tbl21[6] = v130

																																																																																							do
																																																																																								local values = table.pack(ColorSequenceKeypoint.new(v86[63], Color3.fromRGB(255, 0, v86[186])))
																																																																																								table.move(values, 1, values.n, 7, tbl21)
																																																																																							end

																																																																																							uiGradient3.Color = colorSequence(tbl21)
																																																																																							uiGradient3.Parent = frame9
																																																																																							local frame11 = Instance.new("Frame")
																																																																																							frame11.BackgroundTransparency = 1
																																																																																							frame11.Position = UDim2.fromOffset(0, v86[56])
																																																																																							frame11.Size = UDim2.new(1, 0, 1, -8)
																																																																																							frame11.ZIndex = 2
																																																																																							frame11.BorderSizePixel = 0
																																																																																							frame11.Parent = frame9
																																																																																							local instance8 = Instance.new(v86[128])
																																																																																							instance8.AnchorPoint = Vector2.new(0.5, 0.5)
																																																																																							instance8.Position = UDim2.fromScale(0.5, 0.5)
																																																																																							instance8.Size = UDim2.fromOffset(16, v86[162])
																																																																																							instance8.ZIndex = 100
																																																																																							instance8.BorderSizePixel = 0
																																																																																							instance8.BackgroundColor3 = color
																																																																																							instance8.Parent = frame11
																																																																																							local instance9 = Instance.new(v86[85])
																																																																																							instance9.Color = color
																																																																																							instance9.Thickness = 2
																																																																																							instance9.Parent = instance8
																																																																																							local uiCorner4 = Instance.new("UICorner")
																																																																																							uiCorner4.CornerRadius = UDim.new(v86[63], 0)
																																																																																							uiCorner4.Parent = instance8
																																																																																							local frame12 = Instance.new("Frame")
																																																																																							frame12.Size = UDim2.fromOffset(8, 234)
																																																																																							frame12.BorderSizePixel = 0
																																																																																							frame12.BackgroundColor3 = color
																																																																																							frame12.Visible = arg4.AlphaEnabled
																																																																																							frame12.Parent = frame8
																																																																																							local frame13 = Instance.new("Frame")
																																																																																							frame13.AnchorPoint = Vector2.new(0.5, 0)
																																																																																							frame13.Position = UDim2.fromScale(0.5, 0)
																																																																																							frame13.Size = UDim2.new(v86[186], 28, 1, v86[186])
																																																																																							frame13.BackgroundTransparency = 1
																																																																																							frame13.Active = true
																																																																																							frame13.ZIndex = v86[110]
																																																																																							frame13.Parent = frame12
																																																																																							local uiCorner5 = Instance.new("UICorner")
																																																																																							uiCorner5.CornerRadius = UDim.new(v86[186], 3)
																																																																																							uiCorner5.Parent = frame12
																																																																																							local imageLabel = Instance.new("ImageLabel")
																																																																																							imageLabel.ScaleType = Enum.ScaleType.Tile
																																																																																							imageLabel.Image = "rbxassetid://18274452449"
																																																																																							imageLabel.BackgroundTransparency = v86[63]
																																																																																							imageLabel.Size = UDim2.fromScale(1, 1)
																																																																																							imageLabel.TileSize = UDim2.fromOffset(8, 8)
																																																																																							imageLabel.BorderSizePixel = v86[186]
																																																																																							imageLabel.Parent = frame12
																																																																																							local uiCorner6 = Instance.new("UICorner")
																																																																																							uiCorner6.CornerRadius = UDim.new(0, v86[155])
																																																																																							uiCorner6.Parent = imageLabel
																																																																																							local instance10 = Instance.new(v86[128])
																																																																																							instance10.Size = UDim2.fromScale(1, 1)
																																																																																							instance10.BorderSizePixel = 0
																																																																																							instance10.BackgroundColor3 = arg3.Color
																																																																																							instance10.Parent = frame12
																																																																																							local uiCorner7 = Instance.new("UICorner")
																																																																																							uiCorner7.CornerRadius = UDim.new(v86[186], 3)
																																																																																							uiCorner7.Parent = instance10
																																																																																							local instance11 = Instance.new(v86[46])
																																																																																							instance11.Rotation = 90
																																																																																							instance11.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(v86[63], 0) })
																																																																																							instance11.Parent = instance10
																																																																																							local instance12 = Instance.new(v86[128])
																																																																																							instance12.BackgroundTransparency = v86[63]
																																																																																							instance12.Position = UDim2.fromOffset(0, 4)
																																																																																							instance12.Size = UDim2.new(1, 0, 1, -v86[162])
																																																																																							instance12.ZIndex = 2
																																																																																							instance12.BorderSizePixel = 0
																																																																																							instance12.Parent = frame12
																																																																																							local frame14 = Instance.new("Frame")
																																																																																							frame14.AnchorPoint = Vector2.new(0.5, 0.5)
																																																																																							frame14.Position = UDim2.fromScale(0.5, 0.5)
																																																																																							frame14.Size = UDim2.fromOffset(12, 12)
																																																																																							frame14.ZIndex = 100
																																																																																							frame14.BorderSizePixel = 0
																																																																																							frame14.BackgroundColor3 = color
																																																																																							frame14.Parent = instance12
																																																																																							local uiStroke2 = Instance.new("UIStroke")
																																																																																							uiStroke2.Color = color
																																																																																							uiStroke2.Thickness = 2
																																																																																							uiStroke2.Parent = frame14
																																																																																							local uiCorner8 = Instance.new("UICorner")
																																																																																							uiCorner8.CornerRadius = UDim.new(1, 0)
																																																																																							uiCorner8.Parent = frame14
																																																																																							local frame15 = Instance.new("Frame")
																																																																																							frame15.LayoutOrder = 1
																																																																																							frame15.BackgroundTransparency = 1
																																																																																							frame15.Size = UDim2.new(1, 0, v86[186], v86[159])
																																																																																							frame15.BorderSizePixel = 0
																																																																																							frame15.Parent = root
																																																																																							local textLabel2 = Instance.new("TextLabel")
																																																																																							textLabel2.FontFace = v117.Medium
																																																																																							textLabel2.Text = "Input"
																																																																																							textLabel2.AnchorPoint = Vector2.new(0, v86[101])
																																																																																							textLabel2.BackgroundTransparency = 1
																																																																																							textLabel2.Position = UDim2.fromScale(0, v86[101])
																																																																																							textLabel2.BorderSizePixel = v86[186]
																																																																																							textLabel2.AutomaticSize = Enum.AutomaticSize.XY
																																																																																							textLabel2.TextSize = 16
																																																																																							batch:Bind(textLabel2, "TextColor3", "TextColor")
																																																																																							textLabel2.Parent = frame15
																																																																																							local frame16 = Instance.new("Frame")
																																																																																							frame16.BackgroundTransparency = v86[63]
																																																																																							frame16.Size = UDim2.fromScale(v86[186], 1)
																																																																																							frame16.AutomaticSize = Enum.AutomaticSize.X
																																																																																							frame16.BorderSizePixel = v86[186]
																																																																																							frame16.Parent = frame15
																																																																																							local uiListLayout4 = Instance.new("UIListLayout")
																																																																																							uiListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																							uiListLayout4.Parent = frame16
																																																																																							local uiPadding3 = Instance.new("UIPadding")
																																																																																							uiPadding3.PaddingTop = UDim.new(0, 1)
																																																																																							uiPadding3.PaddingLeft = UDim.new(0, v86[63])
																																																																																							uiPadding3.Parent = frame16
																																																																																							local frame17 = Instance.new("Frame")
																																																																																							frame17.AnchorPoint = Vector2.new(1, 0)
																																																																																							frame17.Position = UDim2.new(1, -v86[63], 0, 0)
																																																																																							frame17.BackgroundTransparency = v86[63]
																																																																																							frame17.Size = UDim2.fromScale(0, v86[63])
																																																																																							frame17.AutomaticSize = Enum.AutomaticSize.X
																																																																																							frame17.BorderSizePixel = 0
																																																																																							frame17.Parent = frame15
																																																																																							local uiListLayout5 = Instance.new("UIListLayout")
																																																																																							uiListLayout5.FillDirection = Enum.FillDirection.Horizontal
																																																																																							uiListLayout5.Padding = UDim.new(0, 7)
																																																																																							uiListLayout5.Parent = frame17
																																																																																							local uiPadding4 = Instance.new("UIPadding")
																																																																																							uiPadding4.PaddingTop = UDim.new(0, 1)
																																																																																							uiPadding4.PaddingLeft = UDim.new(0, 1)
																																																																																							uiPadding4.Parent = frame17

																																																																																							local tbl22 = { Repaint = function()
																																																																																							end }

																																																																																							local v131 = nil

																																																																																							if arg4.AlphaEnabled then
																																																																																								local v132 = v120.new(arg, { Bare = true })

																																																																																								v132:AttachRight(function(arg6)
																																																																																									local v133, v134 = fn36(arg6, 49, false)
																																																																																									v131 = v134
																																																																																									return v133
																																																																																								end, nil, nil, trove)

																																																																																								v132:Realize(frame17, tbl20, 0)
																																																																																							end

																																																																																							local v132 = nil
																																																																																							local v133 = nil
																																																																																							local v134 = v120.new(arg, { Bare = true })

																																																																																							v134:AttachRight(function(arg6)
																																																																																								local v135, v136, v137 = fn36(arg6, v86[110], v86[34])
																																																																																								v132 = v136
																																																																																								v133 = v137
																																																																																								return v135
																																																																																							end, nil, nil, trove)

																																																																																							v134:Realize(frame17, tbl20, 1)

																																																																																							if v131 ~= nil then
																																																																																								local v135 = v131

																																																																																								trove:Connect(v135.FocusLost, function()
																																																																																									local v136 = tonumber
																																																																																									local str7 = v135.Text:gsub("%%", "")
																																																																																									local v137 = v136(str7)

																																																																																									if v137 ~= nil then
																																																																																										arg5.SetAlpha(1 - math.clamp(v137 / 100, 0, 1))
																																																																																									else
																																																																																										tbl22.Repaint(true)
																																																																																									end
																																																																																								end)
																																																																																							end

																																																																																							if v132 ~= nil then
																																																																																								local v135 = v132

																																																																																								trove:Connect(v135.FocusLost, function()
																																																																																									local v136, v137 = v107(Color3.fromHex, v135.Text)

																																																																																									if v136 then
																																																																																										arg5.SetRgb(v137)
																																																																																									end
																																																																																								end)
																																																																																							end

																																																																																							local frame18 = Instance.new("Frame")
																																																																																							frame18.LayoutOrder = v86[56]
																																																																																							frame18.Visible = arg3.Mode == "Gradient"
																																																																																							frame18.BackgroundTransparency = 1
																																																																																							frame18.Size = UDim2.fromScale(v86[63], 0)
																																																																																							frame18.BorderSizePixel = 0
																																																																																							frame18.AutomaticSize = Enum.AutomaticSize.XY
																																																																																							frame18.Parent = root
																																																																																							local frame19 = Instance.new("Frame")
																																																																																							frame19.Active = v86[34]
																																																																																							frame19.Position = UDim2.fromOffset(29, 0)
																																																																																							frame19.Size = UDim2.new(1, -v86[60], 0, v86[144])
																																																																																							frame19.BorderSizePixel = 0
																																																																																							frame19.BackgroundColor3 = color
																																																																																							frame19.Parent = frame18
																																																																																							local instance13 = Instance.new(v86[46])
																																																																																							instance13.Parent = frame19
																																																																																							local uiCorner9 = Instance.new("UICorner")
																																																																																							uiCorner9.CornerRadius = UDim.new(0, 5)
																																																																																							uiCorner9.Parent = frame19
																																																																																							local frame20 = Instance.new("Frame")
																																																																																							frame20.BackgroundTransparency = v86[63]
																																																																																							frame20.Size = UDim2.new(1, 0, 0, 29)
																																																																																							frame20.Position = UDim2.fromOffset(0, -1)
																																																																																							frame20.BorderSizePixel = 0
																																																																																							frame20.ZIndex = 2
																																																																																							frame20.Parent = frame19

																																																																																							local function createTextButton(text, arg6)
																																																																																								local textButton = Instance.new("TextButton")
																																																																																								textButton.Active = v86[34]
																																																																																								textButton.Text = ""
																																																																																								textButton.Size = UDim2.fromOffset(22, 22)
																																																																																								textButton.BorderSizePixel = 0
																																																																																								textButton.AutoButtonColor = false

																																																																																								if arg6 then
																																																																																									textButton.AnchorPoint = Vector2.new(1, 0)
																																																																																									textButton.Position = UDim2.fromScale(1, 0)
																																																																																								end

																																																																																								batch:Bind(textButton, "BackgroundColor3", "Background")
																																																																																								textButton.Parent = frame18
																																																																																								local uiCorner10 = Instance.new("UICorner")
																																																																																								uiCorner10.CornerRadius = UDim.new(0, 5)
																																																																																								uiCorner10.Parent = textButton
																																																																																								local uiStroke3 = Instance.new("UIStroke")
																																																																																								uiStroke3.BorderOffset = UDim.new(v86[186], -v86[63])
																																																																																								uiStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
																																																																																								batch:Bind(uiStroke3, "Color", v86[120])
																																																																																								uiStroke3.Parent = textButton
																																																																																								local textLabel3 = Instance.new("TextLabel")
																																																																																								textLabel3.FontFace = v117.Medium
																																																																																								textLabel3.TextColor3 = Color3.fromRGB(132, 133, 139)
																																																																																								textLabel3.Text = text
																																																																																								textLabel3.BackgroundTransparency = 1
																																																																																								textLabel3.Size = UDim2.new(1, 1, 1, -2)
																																																																																								textLabel3.BorderSizePixel = v86[186]
																																																																																								textLabel3.TextWrapped = true
																																																																																								textLabel3.TextSize = 22
																																																																																								textLabel3.Parent = textButton
																																																																																								local uiPadding5 = Instance.new("UIPadding")
																																																																																								uiPadding5.PaddingBottom = UDim.new(0, 2)
																																																																																								uiPadding5.PaddingLeft = UDim.new(0, -1)
																																																																																								uiPadding5.PaddingRight = UDim.new(0, v86[63])
																																																																																								uiPadding5.Parent = textLabel3
																																																																																								return textButton
																																																																																							end

																																																																																							local v135 = createTextButton("-", v86[153])
																																																																																							local v136 = createTextButton("+", true)
																																																																																							local imageLabel2 = Instance.new("ImageLabel")
																																																																																							imageLabel2.Active = true
																																																																																							imageLabel2.AnchorPoint = Vector2.new(0.5, 0)
																																																																																							imageLabel2.Image = "rbxassetid://127264563810956"
																																																																																							imageLabel2.BackgroundTransparency = v86[63]
																																																																																							imageLabel2.Position = UDim2.new(0.5, -1, v86[186], -1)
																																																																																							imageLabel2.Size = UDim2.fromOffset(10, 29)
																																																																																							imageLabel2.BorderSizePixel = 0
																																																																																							batch:Bind(imageLabel2, "ImageColor3", "Outline")
																																																																																							imageLabel2.Parent = frame19
																																																																																							local imageLabel3 = Instance.new("ImageLabel")
																																																																																							imageLabel3.Size = UDim2.new(v86[63], -2, 0, 27)
																																																																																							imageLabel3.Image = "rbxassetid://127264563810956"
																																																																																							imageLabel3.BackgroundTransparency = 1
																																																																																							imageLabel3.Position = UDim2.fromOffset(1, 1)
																																																																																							imageLabel3.ZIndex = 2
																																																																																							imageLabel3.BorderSizePixel = 0
																																																																																							imageLabel3.Parent = imageLabel2
																																																																																							local frame21 = Instance.new("Frame")
																																																																																							frame21.Position = UDim2.fromOffset(1, 1)
																																																																																							frame21.Size = UDim2.new(v86[63], -2, 0, v86[71])
																																																																																							frame21.BorderSizePixel = 0
																																																																																							frame21.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
																																																																																							frame21.Parent = imageLabel3
																																																																																							local instance14 = Instance.new(v86[46])
																																																																																							instance14.Rotation = v86[45]
																																																																																							instance14.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, color), ColorSequenceKeypoint.new(1, Color3.fromRGB(211, 211, 211)) })
																																																																																							instance14.Parent = frame21
																																																																																							local instance15 = Instance.new(v86[128])
																																																																																							instance15.LayoutOrder = 5
																																																																																							instance15.BackgroundTransparency = 1
																																																																																							instance15.Size = UDim2.new(1, 0, v86[186], 23)
																																																																																							instance15.BorderSizePixel = 0
																																																																																							instance15.Visible = arg4.Animatable
																																																																																							instance15.Parent = root
																																																																																							local textLabel3 = Instance.new("TextLabel")
																																																																																							textLabel3.FontFace = v117.Medium
																																																																																							textLabel3.Text = "Animation"
																																																																																							textLabel3.AnchorPoint = Vector2.new(0, v86[101])
																																																																																							textLabel3.BackgroundTransparency = 1
																																																																																							textLabel3.Position = UDim2.fromScale(v86[186], 0.5)
																																																																																							textLabel3.BorderSizePixel = 0
																																																																																							textLabel3.AutomaticSize = Enum.AutomaticSize.XY
																																																																																							textLabel3.TextSize = v86[13]
																																																																																							batch:Bind(textLabel3, v86[167], v86[174])
																																																																																							textLabel3.Parent = instance15
																																																																																							local frame22 = Instance.new("Frame")
																																																																																							frame22.AnchorPoint = Vector2.new(v86[63], 0)
																																																																																							frame22.Position = UDim2.fromScale(1, 0)
																																																																																							frame22.BackgroundTransparency = 1
																																																																																							frame22.Size = UDim2.fromScale(v86[186], 1)
																																																																																							frame22.AutomaticSize = Enum.AutomaticSize.X
																																																																																							frame22.BorderSizePixel = v86[186]
																																																																																							frame22.Parent = instance15
																																																																																							local uiListLayout6 = Instance.new("UIListLayout")
																																																																																							uiListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																							uiListLayout6.Parent = frame22
																																																																																							local instance16 = Instance.new(v86[128])
																																																																																							instance16.LayoutOrder = 8
																																																																																							instance16.BackgroundTransparency = 1
																																																																																							instance16.Size = UDim2.fromScale(v86[63], 0)
																																																																																							instance16.AutomaticSize = Enum.AutomaticSize.Y
																																																																																							instance16.BorderSizePixel = v86[186]
																																																																																							instance16.Visible = arg4.Animatable and arg4.AnimationMode == "Breathing"
																																																																																							instance16.Parent = root
																																																																																							local allowBreathing = arg4.AllowBreathing and tbl18 or tbl19
																																																																																							local v137 = v120.new(arg, { Bare = true })

																																																																																							local tbl23 = {
																																																																																								Inline = true,
																																																																																								MaxWidth = 100,
																																																																																								Options = allowBreathing,
																																																																																								Default = arg4.AnimationMode,
																																																																																								OnChanged = function(arg6)
																																																																																									if type(arg6) == "string" then
																																																																																										arg5.SetAnimationMode(arg6)
																																																																																										instance16.Visible = arg4.Animatable and arg6 == "Breathing"
																																																																																									end
																																																																																								end,
																																																																																							}

																																																																																							local v138 = v116._New(arg, v137, trove:Extend(), tbl23)
																																																																																							v137:Realize(frame22, tbl20, 0)
																																																																																							local frame23 = Instance.new("Frame")
																																																																																							frame23.LayoutOrder = 6
																																																																																							frame23.BackgroundTransparency = v86[63]
																																																																																							frame23.Size = UDim2.fromScale(1, v86[186])
																																																																																							frame23.AutomaticSize = Enum.AutomaticSize.Y
																																																																																							frame23.BorderSizePixel = 0
																																																																																							frame23.Visible = arg4.Animatable
																																																																																							frame23.Parent = root
																																																																																							local v139 = v120.new(arg, { Label = "Speed", Height = 24, MediumTitle = true, RightOffset = -1 })

																																																																																							local tbl24 = {
																																																																																								Label = "Speed",
																																																																																								Min = 0,
																																																																																								Max = v86[175],
																																																																																								Step = v86[62],
																																																																																								Default = arg4.AnimationSpeed,
																																																																																								OnChanged = function(arg6)
																																																																																									arg5.SetAnimationSpeed(arg6)
																																																																																								end,
																																																																																							}

																																																																																							local v140 = v121._New(arg, v139, trove:Extend(), tbl24)
																																																																																							v139:Realize(frame23, tbl20, 0)
																																																																																							local n = 100

																																																																																							if arg4.AnimationBreathingMin ~= nil then
																																																																																								n = math.floor((1 - arg4.AnimationBreathingMin) * 100 + 0.5)
																																																																																							end

																																																																																							local n33 = 0

																																																																																							if arg4.AnimationBreathingMax ~= nil then
																																																																																								n33 = math.floor((1 - arg4.AnimationBreathingMax) * v86[91] + 0.5)
																																																																																							end

																																																																																							local v141 = v120.new(arg, { Label = "Alpha Range", Height = 24, MediumTitle = true, RightOffset = -1 })

																																																																																							local tbl25 = {
																																																																																								Label = v86[132],
																																																																																								Min = 0,
																																																																																								Max = 100,
																																																																																								Step = 1,
																																																																																								Default = { Min = n33, Max = n },
																																																																																								OnChanged = function(arg6)
																																																																																									local setAnimationBreathingRange = arg5.SetAnimationBreathingRange

																																																																																									if setAnimationBreathingRange ~= nil then
																																																																																										setAnimationBreathingRange(arg6)
																																																																																									end
																																																																																								end,
																																																																																							}

																																																																																							local v142 = v119._New(arg, v141, trove:Extend(), tbl25)
																																																																																							v141:Realize(instance16, tbl20, 0)
																																																																																							local tbl26 = {}
																																																																																							local v143 = trove:Extend()

																																																																																							local function fn37(arg6)
																																																																																								local n34 = math.clamp((arg6 - frame19.AbsolutePosition.X) / math.max(frame19.AbsoluteSize.X - 1, 1), 0, 1)
																																																																																								local huge = math.huge
																																																																																								local n35 = 1

																																																																																								for k, v144 in arg3.Stops, nil, nil do
																																																																																									local n36 = math.abs(v144.Time - n34)

																																																																																									if n36 < huge then
																																																																																										huge = n36
																																																																																										n35 = k
																																																																																									end
																																																																																								end

																																																																																								return n35
																																																																																							end

																																																																																							local function fn38(arg6)
																																																																																								if arg3.Mode ~= "Gradient" then
																																																																																									return
																																																																																								end

																																																																																								if arg6 then
																																																																																									arg5.SetDragMode(v86[150])
																																																																																								elseif arg3._dragMode == "stop" then
																																																																																									arg5.SetDragMode(nil)
																																																																																								end

																																																																																								tbl22.Repaint(true)
																																																																																							end

																																																																																							local function fn39(arg6)
																																																																																								arg5.MoveActiveStop(math.clamp((arg6.Position.X - frame19.AbsolutePosition.X) / math.max(frame19.AbsoluteSize.X - v86[63], 1), 0, 1))
																																																																																							end

																																																																																							local function fn40()
																																																																																								v143:Destroy()
																																																																																								v143 = trove:Extend()

																																																																																								for _, v144 in tbl26, nil, nil do
																																																																																									v144.Marker:Destroy()
																																																																																								end

																																																																																								table.clear(tbl26)
																																																																																								if arg3.Mode ~= v86[90] then
																																																																																									return
																																																																																								end

																																																																																								for k, v144 in arg3.Stops, nil, nil do
																																																																																									local flag19 = k == arg3.ActiveStopIndex
																																																																																									local imageButton = Instance.new("ImageButton")
																																																																																									imageButton.Active = true
																																																																																									imageButton.AutoButtonColor = false
																																																																																									imageButton.ImageColor3 = v122.get(v86[120])
																																																																																									imageButton.AnchorPoint = Vector2.new(0.5, 0)
																																																																																									imageButton.Image = "rbxassetid://127264563810956"
																																																																																									imageButton.BackgroundTransparency = 1
																																																																																									imageButton.Position = UDim2.new(v144.Time, -v86[63], 0, -v86[63])
																																																																																									imageButton.Size = flag19 and UDim2.fromOffset(10, 29) or UDim2.fromOffset(8, 24)
																																																																																									imageButton.BorderSizePixel = 0
																																																																																									imageButton.Parent = frame20
																																																																																									local imageLabel4 = Instance.new("ImageLabel")
																																																																																									imageLabel4.Size = UDim2.new(v86[63], -2, 1, -v86[56])
																																																																																									imageLabel4.Image = "rbxassetid://127264563810956"
																																																																																									imageLabel4.BackgroundTransparency = 1
																																																																																									imageLabel4.Position = UDim2.fromOffset(v86[63], v86[63])
																																																																																									imageLabel4.BorderSizePixel = 0
																																																																																									imageLabel4.Parent = imageButton
																																																																																									local frame24 = Instance.new("Frame")
																																																																																									frame24.Position = UDim2.fromOffset(1, 1)
																																																																																									frame24.Size = flag19 and UDim2.new(1, -v86[56], 0, 19) or UDim2.new(1, -2, 0, 16)
																																																																																									frame24.BorderSizePixel = v86[186]
																																																																																									frame24.BackgroundColor3 = v144.Value
																																																																																									frame24.Parent = imageLabel4
																																																																																									local uiGradient4 = Instance.new("UIGradient")
																																																																																									uiGradient4.Rotation = 90
																																																																																									local new = ColorSequenceKeypoint.new
																																																																																									local color2 = Color3.fromRGB
																																																																																									uiGradient4.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, color), new(1, color2(211, 211, 211)) })
																																																																																									uiGradient4.Parent = frame24

																																																																																									if not flag19 then
																																																																																										imageButton.ImageTransparency = v86[62]
																																																																																									end

																																																																																									tbl26[k] = { Marker = imageButton, Accent = frame24 }

																																																																																									v118.connectClick(v143, imageButton, function()
																																																																																										arg5.SelectStop(k)
																																																																																									end)

																																																																																									v118.connectDrag(v143, imageButton, fn39, function(arg6)
																																																																																										if arg6 then
																																																																																											arg5.SelectStop(k)
																																																																																										end

																																																																																										fn38(arg6)
																																																																																									end)
																																																																																								end
																																																																																							end

																																																																																							local function fn41(arg6)
																																																																																								local v144 = arg:DragTweenInfo()

																																																																																								for k, v145 in tbl26, nil, nil do
																																																																																									local v146 = arg3.Stops[k]

																																																																																									if v146 ~= nil then
																																																																																										local imageTransparency = k == arg3.ActiveStopIndex
																																																																																										local udim2 = UDim2.new(v146.Time, -1, 0, -1)
																																																																																										local udim22 = imageTransparency and UDim2.fromOffset(10, 29) or UDim2.fromOffset(v86[162], v86[61])
																																																																																										local udim23 = imageTransparency and UDim2.new(1, -2, 0, 19) or UDim2.new(1, -v86[56], 0, v86[13])
																																																																																										imageTransparency = imageTransparency and 0 or v86[62]

																																																																																										if arg6 then
																																																																																											v145.Marker.Position = udim2
																																																																																											v145.Marker.Size = udim22
																																																																																											v145.Marker.ImageTransparency = imageTransparency
																																																																																											v145.Accent.Size = udim23
																																																																																											v145.Accent.BackgroundColor3 = v146.Value
																																																																																										else
																																																																																											arg:Tween(v145.Marker, { Position = udim2, Size = udim22, ImageTransparency = imageTransparency }, v144)
																																																																																											arg:Tween(v145.Accent, { Size = udim23, BackgroundColor3 = v146.Value }, v144)
																																																																																										end
																																																																																									end
																																																																																								end
																																																																																							end

																																																																																							local function fn42(arg6)
																																																																																								instance13.Color = v115.toSequence(arg3.Stops)
																																																																																								local v144 = arg3.Stops[arg3.ActiveStopIndex]
																																																																																								local color2 = arg3.Color
																																																																																								local udim2 = UDim2.new(v86[101], -v86[63], 0, -1)

																																																																																								if v144 ~= nil then
																																																																																									color2 = v144.Value
																																																																																									udim2 = UDim2.new(v144.Time, -1, v86[186], -v86[63])
																																																																																								end

																																																																																								frame21.BackgroundColor3 = color2
																																																																																								local udim22 = UDim2.fromOffset(v86[133], v86[123])

																																																																																								if arg3._dragMode == "stop" then
																																																																																									udim22 = UDim2.fromOffset(12, v86[31])
																																																																																								end

																																																																																								if #tbl26 ~= #arg3.Stops then
																																																																																									fn40()
																																																																																								else
																																																																																									fn41(arg6)
																																																																																								end

																																																																																								if arg6 then
																																																																																									imageLabel2.Position = udim2
																																																																																									imageLabel2.Size = udim22
																																																																																								else
																																																																																									arg:Tween(imageLabel2, { Position = udim2, Size = udim22 }, arg:DragTweenInfo())
																																																																																								end
																																																																																							end

																																																																																							v118.connectDrag(trove, frame4, function(arg6)
																																																																																								local n34 = math.max(frame4.AbsoluteSize.X - 1, 1)
																																																																																								local n35 = math.max(frame4.AbsoluteSize.Y - v86[63], 1)
																																																																																								arg5.SetHSVA(arg3.Hue, math.clamp((arg6.Position.X - frame4.AbsolutePosition.X) / n34, v86[186], 1), 1 - math.clamp((arg6.Position.Y - frame4.AbsolutePosition.Y) / n35, 0, v86[63]), arg3.Alpha)
																																																																																							end, function(arg6)
																																																																																								local str7 = nil

																																																																																								if arg6 then
																																																																																									str7 = "sat"
																																																																																								end

																																																																																								arg5.SetDragMode(str7)
																																																																																							end)

																																																																																							v118.connectDrag(trove, frame10, function(arg6)
																																																																																								local v144 = v86[186]
																																																																																								arg5.SetHSVA(math.clamp((arg6.Position.Y - frame9.AbsolutePosition.Y) / math.max(frame9.AbsoluteSize.Y - 1, 1), v144, 1), arg3.Sat, arg3.Val, arg3.Alpha)
																																																																																							end, function(arg6)
																																																																																								local str7 = nil

																																																																																								if arg6 then
																																																																																									str7 = "hue"
																																																																																								end

																																																																																								arg5.SetDragMode(str7)
																																																																																							end)

																																																																																							v118.connectDrag(trove, frame13, function(arg6)
																																																																																								local n34 = math.clamp((arg6.Position.Y - frame12.AbsolutePosition.Y) / math.max(frame12.AbsoluteSize.Y - 1, 1), 0, 1)
																																																																																								arg5.SetHSVA(arg3.Hue, arg3.Sat, arg3.Val, n34)
																																																																																							end, function(arg6)
																																																																																								local str7 = nil

																																																																																								if arg6 then
																																																																																									str7 = "alpha"
																																																																																								end

																																																																																								arg5.SetDragMode(str7)
																																																																																							end)

																																																																																							v118.connectClick(trove, frame19, function()
																																																																																								if arg3.Mode == v86[90] then
																																																																																									arg5.SelectStop(fn37(v123.getPointerPosition().X))
																																																																																								end
																																																																																							end)

																																																																																							v118.connectDrag(trove, frame19, fn39, function(arg6)
																																																																																								if arg3.Mode ~= "Gradient" then
																																																																																									return
																																																																																								end

																																																																																								if arg6 then
																																																																																									arg5.SelectStop(fn37(v123.getPointerPosition().X))
																																																																																								end

																																																																																								fn38(arg6)
																																																																																								if not (n26 >= 4814) then
																																																																																									return
																																																																																								end

																																																																																								while true do
																																																																																								end
																																																																																							end)

																																																																																							v118.connectDrag(trove, imageLabel2, fn39, fn38)

																																																																																							v118.connectClick(trove, v136, function()
																																																																																								arg5.AddStop()
																																																																																							end)

																																																																																							v118.connectClick(trove, v135, function()
																																																																																								arg5.RemoveStop()
																																																																																							end)

																																																																																							local function repaint(...) end
																																																																																							tbl22.Repaint = repaint

																																																																																							return {
																																																																																								Repaint = repaint,
																																																																																								SyncMode = function(arg6)
																																																																																									frame18.Visible = arg6 == "Gradient"

																																																																																									if v124 ~= nil then
																																																																																										v124:Set(arg6, true)
																																																																																									end
																																																																																								end,
																																																																																								SyncAnimation = function(arg6, arg7)
																																																																																									v138:Set(arg6, true)
																																																																																									v140:Set(arg7, v86[34])
																																																																																									instance16.Visible = arg4.Animatable and arg6 == "Breathing"
																																																																																								end,
																																																																																								SyncAnimationBreathingRange = function(arg6)
																																																																																									v142:Set(arg6, v86[34])
																																																																																								end,
																																																																																								SetAnimationEnabled = function(visible, arg6)
																																																																																									instance15.Visible = visible
																																																																																									frame23.Visible = visible
																																																																																									instance16.Visible = visible and v138.Value == "Breathing"
																																																																																									local v144 = tbl18

																																																																																									if not arg6 then
																																																																																										v144 = tbl19
																																																																																									end

																																																																																									v138:SetOptions(v144)
																																																																																								end,
																																																																																							}
																																																																																						end }
																																																																																					end

																																																																																					tbl17.L = function()
																																																																																						local l = tbl17.cache.L

																																																																																						if not l then
																																																																																							local l2 = { c = fn35() }
																																																																																							tbl17.cache.L = l2
																																																																																							l = l2
																																																																																						end

																																																																																						return l.c
																																																																																					end
																																																																																				end
																																																																																			end

																																																																																			do
																																																																																				do
																																																																																					local function fn35()
																																																																																						local v115 = tbl17.g()
																																																																																						tbl17.k()
																																																																																						local v116 = tbl17.L()
																																																																																						local v117 = tbl17.E()
																																																																																						tbl17.r()
																																																																																						local v118 = tbl17.u()
																																																																																						local v119 = tbl17.x()
																																																																																						local v120 = tbl17.G()
																																																																																						tbl17.B()
																																																																																						local color = Color3.fromRGB(255, 255, 255)
																																																																																						local index2 = {}
																																																																																						index2.__index = index2

																																																																																						local function fn36(arg)
																																																																																							return arg.Stops[arg.ActiveStopIndex]
																																																																																						end

																																																																																						local function fn37(arg, arg2)
																																																																																							local flag19 = arg2 == "Gradient" and arg.Gradient ~= "off"
																																																																																							local mode = "Solid"

																																																																																							if flag19 then
																																																																																								mode = "Gradient"
																																																																																							end

																																																																																							arg.Mode = mode

																																																																																							if mode == "Gradient" then
																																																																																								arg.Stops = v117.ensure(arg.Stops, arg.Color)
																																																																																								arg.ActiveStopIndex = math.clamp(arg.ActiveStopIndex, 1, #arg.Stops)
																																																																																								local v121 = fn36(arg)

																																																																																								if v121 ~= nil then
																																																																																									arg.Color = v121.Value
																																																																																									local v122, v123, v124 = v121.Value:ToHSV()
																																																																																									arg.Hue = v122
																																																																																									arg.Sat = v123
																																																																																									arg.Val = v124
																																																																																								end
																																																																																							end

																																																																																							local panel = arg._panel

																																																																																							if panel ~= nil then
																																																																																								panel.SyncMode(mode)
																																																																																							end
																																																																																						end

																																																																																						index2._ApplyState = function(I,W)local N=Color3.fromHSV(I.Hue,I.Sat,I.Val);local P=nil;if I.Mode=="Gradient"then I.Stops= v117 .ensure(I.Stops,N);I.ActiveStopIndex=math.clamp(I.ActiveStopIndex,1,#I.Stops);local a= fn36 (I);if a~=nil then a.Value=N;P=a.Value;else P=N;end;else P=N;end;I.Color=P;N=I._rt;if N~=nil then local a=I.Mode=="Gradient";N.Swatch.BackgroundColor3=if a then  color else P;N.SwatchGradient.Enabled=a;if a then N.SwatchGradient.Color= v117 .toSequence(I.Stops);else N.SwatchGradient.Color=ColorSequence.new(P);end;end;I.Value={Rgb=P,Alpha=I.Alpha,Stops=if I.Mode=="Gradient"then( v117 .clone(I.Stops))else nil};P=I._panel;if P~=nil then P.Repaint(I._dragMode~=nil or I.AnimationMode~="None");end;I.ValueChanged:Fire(I.Value);if not W then I._onChanged(I.Value);I.Changed:Fire(I.Value);end;end

																																																																																						local function fn38(arg, arg2)
																																																																																							local menu = arg._menu

																																																																																							local v121 = v120.new(menu, arg._trove, {
																																																																																								Trigger = arg2,
																																																																																								Size = UDim2.fromOffset(300, 300),
																																																																																								AutomaticSize = Enum.AutomaticSize.Y,
																																																																																								CornerRadius = 13,
																																																																																								FlatBackground = v86[34],
																																																																																								Glow = v86[34],
																																																																																								ParentEntry = arg._parentOverlay,
																																																																																								Place = v120.placeBelow(1, 2),
																																																																																								OnToggle = function(arg3)
																																																																																									if arg3 then
																																																																																										local panel = arg._panel

																																																																																										if panel ~= nil then
																																																																																											panel.Repaint(v86[34])
																																																																																										end
																																																																																									end
																																																																																								end,
																																																																																							})

																																																																																							arg._popup = v121

																																																																																							if v118.Scale ~= 1 then
																																																																																								local uiScale = Instance.new("UIScale")
																																																																																								uiScale.Scale = v118.Scale
																																																																																								uiScale.Parent = v121.Root
																																																																																							end

																																																																																							local v122 = v116.build(menu, v121, arg, {
																																																																																								AlphaEnabled = arg.AlphaEnabled,
																																																																																								Gradient = arg.Gradient,
																																																																																								Animatable = arg.Animatable,
																																																																																								AllowBreathing = arg._allowBreathing,
																																																																																								AnimationMode = arg.AnimationMode,
																																																																																								AnimationSpeed = arg.AnimationSpeed,
																																																																																								AnimationBreathingMin = arg.AnimationBreathingRange and arg.AnimationBreathingRange.Min,
																																																																																								AnimationBreathingMax = arg.AnimationBreathingRange and arg.AnimationBreathingRange.Max,
																																																																																							}, {
																																																																																								SetHSVA = function(hue, sat, val, alpha)
																																																																																									arg.Hue = hue
																																																																																									arg.Sat = sat
																																																																																									arg.Val = val
																																																																																									arg.Alpha = alpha
																																																																																									arg:_ApplyState(false)
																																																																																								end,
																																																																																								SetDragMode = function(dragMode)
																																																																																									arg._dragMode = dragMode
																																																																																									arg.Dragging = dragMode ~= nil
																																																																																								end,
																																																																																								SelectStop = function(arg3)
																																																																																									if arg.Mode ~= "Gradient" or #arg.Stops == 0 then
																																																																																										return
																																																																																									end
																																																																																									arg.ActiveStopIndex = math.clamp(arg3, v86[63], #arg.Stops)
																																																																																									local v122 = fn36(arg)

																																																																																									if v122 ~= nil then
																																																																																										arg.Color = v122.Value
																																																																																										local v123 = arg
																																																																																										local v124 = arg
																																																																																										local v125 = arg
																																																																																										local v126, v127, v128 = v122.Value:ToHSV()
																																																																																										v123.Hue = v126
																																																																																										v124.Sat = v127
																																																																																										v125.Val = v128
																																																																																									end

																																																																																									arg:_ApplyState(true)
																																																																																								end,
																																																																																								MoveActiveStop = function(arg3)
																																																																																									local v122 = fn36(arg)
																																																																																									if arg.Mode ~= "Gradient" or v122 == nil or arg.ActiveStopIndex == 1 or arg.ActiveStopIndex == #arg.Stops then
																																																																																										return
																																																																																									end
																																																																																									v122.Time = math.clamp(arg3, 0, 1)
																																																																																									arg.ActiveStopIndex = v117.sort(arg.Stops, v122)
																																																																																									arg:_ApplyState(false)
																																																																																								end,
																																																																																								AddStop = function()
																																																																																									if arg.Mode ~= "Gradient" then
																																																																																										fn37(arg, "Gradient")
																																																																																									end

																																																																																									local v122 = fn36(arg)
																																																																																									local n = 0.5

																																																																																									if v122 ~= nil then
																																																																																										if arg.ActiveStopIndex < #arg.Stops then
																																																																																											n = (v122.Time + arg.Stops[arg.ActiveStopIndex + 1].Time) * 0.5
																																																																																										elseif arg.ActiveStopIndex > 1 then
																																																																																											n = (arg.Stops[arg.ActiveStopIndex - 1].Time + v122.Time) * v86[101]
																																																																																										end
																																																																																									end

																																																																																									local tbl18 = { Time = n, Value = arg.Color }
																																																																																									table.insert(arg.Stops, tbl18)
																																																																																									arg.ActiveStopIndex = v117.sort(arg.Stops, tbl18)
																																																																																									arg:_ApplyState(false)
																																																																																								end,
																																																																																								RemoveStop = function()
																																																																																									if arg.Mode ~= "Gradient" or #arg.Stops <= v86[56] then
																																																																																										return
																																																																																									end
																																																																																									local activeStopIndex = arg.ActiveStopIndex
																																																																																									if activeStopIndex == 1 or activeStopIndex == #arg.Stops then
																																																																																										return
																																																																																									end
																																																																																									local time = arg.Stops[activeStopIndex].Time
																																																																																									table.remove(arg.Stops, activeStopIndex)
																																																																																									local huge = math.huge
																																																																																									local v122 = nil
																																																																																									local activeStopIndex2 = 1

																																																																																									for k, v123 in arg.Stops, v122, nil do
																																																																																										local n = math.abs(v123.Time - time)

																																																																																										if n < huge then
																																																																																											huge = n
																																																																																											activeStopIndex2 = k
																																																																																										end
																																																																																									end

																																																																																									arg.ActiveStopIndex = activeStopIndex2
																																																																																									arg._dragMode = nil
																																																																																									arg.Dragging = v86[153]
																																																																																									arg:_ApplyState(false)
																																																																																								end,
																																																																																								SetMode = function(arg3)
																																																																																									fn37(arg, arg3)
																																																																																									arg:_ApplyState(false)
																																																																																								end,
																																																																																								SetAlpha = function(arg3)
																																																																																									arg.Alpha = math.clamp(arg3, 0, 1)
																																																																																									arg:_ApplyState(v86[153])
																																																																																								end,
																																																																																								SetRgb = function(arg3)
																																																																																									arg:Set({ Rgb = arg3, Alpha = arg.Alpha, Stops = arg.Value.Stops }, false)
																																																																																								end,
																																																																																								SetAnimationMode = function(arg3)
																																																																																									arg:SetAnimationMode(arg3)
																																																																																								end,
																																																																																								SetAnimationSpeed = function(arg3)
																																																																																									arg:SetAnimationSpeed(arg3)
																																																																																								end,
																																																																																								SetAnimationBreathingRange = function(arg3)
																																																																																									arg:SetAnimationBreathingRange(arg3)
																																																																																								end,
																																																																																							})

																																																																																							arg._panel = v122
																																																																																							v122.Repaint(true)
																																																																																						end

																																																																																						local function createTextButton(arg, parent, arg2)
																																																																																							local textButton = Instance.new("TextButton")
																																																																																							textButton.AnchorPoint = Vector2.new(1, 0.5)
																																																																																							textButton.Position = UDim2.fromScale(1, 0.5)
																																																																																							textButton.Size = UDim2.fromOffset(v86[32], v86[32])
																																																																																							textButton.BorderSizePixel = 0
																																																																																							textButton.BackgroundColor3 = arg.Color
																																																																																							textButton.Text = ""
																																																																																							textButton.AutoButtonColor = false
																																																																																							textButton.Parent = parent
																																																																																							local uiCorner = Instance.new("UICorner")
																																																																																							uiCorner.CornerRadius = UDim.new(v86[186], v86[175])
																																																																																							uiCorner.Parent = textButton
																																																																																							local uiGradient = Instance.new("UIGradient")
																																																																																							uiGradient.Enabled = arg.Mode == "Gradient"

																																																																																							if arg.Mode == "Gradient" then
																																																																																								uiGradient.Color = v117.toSequence(arg.Stops)
																																																																																							else
																																																																																								uiGradient.Color = ColorSequence.new(arg.Color)
																																																																																							end

																																																																																							uiGradient.Parent = textButton
																																																																																							arg._rt = { Swatch = textButton, SwatchGradient = uiGradient }
																																																																																							arg._parentOverlay = arg2.ParentOverlay

																																																																																							v119.connectClick(arg2.Trove, textButton, function()
																																																																																								if arg._panel == nil then
																																																																																									fn38(arg, textButton)
																																																																																								end

																																																																																								local popup = arg._popup

																																																																																								if popup ~= nil then
																																																																																									popup:Toggle()
																																																																																								end
																																																																																							end)

																																																																																							return textButton
																																																																																						end

																																																																																						index2._New = function(arg, arg2, arg3, arg4)
																																																																																							local gradient = arg4.Gradient or "off"
																																																																																							local default = arg4.Default
																																																																																							local n = v86[63]
																																																																																							local rgb = color
																																																																																							local stops = nil

																																																																																							if default ~= nil then
																																																																																								rgb = color

																																																																																								if default.Rgb ~= nil then
																																																																																									rgb = default.Rgb
																																																																																								end

																																																																																								if default.Alpha ~= nil then
																																																																																									n = math.clamp(default.Alpha, 0, 1)
																																																																																								end

																																																																																								stops = default.Stops
																																																																																							end

																																																																																							local str7 = "Solid"

																																																																																							if gradient ~= "off" then
																																																																																								if gradient == "only" or stops ~= nil and #stops > v86[186] then
																																																																																									str7 = "Gradient"
																																																																																								end
																																																																																							end

																																																																																							local v121 = v117.ensure(stops, rgb)
																																																																																							local v122, v123, v124 = rgb:ToHSV()

																																																																																							local obj = setmetatable({
																																																																																								_trove = arg3,
																																																																																								_menu = arg,
																																																																																								Kind = "ColorPicker",
																																																																																								Row = arg2,
																																																																																								AlphaEnabled = arg4.Alpha == true,
																																																																																								Gradient = gradient,
																																																																																								Mode = str7,
																																																																																								Hue = v122,
																																																																																								Sat = v123,
																																																																																								Val = v124,
																																																																																								Alpha = n,
																																																																																								Color = rgb,
																																																																																								Stops = v121,
																																																																																								ActiveStopIndex = 1,
																																																																																								Dragging = false,
																																																																																								_dragMode = nil,
																																																																																								Animatable = arg4.Animatable == true,
																																																																																								AnimationMode = "None",
																																																																																								AnimationSpeed = 1,
																																																																																								AnimationBreathingRange = nil,
																																																																																								Value = { Rgb = rgb, Alpha = n, Stops = str7 == "Gradient" and v117.clone(v121) or nil },
																																																																																								Changed = arg3:Add(v115.new()),
																																																																																								ValueChanged = arg3:Add(v115.new()),
																																																																																								AnimationChanged = arg3:Add(v115.new()),
																																																																																								AnimationSpeedChanged = arg3:Add(v115.new()),
																																																																																								AnimationBreathingRangeChanged = arg3:Add(v115.new()),
																																																																																								_onChanged = arg4.OnChanged or function()
																																																																																								end,
																																																																																								_allowBreathing = arg4.Alpha == true,
																																																																																								_rt = nil,
																																																																																								_panel = nil,
																																																																																								_popup = nil,
																																																																																								_parentOverlay = nil,
																																																																																							}, index2)

																																																																																							arg2:AttachRight(function(arg5, arg6)
																																																																																								return createTextButton(obj, arg5, arg6)
																																																																																							end, 18, nil, arg3)

																																																																																							return obj
																																																																																						end

																																																																																						index2.Set = function(arg, arg2, arg3)
																																																																																							local rgb = arg2.Rgb or arg.Color
																																																																																							local alpha = arg.Alpha

																																																																																							if arg2.Alpha ~= nil then
																																																																																								alpha = math.clamp(arg2.Alpha, 0, v86[63])
																																																																																							end

																																																																																							local stops = arg2.Stops
																																																																																							local mode = arg.Mode

																																																																																							if arg.Gradient == v86[172] then
																																																																																								stops = nil
																																																																																								mode = "Solid"
																																																																																							elseif stops ~= nil then
																																																																																								if v86[186] < #stops then
																																																																																									mode = "Gradient"
																																																																																								else
																																																																																									mode = "Solid"
																																																																																								end
																																																																																							end

																																																																																							local hue, v121, v122 = rgb:ToHSV()

																																																																																							if mode == "Gradient" then
																																																																																								local ensure = v117.ensure
																																																																																								stops = stops or arg.Stops
																																																																																								arg.Stops = ensure(stops, rgb)
																																																																																								arg.ActiveStopIndex = math.clamp(arg.ActiveStopIndex, 1, #arg.Stops)
																																																																																								local v123 = fn36(arg)

																																																																																								if v123 ~= nil then
																																																																																									v123.Value = rgb
																																																																																								end
																																																																																							elseif stops ~= nil and #stops > 0 then
																																																																																								arg.Stops = v117.ensure(stops, rgb)
																																																																																							end

																																																																																							local flag19 = arg._dragMode == "sat" or arg._dragMode == v86[164]

																																																																																							if not flag19 then
																																																																																								flag19 = not (v122 > 0 and v121 > 0)
																																																																																							end

																																																																																							if flag19 then
																																																																																								hue = arg.Hue
																																																																																							end

																																																																																							fn37(arg, mode)
																																																																																							arg.Hue = hue
																																																																																							arg.Sat = v121
																																																																																							arg.Val = v122
																																																																																							arg.Alpha = alpha
																																																																																							arg:_ApplyState(arg3)
																																																																																						end

																																																																																						index2.EnableAnimation = function(arg, allowBreathing)
																																																																																							arg.Animatable = v86[34]
																																																																																							arg._allowBreathing = allowBreathing
																																																																																							local panel = arg._panel

																																																																																							if panel ~= nil then
																																																																																								panel.SetAnimationEnabled(true, allowBreathing)
																																																																																							end

																																																																																							return arg
																																																																																						end

																																																																																						index2.SetAnimationMode = function(arg, animationMode, arg2)
																																																																																							if arg.AnimationMode ~= animationMode then
																																																																																								arg.AnimationMode = animationMode
																																																																																								local panel = arg._panel

																																																																																								if panel ~= nil then
																																																																																									panel.SyncAnimation(animationMode, arg.AnimationSpeed)
																																																																																								end

																																																																																								if not arg2 then
																																																																																									arg.AnimationChanged:Fire(animationMode)
																																																																																								end
																																																																																							end

																																																																																							return arg
																																																																																						end

																																																																																						index2.SetAnimationSpeed = function(arg, animationSpeed, arg2)
																																																																																							if arg.AnimationSpeed ~= animationSpeed then
																																																																																								arg.AnimationSpeed = animationSpeed
																																																																																								local panel = arg._panel

																																																																																								if panel ~= nil then
																																																																																									panel.SyncAnimation(arg.AnimationMode, animationSpeed)
																																																																																								end

																																																																																								if not arg2 then
																																																																																									arg.AnimationSpeedChanged:Fire(animationSpeed)
																																																																																								end
																																																																																							end

																																																																																							return arg
																																																																																						end

																																																																																						index2.SetAnimationBreathingRange = function(arg, animationBreathingRange, arg2)
																																																																																							arg.AnimationBreathingRange = animationBreathingRange
																																																																																							local panel = arg._panel

																																																																																							if panel ~= nil then
																																																																																								panel.SyncAnimationBreathingRange(animationBreathingRange)
																																																																																							end

																																																																																							if not arg2 then
																																																																																								arg.AnimationBreathingRangeChanged:Fire(animationBreathingRange)
																																																																																							end

																																																																																							return arg
																																																																																						end

																																																																																						index2.SetOpen = function(arg, arg2)
																																																																																							local popup = arg._popup

																																																																																							if popup == nil then
																																																																																								local rt = arg._rt
																																																																																								if rt == nil then
																																																																																									return
																																																																																								end
																																																																																								fn38(arg, rt.Swatch)
																																																																																								popup = arg._popup
																																																																																							end

																																																																																							if popup ~= nil then
																																																																																								popup:SetOpen(arg2)
																																																																																							end
																																																																																						end

																																																																																						index2.SetLabel = function(arg, arg2)
																																																																																							arg.Row:SetLabel(arg2)
																																																																																							return arg
																																																																																						end

																																																																																						index2.SetTooltip = function(arg, arg2)
																																																																																							arg.Row:SetTooltip(arg2)
																																																																																							return arg
																																																																																						end

																																																																																						index2.SetVisible = function(arg, arg2)
																																																																																							arg.Row:SetVisible(arg2)
																																																																																						end

																																																																																						index2.OnChanged = function(arg, arg2)
																																																																																							arg._trove:Connect(arg.Changed, arg2)
																																																																																							return arg
																																																																																						end

																																																																																						index2.Connect = function(arg, arg2, arg3)
																																																																																							arg._trove:Connect(arg2, arg3)
																																																																																							return arg
																																																																																						end

																																																																																						index2.Destroy = function(arg)
																																																																																							arg._trove:Destroy()
																																																																																						end

																																																																																						return index2
																																																																																					end

																																																																																					tbl17.M = function()
																																																																																						local m = tbl17.cache.M

																																																																																						if not m then
																																																																																							m = { c = fn35() }
																																																																																							tbl17.cache.M = m
																																																																																						end

																																																																																						return m.c
																																																																																					end
																																																																																				end
																																																																																			end

																																																																																			do
																																																																																				do
																																																																																					local function fn35()local I= tbl17 .D(); tbl17 .M(); tbl17 .r();local l={bind=function(W,N)local P=false;local function a()if P or W.Dragging then return;end;local e=N.Read();if e~=nil then W:Set(e,true);end;end;W:OnChanged(function(e)P=true;N.Write(e);P=false;end);for P,P in N.Changed,nil,nil do W:Connect(P,a);end;a();return W;end};local function W(N,P)if N.GetBase~=nil then return N:GetBase(P);end;return N:Get(P);end;l.bindConfig=function(N,P,a)local e,c,E=a.Config,a.Transparency,a.Gradient=="editable"or a.Gradient=="only";a={P:Changed(e)};if c~=nil then table.insert(a,P:Changed(c));end;return l.bind(N,{Read=function()local N,p=W(P,e),if c~=nil then(W(P,c))else nil;if E then return I.decodeSequence(N,p);end;return I.decodeSolid(N,p);end,Write=function(W)local N;if E then local E;E,N=I.encodeSequence(W);P:Set(e,E);else local E;E,N=I.encodeSolid(W);P:Set(e,E);end;if c~=nil then P:Set(c,N);end;end,Changed=a});end;return l;end

																																																																																					tbl17.N = function()
																																																																																						local n = tbl17.cache.N

																																																																																						if not n then
																																																																																							local n33 = { c = fn35() }
																																																																																							tbl17.cache.N = n33
																																																																																							n = n33
																																																																																						end

																																																																																						return n.c
																																																																																					end
																																																																																				end
																																																																																			end

																																																																																			do
																																																																																				local function fn35()
																																																																																					tbl17.k()
																																																																																					tbl17.r()
																																																																																					local v115 = tbl17.x()
																																																																																					tbl17.B()
																																																																																					local v116 = tbl17.A()

																																																																																					return function(arg, arg2, arg3, arg4)
																																																																																						arg:AttachTitleAccessory(function(parent, arg5)
																																																																																							local flag19 = false
																																																																																							local visible = false
																																																																																							local flag20 = false
																																																																																							local Accent = v116.get("Accent")
																																																																																							local v117 = v116.get(v86[96])
																																																																																							local instance = Instance.new(v86[121])
																																																																																							instance.Image = arg3.Icon
																																																																																							instance.BackgroundTransparency = 1
																																																																																							instance.AnchorPoint = Vector2.new(v86[186], v86[101])
																																																																																							instance.Position = UDim2.new(1, 6, 0.5, 0)
																																																																																							instance.Size = UDim2.fromOffset(v86[72], 14)
																																																																																							instance.BorderSizePixel = 0
																																																																																							instance.AutoButtonColor = false

																																																																																							local function fn36()
																																																																																								visible = arg3.IsPinned(arg4)
																																																																																								flag20 = arg3.CanPin(arg4)
																																																																																								instance.Visible = visible or flag20
																																																																																								instance.ImageColor3 = visible and Accent or v117

																																																																																								if visible then
																																																																																									instance.ImageTransparency = v86[186]
																																																																																								elseif flag19 then
																																																																																									instance.ImageTransparency = 0.1
																																																																																								else
																																																																																									instance.ImageTransparency = 0.55
																																																																																								end
																																																																																							end

																																																																																							arg5.Batch:BindStateful("Accent", function(arg6)
																																																																																								Accent = arg6
																																																																																								fn36()
																																																																																							end)

																																																																																							arg5.Batch:BindStateful("Unselected", function(arg6)
																																																																																								v117 = arg6
																																																																																								fn36()
																																																																																							end)

																																																																																							arg5.Trove:Connect(instance.MouseEnter, function()
																																																																																								flag19 = v86[34]
																																																																																								fn36()
																																																																																							end)

																																																																																							arg5.Trove:Connect(instance.MouseLeave, function()
																																																																																								flag19 = false
																																																																																								fn36()
																																																																																							end)

																																																																																							v115.connectClick(arg5.Trove, instance, function()
																																																																																								arg3.Toggle(arg4)
																																																																																							end)

																																																																																							arg5.Trove:Connect(arg3.Changed, fn36)

																																																																																							arg5.Menu:AttachTooltip(arg5.Trove, instance, function()
																																																																																								if visible then
																																																																																									return "Unpin"
																																																																																								end
																																																																																								local v118 = arg3.GetContextLabel()
																																																																																								if v118 == nil then
																																																																																									return nil
																																																																																								end
																																																																																								return string.format("Pin to %s", tostring(v118))
																																																																																							end)

																																																																																							fn36()
																																																																																							instance.Parent = parent
																																																																																							return instance
																																																																																						end, 20, arg2)
																																																																																					end
																																																																																				end

																																																																																				tbl17.O = function()
																																																																																					local o = tbl17.cache.O

																																																																																					if not o then
																																																																																						local o2 = { c = fn35() }
																																																																																						tbl17.cache.O = o2
																																																																																						o = o2
																																																																																					end

																																																																																					return o.c
																																																																																				end
																																																																																			end
																																																																																		end

																																																																																		do
																																																																																			do
																																																																																				do
																																																																																					do
																																																																																						do
																																																																																							do
																																																																																								local function fn35(...) end

																																																																																								tbl17.P = function()
																																																																																									local p = tbl17.cache.P

																																																																																									if not p then
																																																																																										p = { c = fn35() }
																																																																																										tbl17.cache.P = p
																																																																																									end

																																																																																									return p.c
																																																																																								end
																																																																																							end
																																																																																						end

																																																																																						do
																																																																																							local function fn35()
																																																																																								tbl17.g()
																																																																																								tbl17.k()
																																																																																								tbl17.r()
																																																																																								local v115 = tbl17.s()
																																																																																								tbl17.B()
																																																																																								local index2 = {}
																																																																																								index2.__index = index2

																																																																																								local function createFrame(arg, parent, arg2)
																																																																																									local frame = Instance.new("Frame")
																																																																																									frame.BackgroundTransparency = v86[63]
																																																																																									frame.Size = UDim2.new(1, 0, 0, 16)
																																																																																									frame.BorderSizePixel = v86[186]
																																																																																									frame.Parent = parent
																																																																																									local uiListLayout = Instance.new("UIListLayout")
																																																																																									uiListLayout.FillDirection = Enum.FillDirection.Horizontal
																																																																																									uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
																																																																																									uiListLayout.HorizontalFlex = Enum.UIFlexAlignment.Fill
																																																																																									uiListLayout.Padding = UDim.new(v86[186], v86[186])
																																																																																									uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																									uiListLayout.Parent = frame

																																																																																									local function fn36(layoutOrder)
																																																																																										local frame2 = Instance.new("Frame")
																																																																																										frame2.BackgroundTransparency = v86[195]
																																																																																										frame2.BorderSizePixel = 0
																																																																																										frame2.Size = UDim2.fromOffset(0, v86[63])
																																																																																										frame2.LayoutOrder = layoutOrder
																																																																																										arg2.Batch:Bind(frame2, v86[5], "TextColor")
																																																																																										frame2.Parent = frame
																																																																																										local uiFlexItem = Instance.new("UIFlexItem")
																																																																																										uiFlexItem.FlexMode = Enum.UIFlexMode.Fill
																																																																																										uiFlexItem.Parent = frame2
																																																																																									end

																																																																																									fn36(0)
																																																																																									local textLabel = Instance.new("TextLabel")
																																																																																									textLabel.BackgroundTransparency = 1
																																																																																									textLabel.BorderSizePixel = 0
																																																																																									textLabel.Size = UDim2.fromScale(0, 1)
																																																																																									textLabel.AutomaticSize = Enum.AutomaticSize.X
																																																																																									textLabel.FontFace = v115.SemiBold
																																																																																									textLabel.Text = arg.Label:upper()
																																																																																									textLabel.TextSize = 12
																																																																																									textLabel.TextXAlignment = Enum.TextXAlignment.Center
																																																																																									textLabel.LayoutOrder = v86[63]
																																																																																									textLabel.Visible = arg.Label ~= ""
																																																																																									arg2.Batch:Bind(textLabel, "TextColor3", "TextColor")
																																																																																									textLabel.Parent = frame
																																																																																									local instance = Instance.new(v86[113])
																																																																																									instance.PaddingLeft = UDim.new(0, v86[162])
																																																																																									instance.PaddingRight = UDim.new(0, 8)
																																																																																									instance.Parent = textLabel
																																																																																									fn36(2)
																																																																																									arg._rt = { Object = frame, Label = textLabel }
																																																																																									return frame
																																																																																								end

																																																																																								index2._New = function(arg, arg2, arg3, arg4)
																																																																																									local obj = setmetatable({ _trove = arg3, _menu = arg, Kind = "Divider", Row = arg2, Label = arg4.Label or "", _rt = nil }, index2)

																																																																																									arg2:AttachRight(function(arg5, arg6)
																																																																																										return createFrame(obj, arg5, arg6)
																																																																																									end, nil, nil, arg3)

																																																																																									return obj
																																																																																								end

																																																																																								index2.SetLabel = function(arg, label)
																																																																																									arg.Label = label
																																																																																									local rt = arg._rt

																																																																																									if rt ~= nil then
																																																																																										rt.Label.Text = label:upper()
																																																																																										rt.Label.Visible = label ~= ""
																																																																																									end

																																																																																									return arg
																																																																																								end

																																																																																								index2.SetVisible = function(arg, arg2)
																																																																																									arg.Row:SetVisible(arg2)
																																																																																								end

																																																																																								index2.Connect = function(arg, arg2, arg3)
																																																																																									arg._trove:Connect(arg2, arg3)
																																																																																									return arg
																																																																																								end

																																																																																								index2.Destroy = function(arg)
																																																																																									arg._trove:Destroy()
																																																																																								end

																																																																																								return index2
																																																																																							end

																																																																																							tbl17.Q = function()
																																																																																								local q = tbl17.cache.Q

																																																																																								if not q then
																																																																																									local q2 = { c = fn35() }
																																																																																									tbl17.cache.Q = q2
																																																																																									q = q2
																																																																																								end

																																																																																								return q.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						do
																																																																																							local function fn35()
																																																																																								local v115 = tbl17.g()
																																																																																								tbl17.k()
																																																																																								tbl17.r()
																																																																																								local v116 = tbl17.s()
																																																																																								local v117 = tbl17.x()
																																																																																								tbl17.B()
																																																																																								local v118 = tbl17.A()
																																																																																								local index2 = {}
																																																																																								index2.__index = index2

																																																																																								local function fn36(arg)
																																																																																									if arg.Default ~= nil then
																																																																																										return arg.Default
																																																																																									end
																																																																																									local v119 = arg.Options[1]
																																																																																									return (v119 ~= nil and { v119.Name } or { "" })[1]
																																																																																								end

																																																																																								local function fn37(arg, parent, arg2, arg3)
																																																																																									local instance = Instance.new(v86[128])
																																																																																									instance.BackgroundTransparency = v86[63]
																																																																																									instance.BorderSizePixel = 0
																																																																																									instance.Size = UDim2.new(1, 0, 0, arg3)
																																																																																									local uiListLayout = Instance.new("UIListLayout")
																																																																																									uiListLayout.FillDirection = Enum.FillDirection.Horizontal
																																																																																									uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																									uiListLayout.Padding = UDim.new(0, v86[54])
																																																																																									uiListLayout.Parent = instance
																																																																																									local n = arg3 - 12 - v86[155] - 10 - 3
																																																																																									local n33 = #arg._options

																																																																																									for k, v119 in arg._options, nil, nil do
																																																																																										local imageButton = Instance.new("ImageButton")
																																																																																										imageButton.BackgroundTransparency = 1
																																																																																										imageButton.BorderSizePixel = 0
																																																																																										imageButton.AutoButtonColor = false
																																																																																										imageButton.Image = ""
																																																																																										imageButton.LayoutOrder = k
																																																																																										imageButton.Size = UDim2.new(v86[63] / n33, -v86[54], 1, 0)
																																																																																										imageButton.Parent = instance
																																																																																										local frame = Instance.new("Frame")
																																																																																										frame.BackgroundTransparency = 1
																																																																																										frame.BorderSizePixel = 0
																																																																																										frame.Position = UDim2.fromScale(0.5, 0)
																																																																																										frame.AnchorPoint = Vector2.new(0.5, 0)
																																																																																										frame.Size = UDim2.new(1, -20, 1, -10)
																																																																																										frame.Parent = imageButton
																																																																																										local uiListLayout2 = Instance.new("UIListLayout")
																																																																																										uiListLayout2.FillDirection = Enum.FillDirection.Vertical
																																																																																										uiListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
																																																																																										uiListLayout2.VerticalAlignment = Enum.VerticalAlignment.Center
																																																																																										uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																										uiListLayout2.Padding = UDim.new(0, 3)
																																																																																										uiListLayout2.Parent = frame
																																																																																										local imageLabel = Instance.new("ImageLabel")
																																																																																										imageLabel.BackgroundTransparency = 1
																																																																																										imageLabel.BorderSizePixel = 0
																																																																																										imageLabel.LayoutOrder = 1
																																																																																										imageLabel.ScaleType = Enum.ScaleType.Fit
																																																																																										imageLabel.Size = UDim2.new(1, 0, 0, n)
																																																																																										imageLabel.Image = v119.Icon
																																																																																										imageLabel.Parent = frame
																																																																																										local textLabel = Instance.new("TextLabel")
																																																																																										textLabel.BackgroundTransparency = v86[63]
																																																																																										textLabel.BorderSizePixel = 0
																																																																																										textLabel.FontFace = v116.SemiBold
																																																																																										textLabel.LayoutOrder = v86[56]
																																																																																										textLabel.Size = UDim2.new(1, 0, 0, 14)
																																																																																										textLabel.Text = v119.Name
																																																																																										textLabel.TextSize = 12
																																																																																										textLabel.TextTruncate = Enum.TextTruncate.AtEnd
																																																																																										textLabel.Parent = frame
																																																																																										local frame2 = Instance.new("Frame")
																																																																																										frame2.BackgroundTransparency = v86[63]
																																																																																										frame2.BorderSizePixel = 0
																																																																																										frame2.Position = UDim2.new(0, 0, 1, -3)
																																																																																										frame2.Size = UDim2.new(v86[63], 0, 0, 10)
																																																																																										arg2.Batch:Bind(frame2, "BackgroundColor3", "Accent")
																																																																																										frame2.Parent = imageButton
																																																																																										local uiCorner = Instance.new("UICorner")
																																																																																										uiCorner.CornerRadius = UDim.new(0, 3)
																																																																																										uiCorner.Parent = frame2
																																																																																										arg._cells[k] = { Icon = imageLabel, Label = textLabel, Accent = frame2, Name = v119.Name }

																																																																																										v117.connectClick(arg2.Trove, imageButton, function()
																																																																																											arg:Set(v119.Name)
																																																																																										end)
																																																																																									end

																																																																																									arg2.Batch:BindStateful(v86[174], function()
																																																																																										arg:_Refresh()
																																																																																									end)

																																																																																									arg2.Batch:BindStateful(v86[96], function()
																																																																																										arg:_Refresh()
																																																																																									end)

																																																																																									arg:_Refresh()
																																																																																									instance.Parent = parent
																																																																																									return instance
																																																																																								end

																																																																																								index2._New = function(arg, arg2, arg3, arg4)
																																																																																									local obj = setmetatable({
																																																																																										_trove = arg3,
																																																																																										_menu = arg,
																																																																																										_options = arg4.Options,
																																																																																										_cells = {},
																																																																																										Kind = "IconStrip",
																																																																																										Row = arg2,
																																																																																										Value = fn36(arg4),
																																																																																										ValueChanged = arg3:Add(v115.new()),
																																																																																									}, index2)

																																																																																									local height = arg4.Height or 62

																																																																																									arg2:AttachRight(function(arg5, arg6)
																																																																																										return fn37(obj, arg5, arg6, height)
																																																																																									end, nil, nil, arg3)

																																																																																									if arg4.OnChanged ~= nil then
																																																																																										arg3:Add(obj.ValueChanged:Connect(arg4.OnChanged))
																																																																																									end

																																																																																									return obj
																																																																																								end

																																																																																								index2._Refresh = function(arg)
																																																																																									local v119 = v118.get(v86[174])
																																																																																									local Unselected = v118.get("Unselected")

																																																																																									for _, v120 in arg._cells, nil, nil do
																																																																																										local backgroundTransparency = 1
																																																																																										local v121

																																																																																										if v120.Name ~= arg.Value then
																																																																																											v121 = Unselected
																																																																																										else
																																																																																											backgroundTransparency = v86[186]
																																																																																											v121 = v119
																																																																																										end

																																																																																										v120.Icon.ImageColor3 = v121
																																																																																										v120.Label.TextColor3 = v121
																																																																																										v120.Accent.BackgroundTransparency = backgroundTransparency
																																																																																									end
																																																																																								end

																																																																																								index2.Set = function(arg, value, arg2)
																																																																																									if value == arg.Value then
																																																																																										return
																																																																																									end
																																																																																									local flag19 = v86[153]

																																																																																									for _, v119 in arg._options, nil, nil do
																																																																																										if v119.Name == value then
																																																																																											flag19 = true
																																																																																											break
																																																																																										end
																																																																																									end

																																																																																									if not flag19 then
																																																																																										return
																																																																																									end
																																																																																									arg.Value = value
																																																																																									arg:_Refresh()

																																																																																									if not arg2 then
																																																																																										arg.ValueChanged:Fire(value)
																																																																																									end
																																																																																								end

																																																																																								index2.Get = function(arg)
																																																																																									return arg.Value
																																																																																								end

																																																																																								index2.Connect = function(arg, arg2, arg3)
																																																																																									arg._trove:Add(arg2:Connect(arg3))
																																																																																								end

																																																																																								index2.SetVisible = function(arg, arg2)
																																																																																									arg.Row:SetVisible(arg2)
																																																																																								end

																																																																																								index2.Destroy = function(arg)
																																																																																									arg._trove:Destroy()
																																																																																								end

																																																																																								return index2
																																																																																							end

																																																																																							tbl17.R = function()
																																																																																								local r = tbl17.cache.R

																																																																																								if not r then
																																																																																									r = { c = fn35() }
																																																																																									tbl17.cache.R = r
																																																																																								end

																																																																																								return r.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						do
																																																																																							local function fn35()
																																																																																								local v115 = tbl17.g()
																																																																																								tbl17.k()
																																																																																								tbl17.r()
																																																																																								local v116 = tbl17.x()
																																																																																								tbl17.B()
																																																																																								local v117 = tbl17.A()
																																																																																								local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
																																																																																								local color = Color3.fromRGB(255, 255, v86[108])

																																																																																								local function fn36(arg, arg2)
																																																																																									return Color3.new(arg.R * arg2, arg.G * arg2, arg.B * arg2)
																																																																																								end

																																																																																								local index2 = {}
																																																																																								index2.__index = index2

																																																																																								local function fn37(arg, arg2, arg3, arg4)
																																																																																									local backgroundTransparency = v86[63]
																																																																																									local ToggleCircleUnselected = v117.get("ToggleCircleUnselected")
																																																																																									local udim2 = UDim2.fromOffset(v86[155], 2)

																																																																																									if arg3 then
																																																																																										udim2 = UDim2.fromOffset(13, v86[56])
																																																																																										backgroundTransparency = 0
																																																																																										ToggleCircleUnselected = color
																																																																																									end

																																																																																									if arg4 then
																																																																																										arg2.Fill.BackgroundTransparency = backgroundTransparency
																																																																																										arg2.Circle.BackgroundColor3 = ToggleCircleUnselected
																																																																																										arg2.Circle.Position = udim2
																																																																																										return
																																																																																									end

																																																																																									arg._menu:Tween(arg2.Fill, { BackgroundTransparency = backgroundTransparency })
																																																																																									arg._menu:Tween(arg2.Circle, { BackgroundColor3 = ToggleCircleUnselected, Position = udim2 })
																																																																																								end

																																																																																								local function fn38(arg, parent, arg2)
																																																																																									local instance = Instance.new(v86[128])
																																																																																									instance.AnchorPoint = Vector2.new(1, v86[101])
																																																																																									instance.Position = UDim2.fromScale(1, v86[101])
																																																																																									instance.Size = UDim2.fromOffset(32, 20)
																																																																																									instance.BorderSizePixel = 0
																																																																																									instance.BackgroundColor3 = color
																																																																																									instance.Parent = parent
																																																																																									local instance2 = Instance.new(v86[46])
																																																																																									instance2.Rotation = 90
																																																																																									arg2.Batch:BindGradient(instance2, { "ToggleBackgroundUnselected", "GradientDark" })
																																																																																									instance2.Parent = instance
																																																																																									local uiCorner = Instance.new("UICorner")
																																																																																									uiCorner.CornerRadius = UDim.new(1, 0)
																																																																																									uiCorner.Parent = instance
																																																																																									local instance3 = Instance.new(v86[128])
																																																																																									instance3.Size = UDim2.fromScale(1, 1)
																																																																																									instance3.BorderSizePixel = 0
																																																																																									instance3.BackgroundColor3 = v117.get("Accent")
																																																																																									instance3.BackgroundTransparency = v86[63]
																																																																																									instance3.Parent = instance
																																																																																									local uiCorner2 = Instance.new("UICorner")
																																																																																									uiCorner2.CornerRadius = UDim.new(1, v86[186])
																																																																																									uiCorner2.Parent = instance3
																																																																																									local frame = Instance.new("Frame")
																																																																																									frame.Position = UDim2.fromOffset(v86[155], 2)
																																																																																									frame.Size = UDim2.fromOffset(16, 16)
																																																																																									frame.BorderSizePixel = v86[186]
																																																																																									frame.BackgroundColor3 = v117.get("ToggleCircleUnselected")
																																																																																									frame.Parent = instance
																																																																																									local uiCorner3 = Instance.new("UICorner")
																																																																																									uiCorner3.CornerRadius = UDim.new(1, v86[186])
																																																																																									uiCorner3.Parent = frame
																																																																																									local rt = { Fill = instance3, Circle = frame }
																																																																																									arg._rt = rt
																																																																																									local frame2 = arg.Row.Frame

																																																																																									if frame2 ~= nil then
																																																																																										v116.connectClick(arg2.Trove, frame2, function()
																																																																																											arg:Set(not arg.Value)
																																																																																										end)

																																																																																										v116.connectPress(arg2.Trove, frame2, function()
																																																																																											if arg.Value then
																																																																																												local v118 = v86[105]
																																																																																												arg._menu:Tween(instance3, { BackgroundColor3 = fn36(v117.get("Accent"), v118) }, tweenInfo)
																																																																																											end
																																																																																										end, function()
																																																																																											if arg.Value then
																																																																																												arg._menu:Tween(instance3, { BackgroundColor3 = v117.get(v86[139]) }, tweenInfo)
																																																																																											end
																																																																																										end)
																																																																																									end

																																																																																									arg2.Trove:Connect(arg._menu.AccentChanged, function(arg3)
																																																																																										arg._menu:Tween(instance3, { BackgroundColor3 = arg3 })
																																																																																									end)

																																																																																									arg2.Batch:BindStateful("ToggleCircleUnselected", function(backgroundColor3)
																																																																																										if not arg.Value then
																																																																																											frame.BackgroundColor3 = backgroundColor3
																																																																																										end
																																																																																									end)

																																																																																									arg2.Trove:Connect(arg.ValueChanged, function(arg3)
																																																																																										fn37(arg, rt, arg3, v86[153])
																																																																																									end)

																																																																																									fn37(arg, rt, arg.Value, true)
																																																																																									return instance
																																																																																								end

																																																																																								index2._New = function(arg, arg2, arg3, arg4)
																																																																																									local obj = setmetatable({
																																																																																										_trove = arg3,
																																																																																										_menu = arg,
																																																																																										Kind = "Toggle",
																																																																																										Row = arg2,
																																																																																										Value = arg4.Default == true,
																																																																																										Changed = arg3:Add(v115.new()),
																																																																																										ValueChanged = arg3:Add(v115.new()),
																																																																																										_onChanged = arg4.OnChanged or function()
																																																																																										end,
																																																																																										_rt = nil,
																																																																																									}, index2)

																																																																																									arg2:AttachRight(function(arg5, arg6)
																																																																																										return fn38(obj, arg5, arg6)
																																																																																									end, 32, nil, arg3)

																																																																																									return obj
																																																																																								end

																																																																																								index2.Set = function(arg, value, arg2)
																																																																																									local v118 = v86[116]
																																																																																									if type(value) ~= v118 or value == arg.Value then
																																																																																										return
																																																																																									end
																																																																																									arg.Value = value
																																																																																									arg.ValueChanged:Fire(value)

																																																																																									if not arg2 then
																																																																																										arg._onChanged(value)
																																																																																										arg.Changed:Fire(value)
																																																																																									end
																																																																																								end

																																																																																								index2.SetLabel = function(arg, arg2)
																																																																																									arg.Row:SetLabel(arg2)
																																																																																									return arg
																																																																																								end

																																																																																								index2.SetTooltip = function(arg, arg2)
																																																																																									arg.Row:SetTooltip(arg2)
																																																																																									return arg
																																																																																								end

																																																																																								index2.SetVisible = function(arg, arg2)
																																																																																									arg.Row:SetVisible(arg2)
																																																																																								end

																																																																																								index2.OnChanged = function(arg, arg2)
																																																																																									arg._trove:Connect(arg.Changed, arg2)
																																																																																									return arg
																																																																																								end

																																																																																								index2.Connect = function(arg, arg2, arg3)
																																																																																									arg._trove:Connect(arg2, arg3)
																																																																																									return arg
																																																																																								end

																																																																																								index2.Destroy = function(arg)
																																																																																									arg._trove:Destroy()
																																																																																								end

																																																																																								return index2
																																																																																							end

																																																																																							tbl17.S = function()
																																																																																								local s = tbl17.cache.S

																																																																																								if not s then
																																																																																									local s2 = { c = fn35() }
																																																																																									tbl17.cache.S = s2
																																																																																									s = s2
																																																																																								end

																																																																																								return s.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						local function fn35()
																																																																																							local v115 = tbl17.g()
																																																																																							tbl17.k()
																																																																																							tbl17.r()
																																																																																							local v116 = tbl17.H()
																																																																																							local v117 = tbl17.s()
																																																																																							local v118 = tbl17.u()
																																																																																							local v119 = tbl17.x()
																																																																																							local v120 = tbl17.G()
																																																																																							local v121 = tbl17.B()
																																																																																							local v122 = tbl17.A()
																																																																																							local v123 = tbl17.S()
																																																																																							local v124 = tbl17.w()
																																																																																							local index2 = {}
																																																																																							index2.__index = index2

																																																																																							local function fn36(arg)
																																																																																								if typeof(arg) == "EnumItem" then
																																																																																									local v125 = v124.KeyNames[arg]
																																																																																									if type(v125) == "string" then
																																																																																										return v125
																																																																																									end
																																																																																									return arg.Name
																																																																																								end

																																																																																								if type(arg) == "string" then
																																																																																									return arg
																																																																																								end
																																																																																								return "None"
																																																																																							end

																																																																																							local function fn37(arg)
																																																																																								local panel = arg._panel

																																																																																								if panel ~= nil then
																																																																																									panel.KeyValue.Text = "Key: " .. fn36(arg.Value.Key)
																																																																																								end
																																																																																							end

																																																																																							local function fn38(arg)
																																																																																								local active = arg.Active or arg.Value.Mode == v86[21]
																																																																																								local featureEnabled = arg.ShowInList and arg.FeatureEnabled
																																																																																								local hud = arg._hud

																																																																																								if hud ~= nil then
																																																																																									hud:SetKeyText(fn36(arg.Value.Key))
																																																																																									hud:SetMode(arg.Value.Mode)
																																																																																									hud:SetActiveAppearance(active)
																																																																																									hud:SetEnabled(featureEnabled)
																																																																																								end

																																																																																								local mobile = arg._mobile

																																																																																								if mobile ~= nil then
																																																																																									mobile:SetMode(arg.Value.Mode)
																																																																																									mobile:SetActive(active)
																																																																																									mobile:SetVisible(featureEnabled)
																																																																																								end
																																																																																							end

																																																																																							local function createTextLabel(arg, parent, arg2)
																																																																																								local textButton = Instance.new("TextButton")
																																																																																								textButton.BackgroundTransparency = v86[63]
																																																																																								textButton.Size = UDim2.new(1, 0, 0, 20)
																																																																																								textButton.BorderSizePixel = 0
																																																																																								textButton.AutomaticSize = Enum.AutomaticSize.Y
																																																																																								textButton.Text = ""
																																																																																								textButton.AutoButtonColor = false
																																																																																								textButton.LayoutOrder = 0
																																																																																								textButton.Parent = parent
																																																																																								local textLabel = Instance.new("TextLabel")
																																																																																								textLabel.FontFace = v117.Medium
																																																																																								textLabel.Text = "Keybind"
																																																																																								textLabel.AnchorPoint = Vector2.new(0, 0.5)
																																																																																								textLabel.BackgroundTransparency = 1
																																																																																								textLabel.Position = UDim2.fromScale(0, v86[101])
																																																																																								textLabel.BorderSizePixel = v86[186]
																																																																																								textLabel.AutomaticSize = Enum.AutomaticSize.XY
																																																																																								textLabel.TextSize = 16
																																																																																								arg2.Batch:Bind(textLabel, v86[167], "TextColor")
																																																																																								textLabel.Parent = textButton
																																																																																								local textButton2 = Instance.new("TextButton")
																																																																																								textButton2.AnchorPoint = Vector2.new(1, v86[186])
																																																																																								textButton2.Position = UDim2.new(1, v86[186], 0, 1)
																																																																																								textButton2.Size = UDim2.fromOffset(2, v86[61])
																																																																																								textButton2.BorderSizePixel = v86[186]
																																																																																								textButton2.AutomaticSize = Enum.AutomaticSize.X
																																																																																								textButton2.Text = ""
																																																																																								textButton2.AutoButtonColor = v86[153]
																																																																																								arg2.Batch:Bind(textButton2, "BackgroundColor3", "Background")
																																																																																								textButton2.Parent = textButton
																																																																																								local uiCorner = Instance.new("UICorner")
																																																																																								uiCorner.CornerRadius = UDim.new(0, 5)
																																																																																								uiCorner.Parent = textButton2
																																																																																								local uiStroke = Instance.new("UIStroke")
																																																																																								uiStroke.BorderOffset = UDim.new(v86[186], -v86[63])
																																																																																								uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
																																																																																								arg2.Batch:Bind(uiStroke, "Color", "Outline")
																																																																																								uiStroke.Parent = textButton2
																																																																																								local uiListLayout = Instance.new("UIListLayout")
																																																																																								uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
																																																																																								uiListLayout.FillDirection = Enum.FillDirection.Horizontal
																																																																																								uiListLayout.Padding = UDim.new(v86[186], 10)
																																																																																								uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																								uiListLayout.Parent = textButton2
																																																																																								local uiPadding = Instance.new("UIPadding")
																																																																																								uiPadding.PaddingBottom = UDim.new(0, -1)
																																																																																								uiPadding.PaddingLeft = UDim.new(0, 5)
																																																																																								uiPadding.PaddingRight = UDim.new(v86[186], 5)
																																																																																								uiPadding.Parent = textButton2
																																																																																								local textLabel2 = Instance.new("TextLabel")
																																																																																								textLabel2.FontFace = v117.Medium
																																																																																								textLabel2.TextColor3 = v122.get("TextColor")
																																																																																								textLabel2.Text = ""
																																																																																								textLabel2.AnchorPoint = Vector2.new(0, 0.5)
																																																																																								textLabel2.BackgroundTransparency = 1
																																																																																								textLabel2.Position = UDim2.new(0, 5, v86[101], 0)
																																																																																								textLabel2.BorderSizePixel = 0
																																																																																								textLabel2.AutomaticSize = Enum.AutomaticSize.XY
																																																																																								textLabel2.TextSize = 16
																																																																																								textLabel2.Parent = textButton2
																																																																																								local instance = Instance.new(v86[113])
																																																																																								instance.PaddingBottom = UDim.new(0, v86[56])
																																																																																								instance.Parent = textLabel2

																																																																																								v119.connectClick(arg2.Trove, textButton2, function()
																																																																																									arg:StartCapture()
																																																																																								end)

																																																																																								return textLabel2
																																																																																							end

																																																																																							local function fn39(arg)
																																																																																								local panel = arg._panel
																																																																																								if panel ~= nil then
																																																																																									return panel
																																																																																								end
																																																																																								local rt = arg._rt
																																																																																								if rt == nil then
																																																																																									return nil
																																																																																								end
																																																																																								local menu = arg._menu
																																																																																								local gear = rt.Gear
																																																																																								local n = v86[17]

																																																																																								if v118.IsMobile() then
																																																																																									n = 240
																																																																																								end

																																																																																								local v125 = v120.new(menu, arg._trove, {
																																																																																									Trigger = gear,
																																																																																									Size = UDim2.fromOffset(n, 0),
																																																																																									ParentEntry = arg._parentOverlay,
																																																																																									Place = v120.placeBelow(2, 2),
																																																																																									OnToggle = function(arg2)
																																																																																										local n33 = v86[186]

																																																																																										if arg2 then
																																																																																											n33 = 180
																																																																																										end

																																																																																										menu:Tween(gear, { Rotation = n33 })

																																																																																										if arg2 then
																																																																																											local panel2 = arg._panel

																																																																																											if panel2 ~= nil then
																																																																																												panel2.Scroll.CanvasPosition = Vector2.zero
																																																																																											end
																																																																																										end
																																																																																									end,
																																																																																								})

																																																																																								local v126, v127 = v125:AttachScrollingList(n)
																																																																																								local v128 = v125:RealizeCtx()
																																																																																								local v129 = createTextLabel(arg, v127, v128)
																																																																																								local v130 = v121.new(menu, { Label = v86[97], Height = v86[9] })

																																																																																								local tbl18 = {
																																																																																									Label = "Show in list",
																																																																																									Default = arg.ShowInList,
																																																																																									OnChanged = function(arg2)
																																																																																										arg:SetShowInList(arg2)
																																																																																									end,
																																																																																								}

																																																																																								local v131 = v123._New(menu, v130, arg._trove:Extend(), tbl18)
																																																																																								v130:Realize(v127, v128, 2)
																																																																																								local v132 = nil

																																																																																								if v118.WantsMobileButtons() then
																																																																																									local v133 = v121.new(menu, { Label = v86[112], Height = 20 })

																																																																																									local tbl19 = {
																																																																																										Label = v86[112],
																																																																																										Default = arg.Invisible,
																																																																																										OnChanged = function(arg2)
																																																																																											arg:SetInvisible(arg2)
																																																																																										end,
																																																																																									}

																																																																																									v132 = v123._New(menu, v133, arg._trove:Extend(), tbl19)
																																																																																									v133:Realize(v127, v128, v86[155])
																																																																																								end

																																																																																								local v133 = v121.new(menu, { Label = v86[55], Height = 24 })

																																																																																								local tbl19 = {
																																																																																									Label = "Mode",
																																																																																									Options = arg.Modes,
																																																																																									Default = arg.Value.Mode,
																																																																																									OnChanged = function(arg2)
																																																																																										local v134 = v86[165]

																																																																																										if type(arg2) == v134 then
																																																																																											arg:Set({ Key = arg.Value.Key, Mode = arg2 })
																																																																																										end
																																																																																									end,
																																																																																								}

																																																																																								local v134 = v116._New(menu, v133, arg._trove:Extend(), tbl19)
																																																																																								v133:Realize(v127, v128, v86[26])

																																																																																								local panel2 = {
																																																																																									Popup = v125,
																																																																																									Scroll = v126,
																																																																																									KeyValue = v129,
																																																																																									ShowToggle = v131,
																																																																																									InvisibleToggle = v132,
																																																																																									ModeDropdown = v134,
																																																																																								}

																																																																																								arg._panel = panel2
																																																																																								fn37(arg)
																																																																																								return panel2
																																																																																							end

																																																																																							local function createImageButton(arg, parent, arg2)
																																																																																								local imageButton = Instance.new("ImageButton")
																																																																																								imageButton.Image = "rbxassetid://127083575814915"
																																																																																								imageButton.BackgroundTransparency = 1
																																																																																								imageButton.AnchorPoint = Vector2.new(1, 0.5)
																																																																																								imageButton.Position = UDim2.fromScale(1, 0.5)
																																																																																								imageButton.Size = UDim2.fromOffset(16, 16)
																																																																																								imageButton.BorderSizePixel = 0
																																																																																								imageButton.AutoButtonColor = false
																																																																																								arg2.Batch:Bind(imageButton, "ImageColor3", "TextColor")
																																																																																								imageButton.Parent = parent
																																																																																								arg._rt = { Gear = imageButton }
																																																																																								arg._parentOverlay = arg2.ParentOverlay

																																																																																								v119.connectClick(arg2.Trove, imageButton, function()
																																																																																									local v125 = fn39(arg)

																																																																																									if v125 ~= nil then
																																																																																										v125.Popup:Toggle()
																																																																																									end
																																																																																								end)

																																																																																								return imageButton
																																																																																							end

																																																																																							index2._New = function(arg, arg2, arg3, arg4)
																																																																																								local default = arg4.Default
																																																																																								local str7 = "Toggle"
																																																																																								local key = nil

																																																																																								if default ~= nil then
																																																																																									key = default.Key

																																																																																									if default.Mode ~= nil then
																																																																																										str7 = default.Mode
																																																																																									end
																																																																																								end

																																																																																								local obj = setmetatable({
																																																																																									_trove = arg3,
																																																																																									_menu = arg,
																																																																																									Kind = v86[73],
																																																																																									Row = arg2,
																																																																																									Modes = arg4.Modes or { "Hold", "Toggle", "Always" },
																																																																																									Value = { Key = key, Mode = str7 },
																																																																																									Active = false,
																																																																																									FeatureEnabled = false,
																																																																																									ShowInList = arg4.InKeybindList == true,
																																																																																									Invisible = v86[153],
																																																																																									ListLabel = arg4.ListLabel or arg4.Label or "Keybind",
																																																																																									Capturing = v86[153],
																																																																																									Changed = arg3:Add(v115.new()),
																																																																																									ValueChanged = arg3:Add(v115.new()),
																																																																																									ActiveChanged = arg3:Add(v115.new()),
																																																																																									ShowInListChanged = arg3:Add(v115.new()),
																																																																																									InvisibleChanged = arg3:Add(v115.new()),
																																																																																									_onChanged = arg4.OnChanged or function()
																																																																																									end,
																																																																																									_cancelCapture = nil,
																																																																																									_rt = nil,
																																																																																									_panel = nil,
																																																																																									_parentOverlay = nil,
																																																																																									_hud = nil,
																																																																																									_mobile = nil,
																																																																																								}, index2)

																																																																																								local v125 = arg:AddKeybindHudEntry()

																																																																																								if v125 ~= nil then
																																																																																									obj._hud = v125
																																																																																									v125:SetLabel(obj.ListLabel)
																																																																																									arg3:Add(v125)
																																																																																								end

																																																																																								local v126 = arg:RegisterMobileButton(arg4.RegistrationKey or obj.ListLabel, obj.ListLabel, obj.Value.Mode, function(arg5)
																																																																																									obj:SetActive(arg5)
																																																																																								end)

																																																																																								if v126 ~= nil then
																																																																																									obj._mobile = v126
																																																																																									arg3:Add(v126)
																																																																																								end

																																																																																								fn38(obj)

																																																																																								arg2:AttachRight(function(arg5, arg6)
																																																																																									return createImageButton(obj, arg5, arg6)
																																																																																								end, v86[13], nil, arg3)

																																																																																								return obj
																																																																																							end

																																																																																							index2._BindConfigMap = function(arg, arg2, arg3)
																																																																																								local flag19 = false

																																																																																								local function fn40(arg4, arg5, arg6, arg7)
																																																																																									if arg4 == nil then
																																																																																										return
																																																																																									end

																																																																																									local function fn41(arg8)
																																																																																										if arg8 == nil then
																																																																																											return
																																																																																										end
																																																																																										flag19 = v86[34]
																																																																																										arg7(arg8)
																																																																																										flag19 = v86[153]
																																																																																									end

																																																																																									fn41(arg2:Get(arg4))

																																																																																									arg._trove:Connect(arg5, function()
																																																																																										if flag19 then
																																																																																											return
																																																																																										end
																																																																																										arg2:Set(arg4, arg6())
																																																																																									end)

																																																																																									arg._trove:Connect(arg2:Changed(arg4, v86[34]), function(arg8)
																																																																																										if flag19 or arg8 == arg6() then
																																																																																											return
																																																																																										end
																																																																																										fn41(arg8)
																																																																																									end)
																																																																																								end

																																																																																								fn40(arg3.Key, arg.Changed, function()
																																																																																									local key = arg.Value.Key
																																																																																									if key == nil then
																																																																																										return v86[75]
																																																																																									end
																																																																																									return key
																																																																																								end, function(arg4)
																																																																																									if typeof(arg4) == "EnumItem" then
																																																																																										arg:SetKey(arg4)
																																																																																									elseif type(arg4) == "string" then
																																																																																										local v125 = arg
																																																																																										local setKey = v125.SetKey
																																																																																										local v126 = v124.deserializeKey(arg4)
																																																																																										setKey(v125, v126)
																																																																																									end
																																																																																								end)

																																																																																								fn40(arg3.Mode, arg.Changed, function()
																																																																																									return arg.Value.Mode
																																																																																								end, function(arg4)
																																																																																									if type(arg4) == "string" then
																																																																																										arg:SetMode(arg4)
																																																																																									end
																																																																																								end)

																																																																																								fn40(arg3.Active, arg.ActiveChanged, function()
																																																																																									return arg.Active
																																																																																								end, function(arg4)
																																																																																									arg:SetActive(arg4 == v86[34])
																																																																																								end)

																																																																																								fn40(arg3.ShowInList, arg.ShowInListChanged, function()
																																																																																									return arg.ShowInList
																																																																																								end, function(arg4)
																																																																																									arg:SetShowInList(arg4 == v86[34])
																																																																																								end)

																																																																																								fn40(arg3.Invisible, arg.InvisibleChanged, function()
																																																																																									return arg.Invisible
																																																																																								end, function(arg4)
																																																																																									arg:SetInvisible(arg4 == true)
																																																																																								end)
																																																																																							end

																																																																																							index2.StartCapture = function(arg)
																																																																																								local panel = arg._panel
																																																																																								if panel == nil then
																																																																																									return
																																																																																								end
																																																																																								arg.Capturing = v86[34]
																																																																																								panel.KeyValue.Text = "Key: ..."
																																																																																								arg._menu:Tween(panel.KeyValue, { TextColor3 = v122.get("Accent") })

																																																																																								arg._cancelCapture = arg._menu:CaptureKey(function(arg2)
																																																																																									arg.Capturing = false
																																																																																									arg._cancelCapture = nil
																																																																																									arg._menu:Tween(panel.KeyValue, { TextColor3 = v122.get("TextColor") })
																																																																																									if arg2 == nil then
																																																																																										fn37(arg)
																																																																																										return
																																																																																									end
																																																																																									arg:Set({ Key = arg2, Mode = arg.Value.Mode })
																																																																																								end)
																																																																																							end

																																																																																							index2.Set = function(arg, arg2, arg3)
																																																																																								local key = arg2.Key
																																																																																								local mode = arg2.Mode or arg.Value.Mode
																																																																																								if key == arg.Value.Key and mode == arg.Value.Mode then
																																																																																									return
																																																																																								end
																																																																																								arg.Value = { Key = key, Mode = mode }
																																																																																								fn37(arg)
																																																																																								fn38(arg)
																																																																																								local panel = arg._panel

																																																																																								if panel ~= nil then
																																																																																									panel.ModeDropdown:Set(mode, true)
																																																																																								end

																																																																																								arg.ValueChanged:Fire(arg.Value)

																																																																																								if not arg3 then
																																																																																									arg._onChanged(arg.Value)
																																																																																									arg.Changed:Fire(arg.Value)
																																																																																								end
																																																																																							end

																																																																																							index2.SetKey = function(arg, arg2, arg3)
																																																																																								arg:Set({ Key = arg2, Mode = arg.Value.Mode }, arg3)
																																																																																							end

																																																																																							index2.SetMode = function(arg, arg2, arg3)
																																																																																								arg:Set({ Key = arg.Value.Key, Mode = arg2 }, arg3)
																																																																																							end

																																																																																							index2.SetActive = function(arg, active, arg2)
																																																																																								if arg.Active == active then
																																																																																									return
																																																																																								end
																																																																																								arg.Active = active
																																																																																								fn38(arg)
																																																																																								arg.ActiveChanged:Fire(active)

																																																																																								if not arg2 then
																																																																																									arg.Changed:Fire(arg.Value)
																																																																																								end
																																																																																							end

																																																																																							index2.SetFeatureEnabled = function(arg, featureEnabled)
																																																																																								if arg.FeatureEnabled == featureEnabled then
																																																																																									return
																																																																																								end
																																																																																								arg.FeatureEnabled = featureEnabled
																																																																																								fn38(arg)
																																																																																							end

																																																																																							index2.SetShowInList = function(arg, arg2, arg3)
																																																																																								local showInList = arg2 == true
																																																																																								if arg.ShowInList == showInList then
																																																																																									return
																																																																																								end
																																																																																								arg.ShowInList = showInList
																																																																																								fn38(arg)
																																																																																								local panel = arg._panel

																																																																																								if panel ~= nil then
																																																																																									panel.ShowToggle:Set(showInList, true)
																																																																																								end

																																																																																								if not arg3 then
																																																																																									arg.ShowInListChanged:Fire(showInList)
																																																																																								end
																																																																																							end

																																																																																							index2.SetInvisible = function(arg, arg2, arg3)
																																																																																								local invisible = arg2 == true
																																																																																								if arg.Invisible == invisible then
																																																																																									return
																																																																																								end
																																																																																								arg.Invisible = invisible
																																																																																								local mobile = arg._mobile

																																																																																								if mobile ~= nil then
																																																																																									mobile:SetInvisible(invisible)
																																																																																								end

																																																																																								local panel = arg._panel

																																																																																								if panel ~= nil then
																																																																																									local invisibleToggle = panel.InvisibleToggle

																																																																																									if invisibleToggle ~= nil then
																																																																																										invisibleToggle:Set(invisible, v86[34])
																																																																																									end
																																																																																								end

																																																																																								if not arg3 then
																																																																																									arg.InvisibleChanged:Fire(invisible)
																																																																																								end
																																																																																							end

																																																																																							index2.SetLabel = function(arg, arg2)
																																																																																								arg.Row:SetLabel(arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.SetTooltip = function(arg, arg2)
																																																																																								arg.Row:SetTooltip(arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.SetVisible = function(arg, arg2)
																																																																																								arg.Row:SetVisible(arg2)
																																																																																							end

																																																																																							index2.OnChanged = function(arg, arg2)
																																																																																								arg._trove:Connect(arg.Changed, arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.Connect = function(arg, arg2, arg3)
																																																																																								arg._trove:Connect(arg2, arg3)
																																																																																								return arg
																																																																																							end

																																																																																							index2.Destroy = function(arg)
																																																																																								local cancelCapture = arg._cancelCapture

																																																																																								if cancelCapture ~= nil then
																																																																																									cancelCapture()
																																																																																								end

																																																																																								arg._trove:Destroy()
																																																																																							end

																																																																																							return index2
																																																																																						end

																																																																																						tbl17.T = function()
																																																																																							local t = tbl17.cache.T

																																																																																							if not t then
																																																																																								t = { c = fn35() }
																																																																																								tbl17.cache.T = t
																																																																																							end

																																																																																							return t.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					do
																																																																																						do
																																																																																							local function fn35()
																																																																																								tbl17.g()
																																																																																								tbl17.k()
																																																																																								tbl17.r()
																																																																																								local v115 = tbl17.s()
																																																																																								tbl17.B()
																																																																																								local index2 = {}
																																																																																								index2.__index = index2

																																																																																								local function createTextButton(arg, parent, arg2)
																																																																																									local textButton = Instance.new("TextButton")
																																																																																									textButton.BackgroundTransparency = 1
																																																																																									textButton.Size = UDim2.new(1, 0, 0, v86[61])
																																																																																									textButton.BorderSizePixel = 0
																																																																																									textButton.AutomaticSize = Enum.AutomaticSize.Y
																																																																																									textButton.Text = ""
																																																																																									textButton.AutoButtonColor = false
																																																																																									textButton.Parent = parent
																																																																																									local textLabel = Instance.new("TextLabel")
																																																																																									textLabel.RichText = v86[34]
																																																																																									textLabel.FontFace = v115.Medium
																																																																																									textLabel.Text = arg.Label
																																																																																									textLabel.AnchorPoint = Vector2.new(v86[186], 0.5)
																																																																																									textLabel.BackgroundTransparency = 1
																																																																																									textLabel.Position = UDim2.fromScale(v86[186], 0.5)
																																																																																									textLabel.BorderSizePixel = 0
																																																																																									textLabel.AutomaticSize = Enum.AutomaticSize.Y
																																																																																									textLabel.Size = UDim2.fromScale(1, 0)
																																																																																									textLabel.TextWrapped = v86[34]
																																																																																									textLabel.TextXAlignment = Enum.TextXAlignment.Left
																																																																																									textLabel.TextSize = arg._textSize or 16

																																																																																									if arg._textColor ~= nil then
																																																																																										textLabel.TextColor3 = arg._textColor
																																																																																									else
																																																																																										arg2.Batch:Bind(textLabel, "TextColor3", "TextColor")
																																																																																									end

																																																																																									textLabel.Parent = textButton
																																																																																									arg._label = textLabel
																																																																																									return textButton
																																																																																								end

																																																																																								index2._New = function(arg, arg2, arg3, arg4)
																																																																																									local obj = setmetatable({
																																																																																										_trove = arg3,
																																																																																										_menu = arg,
																																																																																										Kind = "Label",
																																																																																										Row = arg2,
																																																																																										Label = arg4.Label or "",
																																																																																										_textColor = arg4.TextColor,
																																																																																										_textSize = arg4.TextSize,
																																																																																										_label = nil,
																																																																																									}, index2)

																																																																																									arg2:AttachRight(function(arg5, arg6)
																																																																																										return createTextButton(obj, arg5, arg6)
																																																																																									end, nil, nil, arg3)

																																																																																									return obj
																																																																																								end

																																																																																								index2.SetLabel = function(arg, label)
																																																																																									arg.Label = label
																																																																																									local label2 = arg._label

																																																																																									if label2 ~= nil then
																																																																																										label2.Text = label
																																																																																									end

																																																																																									return arg
																																																																																								end

																																																																																								index2.SetColor = function(arg, textColor)
																																																																																									local v116 = v86[115]
																																																																																									if typeof(textColor) ~= v116 then
																																																																																										return arg
																																																																																									end
																																																																																									arg._textColor = textColor
																																																																																									local label = arg._label

																																																																																									if label ~= nil then
																																																																																										label.TextColor3 = textColor
																																																																																									end

																																																																																									return arg
																																																																																								end

																																																																																								index2.SetTooltip = function(arg, arg2)
																																																																																									arg.Row:SetTooltip(arg2)
																																																																																									return arg
																																																																																								end

																																																																																								index2.SetVisible = function(arg, arg2)
																																																																																									arg.Row:SetVisible(arg2)
																																																																																								end

																																																																																								index2.Connect = function(arg, arg2, arg3)
																																																																																									arg._trove:Connect(arg2, arg3)
																																																																																									return arg
																																																																																								end

																																																																																								index2.Destroy = function(arg)
																																																																																									arg._trove:Destroy()
																																																																																								end

																																																																																								return index2
																																																																																							end

																																																																																							tbl17.U = function()
																																																																																								local u = tbl17.cache.U

																																																																																								if not u then
																																																																																									u = { c = fn35() }
																																																																																									tbl17.cache.U = u
																																																																																								end

																																																																																								return u.c
																																																																																							end
																																																																																						end
																																																																																					end

																																																																																					do
																																																																																						local function fn35()
																																																																																							local v115 = tbl17.g()
																																																																																							tbl17.k()
																																																																																							local v116 = tbl17.F()
																																																																																							tbl17.r()
																																																																																							local v117 = tbl17.x()
																																																																																							tbl17.B()
																																																																																							local v118 = tbl17.A()
																																																																																							local index2 = {}
																																																																																							index2.__index = index2

																																																																																							local function fn36(arg, arg2)
																																																																																								local value = arg.Value
																																																																																								if type(value) == "table" then
																																																																																									return table.find(value, arg2) ~= nil
																																																																																								end
																																																																																								return value == arg2
																																																																																							end

																																																																																							local function fn37(arg, arg2, arg3, arg4)
																																																																																								local Unselected = v118.get("Unselected")
																																																																																								local imageTransparency = v86[63]
																																																																																								local n = v86[175]

																																																																																								if arg3 then
																																																																																									Unselected = v118.get("TextColor")
																																																																																									n = 29
																																																																																									imageTransparency = 0
																																																																																								end

																																																																																								arg2.Tick.ImageColor3 = v118.get(v86[174])
																																																																																								local udim = UDim.new(v86[186], n)

																																																																																								if arg4 then
																																																																																									arg2.Title.TextColor3 = Unselected
																																																																																									arg2.Tick.ImageTransparency = imageTransparency
																																																																																									arg2.Padding.PaddingLeft = udim
																																																																																									return
																																																																																								end

																																																																																								arg._menu:Tween(arg2.Title, { TextColor3 = Unselected })
																																																																																								arg._menu:Tween(arg2.Tick, { ImageTransparency = imageTransparency })
																																																																																								arg._menu:Tween(arg2.Padding, { PaddingLeft = udim })
																																																																																							end

																																																																																							local function fn38(arg, arg2)
																																																																																								local rt = arg._rt
																																																																																								if rt == nil then
																																																																																									return
																																																																																								end

																																																																																								for k, v119 in rt.Rows, nil, nil do
																																																																																									local v120 = arg.Options[k]
																																																																																									fn37(arg, v119, v120 ~= nil and fn36(arg, v120), arg2)
																																																																																								end
																																																																																							end

																																																																																							local function fn39(arg, arg2)
																																																																																								local rt = arg._rt
																																																																																								if rt == nil then
																																																																																									return
																																																																																								end
																																																																																								local str7 = arg2:lower()

																																																																																								for _, v119 in rt.Rows, nil, nil do
																																																																																									v119.Title.Visible = v119.Title.Text:lower():find(str7, 1, true) ~= nil
																																																																																								end
																																																																																							end

																																																																																							local function fn40(arg, arg2)
																																																																																								local v119 = arg.Options[arg2]
																																																																																								if v119 == nil then
																																																																																									return
																																																																																								end

																																																																																								if not arg.Multi then
																																																																																									arg:Set(v119)
																																																																																									return
																																																																																								end
																																																																																								local tbl18 = {}
																																																																																								local v120 = v86[68]

																																																																																								if type(arg.Value) == v120 then
																																																																																									tbl18 = table.clone(arg.Value)
																																																																																								end

																																																																																								local v121 = table.find(tbl18, v119)

																																																																																								if v121 ~= nil then
																																																																																									table.remove(tbl18, v121)
																																																																																								else
																																																																																									table.insert(tbl18, v119)
																																																																																								end

																																																																																								arg:Set(tbl18)
																																																																																							end

																																																																																							local function fn41(arg, arg2, layoutOrder)
																																																																																								local instance = Instance.new(v86[135])
																																																																																								instance.BackgroundTransparency = v86[63]
																																																																																								instance.TextColor3 = v118.get("Unselected")
																																																																																								instance.Text = ""
																																																																																								instance.Size = UDim2.fromScale(1, 0)
																																																																																								instance.ClipsDescendants = true
																																																																																								instance.TextXAlignment = Enum.TextXAlignment.Left
																																																																																								instance.BorderSizePixel = 0
																																																																																								instance.AutomaticSize = Enum.AutomaticSize.XY
																																																																																								instance.TextSize = 16
																																																																																								instance.FontFace = arg._menu.Fonts.Main
																																																																																								instance.LayoutOrder = layoutOrder
																																																																																								instance.Parent = arg2.Scroll
																																																																																								local instance2 = Instance.new(v86[113])
																																																																																								instance2.PaddingTop = UDim.new(0, 5)
																																																																																								instance2.PaddingBottom = UDim.new(0, 5)
																																																																																								instance2.PaddingRight = UDim.new(0, 5)
																																																																																								instance2.PaddingLeft = UDim.new(0, 5)
																																																																																								instance2.Parent = instance
																																																																																								local imageLabel = Instance.new("ImageLabel")
																																																																																								imageLabel.ImageTransparency = v86[63]
																																																																																								imageLabel.Image = "rbxassetid://73347151382921"
																																																																																								imageLabel.ImageColor3 = v118.get(v86[174])
																																																																																								imageLabel.BackgroundTransparency = v86[63]
																																																																																								imageLabel.AnchorPoint = Vector2.new(0, 0.5)
																																																																																								imageLabel.Position = UDim2.new(0, -22, v86[101], v86[186])
																																																																																								imageLabel.Size = UDim2.fromOffset(14, 14)
																																																																																								imageLabel.BorderSizePixel = v86[186]
																																																																																								imageLabel.Parent = instance

																																																																																								v117.connectClick(arg._trove, instance, function()
																																																																																									fn40(arg, layoutOrder)
																																																																																								end)

																																																																																								return { Title = instance, Padding = instance2, Tick = imageLabel }
																																																																																							end

																																																																																							local function fn42(arg)
																																																																																								local rt = arg._rt
																																																																																								if rt == nil then
																																																																																									return
																																																																																								end
																																																																																								local rows = rt.Rows
																																																																																								local options = arg.Options

																																																																																								for k, v119 in options, nil, nil do
																																																																																									local v120 = rows[k]

																																																																																									if v120 == nil then
																																																																																										v120 = fn41(arg, rt, k)
																																																																																										rows[k] = v120
																																																																																									end

																																																																																									if v120.Title.Text ~= v119 then
																																																																																										v120.Title.Text = v119
																																																																																									end

																																																																																									if not v120.Title.Visible then
																																																																																										v120.Title.Visible = true
																																																																																									end
																																																																																								end

																																																																																								for i = #rows, #options + 1, -1 do
																																																																																									rows[i].Title:Destroy()
																																																																																									rows[i] = nil
																																																																																								end
																																																																																							end

																																																																																							local function fn43(arg, arg2, arg3)
																																																																																								local menu = arg._menu
																																																																																								local instance = Instance.new(v86[128])
																																																																																								instance.LayoutOrder = -1
																																																																																								instance.Size = UDim2.fromOffset(v86[157], v86[144])
																																																																																								instance.ClipsDescendants = true
																																																																																								instance.BorderSizePixel = 0
																																																																																								arg3.Batch:Bind(instance, "BackgroundColor3", "Background")
																																																																																								instance.Parent = arg2.Root
																																																																																								local uiCorner = Instance.new("UICorner")
																																																																																								uiCorner.CornerRadius = UDim.new(0, 5)
																																																																																								uiCorner.Parent = instance
																																																																																								local uiStroke = Instance.new("UIStroke")
																																																																																								arg3.Batch:Bind(uiStroke, "Color", "Outline")
																																																																																								uiStroke.Parent = instance
																																																																																								local textBox = Instance.new("TextBox")
																																																																																								textBox.PlaceholderText = v86[190]
																																																																																								textBox.PlaceholderColor3 = v118.get("Unselected")
																																																																																								textBox.FontFace = menu.Fonts.Main
																																																																																								textBox.Text = ""
																																																																																								textBox.AnchorPoint = Vector2.new(v86[186], 0.5)
																																																																																								textBox.Position = UDim2.new(0, v86[54], 0.5, 0)
																																																																																								textBox.Size = UDim2.new(1, -12, 1, v86[186])
																																																																																								textBox.BackgroundTransparency = 1
																																																																																								textBox.BorderSizePixel = 0
																																																																																								textBox.TextSize = 14
																																																																																								textBox.TextXAlignment = Enum.TextXAlignment.Left
																																																																																								textBox.ClearTextOnFocus = v86[34]
																																																																																								textBox.Active = true
																																																																																								arg3.Batch:Bind(textBox, "TextColor3", "TextColor")
																																																																																								textBox.Parent = instance
																																																																																								arg2.SearchInput = textBox

																																																																																								arg3.Trove:Connect(textBox:GetPropertyChangedSignal(v86[80]), function()
																																																																																									fn39(arg, textBox.Text)
																																																																																								end)
																																																																																							end

																																																																																							local function fn44(arg, parent, arg2)
																																																																																								local instance = Instance.new(v86[92])
																																																																																								instance.BackgroundTransparency = v86[63]
																																																																																								instance.Size = UDim2.new(1, 0, v86[186], 24)
																																																																																								instance.BorderSizePixel = 0
																																																																																								instance.AutomaticSize = Enum.AutomaticSize.Y
																																																																																								instance.Text = ""
																																																																																								instance.AutoButtonColor = false
																																																																																								instance.Parent = parent
																																																																																								local uiListLayout = Instance.new("UIListLayout")
																																																																																								uiListLayout.Padding = UDim.new(v86[186], v86[13])
																																																																																								uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																								uiListLayout.Parent = instance
																																																																																								local scrollingFrame = Instance.new("ScrollingFrame")
																																																																																								scrollingFrame.ScrollBarImageTransparency = 1
																																																																																								scrollingFrame.ScrollBarThickness = v86[186]
																																																																																								scrollingFrame.Selectable = false
																																																																																								scrollingFrame.Size = UDim2.new(1, 0, 0, arg.Height)
																																																																																								scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
																																																																																								scrollingFrame.CanvasSize = UDim2.fromOffset(0, 0)
																																																																																								scrollingFrame.BackgroundColor3 = Color3.fromRGB(v86[108], 255, 255)
																																																																																								scrollingFrame.BorderSizePixel = 0
																																																																																								arg2.Batch:Bind(scrollingFrame, "ScrollBarImageColor3", "Accent")
																																																																																								scrollingFrame.Parent = instance
																																																																																								local instance2 = Instance.new(v86[46])
																																																																																								instance2.Rotation = v86[45]
																																																																																								v116.bindSurfaceGradient(arg2.Batch, instance2, { v86[187], "GradientDark" })
																																																																																								instance2.Parent = scrollingFrame
																																																																																								local uiCorner = Instance.new("UICorner")
																																																																																								uiCorner.CornerRadius = UDim.new(0, 5)
																																																																																								uiCorner.Parent = scrollingFrame
																																																																																								local uiStroke = Instance.new("UIStroke")
																																																																																								arg2.Batch:Bind(uiStroke, "Color", v86[120])
																																																																																								uiStroke.Parent = scrollingFrame
																																																																																								local uiListLayout2 = Instance.new("UIListLayout")
																																																																																								uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																								uiListLayout2.Parent = scrollingFrame
																																																																																								local rt = { Root = instance, Scroll = scrollingFrame, SearchInput = nil, Rows = {} }
																																																																																								arg._rt = rt

																																																																																								if arg.Search then
																																																																																									fn43(arg, rt, arg2)
																																																																																								end

																																																																																								fn42(arg)
																																																																																								fn38(arg, v86[34])
																																																																																								return instance
																																																																																							end

																																																																																							local function fn45(arg, arg2)
																																																																																								if n25 > 3887 then
																																																																																									while v86[34] do
																																																																																									end
																																																																																								end

																																																																																								local tbl18 = {}

																																																																																								for _, v119 in arg, nil, nil do
																																																																																									if table.find(arg2, v119) ~= nil then
																																																																																										table.insert(tbl18, v119)
																																																																																									end
																																																																																								end

																																																																																								return tbl18
																																																																																							end

																																																																																							local function fn46(arg, arg2)
																																																																																								if #arg ~= #arg2 then
																																																																																									return false
																																																																																								end

																																																																																								for k, v119 in arg, nil, nil do
																																																																																									if arg2[k] ~= v119 then
																																																																																										return false
																																																																																									end
																																																																																								end

																																																																																								return true
																																																																																							end

																																																																																							local function fn47(arg, arg2, arg3, arg4, arg5, arg6, arg7)
																																																																																								local obj = setmetatable({
																																																																																									_trove = arg3,
																																																																																									_menu = arg,
																																																																																									Kind = "List",
																																																																																									Row = arg2,
																																																																																									Multi = arg5,
																																																																																									Search = arg4.Search == true,
																																																																																									Height = arg4.Height or v86[110],
																																																																																									Options = table.clone(arg4.Options or {}),
																																																																																									Value = arg6,
																																																																																									Changed = arg3:Add(v115.new()),
																																																																																									ValueChanged = arg3:Add(v115.new()),
																																																																																									_onChanged = arg7,
																																																																																									_rt = nil,
																																																																																								}, index2)

																																																																																								arg2:AttachRight(function(arg8, arg9)
																																																																																									return fn44(obj, arg8, arg9)
																																																																																								end, nil, nil, arg3)

																																																																																								return obj
																																																																																							end

																																																																																							index2._New = function(arg, arg2, arg3, arg4)
																																																																																								local options = arg4.Options or {}
																																																																																								local default = arg4.Default

																																																																																								if not (default ~= nil and table.find(options, default) ~= nil) then
																																																																																									default = nil

																																																																																									if arg4.SelectFirst ~= false then
																																																																																										default = options[1]
																																																																																									end
																																																																																								end

																																																																																								local onChanged = arg4.OnChanged

																																																																																								local function fn48()
																																																																																								end

																																																																																								if onChanged ~= nil then
																																																																																									fn48 = function(arg5)
																																																																																										onChanged(arg5)
																																																																																									end
																																																																																								end

																																																																																								return (fn47(arg, arg2, arg3, arg4, false, default, fn48))
																																																																																							end

																																																																																							index2._NewMulti = function(arg, arg2, arg3, arg4)
																																																																																								local v119 = fn45(arg4.Options or {}, arg4.Default or {})
																																																																																								local onChanged = arg4.OnChanged

																																																																																								local function fn48()
																																																																																								end

																																																																																								if onChanged ~= nil then
																																																																																									fn48 = function(arg5)
																																																																																										onChanged(arg5)
																																																																																									end
																																																																																								end

																																																																																								return (fn47(arg, arg2, arg3, arg4, v86[34], v119, fn48))
																																																																																							end

																																																																																							index2.Set = function(arg, value, arg2)
																																																																																								local flag19 = arg2 == v86[34]

																																																																																								if arg.Multi then
																																																																																									local tbl18 = {}

																																																																																									if type(value) ~= "table" then
																																																																																										local v119 = v86[165]

																																																																																										if type(value) ~= v119 then
																																																																																											value = tbl18
																																																																																										else
																																																																																											value = { value }
																																																																																										end
																																																																																									end

																																																																																									arg.Value = fn45(arg.Options, value)
																																																																																								else
																																																																																									local flag20 = type(value) == "string" and table.find(arg.Options, value) ~= nil
																																																																																									local v119 = nil

																																																																																									if not flag20 then
																																																																																										value = v119
																																																																																									end

																																																																																									arg.Value = value
																																																																																								end

																																																																																								fn38(arg, flag19)
																																																																																								arg.ValueChanged:Fire(arg.Value)

																																																																																								if not arg2 then
																																																																																									arg._onChanged(arg.Value)
																																																																																									arg.Changed:Fire(arg.Value)
																																																																																								end
																																																																																							end

																																																																																							index2.SetOptions = function(arg, arg2)
																																																																																								local value = arg.Value
																																																																																								arg.Options = table.clone(arg2 or {})
																																																																																								fn42(arg)
																																																																																								arg:Set(value, true)
																																																																																								local flag19 = value ~= arg.Value
																																																																																								local multi = arg.Multi

																																																																																								if multi then
																																																																																									local v119 = v86[68]
																																																																																									multi = type(value) == v119
																																																																																								end

																																																																																								if multi and type(arg.Value) == "table" then
																																																																																									flag19 = not fn46(value, arg.Value)
																																																																																								end

																																																																																								if flag19 then
																																																																																									arg._onChanged(arg.Value)
																																																																																									arg.Changed:Fire(arg.Value)
																																																																																								end
																																																																																							end

																																																																																							index2.Add = function(arg, arg2)
																																																																																								if type(arg2) ~= "string" or table.find(arg.Options, arg2) ~= nil then
																																																																																									return
																																																																																								end
																																																																																								local v119 = table.clone(arg.Options)
																																																																																								table.insert(v119, arg2)
																																																																																								arg:SetOptions(v119)
																																																																																							end

																																																																																							index2.Remove = function(arg, arg2)
																																																																																								local v119 = table.find(arg.Options, arg2)
																																																																																								if v119 == nil then
																																																																																									return
																																																																																								end
																																																																																								local v120 = table.clone(arg.Options)
																																																																																								table.remove(v120, v119)
																																																																																								arg:SetOptions(v120)
																																																																																							end

																																																																																							index2.SetLabel = function(arg, arg2)
																																																																																								arg.Row:SetLabel(arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.SetTooltip = function(arg, arg2)
																																																																																								arg.Row:SetTooltip(arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.SetVisible = function(arg, arg2)
																																																																																								arg.Row:SetVisible(arg2)
																																																																																							end

																																																																																							index2.OnChanged = function(arg, arg2)
																																																																																								arg._trove:Connect(arg.Changed, arg2)
																																																																																								return arg
																																																																																							end

																																																																																							index2.Connect = function(arg, arg2, arg3)
																																																																																								arg._trove:Connect(arg2, arg3)
																																																																																								return arg
																																																																																							end

																																																																																							index2.Destroy = function(arg)
																																																																																								arg._trove:Destroy()
																																																																																							end

																																																																																							return index2
																																																																																						end

																																																																																						tbl17.V = function()
																																																																																							local v115 = tbl17.cache.V

																																																																																							if not v115 then
																																																																																								local v116 = { c = fn35() }
																																																																																								tbl17.cache.V = v116
																																																																																								v115 = v116
																																																																																							end

																																																																																							return v115.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					do
																																																																																						local function fn35()
																																																																																							local v115 = tbl17.F()
																																																																																							local v116 = tbl17.v()
																																																																																							tbl17.A()

																																																																																							return {
																																																																																								nextLayoutOrder = function(arg)
																																																																																									local n = 0

																																																																																									for _, v117 in arg:GetChildren() do
																																																																																										if v117:IsA("GuiObject") then
																																																																																											n += v86[63]
																																																																																										end
																																																																																									end

																																																																																									return n
																																																																																								end,
																																																																																								box = function(arg, parent)
																																																																																									local frame = Instance.new("Frame")
																																																																																									frame.BackgroundTransparency = 0
																																																																																									frame.Size = UDim2.fromScale(1, 0)
																																																																																									frame.BorderSizePixel = 0
																																																																																									frame.AutomaticSize = Enum.AutomaticSize.Y
																																																																																									frame.BackgroundColor3 = Color3.fromRGB(255, v86[108], 255)
																																																																																									frame.Parent = parent
																																																																																									local uiGradient = Instance.new("UIGradient")
																																																																																									uiGradient.Rotation = 90
																																																																																									v115.bindSurfaceGradient(arg, uiGradient, { "GradientMid", v86[70] })
																																																																																									uiGradient.Parent = frame
																																																																																									local uiCorner = Instance.new("UICorner")
																																																																																									uiCorner.CornerRadius = UDim.new(0, 6)
																																																																																									uiCorner.Parent = frame
																																																																																									local instance = Instance.new(v86[85])
																																																																																									arg:Bind(instance, v86[27], "Outline")
																																																																																									instance.Parent = frame
																																																																																									return frame
																																																																																								end,
																																																																																								elementsContainer = function(parent, position, size)
																																																																																									local section = v116.get().Section
																																																																																									local frame = Instance.new("Frame")
																																																																																									frame.BackgroundTransparency = 1
																																																																																									frame.Position = position or UDim2.fromOffset(section.InnerPadding, section.InnerPadding)
																																																																																									frame.Size = size or UDim2.new(v86[63], -section.InnerPadding * v86[56], v86[186], 0)
																																																																																									frame.BorderSizePixel = 0
																																																																																									frame.AutomaticSize = Enum.AutomaticSize.Y
																																																																																									frame.Parent = parent
																																																																																									local uiListLayout = Instance.new("UIListLayout")
																																																																																									uiListLayout.Padding = UDim.new(v86[186], section.ElementGap)
																																																																																									uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																									uiListLayout.Parent = frame
																																																																																									local uiPadding = Instance.new("UIPadding")
																																																																																									uiPadding.PaddingBottom = UDim.new(0, section.InnerPadding)
																																																																																									uiPadding.Parent = frame
																																																																																									return frame
																																																																																								end,
																																																																																							}
																																																																																						end

																																																																																						tbl17.W = function()
																																																																																							local w = tbl17.cache.W

																																																																																							if not w then
																																																																																								w = { c = fn35() }
																																																																																								tbl17.cache.W = w
																																																																																							end

																																																																																							return w.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					do
																																																																																						local function fn35()
																																																																																							tbl17.g()
																																																																																							tbl17.k()
																																																																																							local v115 = tbl17.F()
																																																																																							tbl17.r()
																																																																																							local v116 = tbl17.s()
																																																																																							local v117 = tbl17.v()
																																																																																							tbl17.B()
																																																																																							local v118 = tbl17.W()
																																																																																							local v119 = tbl17.A()
																																																																																							local index2 = {}
																																																																																							index2.__index = index2

																																																																																							index2.new = function(arg, arg2, arg3, arg4)
																																																																																								return setmetatable({
																																																																																									_trove = arg2:Extend(),
																																																																																									_menu = arg,
																																																																																									_resolveParent = arg4,
																																																																																									Sections = arg3,
																																																																																									_activeIndex = 1,
																																																																																									_realized = false,
																																																																																									_ctx = nil,
																																																																																									_tabs = {},
																																																																																									_rootFrame = nil,
																																																																																								}, index2)
																																																																																							end

																																																																																							local function fn36(arg, parent, arg2, layoutOrder)
																																																																																								local section = v117.get().Section
																																																																																								local frame = Instance.new("Frame")
																																																																																								frame.LayoutOrder = layoutOrder or v118.nextLayoutOrder(parent)
																																																																																								frame.BackgroundTransparency = 1
																																																																																								frame.Size = UDim2.fromScale(1, 0)
																																																																																								frame.BorderSizePixel = v86[186]
																																																																																								frame.AutomaticSize = Enum.AutomaticSize.Y
																																																																																								frame.Parent = parent
																																																																																								arg._rootFrame = frame
																																																																																								local uiPadding = Instance.new("UIPadding")
																																																																																								uiPadding.PaddingTop = UDim.new(0, 3)
																																																																																								uiPadding.Parent = frame
																																																																																								local uiCorner = Instance.new("UICorner")
																																																																																								uiCorner.CornerRadius = UDim.new(0, v86[54])
																																																																																								uiCorner.Parent = frame
																																																																																								local uiListLayout = Instance.new("UIListLayout")
																																																																																								uiListLayout.Padding = UDim.new(0, section.TitleGap)
																																																																																								uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																								uiListLayout.Parent = frame
																																																																																								local v120 = v118.box(arg2, frame)
																																																																																								local frame2 = Instance.new("Frame")
																																																																																								frame2.BackgroundTransparency = 0
																																																																																								frame2.ClipsDescendants = true
																																																																																								frame2.Size = UDim2.new(1, 0, 0, section.MultiHeaderHeight)
																																																																																								frame2.BorderSizePixel = v86[186]
																																																																																								frame2.BackgroundColor3 = Color3.fromRGB(v86[108], v86[108], 255)
																																																																																								frame2.Parent = v120
																																																																																								local uiCorner2 = Instance.new("UICorner")
																																																																																								uiCorner2.CornerRadius = UDim.new(0, 6)
																																																																																								uiCorner2.Parent = frame2
																																																																																								local uiGradient = Instance.new("UIGradient")
																																																																																								uiGradient.Rotation = 90
																																																																																								v115.bindSurfaceGradient(arg2, uiGradient, { "GradientTop", "GradientMid" })
																																																																																								uiGradient.Parent = frame2
																																																																																								local frame3 = Instance.new("Frame")
																																																																																								frame3.Position = UDim2.new(0, v86[186], 1, -1)
																																																																																								frame3.Size = UDim2.new(1, v86[186], 0, 1)
																																																																																								frame3.BorderSizePixel = 0
																																																																																								arg2:Bind(frame3, "BackgroundColor3", "Outline")
																																																																																								frame3.Parent = frame2
																																																																																								local instance = Instance.new(v86[128])
																																																																																								instance.BackgroundTransparency = 1
																																																																																								instance.Size = UDim2.fromScale(1, 1)
																																																																																								instance.BorderSizePixel = 0
																																																																																								instance.Parent = frame2
																																																																																								local uiListLayout2 = Instance.new("UIListLayout")
																																																																																								uiListLayout2.Padding = UDim.new(v86[186], section.MultiHeaderGap)
																																																																																								uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																								uiListLayout2.FillDirection = Enum.FillDirection.Horizontal
																																																																																								uiListLayout2.Parent = instance
																																																																																								local uiPadding2 = Instance.new("UIPadding")
																																																																																								uiPadding2.PaddingRight = UDim.new(0, section.MultiHeaderPadding)
																																																																																								uiPadding2.PaddingLeft = UDim.new(v86[186], section.MultiHeaderPadding)
																																																																																								uiPadding2.Parent = instance
																																																																																								return v120, instance
																																																																																							end

																																																																																							local function fn37(arg, layoutOrder, arg2, parent, arg3)
																																																																																								local section = v117.get().Section
																																																																																								local udim2 = UDim2.new
																																																																																								local n = -section.InnerPadding * v86[56]
																																																																																								local v120 = v118.elementsContainer(arg2, UDim2.fromOffset(section.InnerPadding, section.MultiPaneTop), udim2(1, n, 0, 0))
																																																																																								v120.Visible = false
																																																																																								local textButton = Instance.new("TextButton")
																																																																																								textButton.BackgroundTransparency = 1
																																																																																								textButton.Size = UDim2.fromScale(0, 1)
																																																																																								textButton.BorderSizePixel = v86[186]
																																																																																								textButton.AutomaticSize = Enum.AutomaticSize.X
																																																																																								textButton.Text = ""
																																																																																								textButton.AutoButtonColor = false
																																																																																								textButton.LayoutOrder = layoutOrder
																																																																																								textButton.Parent = parent
																																																																																								local textLabel = Instance.new("TextLabel")
																																																																																								textLabel.FontFace = v116.SemiBold
																																																																																								textLabel.Text = arg.Sections[layoutOrder].Title
																																																																																								textLabel.TextColor3 = v119.get("Unselected")
																																																																																								textLabel.AnchorPoint = Vector2.new(0, 0.5)
																																																																																								textLabel.BackgroundTransparency = 1
																																																																																								textLabel.Position = UDim2.fromScale(v86[186], v86[101])
																																																																																								textLabel.BorderSizePixel = 0
																																																																																								textLabel.AutomaticSize = Enum.AutomaticSize.X
																																																																																								textLabel.Size = UDim2.fromOffset(0, section.MultiTabTextSize + 5)
																																																																																								textLabel.TextSize = section.MultiTabTextSize
																																																																																								textLabel.Parent = textButton
																																																																																								local frame = Instance.new("Frame")
																																																																																								frame.BackgroundTransparency = 1
																																																																																								frame.Position = UDim2.new(0, 0, v86[63], -v86[155])
																																																																																								frame.Size = UDim2.new(1, 0, 0, 10)
																																																																																								frame.BorderSizePixel = 0
																																																																																								arg3.Batch:Bind(frame, v86[5], v86[139])
																																																																																								frame.Parent = textButton
																																																																																								local instance = Instance.new(v86[98])
																																																																																								instance.CornerRadius = UDim.new(0, 3)
																																																																																								instance.Parent = frame

																																																																																								arg3.Trove:Connect(textButton.MouseButton1Click, function()
																																																																																									arg:_SetActive(layoutOrder)
																																																																																								end)

																																																																																								return { Label = textLabel, Accent = frame, Pane = v120 }
																																																																																							end

																																																																																							index2.Realize = function(arg, arg2)
																																																																																								if arg._realized then
																																																																																									return
																																																																																								end
																																																																																								arg._realized = true
																																																																																								local v120 = arg._trove:Extend()
																																																																																								local v121 = v119.newBatch(v120)
																																																																																								local ctx = { Menu = arg._menu, Trove = v120, Batch = v121 }
																																																																																								arg._ctx = ctx
																																																																																								local v122, v123 = fn36(arg, arg._resolveParent(), v121, arg2)

																																																																																								for k in arg.Sections, nil, nil do
																																																																																									arg._tabs[k] = fn37(arg, k, v122, v123, ctx)
																																																																																								end

																																																																																								v121:BindStateful("TextColor", function(textColor3)
																																																																																									local v124 = arg._tabs[arg._activeIndex]

																																																																																									if v124 ~= nil then
																																																																																										v124.Label.TextColor3 = textColor3
																																																																																									end
																																																																																								end)

																																																																																								v121:BindStateful("Unselected", function(textColor3)
																																																																																									for k, v124 in arg._tabs, nil, nil do
																																																																																										if k ~= arg._activeIndex then
																																																																																											v124.Label.TextColor3 = textColor3
																																																																																										end
																																																																																									end
																																																																																								end)

																																																																																								local v124 = arg._tabs[arg._activeIndex]

																																																																																								if v124 ~= nil then
																																																																																									v124.Label.TextColor3 = v119.get("TextColor")
																																																																																									v124.Accent.BackgroundTransparency = 0
																																																																																									v124.Pane.Visible = true
																																																																																									arg.Sections[arg._activeIndex]:_RealizeAsPane(v124.Pane, ctx)
																																																																																								end
																																																																																							end

																																																																																							index2._SetActive = function(arg, activeIndex)
																																																																																								if activeIndex == arg._activeIndex or arg._tabs[activeIndex] == nil then
																																																																																									return
																																																																																								end
																																																																																								local menu = arg._menu
																																																																																								local v120 = arg._tabs[arg._activeIndex]

																																																																																								if v120 ~= nil then
																																																																																									menu:Tween(v120.Label, { TextColor3 = v119.get(v86[96]) })
																																																																																									menu:Tween(v120.Accent, { BackgroundTransparency = 1 })
																																																																																									v120.Pane.Visible = false
																																																																																									arg.Sections[arg._activeIndex].Opened:Fire(v86[153])
																																																																																								end

																																																																																								arg._activeIndex = activeIndex
																																																																																								local v121 = arg._tabs[activeIndex]
																																																																																								local ctx = arg._ctx

																																																																																								if ctx ~= nil then
																																																																																									arg.Sections[activeIndex]:_RealizeAsPane(v121.Pane, ctx)
																																																																																								end

																																																																																								menu:Tween(v121.Label, { TextColor3 = v119.get("TextColor") })
																																																																																								menu:Tween(v121.Accent, { BackgroundTransparency = 0 })
																																																																																								v121.Pane.Visible = v86[34]
																																																																																								arg.Sections[activeIndex].Opened:Fire(true)
																																																																																							end

																																																																																							index2.SelectPane = function(arg, arg2)
																																																																																								if not arg._realized then
																																																																																									arg:Realize()
																																																																																								end

																																																																																								arg:_SetActive(arg2)
																																																																																							end

																																																																																							index2._SetGridParent = function(arg, parent, layoutOrder)
																																																																																								local rootFrame = arg._rootFrame
																																																																																								if rootFrame == nil then
																																																																																									return
																																																																																								end
																																																																																								rootFrame.LayoutOrder = layoutOrder
																																																																																								rootFrame.Parent = parent
																																																																																							end

																																																																																							index2.SetVisible = function(arg, visible)
																																																																																								local rootFrame = arg._rootFrame

																																																																																								if rootFrame ~= nil then
																																																																																									rootFrame.Visible = visible
																																																																																								end
																																																																																							end

																																																																																							index2.Destroy = function(arg)
																																																																																								local rootFrame = arg._rootFrame

																																																																																								if rootFrame ~= nil then
																																																																																									rootFrame:Destroy()
																																																																																									arg._rootFrame = nil

																																																																																									if n26 >= 4826 then
																																																																																										while true do
																																																																																										end
																																																																																									end
																																																																																								end

																																																																																								arg._trove:Destroy()
																																																																																							end

																																																																																							return index2
																																																																																						end

																																																																																						tbl17.X = function()
																																																																																							local x = tbl17.cache.X

																																																																																							if not x then
																																																																																								x = { c = fn35() }
																																																																																								tbl17.cache.X = x
																																																																																							end

																																																																																							return x.c
																																																																																						end
																																																																																					end
																																																																																				end

																																																																																				do
																																																																																					local function fn35()
																																																																																						local v115 = tbl17.g()
																																																																																						tbl17.k()
																																																																																						local v116 = tbl17.F()
																																																																																						tbl17.r()
																																																																																						local v117 = tbl17.s()
																																																																																						local v118 = tbl17.v()
																																																																																						local v119 = tbl17.x()
																																																																																						tbl17.B()
																																																																																						local index2 = {}
																																																																																						index2.__index = index2

																																																																																						local function fn36(arg, arg2)
																																																																																							local tbl18 = {}

																																																																																							for _, v120 in arg2, nil, nil do
																																																																																								if type(v120) == "string" and table.find(arg, v120) ~= nil and table.find(tbl18, v120) == nil then
																																																																																									table.insert(tbl18, v120)
																																																																																								end
																																																																																							end

																																																																																							for _, v120 in arg, nil, nil do
																																																																																								if table.find(tbl18, v120) == nil then
																																																																																									table.insert(tbl18, v120)
																																																																																								end
																																																																																							end

																																																																																							return tbl18
																																																																																						end

																																																																																						local function fn37(arg, arg2, arg3)
																																																																																							local v120 = table.find(arg, arg2)
																																																																																							if v120 == nil then
																																																																																								return false
																																																																																							end
																																																																																							local n = math.clamp(v120 + arg3, 1, #arg)
																																																																																							if n == v120 then
																																																																																								return false
																																																																																							end
																																																																																							table.remove(arg, v120)
																																																																																							table.insert(arg, n, arg2)
																																																																																							return v86[34]
																																																																																						end

																																																																																						local function fn38(arg)
																																																																																							local rt = arg._rt
																																																																																							if rt == nil then
																																																																																								return
																																																																																							end

																																																																																							for k, v120 in rt.Rows, nil, nil do
																																																																																								local layoutOrder = table.find(arg.Order, k) or 0
																																																																																								local autoButtonColor = layoutOrder > v86[63]
																																																																																								local autoButtonColor2 = layoutOrder > v86[186] and layoutOrder < #arg.Order
																																																																																								v120.Object.LayoutOrder = layoutOrder
																																																																																								v120.Index.Text = tostring(layoutOrder)
																																																																																								v120.Up.AutoButtonColor = autoButtonColor
																																																																																								v120.Down.AutoButtonColor = autoButtonColor2
																																																																																								local textTransparency = 0.6

																																																																																								if autoButtonColor then
																																																																																									textTransparency = 0
																																																																																								end

																																																																																								local textTransparency2 = v86[84]

																																																																																								if autoButtonColor2 then
																																																																																									textTransparency2 = 0
																																																																																								end

																																																																																								v120.Up.TextTransparency = textTransparency
																																																																																								v120.Down.TextTransparency = textTransparency2
																																																																																							end
																																																																																						end

																																																																																						local function fn39(arg, arg2)
																																																																																							arg.Value = table.clone(arg.Order)
																																																																																							arg.ValueChanged:Fire(arg.Value)

																																																																																							if not arg2 then
																																																																																								arg._onChanged(arg.Value)
																																																																																								arg.Changed:Fire(arg.Value)
																																																																																							end
																																																																																						end

																																																																																						local function fn40(arg, text, parent, arg2)
																																																																																							local menu = arg._menu
																																																																																							local v120 = v118.get()
																																																																																							local listRowHeight = v120.Row.ListRowHeight
																																																																																							local n = -v86[58]
																																																																																							local isCompact = v120.IsCompact
																																																																																							local n33 = -28
																																																																																							local textSize = 12
																																																																																							local n34 = 22

																																																																																							if isCompact then
																																																																																								n = -v86[53]
																																																																																								n33 = -42
																																																																																								textSize = 14
																																																																																								n34 = 30
																																																																																							end

																																																																																							local frame = Instance.new("Frame")
																																																																																							frame.BackgroundTransparency = 0.5
																																																																																							frame.Size = UDim2.new(1, 0, v86[186], listRowHeight)
																																																																																							frame.BorderSizePixel = v86[186]
																																																																																							arg2.Batch:Bind(frame, "BackgroundColor3", "ElementBackground")
																																																																																							frame.Parent = parent
																																																																																							local instance = Instance.new(v86[98])
																																																																																							instance.CornerRadius = UDim.new(0, v86[26])
																																																																																							instance.Parent = frame
																																																																																							local instance2 = Instance.new(v86[135])
																																																																																							instance2.BackgroundTransparency = 1
																																																																																							instance2.Position = UDim2.fromOffset(8, 0)
																																																																																							instance2.Size = UDim2.new(v86[186], 18, 1, v86[186])
																																																																																							instance2.Text = ""
																																																																																							instance2.TextSize = v86[118]
																																																																																							instance2.TextXAlignment = Enum.TextXAlignment.Left
																																																																																							instance2.FontFace = v117.Medium
																																																																																							arg2.Batch:Bind(instance2, "TextColor3", v86[96])
																																																																																							instance2.Parent = frame
																																																																																							local instance3 = Instance.new(v86[135])
																																																																																							instance3.BackgroundTransparency = 1
																																																																																							instance3.Position = UDim2.fromOffset(30, 0)
																																																																																							instance3.Size = UDim2.new(1, n, 1, 0)
																																																																																							instance3.Text = text
																																																																																							instance3.TextSize = v86[72]
																																																																																							instance3.TextXAlignment = Enum.TextXAlignment.Left
																																																																																							instance3.FontFace = v117.Medium
																																																																																							instance3.TextTruncate = Enum.TextTruncate.AtEnd
																																																																																							arg2.Batch:Bind(instance3, "TextColor3", v86[174])
																																																																																							instance3.Parent = frame
																																																																																							local textButton = Instance.new("TextButton")
																																																																																							textButton.AnchorPoint = Vector2.new(1, 0.5)
																																																																																							textButton.Position = UDim2.new(1, n33, 0.5, 0)
																																																																																							textButton.Size = UDim2.fromOffset(n34, n34)
																																																																																							textButton.BackgroundTransparency = 1
																																																																																							textButton.BorderSizePixel = 0
																																																																																							textButton.Text = "▲"
																																																																																							textButton.TextSize = textSize
																																																																																							textButton.AutoButtonColor = false
																																																																																							textButton.FontFace = menu.Fonts.Main
																																																																																							arg2.Batch:Bind(textButton, v86[167], "TextColor")
																																																																																							textButton.Parent = frame
																																																																																							local textButton2 = Instance.new("TextButton")
																																																																																							textButton2.AnchorPoint = Vector2.new(v86[63], 0.5)
																																																																																							textButton2.Position = UDim2.new(1, -4, 0.5, 0)
																																																																																							textButton2.Size = UDim2.fromOffset(n34, n34)
																																																																																							textButton2.BackgroundTransparency = 1
																																																																																							textButton2.BorderSizePixel = 0
																																																																																							textButton2.Text = "▼"
																																																																																							textButton2.TextSize = textSize
																																																																																							textButton2.AutoButtonColor = v86[153]
																																																																																							textButton2.FontFace = menu.Fonts.Main
																																																																																							arg2.Batch:Bind(textButton2, "TextColor3", "TextColor")
																																																																																							textButton2.Parent = frame

																																																																																							v119.connectClick(arg2.Trove, textButton, function()
																																																																																								if fn37(arg.Order, text, -v86[63]) then
																																																																																									fn38(arg)
																																																																																									fn39(arg)
																																																																																								end
																																																																																							end)

																																																																																							v119.connectClick(arg2.Trove, textButton2, function()
																																																																																								if fn37(arg.Order, text, 1) then
																																																																																									fn38(arg)
																																																																																									fn39(arg)
																																																																																								end
																																																																																							end)

																																																																																							return { Object = frame, Up = textButton, Down = textButton2, Index = instance2 }
																																																																																						end

																																																																																						local function createFrame(arg, parent, arg2)
																																																																																							local frame = Instance.new("Frame")
																																																																																							frame.BackgroundTransparency = 1
																																																																																							frame.Size = UDim2.fromScale(1, v86[186])
																																																																																							frame.BorderSizePixel = 0
																																																																																							frame.AutomaticSize = Enum.AutomaticSize.Y
																																																																																							frame.Parent = parent
																																																																																							local instance = Instance.new(v86[128])
																																																																																							instance.BackgroundColor3 = Color3.fromRGB(v86[108], v86[108], 255)
																																																																																							instance.Size = UDim2.fromScale(1, 0)
																																																																																							instance.AutomaticSize = Enum.AutomaticSize.Y
																																																																																							instance.BorderSizePixel = 0
																																																																																							instance.Parent = frame
																																																																																							local uiGradient = Instance.new("UIGradient")
																																																																																							uiGradient.Rotation = 90
																																																																																							v116.bindSurfaceGradient(arg2.Batch, uiGradient, { "GradientMid", v86[70] })
																																																																																							uiGradient.Parent = instance
																																																																																							local uiCorner = Instance.new("UICorner")
																																																																																							uiCorner.CornerRadius = UDim.new(0, 5)
																																																																																							uiCorner.Parent = instance
																																																																																							local uiStroke = Instance.new("UIStroke")
																																																																																							arg2.Batch:Bind(uiStroke, "Color", "Outline")
																																																																																							uiStroke.Parent = instance
																																																																																							local uiListLayout = Instance.new("UIListLayout")
																																																																																							uiListLayout.Padding = UDim.new(v86[186], 1)
																																																																																							uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
																																																																																							uiListLayout.Parent = instance
																																																																																							local uiPadding = Instance.new("UIPadding")
																																																																																							uiPadding.PaddingTop = UDim.new(0, 4)
																																																																																							uiPadding.PaddingBottom = UDim.new(0, v86[26])
																																																																																							uiPadding.PaddingLeft = UDim.new(v86[186], 4)
																																																																																							uiPadding.PaddingRight = UDim.new(0, v86[26])
																																																																																							uiPadding.Parent = instance
																																																																																							local rt = { Root = frame, Rows = {} }
																																																																																							arg._rt = rt

																																																																																							for _, v120 in arg.Items, nil, nil do
																																																																																								rt.Rows[v120] = fn40(arg, v120, instance, arg2)
																																																																																							end

																																																																																							fn38(arg)
																																																																																							return frame
																																																																																						end

																																																																																						index2._New = function(arg, arg2, arg3, arg4)
																																																																																							local tbl18 = {}

																																																																																							for _, v120 in arg4.Items, nil, nil do
																																																																																								if type(v120) == "string" then
																																																																																									table.insert(tbl18, v120)
																																																																																								end
																																																																																							end

																																																																																							local v120

																																																																																							if arg4.Default ~= nil then
																																																																																								v120 = fn36(tbl18, arg4.Default)
																																																																																							else
																																																																																								v120 = table.clone(tbl18)
																																																																																							end

																																																																																							local obj = setmetatable({
																																																																																								_trove = arg3,
																																																																																								_menu = arg,
																																																																																								Kind = "OrderedList",
																																																																																								Row = arg2,
																																																																																								Items = tbl18,
																																																																																								Order = v120,
																																																																																								Value = table.clone(v120),
																																																																																								Changed = arg3:Add(v115.new()),
																																																																																								ValueChanged = arg3:Add(v115.new()),
																																																																																								_onChanged = arg4.OnChanged or function()
																																																																																								end,
																																																																																								_rt = nil,
																																																																																							}, index2)

																																																																																							arg2:AttachRight(function(arg5, arg6)
																																																																																								return createFrame(obj, arg5, arg6)
																																																																																							end, nil, nil, arg3)

																																																																																							return obj
																																																																																						end

																																																																																						index2.Set = function(arg, arg2, arg3)
																																																																																							if type(arg2) ~= "table" then
																																																																																								return
																																																																																							end
																																																																																							arg.Order = fn36(arg.Items, arg2)
																																																																																							fn38(arg)
																																																																																							fn39(arg, arg3)
																																																																																						end

																																																																																						index2.SetItems = function(arg, arg2)
																																																																																							local items = {}

																																																																																							for _, v120 in arg2, nil, nil do
																																																																																								if type(v120) == "string" then
																																																																																									table.insert(items, v120)
																																																																																								end
																																																																																							end

																																																																																							arg.Items = items
																																																																																							arg.Order = fn36(items, arg.Order)
																																																																																							arg.Value = table.clone(arg.Order)
																																																																																							return arg
																																																																																						end

																																																																																						index2.SetLabel = function(arg, arg2)
																																																																																							arg.Row:SetLabel(arg2)
																																																																																							return arg
																																																																																						end

																																																																																						index2.SetTooltip = function(arg, arg2)
																																																																																							arg.Row:SetTooltip(arg2)
																																																																																							return arg
																																																																																						end

																																																																																						index2.SetVisible = function(arg, arg2)
																																																																																							arg.Row:SetVisible(arg2)
																																																																																						end

																																																																																						index2.OnChanged = function(arg, arg2)
																																																																																							arg._trove:Connect(arg.Changed, arg2)
																																																																																							return arg
																																																																																						end

																																																																																						index2.Connect = function(arg, arg2, arg3)
																																																																																							arg._trove:Connect(arg2, arg3)
																																																																																							return arg
																																																																																						end

																																																																																						index2.Destroy = function(arg)
																																																																																							arg._trove:Destroy()
																																																																																						end

																																																																																						return index2
																																																																																					end

																																																																																					tbl17.Y = function()
																																																																																						local y = tbl17.cache.Y

																																																																																						if not y then
																																																																																							local y2 = { c = fn35() }
																																																																																							tbl17.cache.Y = y2
																																																																																							y = y2
																																																																																						end

																																																																																						return y.c
																																																																																					end
																																																																																				end
																																																																																			end

																																																																																			do
																																																																																				do
																																																																																					do
																																																																																						do
																																																																																							local function fn35()
																																																																																								local v115 = tbl17.g()
																																																																																								tbl17.k()
																																																																																								tbl17.r()
																																																																																								local v116 = tbl17.s()
																																																																																								local v117 = tbl17.x()
																																																																																								tbl17.B()
																																																																																								local v118 = tbl17.A()
																																																																																								local v119 = tbl17.w()
																																																																																								local color = Color3.fromRGB(v86[119], 159, 159)
																																																																																								local udim2 = UDim2.fromOffset(153, 150)
																																																																																								local udim22 = UDim2.fromOffset(5, 16)
																																																																																								local index2 = {}
																																																																																								index2.__index = index2

																																																																																								local function fn36(arg)
																																																																																									return arg.Title or arg.Name
																																																																																								end

																																																																																								local function fn37(arg, arg2, selected, arg3)
																																																																																									arg2.Selected = selected
																																																																																									local item = arg2.Item
																																																																																									local defaultAccentPosition = arg2.DefaultAccentPosition
																																																																																									local defaultImageSize = arg2.DefaultImageSize
																																																																																									local selectedPreviewColor, n, n33, n34

																																																																																									if selected then
																																																																																										selectedPreviewColor = item.SelectedPreviewColor or v118.get("TabButtonSelected")
																																																																																										defaultAccentPosition = UDim2.new(0.5, 0, 1, -2)
																																																																																										defaultImageSize = UDim2.new(arg2.DefaultImageSize.X.Scale, arg2.DefaultImageSize.X.Offset + 6, arg2.DefaultImageSize.Y.Scale, arg2.DefaultImageSize.Y.Offset + 6)
																																																						
