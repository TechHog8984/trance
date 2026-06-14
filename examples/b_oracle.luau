game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
game.ReplicatedStorage:WaitForChild("framework_shared")
game.ReplicatedStorage:WaitForChild("frontlines_assets")

do
	local terminal_gui, frontlines_loading_screen, capture_point_tracker

	do
		local frontlines_gui = game.ReplicatedFirst:WaitForChild("frontlines_gui")

		terminal_gui = game.ReplicatedFirst:WaitForChild("terminal_gui")

		local frontlines_screen_effects = game.ReplicatedFirst:WaitForChild("frontlines_screen_effects")
		local capture_point_3d = game.ReplicatedFirst:WaitForChild("capture_point_3d")

		game.ReplicatedFirst:WaitForChild("frontlines_intro")
		frontlines_loading_screen = game.ReplicatedFirst:WaitForChild("frontlines_loading_screen")
		capture_point_tracker = game.ReplicatedFirst:WaitForChild("capture_point_tracker")
		game.Players.LocalPlayer:WaitForChild("PlayerGui")
		frontlines_gui.Parent = game.Players.LocalPlayer.PlayerGui
		frontlines_screen_effects.Parent = game.Players.LocalPlayer.PlayerGui
		capture_point_3d.Parent = game.Players.LocalPlayer.PlayerGui
	end

	terminal_gui.Parent = game.Players.LocalPlayer.PlayerGui
	capture_point_tracker.Parent = game.Players.LocalPlayer.PlayerGui
	frontlines_loading_screen.Parent = game.Players.LocalPlayer.PlayerGui
	wait(8)
	_G.platform_id = "pc"

	if game:GetService("UserInputService").TouchEnabled then
		_G.platform_id = "mobile"
	elseif game:GetService("GuiService"):IsTenFootInterface() then
		_G.platform_id = "console"
	end

	_G.utils = table.create(0)
	_G.globals = table.create(0)
	_G.consts = table.create(0)
	_G.enums = table.create(0)

	local function shared_libs(p1) -- line: 46
		local p1_2 = game.ReplicatedStorage.framework_shared:FindFirstChild(p1, true)

		assert(p1_2 ~= nil, p1)

		return require(p1_2)
	end
	local function local_libs(p2) -- line: 53
		local p2_2 = script.Parent:FindFirstChild(p2, true)

		assert(p2_2 ~= nil, p2)

		return require(p2_2)
	end
	local function init_system(p3) -- line: 60
		local p3_2 = script.Parent:FindFirstChild(p3, true)

		assert(p3_2 ~= nil, p3)
		assert(require(p3_2) == nil, p3)
	end

	_G.utils.lib_util = {
		shared = shared_libs,
		client = local_libs
	}
end

do
	local utils = _G.utils
	local math_utils = game.ReplicatedStorage.framework_shared:FindFirstChild("math_utils", true)

	assert(math_utils ~= nil, "math_utils")
	utils.math_util = require(math_utils)

	local utils2 = _G.utils
	local parametric_move_util = game.ReplicatedStorage.framework_shared:FindFirstChild("parametric_move_util", true)

	assert(parametric_move_util ~= nil, "parametric_move_util")
	utils2.parametric_move_util = require(parametric_move_util)

	local utils3 = _G.utils
	local voxel_util = game.ReplicatedStorage.framework_shared:FindFirstChild("voxel_util", true)

	assert(voxel_util ~= nil, "voxel_util")
	utils3.voxel_util = require(voxel_util)
end

do
	local utils = _G.utils
	local compress_util = game.ReplicatedStorage.framework_shared:FindFirstChild("compress_util", true)

	assert(compress_util ~= nil, "compress_util")
	utils.compress_util = require(compress_util)

	local utils4 = _G.utils
	local keyframe_animation = script.Parent:FindFirstChild("keyframe_animation", true)

	assert(keyframe_animation ~= nil, "keyframe_animation")
	utils4.keyframe_anim_util = require(keyframe_animation)

	local utils5 = _G.utils
	local dynamo = script.Parent:FindFirstChild("dynamo", true)

	assert(dynamo ~= nil, "dynamo")
	utils5.dynamo = require(dynamo)
end

do
	local utils = _G.utils
	local camshake = script.Parent:FindFirstChild("camshake", true)

	assert(camshake ~= nil, "camshake")
	utils.intro_cam_shake = require(camshake)

	local utils6 = _G.utils
	local spring = script.Parent:FindFirstChild("spring", true)

	assert(spring ~= nil, "spring")
	utils6.spring_c = require(spring)

	local utils7 = _G.utils
	local viewport_sizing = script.Parent:FindFirstChild("viewport_sizing", true)

	assert(viewport_sizing ~= nil, "viewport_sizing")
	utils7.viewport_sizing = require(viewport_sizing)
end

do
	local consts = _G.consts
	local general_consts = game.ReplicatedStorage.framework_shared:FindFirstChild("general_consts", true)

	assert(general_consts ~= nil, "general_consts")
	consts.general = require(general_consts)

	local consts2 = _G.consts
	local c_task_priorities = script.Parent:FindFirstChild("c_task_priorities", true)

	assert(c_task_priorities ~= nil, "c_task_priorities")
	consts2.c_prio = require(c_task_priorities)

	local enums = _G.enums
	local sol_operator_enum = game.ReplicatedStorage.framework_shared:FindFirstChild("sol_operator_enum", true)

	assert(sol_operator_enum ~= nil, "sol_operator_enum")
	enums.sol_operator = require(sol_operator_enum)
end

do
	local enums = _G.enums
	local r15_part_enum = game.ReplicatedStorage.framework_shared:FindFirstChild("r15_part_enum", true)

	assert(r15_part_enum ~= nil, "r15_part_enum")
	enums.r15_part = require(r15_part_enum)

	local enum = game.ReplicatedStorage.framework_shared:FindFirstChild("enum", true)

	assert(enum ~= nil, "enum")
	require(enum)

	local client_execution_tree = script.Parent:FindFirstChild("client_execution_tree", true)

	assert(client_execution_tree ~= nil, "client_execution_tree")
	require(client_execution_tree)

	local execution_tree = game.ReplicatedStorage.framework_shared:FindFirstChild("execution_tree", true)

	assert(execution_tree ~= nil, "execution_tree")
	require(execution_tree)
end

do
	local vector_bit = game.ReplicatedStorage.framework_shared:FindFirstChild("vector_bit", true)

	assert(vector_bit ~= nil, "vector_bit")
	require(vector_bit)

	local replay_pkg = game.ReplicatedStorage.framework_shared:FindFirstChild("replay_pkg", true)

	assert(replay_pkg ~= nil, "replay_pkg")
	require(replay_pkg)

	local game_loop_header = game.ReplicatedStorage.framework_shared:FindFirstChild("game_loop_header", true)

	assert(game_loop_header ~= nil, "game_loop_header")
	require(game_loop_header)

	local combat_loop_pkg = game.ReplicatedStorage.framework_shared:FindFirstChild("combat_loop_pkg", true)

	assert(combat_loop_pkg ~= nil, "combat_loop_pkg")
	require(combat_loop_pkg)

	local cli_state_header = game.ReplicatedStorage.framework_shared:FindFirstChild("cli_state_header", true)

	assert(cli_state_header ~= nil, "cli_state_header")
	require(cli_state_header)

	local capture_point_pkg = game.ReplicatedStorage.framework_shared:FindFirstChild("capture_point_pkg", true)

	assert(capture_point_pkg ~= nil, "capture_point_pkg")
	require(capture_point_pkg)
end

do
	local lighting_header = game.ReplicatedStorage.framework_shared:FindFirstChild("lighting_header", true)

	assert(lighting_header ~= nil, "lighting_header")
	require(lighting_header)

	local map_header = game.ReplicatedStorage.framework_shared:FindFirstChild("map_header", true)

	assert(map_header ~= nil, "map_header")
	require(map_header)

	local match_score_header = game.ReplicatedStorage.framework_shared:FindFirstChild("match_score_header", true)

	assert(match_score_header ~= nil, "match_score_header")
	require(match_score_header)

	local match_vote_header = game.ReplicatedStorage.framework_shared:FindFirstChild("match_vote_header", true)

	assert(match_vote_header ~= nil, "match_vote_header")
	require(match_vote_header)

	local match_lead_pkg = script.Parent:FindFirstChild("match_lead_pkg", true)

	assert(match_lead_pkg ~= nil, "match_lead_pkg")
	require(match_lead_pkg)

	local main_menu_header = script.Parent:FindFirstChild("main_menu_header", true)

	assert(main_menu_header ~= nil, "main_menu_header")
	require(main_menu_header)
end

do
	local heli_scene_header = script.Parent:FindFirstChild("heli_scene_header", true)

	assert(heli_scene_header ~= nil, "heli_scene_header")
	require(heli_scene_header)

	local customization_header = script.Parent:FindFirstChild("customization_header", true)

	assert(customization_header ~= nil, "customization_header")
	require(customization_header)

	local sol_state_header = game.ReplicatedStorage.framework_shared:FindFirstChild("sol_state_header", true)

	assert(sol_state_header ~= nil, "sol_state_header")
	require(sol_state_header)

	local sol_state_graph = game.ReplicatedStorage.framework_shared:FindFirstChild("sol_state_graph", true)

	assert(sol_state_graph ~= nil, "sol_state_graph")
	require(sol_state_graph)

	local sol_equipment_specs = game.ReplicatedStorage.framework_shared:FindFirstChild("sol_equipment_specs", true)

	assert(sol_equipment_specs ~= nil, "sol_equipment_specs")
	require(sol_equipment_specs)

	local arsenal = game.ReplicatedStorage.framework_shared:FindFirstChild("arsenal", true)

	assert(arsenal ~= nil, "arsenal")
	require(arsenal)
end

do
	local arsenal_data = game.ReplicatedStorage.framework_shared:FindFirstChild("arsenal_data", true)

	assert(arsenal_data ~= nil, "arsenal_data")
	require(arsenal_data)

	local tpv_sol_death_sequence = script.Parent:FindFirstChild("tpv_sol_death_sequence", true)

	assert(tpv_sol_death_sequence ~= nil, "tpv_sol_death_sequence")
	require(tpv_sol_death_sequence)

	local user_interface = script.Parent:FindFirstChild("user_interface", true)

	assert(user_interface ~= nil, "user_interface")
	require(user_interface)

	local environment_zone_header = game.ReplicatedStorage.framework_shared:FindFirstChild("environment_zone_header", true)

	assert(environment_zone_header ~= nil, "environment_zone_header")
	require(environment_zone_header)

	local equipment_slot_header = game.ReplicatedStorage.framework_shared:FindFirstChild("equipment_slot_header", true)

	assert(equipment_slot_header ~= nil, "equipment_slot_header")
	require(equipment_slot_header)

	local sol_loadout_header = game.ReplicatedStorage.framework_shared:FindFirstChild("sol_loadout_header", true)

	assert(sol_loadout_header ~= nil, "sol_loadout_header")
	require(sol_loadout_header)
end

do
	local soldier_loadout_header = game.ReplicatedStorage.framework_shared:FindFirstChild("soldier_loadout_header", true)

	assert(soldier_loadout_header ~= nil, "soldier_loadout_header")
	require(soldier_loadout_header)

	local user_progression_header = game.ReplicatedStorage.framework_shared:FindFirstChild("user_progression_header", true)

	assert(user_progression_header ~= nil, "user_progression_header")
	require(user_progression_header)

	local user_inventory_header = game.ReplicatedStorage.framework_shared:FindFirstChild("user_inventory_header", true)

	assert(user_inventory_header ~= nil, "user_inventory_header")
	require(user_inventory_header)

	local user_mission_header = game.ReplicatedStorage.framework_shared:FindFirstChild("user_mission_header", true)

	assert(user_mission_header ~= nil, "user_mission_header")
	require(user_mission_header)

	local arsenal_inventory_header = game.ReplicatedStorage.framework_shared:FindFirstChild("arsenal_inventory_header", true)

	assert(arsenal_inventory_header ~= nil, "arsenal_inventory_header")
	require(arsenal_inventory_header)

	local store_header = game.ReplicatedStorage.framework_shared:FindFirstChild("store_header", true)

	assert(store_header ~= nil, "store_header")
	require(store_header)
end

do
	local global_leaderboard_header = game.ReplicatedStorage.framework_shared:FindFirstChild("global_leaderboard_header", true)

	assert(global_leaderboard_header ~= nil, "global_leaderboard_header")
	require(global_leaderboard_header)

	local guild_header = game.ReplicatedStorage.framework_shared:FindFirstChild("guild_header", true)

	assert(guild_header ~= nil, "guild_header")
	require(guild_header)

	local calling_card_header = game.ReplicatedStorage.framework_shared:FindFirstChild("calling_card_header", true)

	assert(calling_card_header ~= nil, "calling_card_header")
	require(calling_card_header)

	local user_settings_header = game.ReplicatedStorage.framework_shared:FindFirstChild("user_settings_header", true)

	assert(user_settings_header ~= nil, "user_settings_header")
	require(user_settings_header)

	local skills_header = game.ReplicatedStorage.framework_shared:FindFirstChild("skills_header", true)

	assert(skills_header ~= nil, "skills_header")
	require(skills_header)

	local soldier_voicelines_header = game.ReplicatedStorage.framework_shared:FindFirstChild("soldier_voicelines_header", true)

	assert(soldier_voicelines_header ~= nil, "soldier_voicelines_header")
	require(soldier_voicelines_header)
end

do
	local match_outcome_header = game.ReplicatedStorage.framework_shared:FindFirstChild("match_outcome_header", true)

	assert(match_outcome_header ~= nil, "match_outcome_header")
	require(match_outcome_header)

	local rush_header = game.ReplicatedStorage.framework_shared:FindFirstChild("rush_header", true)

	assert(rush_header ~= nil, "rush_header")
	require(rush_header)

	local social_media_header = game.ReplicatedStorage.framework_shared:FindFirstChild("social_media_header", true)

	assert(social_media_header ~= nil, "social_media_header")
	require(social_media_header)

	local inverse_kinematics = game.ReplicatedStorage.framework_shared:FindFirstChild("inverse_kinematics", true)

	assert(inverse_kinematics ~= nil, "inverse_kinematics")
	require(inverse_kinematics)

	local arsenal_model_header = game.ReplicatedStorage.framework_shared:FindFirstChild("arsenal_model_header", true)

	assert(arsenal_model_header ~= nil, "arsenal_model_header")
	require(arsenal_model_header)

	local fpv_frontlines_animation = script.Parent:FindFirstChild("fpv_frontlines_animation", true)

	assert(fpv_frontlines_animation ~= nil, "fpv_frontlines_animation")
	require(fpv_frontlines_animation)
end

do
	local lib

	do
		local tpv_frontlines_animation = game.ReplicatedStorage.framework_shared:FindFirstChild("tpv_frontlines_animation", true)

		assert(tpv_frontlines_animation ~= nil, "tpv_frontlines_animation")
		require(tpv_frontlines_animation)

		local sol_equipment_specs = game.ReplicatedStorage.framework_shared:FindFirstChild("sol_equipment_specs", true)

		assert(sol_equipment_specs ~= nil, "sol_equipment_specs")
		require(sol_equipment_specs)

		local sol_movement_dir = game.ReplicatedStorage.framework_shared:FindFirstChild("sol_movement_dir", true)

		assert(sol_movement_dir ~= nil, "sol_movement_dir")
		require(sol_movement_dir)

		local trailer_team_header = game.ReplicatedStorage.framework_shared:FindFirstChild("trailer_team_header", true)

		assert(trailer_team_header ~= nil, "trailer_team_header")
		require(trailer_team_header)

		local squads_header = game.ReplicatedStorage.framework_shared:FindFirstChild("squads_header", true)

		assert(squads_header ~= nil, "squads_header")
		require(squads_header)

		local network = game.ReplicatedStorage.framework_shared:FindFirstChild("network", true)

		assert(network ~= nil, "network")
		lib = require(network)
	end

	local network_buffer = game.ReplicatedStorage.framework_shared:FindFirstChild("network_buffer", true)

	assert(network_buffer ~= nil, "network_buffer")
	require(network_buffer)

	local network_pull = game.ReplicatedStorage.framework_shared:FindFirstChild("network_pull", true)

	assert(network_pull ~= nil, "network_pull")
	require(network_pull)

	local network_messages = game.ReplicatedStorage.framework_shared:FindFirstChild("network_messages", true)

	assert(network_messages ~= nil, "network_messages")
	require(network_messages)
	_G.utils.net_msg_util = lib.net_msg_util
	_G.globals.null_net_msg_state = _G.utils.net_msg_util.net_msg_state()
	_G.globals.combat_net_msg_state = _G.utils.net_msg_util.net_msg_state()
	_G.consts.net_fmts = lib.net_fmts
	_G.consts.net_fmt_len = lib.net_fmt_len
	_G.consts.s_net_msg_fmts = lib.s_net_msg_fmts
	_G.consts.s_net_msg_lens = lib.s_net_msg_lens
	_G.consts.c_net_msg_fmts = lib.c_net_msg_fmts
	_G.consts.c_net_msg_lens = lib.c_net_msg_lens
	_G.enums.net_str = lib.net_str_enum
	_G.enums.s_net_msg = lib.s_net_msg_enum
	_G.enums.c_net_msg = lib.c_net_msg_enum
	_G.globals.optics_catalog = {
		holographic = {
			"507k_sight",
			"m21_sight",
			"sro_sight",
			"lco_sight",
			"romeo3xl_sight",
			"mrs_sight",
			"exps_sight",
			"mars_sight",
			"rds_sight"
		},
		culled = {
			"mrx1x25_sight",
			"axis_4x32_sight"
		},
		sniper = { "sniper_sight" }
	}
	_G.globals.aim_assist_state = {
		on = false
	}
	_G.globals.user_inventory = table.create(0)
	_G.globals.user_settings = table.clone(_G.default_user_settings)
	_G.globals.user_statistics = table.create(0)
	_G.globals.user_skills = table.create(0)
	_G.globals.client_skills = table.create(_G.PLAYER_COUNT)
	_G.globals.loadout_skills = table.create(_G.MAX_SOLDIER_LOADOUTS)

	for i = 1, _G.MAX_SOLDIER_LOADOUTS do
		_G.globals.loadout_skills[i] = table.clone(_G.default_skills)
	end

	for i = 1, _G.PLAYER_COUNT do
		_G.globals.client_skills[i] = table.create(0)
	end

	_G.globals.client_squads = table.create(_G.PLAYER_COUNT, 0)
	_G.globals.store_item_buttons = table.create(0)
	_G.globals.spare_magazine_joints = table.create(255)
	_G.globals.game_loop_state = {
		state = 0,
		state_tick = 0
	}
	_G.globals.match_tuple = {
		gamemode = 1,
		map = 1,
		map_condition = 1
	}
	_G.globals.match_outcome = {
		outcome = 0
	}
	_G.globals.match_mutual_kills = table.create(_G.PLAYER_COUNT, 0)
	_G.globals.match_mutual_deaths = table.create(_G.PLAYER_COUNT, 0)
	_G.globals.client_calling_cards = table.create(_G.PLAYER_COUNT + 1, 0)
	_G.globals.capture_points_personally_occupied = table.create(_G.enum_size(_G.capture_point), false)
	_G.globals.soldier_hitbox_hash = table.create(0)
	_G.globals.soldier_hitbox_id_hash = table.create(0)
	_G.globals.soldier_hitbox_welds = table.create(_G.PLAYER_COUNT)

	for i = 1, _G.PLAYER_COUNT do
		_G.globals.soldier_hitbox_welds[i] = table.create(_G.enum_size(_G.tpv_sol_joint_t))
	end

	_G.globals.clients_initialized = table.create(_G.PLAYER_COUNT, false)
	_G.globals.cli_names = table.create(_G.PLAYER_COUNT, "")
	_G.globals.cli_teams = table.create(_G.PLAYER_COUNT, 0)
	_G.globals.sol_teams = table.create(_G.PLAYER_COUNT, 0)
	_G.globals.cli_state = {
		state = 0,
		id = 0,
		fpv_sol_id = 0
	}
	_G.globals.cli_kills = table.create(_G.PLAYER_COUNT, 0)
	_G.globals.cli_deaths = table.create(_G.PLAYER_COUNT, 0)
	_G.globals.cli_id_alloc = {
		x = 0,
		m = _G.PLAYER_COUNT + 1,
		b = 0
	}
	_G.utils.cli_id_alloc = {
		alloc_cli_id = function(p4) -- line: 337
			local v367 = p4.m * p4.x + p4.b

			p4.x = p4.x + 1

			return v367
		end
	}
	_G.globals.match_scores = table.create(2, 0)
	_G.globals.cli_match_scores = table.create(_G.PLAYER_COUNT, 0)
	_G.globals.cli_match_kills = table.create(_G.PLAYER_COUNT, 0)
	_G.globals.cli_match_deaths = table.create(_G.PLAYER_COUNT, 0)
	_G.globals.clock_state = {
		client_tick = 0,
		server_tick = 0
	}
	_G.consts.cam_dfts = {
		SOL_SENSITIVITY = 0.2,
		SPECTATE_SENSITIVITY = 0.1,
		SCENE_FOV = 70,
		SOL_FOV = 75,
		SPECTATE_FOV = 75
	}
	_G.globals.projectile_hash = table.create(0)
	_G.globals.customization_subgraphs = table.create(0)
	_G.globals.customization_models = table.create(0)
	_G.globals.customization_vertex_models = table.create(0)
	_G.globals.customization_vertex_cframes = table.create(0)
	_G.globals.loadout_viewports = table.create(0)
	_G.globals.vertex_gui_objects = table.create(0)
	_G.globals.vertex_buttons = table.create(0)
	_G.globals.vertex_type_buttons = table.create(_G.arsenal_vertex_type_count)
	_G.globals.loadout_state = {
		loadout_id = 1
	}
	_G.globals.customization_selector_fx = Instance.new("Highlight")
	_G.globals.customization_selector_fx.FillColor = Color3.fromRGB(255, 255, 255)
	_G.globals.customization_selector_fx.FillTransparency = 1
	_G.globals.customization_model_selected = false
	_G.globals.ctrl_states = {
		mv_fw = false,
		mv_bw = false,
		mv_rt = false,
		mv_lt = false,
		mv_up = false,
		mv_dn = false,
		hold_accel = false,
		hold_deccel = false,
		hold_crouch = false,
		hold_jump = false,
		trigger = false,
		gamepad_trigger = false,
		fire = false,
		hold_reload = false,
		hold_melee_attack = false,
		hold_melee_throw = false,
		hold_lethal = false,
		hold_tac = false,
		hold_ads = false,
		hold_ads_aux = false,
		hold_interact = false
	}
	_G.globals.ctrl_ts = {
		press_accel = 0,
		press_accel_prev = 0,
		press_crouch = 0,
		press_jump = 0,
		press_primary = 0,
		press_secondary = 0,
		press_melee = 0,
		trigger = 0,
		press_reload = 0,
		press_melee_attack = 0,
		melee_attack = 0,
		melee_throw = 0,
		press_lethal = 0,
		press_tac = 0,
		press_ads = 0,
		press_interact = 0,
		mv_fw = 0,
		mv_bw = 0,
		mv_rt = 0,
		mv_lt = 0
	}
	_G.globals.broad_environment_cfs = {}
	_G.globals.broad_environment_sizes = {}
	_G.globals.broad_environment_zones = {}
	_G.globals.narrow_environment_cfs = {}
	_G.globals.narrow_environment_sizes = {}
	_G.globals.soldiers_alive = table.create(_G.PLAYER_COUNT, false)
	_G.globals.soldiers_spawned = table.create(_G.PLAYER_COUNT, false)
	_G.globals.soldiers_ragdolling = table.create(_G.PLAYER_COUNT, false)
	_G.globals.sol_anim_cull_indices = table.create(_G.PLAYER_COUNT, 0)
	_G.globals.soldiers_unculled = table.create(_G.PLAYER_COUNT, true)
	_G.globals.soldier_joints = table.create(_G.PLAYER_COUNT)
	_G.globals.ragdoll_joint_cframes = table.create(_G.PLAYER_COUNT)

	for i = 1, _G.PLAYER_COUNT do
		_G.globals.soldier_joints[i] = table.create(_G.enum_size(_G.tpv_sol_joint_t))
		_G.globals.ragdoll_joint_cframes[i] = table.create(_G.enum_size(_G.tpv_sol_joint_t), CFrame.new())
	end

	local t1 = table.create(_G.PLAYER_COUNT, 0)
	local t2 = table.create(_G.PLAYER_COUNT, 0)

	table.create(_G.PLAYER_COUNT)
	table.create(_G.PLAYER_COUNT)
	table.create(_G.PLAYER_COUNT)
	_G.globals.sol_zones = table.create(_G.PLAYER_COUNT, _G.environment_zone.OUTDOORS)
	_G.globals.sol_zone_classes = table.create(_G.PLAYER_COUNT, _G.environment_zone_class.OUTDOOR_SPACE)
	_G.globals.gbl_sol_healths = table.create(_G.PLAYER_COUNT, 0)
	_G.globals.gbl_sol_death_dirs = t1
	_G.globals.gbl_sol_state = {
		tpv_dirs = t2
	}
end

_G.globals.fpv_sol_state = _G.alloc_sol_state()
_G.globals.fpv_sol_state_clocks = _G.alloc_sol_state()
_G.globals.sol_states = table.create(_G.PLAYER_COUNT)
_G.globals.sol_net_states = table.create(_G.PLAYER_COUNT)
_G.globals.sol_death_states = table.create(_G.PLAYER_COUNT)
_G.globals.sol_state_clocks = table.create(_G.PLAYER_COUNT)

for i = 1, _G.PLAYER_COUNT do
	_G.globals.sol_states[i] = _G.alloc_sol_state()
	_G.globals.sol_net_states[i] = _G.alloc_sol_state()
	_G.globals.sol_death_states[i] = _G.alloc_sol_state()
	_G.globals.sol_state_clocks[i] = _G.alloc_sol_state()
end

_G.globals.fpv_sol_walk_animation = {
	t = 0
}

do
	local clone = game.ReplicatedStorage.frontlines_assets.soldier_model:Clone()

	_G.globals.soldier_models = table.create(_G.PLAYER_COUNT)
	_G.globals.sol_root_parts = table.create(_G.PLAYER_COUNT)

	for i = 1, _G.PLAYER_COUNT do
		local clone2 = clone:Clone()

		_G.globals.soldier_models[i] = clone2
		_G.globals.sol_root_parts[i] = clone2.PrimaryPart
	end

	_G.globals.sol_floor_instances = table.create(_G.PLAYER_COUNT)
	_G.globals.sol_floor_normals = table.create(_G.PLAYER_COUNT, (Vector3.new(0, 1, 0)))
	_G.globals.sol_floor_materials = table.create(_G.PLAYER_COUNT, Enum.Material.Plastic)
	_G.globals.sol_positions = table.create(_G.PLAYER_COUNT, (Vector3.new()))
	_G.globals.sol_linear_velocities = table.create(_G.PLAYER_COUNT, (Vector3.new()))
	_G.globals.sol_attitudes = table.create(_G.PLAYER_COUNT, (Vector3.new()))
	_G.globals.sol_angular_velocities = table.create(_G.PLAYER_COUNT, (Vector3.new()))
	_G.globals.gbl_sol_equipments = table.create(_G.PLAYER_COUNT)
	_G.globals.gbl_sol_coequipments = table.create(_G.PLAYER_COUNT)
	_G.globals.equipments = table.create(255)
	_G.globals.equipment_slots = table.create(255, (Vector3.new()))
	_G.globals.slot_equipments = _G.alloc_slot_equipments(_G.PLAYER_COUNT)
	_G.globals.equipment_drop_ids = table.create(_G.PLAYER_COUNT, 0)
	_G.globals.fpv_equipment_idle_cframes = table.create(255)
	_G.globals.tpv_equipment_idle_cframes = table.create(255)
	_G.globals.fpv_equipment_motor6ds = table.create(255)
	_G.globals.tpv_equipment_motor6ds = table.create(255)
	_G.globals.equipment_joint_c1s = table.create(255, CFrame.new())
	_G.globals.fpv_bool_equipment_anims = table.create(255)
	_G.globals.fpv_interp_equipment_anims = table.create(255)
	_G.globals.fpv_sol_ammo = {
		ammo = 0,
		capacity = 0,
		reserve = 0,
		ammos = table.create(5, 0)
	}
	_G.globals.fpv_sol_inventory = table.create(5)
	_G.globals.fpv_sol_multipliers = {
		movement = 1,
		ads = 1,
		switch = 1,
		reload = 1
	}
	_G.globals.fpv_sol_ads = {
		p = 0,
		fov = 70
	}
	_G.globals.fpv_sol_spread = {
		spread = 0
	}
	_G.globals.fpv_sol_firearm = {
		discharge_time = time(),
		cycle_index = 0
	}

	local jump = game.ReplicatedStorage.FrontlinesConfigurations.SoldierMovement.jump

	_G.globals.fpv_sol_instances = table.create(0)
	_G.globals.fpv_sol_physics = {
		ctrl_moving = false,
		speed = 0,
		velocity = Vector3.new(0, 0, 0)
	}
	_G.globals.fpv_sol_movement = {
		att_x = 0,
		att_y = 0,
		momentum = Vector3.new(),
		momentum_dir = Vector3.new(),
		momentum_norm = 0,
		jump_enter_y = 0,
		curr_obs = nil,
		curr_obs_dist = 0,
		curr_obs_vault_height = 0,
		curr_obs_vaultable = false,
		curr_obs_high_vaultable = false,
		vault_complete = false,
		jump_ammo = jump.max_count.Value
	}
	_G.globals.fpv_sol_recoil = {
		attitude_delta = Vector3.new()
	}
	_G.globals.fpv_sol_equipment = {
		curr_equipment = nil,
		curr_slot = 1
	}
	_G.globals.fpv_sol_pickup = {
		id = 0
	}
	_G.globals.fpv_sol_dir = {
		dir = _G.sol_movement_dir_t.IDLE,
		x = 0,
		z = 0
	}
	_G.globals.fpv_sol_health = {
		health = 0,
		max_health = 100
	}
	_G.consts.fpv_sol_movement = {
		BASE_SPEED = 16,
		MAX_SPEED_DECREASE_ANGLE = 1.5707963267948966,
		MAX_SPEED_DECREASE_BY_ANGLE = 0.2,
		MAX_SPEED_DECREASE_BY_ADS = 0.2,
		MAX_SPEED_CHANGE_BY_INCLINE = 0.5,
		CROUCH_SPEED_MUL = 0.6,
		SPRINT_SPEED_MUL = 1.6875,
		TAC_SPRINT_SPEED_MUL = 2.025,
		MAX_ATT_X = 1.3089969389957472,
		CROUCH_DEPTH = 1.5,
		JUMP_COOLOFF = 0.15,
		JUMP_HEIGHT = 4,
		CONTROLLABLE_JUMP_MOMENTUM = 5,
		MIN_OBS_DIST_FOR_SPRINT = 5,
		TAC_SPRINT_DURATION = 2.5,
		TAC_SPRINT_INPUT_DELAY = 0.25,
		SPRINT_SLIDE_MOMENTUM_0 = 37,
		TAC_SPRINT_SLIDE_MOMENTUM_0 = 42,
		JUMP_SLIDE_MOMENTUM_0 = 37,
		MIN_SLIDE_DURATION = 0.1,
		SLIDE_DEPTH = 1.75,
		MIN_SLIDE_ENTER_MOMENTUM = 24,
		SLIDE_EXIT_MOMENTUM = 12,
		MIN_JUMP_SLIDE_TRANSITION_COS = -0.3420201433256687,
		CONTROLLABLE_SLIDE_MOMENTUM = 10,
		BASE_SLIDE_DECCEL = 0.7,
		MAX_SLIDE_DECCEL_CHANGE_BY_INCLINE = 2,
		MAX_SLIDE_DECCEL_INCREASE_BY_ANGLE = 1,
		MIN_OBS_DIST_FOR_VAULT = 3,
		MAX_OBS_DIST_FOR_VAULT = 6,
		MIN_OBS_HEIGHT_FOR_VAULT = 3,
		MAX_OBS_HEIGHT_FOR_VAULT = 4.8,
		MAX_OBS_HEIGHT_FOR_HIGH_VAULT = 7.1,
		MAX_VAULT_OVER_DIST = 5,
		OBS_RAYCAST_DIST = 10,
		OBS_RAYCAST_HEIGHT = 1
	}
	_G.globals.fpv_sol_joint_trs = table.create(_G.enum_size(_G.fpv_sol_joint_t))

	for i = 1, _G.enum_size(_G.fpv_sol_joint_t) do
		_G.globals.fpv_sol_joint_trs[i] = {
			Vector3.new(),
			1,
			0,
			0,
			0
		}
	end

	local soldier_actor = script.Parent.soldier_actor

	_G.soldier_actors = table.create(_G.PLAYER_COUNT)

	for i = 1, _G.PLAYER_COUNT do
		local clone3 = soldier_actor:Clone()

		_G.soldier_actors[i] = clone3
	end

	soldier_actor:Destroy()
end

_G.sol_state_values = table.create(_G.PLAYER_COUNT)

for i = 1, _G.PLAYER_COUNT do
	_G.sol_state_values[i] = table.create(_G.enum_size(_G.sol_state_class))

	for k, v in pairs(_G.sol_state_class) do
		local IntValue = Instance.new("IntValue")

		IntValue.Name = k
		IntValue.Parent = _G.soldier_actors[i].main.states
		_G.sol_state_values[i][v] = IntValue
	end
end

_G.sol_direction_values = table.create(_G.PLAYER_COUNT)

for i = 1, _G.PLAYER_COUNT do
	_G.sol_direction_values[i] = _G.soldier_actors[i].main.direction
end

_G.sol_animation_values = table.create(_G.PLAYER_COUNT)

for i = 1, _G.PLAYER_COUNT do
	_G.sol_animation_values[i] = table.create(_G.enum_size(_G.tpv_sol_kfs_t))

	for k, v in pairs(_G.tpv_sol_kfs_t) do
		local ObjectValue = Instance.new("ObjectValue")

		ObjectValue.Name = k
		ObjectValue.Parent = _G.soldier_actors[i].main.animations
		_G.sol_animation_values[i][v] = ObjectValue
	end
end

_G.sol_joint_position_values = table.create(_G.PLAYER_COUNT)
_G.sol_joint_qw_values = table.create(_G.PLAYER_COUNT)
_G.sol_joint_qv_values = table.create(_G.PLAYER_COUNT)

for i = 1, _G.PLAYER_COUNT do
	_G.sol_joint_position_values[i] = table.create(_G.enum_size(_G.tpv_sol_joint_t))
	_G.sol_joint_qw_values[i] = table.create(_G.enum_size(_G.tpv_sol_joint_t))
	_G.sol_joint_qv_values[i] = table.create(_G.enum_size(_G.tpv_sol_joint_t))

	for k, v in pairs(_G.tpv_sol_joint_t) do
		local Vector3Value = Instance.new("Vector3Value")
		local NumberValue = Instance.new("NumberValue")
		local Vector3Value2 = Instance.new("Vector3Value")

		Vector3Value.Name = k
		Vector3Value.Parent = _G.soldier_actors[i].main.joint_positions
		NumberValue.Name = k
		NumberValue.Parent = _G.soldier_actors[i].main.joint_qws
		Vector3Value2.Name = k
		Vector3Value2.Parent = _G.soldier_actors[i].main.joint_qvs
		_G.sol_joint_position_values[i][v] = Vector3Value
		_G.sol_joint_qw_values[i][v] = NumberValue
		_G.sol_joint_qv_values[i][v] = Vector3Value2
	end
end

for i = 1, _G.PLAYER_COUNT do
	_G.soldier_actors[i].main.model.Value = _G.globals.soldier_models[i]
end

for _, v in ipairs(_G.soldier_actors) do
	v.Parent = script.Parent
end

do
	local mouse_lock = script.Parent:FindFirstChild("mouse_lock", true)

	assert(mouse_lock ~= nil, "mouse_lock")
	assert(require(mouse_lock) == nil, "mouse_lock")

	local gbl_sol_footstep = script.Parent:FindFirstChild("gbl_sol_footstep", true)

	assert(gbl_sol_footstep ~= nil, "gbl_sol_footstep")
	assert(require(gbl_sol_footstep) == nil, "gbl_sol_footstep")

	local gbl_sol_equipment = script.Parent:FindFirstChild("gbl_sol_equipment", true)

	assert(gbl_sol_equipment ~= nil, "gbl_sol_equipment")
	assert(require(gbl_sol_equipment) == nil, "gbl_sol_equipment")

	local gbl_sol_position = script.Parent:FindFirstChild("gbl_sol_position", true)

	assert(gbl_sol_position ~= nil, "gbl_sol_position")
	assert(require(gbl_sol_position) == nil, "gbl_sol_position")

	local gbl_sol_equipment_sfx = script.Parent:FindFirstChild("gbl_sol_equipment_sfx", true)

	assert(gbl_sol_equipment_sfx ~= nil, "gbl_sol_equipment_sfx")
	assert(require(gbl_sol_equipment_sfx) == nil, "gbl_sol_equipment_sfx")

	local gbl_sol_firearm = script.Parent:FindFirstChild("gbl_sol_firearm", true)

	assert(gbl_sol_firearm ~= nil, "gbl_sol_firearm")
	assert(require(gbl_sol_firearm) == nil, "gbl_sol_firearm")

	local gbl_sol_inventory = script.Parent:FindFirstChild("gbl_sol_inventory", true)

	assert(gbl_sol_inventory ~= nil, "gbl_sol_inventory")
	assert(require(gbl_sol_inventory) == nil, "gbl_sol_inventory")
end

do
	local gbl_sol_direction_core = script.Parent:FindFirstChild("gbl_sol_direction_core", true)

	assert(gbl_sol_direction_core ~= nil, "gbl_sol_direction_core")
	assert(require(gbl_sol_direction_core) == nil, "gbl_sol_direction_core")

	local tpv_sol_direction = script.Parent:FindFirstChild("tpv_sol_direction", true)

	assert(tpv_sol_direction ~= nil, "tpv_sol_direction")
	assert(require(tpv_sol_direction) == nil, "tpv_sol_direction")

	local gbl_sol_tags = script.Parent:FindFirstChild("gbl_sol_tags", true)

	assert(gbl_sol_tags ~= nil, "gbl_sol_tags")
	assert(require(gbl_sol_tags) == nil, "gbl_sol_tags")

	local fpv_sol_equipment_hud = script.Parent:FindFirstChild("fpv_sol_equipment_hud", true)

	assert(fpv_sol_equipment_hud ~= nil, "fpv_sol_equipment_hud")
	assert(require(fpv_sol_equipment_hud) == nil, "fpv_sol_equipment_hud")

	local fpv_sol_joints = script.Parent:FindFirstChild("fpv_sol_joints", true)

	assert(fpv_sol_joints ~= nil, "fpv_sol_joints")
	assert(require(fpv_sol_joints) == nil, "fpv_sol_joints")

	local fpv_sol_keyframe_anims = script.Parent:FindFirstChild("fpv_sol_keyframe_anims", true)

	assert(fpv_sol_keyframe_anims ~= nil, "fpv_sol_keyframe_anims")
	assert(require(fpv_sol_keyframe_anims) == nil, "fpv_sol_keyframe_anims")

	local fpv_sol_spawn = script.Parent:FindFirstChild("fpv_sol_spawn", true)

	assert(fpv_sol_spawn ~= nil, "fpv_sol_spawn")
	assert(require(fpv_sol_spawn) == nil, "fpv_sol_spawn")

	local combat_score_sfx = script.Parent:FindFirstChild("combat_score_sfx", true)

	assert(combat_score_sfx ~= nil, "combat_score_sfx")
	assert(require(combat_score_sfx) == nil, "combat_score_sfx")

	local damage_direction_gui = script.Parent:FindFirstChild("damage_direction_gui", true)

	assert(damage_direction_gui ~= nil, "damage_direction_gui")
	assert(require(damage_direction_gui) == nil, "damage_direction_gui")

	local combat_score_gui = script.Parent:FindFirstChild("combat_score_gui", true)

	assert(combat_score_gui ~= nil, "combat_score_gui")
	assert(require(combat_score_gui) == nil, "combat_score_gui")

	local replay_gui = script.Parent:FindFirstChild("replay_gui", true)

	assert(replay_gui ~= nil, "replay_gui")
	assert(require(replay_gui) == nil, "replay_gui")
end

do
	local hitmarker_gui = script.Parent:FindFirstChild("hitmarker_gui", true)

	assert(hitmarker_gui ~= nil, "hitmarker_gui")
	assert(require(hitmarker_gui) == nil, "hitmarker_gui")

	local compass_gui = script.Parent:FindFirstChild("compass_gui", true)

	assert(compass_gui ~= nil, "compass_gui")
	assert(require(compass_gui) == nil, "compass_gui")

	local suppression_vignette = script.Parent:FindFirstChild("suppression_vignette", true)

	assert(suppression_vignette ~= nil, "suppression_vignette")
	assert(require(suppression_vignette) == nil, "suppression_vignette")

	local fpv_sol_death_blur = script.Parent:FindFirstChild("fpv_sol_death_blur", true)

	assert(fpv_sol_death_blur ~= nil, "fpv_sol_death_blur")
	assert(require(fpv_sol_death_blur) == nil, "fpv_sol_death_blur")

	local fpv_sol_damage_sfx = script.Parent:FindFirstChild("fpv_sol_damage_sfx", true)

	assert(fpv_sol_damage_sfx ~= nil, "fpv_sol_damage_sfx")
	assert(require(fpv_sol_damage_sfx) == nil, "fpv_sol_damage_sfx")

	local fpv_sol_death_sfx = script.Parent:FindFirstChild("fpv_sol_death_sfx", true)

	assert(fpv_sol_death_sfx ~= nil, "fpv_sol_death_sfx")
	assert(require(fpv_sol_death_sfx) == nil, "fpv_sol_death_sfx")

	local fpv_sol_health_sfx = script.Parent:FindFirstChild("fpv_sol_health_sfx", true)

	assert(fpv_sol_health_sfx ~= nil, "fpv_sol_health_sfx")
	assert(require(fpv_sol_health_sfx) == nil, "fpv_sol_health_sfx")

	local fpv_sol_ammo_pickup_sfx = script.Parent:FindFirstChild("fpv_sol_ammo_pickup_sfx", true)

	assert(fpv_sol_ammo_pickup_sfx ~= nil, "fpv_sol_ammo_pickup_sfx")
	assert(require(fpv_sol_ammo_pickup_sfx) == nil, "fpv_sol_ammo_pickup_sfx")

	local fpv_sol_ammo_pickup_gui = script.Parent:FindFirstChild("fpv_sol_ammo_pickup_gui", true)

	assert(fpv_sol_ammo_pickup_gui ~= nil, "fpv_sol_ammo_pickup_gui")
	assert(require(fpv_sol_ammo_pickup_gui) == nil, "fpv_sol_ammo_pickup_gui")

	local fpv_sol_shell_ejection = script.Parent:FindFirstChild("fpv_sol_shell_ejection", true)

	assert(fpv_sol_shell_ejection ~= nil, "fpv_sol_shell_ejection")
	assert(require(fpv_sol_shell_ejection) == nil, "fpv_sol_shell_ejection")

	local impact_composite_effects = script.Parent:FindFirstChild("impact_composite_effects", true)

	assert(impact_composite_effects ~= nil, "impact_composite_effects")
	assert(require(impact_composite_effects) == nil, "impact_composite_effects")
end

do
	local payload_composite_effects = script.Parent:FindFirstChild("payload_composite_effects", true)

	assert(payload_composite_effects ~= nil, "payload_composite_effects")
	assert(require(payload_composite_effects) == nil, "payload_composite_effects")

	local bullet_sfx = script.Parent:FindFirstChild("bullet_sfx", true)

	assert(bullet_sfx ~= nil, "bullet_sfx")
	assert(require(bullet_sfx) == nil, "bullet_sfx")

	local bullet_core = script.Parent:FindFirstChild("bullet_core", true)

	assert(bullet_core ~= nil, "bullet_core")
	assert(require(bullet_core) == nil, "bullet_core")

	local gbl_sol_health = script.Parent:FindFirstChild("gbl_sol_health", true)

	assert(gbl_sol_health ~= nil, "gbl_sol_health")
	assert(require(gbl_sol_health) == nil, "gbl_sol_health")

	local fpv_sol_health = script.Parent:FindFirstChild("fpv_sol_health", true)

	assert(fpv_sol_health ~= nil, "fpv_sol_health")
	assert(require(fpv_sol_health) == nil, "fpv_sol_health")

	local fpv_sol_physics_read = script.Parent:FindFirstChild("fpv_sol_physics_read", true)

	assert(fpv_sol_physics_read ~= nil, "fpv_sol_physics_read")
	assert(require(fpv_sol_physics_read) == nil, "fpv_sol_physics_read")

	local fpv_sol_control = script.Parent:FindFirstChild("fpv_sol_control", true)

	assert(fpv_sol_control ~= nil, "fpv_sol_control")
	assert(require(fpv_sol_control) == nil, "fpv_sol_control")

	local tpv_sol_gui = script.Parent:FindFirstChild("tpv_sol_gui", true)

	assert(tpv_sol_gui ~= nil, "tpv_sol_gui")
	assert(require(tpv_sol_gui) == nil, "tpv_sol_gui")

	local tpv_sol_spawn = script.Parent:FindFirstChild("tpv_sol_spawn", true)

	assert(tpv_sol_spawn ~= nil, "tpv_sol_spawn")
	assert(require(tpv_sol_spawn) == nil, "tpv_sol_spawn")

	local tpv_sol_state = script.Parent:FindFirstChild("tpv_sol_state", true)

	assert(tpv_sol_state ~= nil, "tpv_sol_state")
	assert(require(tpv_sol_state) == nil, "tpv_sol_state")

	local tpv_sol_joints = script.Parent:FindFirstChild("tpv_sol_joints", true)

	assert(tpv_sol_joints ~= nil, "tpv_sol_joints")
	assert(require(tpv_sol_joints) == nil, "tpv_sol_joints")
end

do
	local tpv_sol_inventory = script.Parent:FindFirstChild("tpv_sol_inventory", true)

	assert(tpv_sol_inventory ~= nil, "tpv_sol_inventory")
	assert(require(tpv_sol_inventory) == nil, "tpv_sol_inventory")

	local tpv_sol_firearm = script.Parent:FindFirstChild("tpv_sol_firearm", true)

	assert(tpv_sol_firearm ~= nil, "tpv_sol_firearm")
	assert(require(tpv_sol_firearm) == nil, "tpv_sol_firearm")

	local gbl_sol_movement_sfx = script.Parent:FindFirstChild("gbl_sol_movement_sfx", true)

	assert(gbl_sol_movement_sfx ~= nil, "gbl_sol_movement_sfx")
	assert(require(gbl_sol_movement_sfx) == nil, "gbl_sol_movement_sfx")

	local environment_destruction = script.Parent:FindFirstChild("environment_destruction", true)

	assert(environment_destruction ~= nil, "environment_destruction")
	assert(require(environment_destruction) == nil, "environment_destruction")

	local killcam_control = script.Parent:FindFirstChild("killcam_control", true)

	assert(killcam_control ~= nil, "killcam_control")
	assert(require(killcam_control) == nil, "killcam_control")

	local fpv_sol_pickup = script.Parent:FindFirstChild("fpv_sol_pickup", true)

	assert(fpv_sol_pickup ~= nil, "fpv_sol_pickup")
	assert(require(fpv_sol_pickup) == nil, "fpv_sol_pickup")

	local fpv_sol_ads = script.Parent:FindFirstChild("fpv_sol_ads", true)

	assert(fpv_sol_ads ~= nil, "fpv_sol_ads")
	assert(require(fpv_sol_ads) == nil, "fpv_sol_ads")

	local fpv_sol_ammo = script.Parent:FindFirstChild("fpv_sol_ammo", true)

	assert(fpv_sol_ammo ~= nil, "fpv_sol_ammo")
	assert(require(fpv_sol_ammo) == nil, "fpv_sol_ammo")

	local fpv_sol_ammo_pickup = script.Parent:FindFirstChild("fpv_sol_ammo_pickup", true)

	assert(fpv_sol_ammo_pickup ~= nil, "fpv_sol_ammo_pickup")
	assert(require(fpv_sol_ammo_pickup) == nil, "fpv_sol_ammo_pickup")

	local fpv_sol_direction_core = script.Parent:FindFirstChild("fpv_sol_direction_core", true)

	assert(fpv_sol_direction_core ~= nil, "fpv_sol_direction_core")
	assert(require(fpv_sol_direction_core) == nil, "fpv_sol_direction_core")

	local fpv_sol_equipment = script.Parent:FindFirstChild("fpv_sol_equipment", true)

	assert(fpv_sol_equipment ~= nil, "fpv_sol_equipment")
	assert(require(fpv_sol_equipment) == nil, "fpv_sol_equipment")
end

do
	local fpv_sol_cycle_mode = script.Parent:FindFirstChild("fpv_sol_cycle_mode", true)

	assert(fpv_sol_cycle_mode ~= nil, "fpv_sol_cycle_mode")
	assert(require(fpv_sol_cycle_mode) == nil, "fpv_sol_cycle_mode")

	local fpv_sol_firearm_prime = script.Parent:FindFirstChild("fpv_sol_firearm_prime", true)

	assert(fpv_sol_firearm_prime ~= nil, "fpv_sol_firearm_prime")
	assert(require(fpv_sol_firearm_prime) == nil, "fpv_sol_firearm_prime")

	local fpv_sol_firearm_spread = script.Parent:FindFirstChild("fpv_sol_firearm_spread", true)

	assert(fpv_sol_firearm_spread ~= nil, "fpv_sol_firearm_spread")
	assert(require(fpv_sol_firearm_spread) == nil, "fpv_sol_firearm_spread")

	local fpv_sol_firearm_bullet = script.Parent:FindFirstChild("fpv_sol_firearm_bullet", true)

	assert(fpv_sol_firearm_bullet ~= nil, "fpv_sol_firearm_bullet")
	assert(require(fpv_sol_firearm_bullet) == nil, "fpv_sol_firearm_bullet")

	local fpv_sol_inventory = script.Parent:FindFirstChild("fpv_sol_inventory", true)

	assert(fpv_sol_inventory ~= nil, "fpv_sol_inventory")
	assert(require(fpv_sol_inventory) == nil, "fpv_sol_inventory")

	local fpv_sol_melee = script.Parent:FindFirstChild("fpv_sol_melee", true)

	assert(fpv_sol_melee ~= nil, "fpv_sol_melee")
	assert(require(fpv_sol_melee) == nil, "fpv_sol_melee")

	local fpv_sol_state = script.Parent:FindFirstChild("fpv_sol_state", true)

	assert(fpv_sol_state ~= nil, "fpv_sol_state")
	assert(require(fpv_sol_state) == nil, "fpv_sol_state")

	local fpv_sol_throwable = script.Parent:FindFirstChild("fpv_sol_throwable", true)

	assert(fpv_sol_throwable ~= nil, "fpv_sol_throwable")
	assert(require(fpv_sol_throwable) == nil, "fpv_sol_throwable")

	local fpv_sol_crosshair = script.Parent:FindFirstChild("fpv_sol_crosshair", true)

	assert(fpv_sol_crosshair ~= nil, "fpv_sol_crosshair")
	assert(require(fpv_sol_crosshair) == nil, "fpv_sol_crosshair")

	local fpv_sol_movement_core = script.Parent:FindFirstChild("fpv_sol_movement_core", true)

	assert(fpv_sol_movement_core ~= nil, "fpv_sol_movement_core")
	assert(require(fpv_sol_movement_core) == nil, "fpv_sol_movement_core")

	local unrecovered_credits_alert = script.Parent:FindFirstChild("unrecovered_credits_alert", true)

	assert(unrecovered_credits_alert ~= nil, "unrecovered_credits_alert")
	assert(require(unrecovered_credits_alert) == nil, "unrecovered_credits_alert")
end

do
	local aim_sway = script.Parent:FindFirstChild("aim_sway", true)

	assert(aim_sway ~= nil, "aim_sway")
	assert(require(aim_sway) == nil, "aim_sway")

	local move_tilt = script.Parent:FindFirstChild("move_tilt", true)

	assert(move_tilt ~= nil, "move_tilt")
	assert(require(move_tilt) == nil, "move_tilt")

	local cam_shake = script.Parent:FindFirstChild("cam_shake", true)

	assert(cam_shake ~= nil, "cam_shake")
	assert(require(cam_shake) == nil, "cam_shake")

	local fpv_sol_recoil_anim = script.Parent:FindFirstChild("fpv_sol_recoil_anim", true)

	assert(fpv_sol_recoil_anim ~= nil, "fpv_sol_recoil_anim")
	assert(require(fpv_sol_recoil_anim) == nil, "fpv_sol_recoil_anim")

	local fpv_sol_multipliers = script.Parent:FindFirstChild("fpv_sol_multipliers", true)

	assert(fpv_sol_multipliers ~= nil, "fpv_sol_multipliers")
	assert(require(fpv_sol_multipliers) == nil, "fpv_sol_multipliers")

	local fpv_sol_movement = script.Parent:FindFirstChild("fpv_sol_movement", true)

	assert(fpv_sol_movement ~= nil, "fpv_sol_movement")
	assert(require(fpv_sol_movement) == nil, "fpv_sol_movement")

	local fpv_sol_movement_sfx = script.Parent:FindFirstChild("fpv_sol_movement_sfx", true)

	assert(fpv_sol_movement_sfx ~= nil, "fpv_sol_movement_sfx")
	assert(require(fpv_sol_movement_sfx) == nil, "fpv_sol_movement_sfx")

	local gbl_sol_movement = script.Parent:FindFirstChild("gbl_sol_movement", true)

	assert(gbl_sol_movement ~= nil, "gbl_sol_movement")
	assert(require(gbl_sol_movement) == nil, "gbl_sol_movement")

	local combat = script.Parent:FindFirstChild("combat", true)

	assert(combat ~= nil, "combat")
	assert(require(combat) == nil, "combat")

	local soldier_core = script.Parent:FindFirstChild("soldier_core", true)

	assert(soldier_core ~= nil, "soldier_core")
	assert(require(soldier_core) == nil, "soldier_core")

	local soldier_state = script.Parent:FindFirstChild("soldier_state", true)

	assert(soldier_state ~= nil, "soldier_state")
	assert(require(soldier_state) == nil, "soldier_state")
end

do
	local soldier_time_sequence = script.Parent:FindFirstChild("soldier_time_sequence", true)

	assert(soldier_time_sequence ~= nil, "soldier_time_sequence")
	assert(require(soldier_time_sequence) == nil, "soldier_time_sequence")

	local soldier_movement = script.Parent:FindFirstChild("soldier_movement", true)

	assert(soldier_movement ~= nil, "soldier_movement")
	assert(require(soldier_movement) == nil, "soldier_movement")

	local soldier_cframe = script.Parent:FindFirstChild("soldier_cframe", true)

	assert(soldier_cframe ~= nil, "soldier_cframe")
	assert(require(soldier_cframe) == nil, "soldier_cframe")

	local soldier_floor_cast = script.Parent:FindFirstChild("soldier_floor_cast", true)

	assert(soldier_floor_cast ~= nil, "soldier_floor_cast")
	assert(require(soldier_floor_cast) == nil, "soldier_floor_cast")

	local soldier_models = script.Parent:FindFirstChild("soldier_models", true)

	assert(soldier_models ~= nil, "soldier_models")
	assert(require(soldier_models) == nil, "soldier_models")

	local soldier_muzzle_flash = script.Parent:FindFirstChild("soldier_muzzle_flash", true)

	assert(soldier_muzzle_flash ~= nil, "soldier_muzzle_flash")
	assert(require(soldier_muzzle_flash) == nil, "soldier_muzzle_flash")

	local soldier_muzzle_smoke = script.Parent:FindFirstChild("soldier_muzzle_smoke", true)

	assert(soldier_muzzle_smoke ~= nil, "soldier_muzzle_smoke")
	assert(require(soldier_muzzle_smoke) == nil, "soldier_muzzle_smoke")

	local soldier_ejection_smoke = script.Parent:FindFirstChild("soldier_ejection_smoke", true)

	assert(soldier_ejection_smoke ~= nil, "soldier_ejection_smoke")
	assert(require(soldier_ejection_smoke) == nil, "soldier_ejection_smoke")

	local soldier_camera = script.Parent:FindFirstChild("soldier_camera", true)

	assert(soldier_camera ~= nil, "soldier_camera")
	assert(require(soldier_camera) == nil, "soldier_camera")

	local net_ingress = script.Parent:FindFirstChild("net_ingress", true)

	assert(net_ingress ~= nil, "net_ingress")
	assert(require(net_ingress) == nil, "net_ingress")

	local net_egress = script.Parent:FindFirstChild("net_egress", true)

	assert(net_egress ~= nil, "net_egress")
	assert(require(net_egress) == nil, "net_egress")
end

do
	local soldier_replay = script.Parent:FindFirstChild("soldier_replay", true)

	assert(soldier_replay ~= nil, "soldier_replay")
	assert(require(soldier_replay) == nil, "soldier_replay")

	local cli_replay = script.Parent:FindFirstChild("cli_replay", true)

	assert(cli_replay ~= nil, "cli_replay")
	assert(require(cli_replay) == nil, "cli_replay")

	local cli_combat = script.Parent:FindFirstChild("cli_combat", true)

	assert(cli_combat ~= nil, "cli_combat")
	assert(require(cli_combat) == nil, "cli_combat")

	local cli_killcam = script.Parent:FindFirstChild("cli_killcam", true)

	assert(cli_killcam ~= nil, "cli_killcam")
	assert(require(cli_killcam) == nil, "cli_killcam")

	local cli_best_play = script.Parent:FindFirstChild("cli_best_play", true)

	assert(cli_best_play ~= nil, "cli_best_play")
	assert(require(cli_best_play) == nil, "cli_best_play")

	local cli_last_play = script.Parent:FindFirstChild("cli_last_play", true)

	assert(cli_last_play ~= nil, "cli_last_play")
	assert(require(cli_last_play) == nil, "cli_last_play")

	local cli_buffer_killcam = script.Parent:FindFirstChild("cli_buffer_killcam", true)

	assert(cli_buffer_killcam ~= nil, "cli_buffer_killcam")
	assert(require(cli_buffer_killcam) == nil, "cli_buffer_killcam")

	local cli_state = script.Parent:FindFirstChild("cli_state", true)

	assert(cli_state ~= nil, "cli_state")
	assert(require(cli_state) == nil, "cli_state")

	local match_score = script.Parent:FindFirstChild("match_score", true)

	assert(match_score ~= nil, "match_score")
	assert(require(match_score) == nil, "match_score")

	local match_lead = script.Parent:FindFirstChild("match_lead", true)

	assert(match_lead ~= nil, "match_lead")
	assert(require(match_lead) == nil, "match_lead")

	local capture_point = script.Parent:FindFirstChild("capture_point", true)

	assert(capture_point ~= nil, "capture_point")
	assert(require(capture_point) == nil, "capture_point")
end

do
	local team_deathmatch = script.Parent:FindFirstChild("team_deathmatch", true)

	assert(team_deathmatch ~= nil, "team_deathmatch")
	assert(require(team_deathmatch) == nil, "team_deathmatch")

	local domination = script.Parent:FindFirstChild("domination", true)

	assert(domination ~= nil, "domination")
	assert(require(domination) == nil, "domination")

	local king_of_the_hill = script.Parent:FindFirstChild("king_of_the_hill", true)

	assert(king_of_the_hill ~= nil, "king_of_the_hill")
	assert(require(king_of_the_hill) == nil, "king_of_the_hill")

	local kill_confirmed = script.Parent:FindFirstChild("kill_confirmed", true)

	assert(kill_confirmed ~= nil, "kill_confirmed")
	assert(require(kill_confirmed) == nil, "kill_confirmed")

	local game_loop = script.Parent:FindFirstChild("game_loop", true)

	assert(game_loop ~= nil, "game_loop")
	assert(require(game_loop) == nil, "game_loop")

	local customization_state = script.Parent:FindFirstChild("customization_state", true)

	assert(customization_state ~= nil, "customization_state")
	assert(require(customization_state) == nil, "customization_state")

	local customization_loadouts = script.Parent:FindFirstChild("customization_loadouts", true)

	assert(customization_loadouts ~= nil, "customization_loadouts")
	assert(require(customization_loadouts) == nil, "customization_loadouts")

	local customization_models = script.Parent:FindFirstChild("customization_models", true)

	assert(customization_models ~= nil, "customization_models")
	assert(require(customization_models) == nil, "customization_models")

	local main_menu_pings = script.Parent:FindFirstChild("main_menu_pings", true)

	assert(main_menu_pings ~= nil, "main_menu_pings")
	assert(require(main_menu_pings) == nil, "main_menu_pings")

	local match_load_gui = script.Parent:FindFirstChild("match_load_gui", true)

	assert(match_load_gui ~= nil, "match_load_gui")
	assert(require(match_load_gui) == nil, "match_load_gui")

	local match_vote_gui = script.Parent:FindFirstChild("match_vote_gui", true)

	assert(match_vote_gui ~= nil, "match_vote_gui")
	assert(require(match_vote_gui) == nil, "match_vote_gui")
end

do
	local match_status_gui = script.Parent:FindFirstChild("match_status_gui", true)

	assert(match_status_gui ~= nil, "match_status_gui")
	assert(require(match_status_gui) == nil, "match_status_gui")

	local victory_defeat_gui = script.Parent:FindFirstChild("victory_defeat_gui", true)

	assert(victory_defeat_gui ~= nil, "victory_defeat_gui")
	assert(require(victory_defeat_gui) == nil, "victory_defeat_gui")

	local capture_point_gui = script.Parent:FindFirstChild("capture_point_gui", true)

	assert(capture_point_gui ~= nil, "capture_point_gui")
	assert(require(capture_point_gui) == nil, "capture_point_gui")

	local tag_bank_gui = script.Parent:FindFirstChild("tag_bank_gui", true)

	assert(tag_bank_gui ~= nil, "tag_bank_gui")
	assert(require(tag_bank_gui) == nil, "tag_bank_gui")

	local tag_reserves_gui = script.Parent:FindFirstChild("tag_reserves_gui", true)

	assert(tag_reserves_gui ~= nil, "tag_reserves_gui")
	assert(require(tag_reserves_gui) == nil, "tag_reserves_gui")

	local combat_progression_gui = script.Parent:FindFirstChild("combat_progression_gui", true)

	assert(combat_progression_gui ~= nil, "combat_progression_gui")
	assert(require(combat_progression_gui) == nil, "combat_progression_gui")

	local main_menu_navigation = script.Parent:FindFirstChild("main_menu_navigation", true)

	assert(main_menu_navigation ~= nil, "main_menu_navigation")
	assert(require(main_menu_navigation) == nil, "main_menu_navigation")

	local loadout_preview = script.Parent:FindFirstChild("loadout_preview", true)

	assert(loadout_preview ~= nil, "loadout_preview")
	assert(require(loadout_preview) == nil, "loadout_preview")

	local loadout_selector = script.Parent:FindFirstChild("loadout_selector", true)

	assert(loadout_selector ~= nil, "loadout_selector")
	assert(require(loadout_selector) == nil, "loadout_selector")

	local customization_slot_selector = script.Parent:FindFirstChild("customization_slot_selector", true)

	assert(customization_slot_selector ~= nil, "customization_slot_selector")
	assert(require(customization_slot_selector) == nil, "customization_slot_selector")

	local customization_type_selector = script.Parent:FindFirstChild("customization_type_selector", true)

	assert(customization_type_selector ~= nil, "customization_type_selector")
	assert(require(customization_type_selector) == nil, "customization_type_selector")
end

do
	local customization_vertex_selector = script.Parent:FindFirstChild("customization_vertex_selector", true)

	assert(customization_vertex_selector ~= nil, "customization_vertex_selector")
	assert(require(customization_vertex_selector) == nil, "customization_vertex_selector")

	local customization_subgraph_info = script.Parent:FindFirstChild("customization_subgraph_info", true)

	assert(customization_subgraph_info ~= nil, "customization_subgraph_info")
	assert(require(customization_subgraph_info) == nil, "customization_subgraph_info")

	local customization_purchase_elements = script.Parent:FindFirstChild("customization_purchase_elements", true)

	assert(customization_purchase_elements ~= nil, "customization_purchase_elements")
	assert(require(customization_purchase_elements) == nil, "customization_purchase_elements")

	local equip_button = script.Parent:FindFirstChild("equip_button", true)

	assert(equip_button ~= nil, "equip_button")
	assert(require(equip_button) == nil, "equip_button")

	local ui_anims = script.Parent:FindFirstChild("ui_anims", true)

	assert(ui_anims ~= nil, "ui_anims")
	assert(require(ui_anims) == nil, "ui_anims")

	local user_missions_gui = script.Parent:FindFirstChild("user_missions_gui", true)

	assert(user_missions_gui ~= nil, "user_missions_gui")
	assert(require(user_missions_gui) == nil, "user_missions_gui")

	local user_data_gui = script.Parent:FindFirstChild("user_data_gui", true)

	assert(user_data_gui ~= nil, "user_data_gui")
	assert(require(user_data_gui) == nil, "user_data_gui")

	local store_gui = script.Parent:FindFirstChild("store_gui", true)

	assert(store_gui ~= nil, "store_gui")
	assert(require(store_gui) == nil, "store_gui")

	local user_skills_gui = script.Parent:FindFirstChild("user_skills_gui", true)

	assert(user_skills_gui ~= nil, "user_skills_gui")
	assert(require(user_skills_gui) == nil, "user_skills_gui")

	local barracks_gui = script.Parent:FindFirstChild("barracks_gui", true)

	assert(barracks_gui ~= nil, "barracks_gui")
	assert(require(barracks_gui) == nil, "barracks_gui")

	local global_leaderboards_gui = script.Parent:FindFirstChild("global_leaderboards_gui", true)

	assert(global_leaderboards_gui ~= nil, "global_leaderboards_gui")
	assert(require(global_leaderboards_gui) == nil, "global_leaderboards_gui")
end

do
	local user_statistics_gui = script.Parent:FindFirstChild("user_statistics_gui", true)

	assert(user_statistics_gui ~= nil, "user_statistics_gui")
	assert(require(user_statistics_gui) == nil, "user_statistics_gui")

	local calling_card_gui = script.Parent:FindFirstChild("calling_card_gui", true)

	assert(calling_card_gui ~= nil, "calling_card_gui")
	assert(require(calling_card_gui) == nil, "calling_card_gui")

	local user_settings_gui = script.Parent:FindFirstChild("user_settings_gui", true)

	assert(user_settings_gui ~= nil, "user_settings_gui")
	assert(require(user_settings_gui) == nil, "user_settings_gui")

	local match_data_gui = script.Parent:FindFirstChild("match_data_gui", true)

	assert(match_data_gui ~= nil, "match_data_gui")
	assert(require(match_data_gui) == nil, "match_data_gui")

	local main_menu = script.Parent:FindFirstChild("main_menu", true)

	assert(main_menu ~= nil, "main_menu")
	assert(require(main_menu) == nil, "main_menu")

	local sound_groups = script.Parent:FindFirstChild("sound_groups", true)

	assert(sound_groups ~= nil, "sound_groups")
	assert(require(sound_groups) == nil, "sound_groups")

	local auto_manager_equalizer = script.Parent:FindFirstChild("auto_manager_equalizer", true)

	assert(auto_manager_equalizer ~= nil, "auto_manager_equalizer")
	assert(require(auto_manager_equalizer) == nil, "auto_manager_equalizer")

	local environment_sound_group = script.Parent:FindFirstChild("environment_sound_group", true)

	assert(environment_sound_group ~= nil, "environment_sound_group")
	assert(require(environment_sound_group) == nil, "environment_sound_group")

	local shell_ejection_sound = script.Parent:FindFirstChild("shell_ejection_sound", true)

	assert(shell_ejection_sound ~= nil, "shell_ejection_sound")
	assert(require(shell_ejection_sound) == nil, "shell_ejection_sound")

	local fpv_sol_damage_gfx = script.Parent:FindFirstChild("fpv_sol_damage_gfx", true)

	assert(fpv_sol_damage_gfx ~= nil, "fpv_sol_damage_gfx")
	assert(require(fpv_sol_damage_gfx) == nil, "fpv_sol_damage_gfx")

	local dirt_screen_effect = script.Parent:FindFirstChild("dirt_screen_effect", true)

	assert(dirt_screen_effect ~= nil, "dirt_screen_effect")
	assert(require(dirt_screen_effect) == nil, "dirt_screen_effect")
end

do
	local environment_obb_tree = script.Parent:FindFirstChild("environment_obb_tree", true)

	assert(environment_obb_tree ~= nil, "environment_obb_tree")
	assert(require(environment_obb_tree) == nil, "environment_obb_tree")

	local cli_environment_zone = script.Parent:FindFirstChild("cli_environment_zone", true)

	assert(cli_environment_zone ~= nil, "cli_environment_zone")
	assert(require(cli_environment_zone) == nil, "cli_environment_zone")

	local sol_environment_zones = script.Parent:FindFirstChild("sol_environment_zones", true)

	assert(sol_environment_zones ~= nil, "sol_environment_zones")
	assert(require(sol_environment_zones) == nil, "sol_environment_zones")

	local capture_point_sound = script.Parent:FindFirstChild("capture_point_sound", true)

	assert(capture_point_sound ~= nil, "capture_point_sound")
	assert(require(capture_point_sound) == nil, "capture_point_sound")

	local victory_defeat_sound = script.Parent:FindFirstChild("victory_defeat_sound", true)

	assert(victory_defeat_sound ~= nil, "victory_defeat_sound")
	assert(require(victory_defeat_sound) == nil, "victory_defeat_sound")

	local main_menu_music = script.Parent:FindFirstChild("main_menu_music", true)

	assert(main_menu_music ~= nil, "main_menu_music")
	assert(require(main_menu_music) == nil, "main_menu_music")

	local menu_button_sound = script.Parent:FindFirstChild("menu_button_sound", true)

	assert(menu_button_sound ~= nil, "menu_button_sound")
	assert(require(menu_button_sound) == nil, "menu_button_sound")

	local purchase_sound = script.Parent:FindFirstChild("purchase_sound", true)

	assert(purchase_sound ~= nil, "purchase_sound")
	assert(require(purchase_sound) == nil, "purchase_sound")

	local environment_sound = script.Parent:FindFirstChild("environment_sound", true)

	assert(environment_sound ~= nil, "environment_sound")
	assert(require(environment_sound) == nil, "environment_sound")

	local admin_feedback_sound = script.Parent:FindFirstChild("admin_feedback_sound", true)

	assert(admin_feedback_sound ~= nil, "admin_feedback_sound")
	assert(require(admin_feedback_sound) == nil, "admin_feedback_sound")

	local sound_admin = script.Parent:FindFirstChild("sound_admin", true)

	assert(sound_admin ~= nil, "sound_admin")
	assert(require(sound_admin) == nil, "sound_admin")
end

do
	local kill_confirmed_sound = script.Parent:FindFirstChild("kill_confirmed_sound", true)

	assert(kill_confirmed_sound ~= nil, "kill_confirmed_sound")
	assert(require(kill_confirmed_sound) == nil, "kill_confirmed_sound")

	local bullet_impact_sound = script.Parent:FindFirstChild("bullet_impact_sound", true)

	assert(bullet_impact_sound ~= nil, "bullet_impact_sound")
	assert(require(bullet_impact_sound) == nil, "bullet_impact_sound")

	local main_menu_control = script.Parent:FindFirstChild("main_menu_control", true)

	assert(main_menu_control ~= nil, "main_menu_control")
	assert(require(main_menu_control) == nil, "main_menu_control")

	local user_inventory = script.Parent:FindFirstChild("user_inventory", true)

	assert(user_inventory ~= nil, "user_inventory")
	assert(require(user_inventory) == nil, "user_inventory")

	local user_settings = script.Parent:FindFirstChild("user_settings", true)

	assert(user_settings ~= nil, "user_settings")
	assert(require(user_settings) == nil, "user_settings")

	local user_calling_cards = script.Parent:FindFirstChild("user_calling_cards", true)

	assert(user_calling_cards ~= nil, "user_calling_cards")
	assert(require(user_calling_cards) == nil, "user_calling_cards")

	local user_statistics = script.Parent:FindFirstChild("user_statistics", true)

	assert(user_statistics ~= nil, "user_statistics")
	assert(require(user_statistics) == nil, "user_statistics")

	local user_skills = script.Parent:FindFirstChild("user_skills", true)

	assert(user_skills ~= nil, "user_skills")
	assert(require(user_skills) == nil, "user_skills")

	local match_tuple = script.Parent:FindFirstChild("match_tuple", true)

	assert(match_tuple ~= nil, "match_tuple")
	assert(require(match_tuple) == nil, "match_tuple")

	local lighting_configuration = script.Parent:FindFirstChild("lighting_configuration", true)

	assert(lighting_configuration ~= nil, "lighting_configuration")
	assert(require(lighting_configuration) == nil, "lighting_configuration")

	local tag_stack_indicator = script.Parent:FindFirstChild("tag_stack_indicator", true)

	assert(tag_stack_indicator ~= nil, "tag_stack_indicator")
	assert(require(tag_stack_indicator) == nil, "tag_stack_indicator")
end

do
	local user_interface_mode = script.Parent:FindFirstChild("user_interface_mode", true)

	assert(user_interface_mode ~= nil, "user_interface_mode")
	assert(require(user_interface_mode) == nil, "user_interface_mode")

	local bullet_impact_notification = script.Parent:FindFirstChild("bullet_impact_notification", true)

	assert(bullet_impact_notification ~= nil, "bullet_impact_notification")
	assert(require(bullet_impact_notification) == nil, "bullet_impact_notification")

	local survival_instinct_gui = script.Parent:FindFirstChild("survival_instinct_gui", true)

	assert(survival_instinct_gui ~= nil, "survival_instinct_gui")
	assert(require(survival_instinct_gui) == nil, "survival_instinct_gui")

	local stalker_indicator = script.Parent:FindFirstChild("stalker_indicator", true)

	assert(stalker_indicator ~= nil, "stalker_indicator")
	assert(require(stalker_indicator) == nil, "stalker_indicator")

	local gamepad_cursor = script.Parent:FindFirstChild("gamepad_cursor", true)

	assert(gamepad_cursor ~= nil, "gamepad_cursor")
	assert(require(gamepad_cursor) == nil, "gamepad_cursor")

	local aim_assist = script.Parent:FindFirstChild("aim_assist", true)

	assert(aim_assist ~= nil, "aim_assist")
	assert(require(aim_assist) == nil, "aim_assist")

	local haptic_feedback = script.Parent:FindFirstChild("haptic_feedback", true)

	assert(haptic_feedback ~= nil, "haptic_feedback")
	assert(require(haptic_feedback) == nil, "haptic_feedback")

	local mobile_control_gui = script.Parent:FindFirstChild("mobile_control_gui", true)

	assert(mobile_control_gui ~= nil, "mobile_control_gui")
	assert(require(mobile_control_gui) == nil, "mobile_control_gui")

	local match_mutual_score = script.Parent:FindFirstChild("match_mutual_score", true)

	assert(match_mutual_score ~= nil, "match_mutual_score")
	assert(require(match_mutual_score) == nil, "match_mutual_score")

	local new_radar_gui = script.Parent:FindFirstChild("new_radar_gui", true)

	assert(new_radar_gui ~= nil, "new_radar_gui")
	assert(require(new_radar_gui) == nil, "new_radar_gui")

	local socials_credits_gui = script.Parent:FindFirstChild("socials_credits_gui", true)

	assert(socials_credits_gui ~= nil, "socials_credits_gui")
	assert(require(socials_credits_gui) == nil, "socials_credits_gui")
end

do
	local announcer_voicelines = script.Parent:FindFirstChild("announcer_voicelines", true)

	assert(announcer_voicelines ~= nil, "announcer_voicelines")
	assert(require(announcer_voicelines) == nil, "announcer_voicelines")

	local leaderboard_gui = script.Parent:FindFirstChild("leaderboard_gui", true)

	assert(leaderboard_gui ~= nil, "leaderboard_gui")
	assert(require(leaderboard_gui) == nil, "leaderboard_gui")

	local combat_gui_toggle = script.Parent:FindFirstChild("combat_gui_toggle", true)

	assert(combat_gui_toggle ~= nil, "combat_gui_toggle")
	assert(require(combat_gui_toggle) == nil, "combat_gui_toggle")

	local client_state_blur = script.Parent:FindFirstChild("client_state_blur", true)

	assert(client_state_blur ~= nil, "client_state_blur")
	assert(require(client_state_blur) == nil, "client_state_blur")

	local soldier_voicelines = script.Parent:FindFirstChild("soldier_voicelines", true)

	assert(soldier_voicelines ~= nil, "soldier_voicelines")
	assert(require(soldier_voicelines) == nil, "soldier_voicelines")

	local votekick_gui = script.Parent:FindFirstChild("votekick_gui", true)

	assert(votekick_gui ~= nil, "votekick_gui")
	assert(require(votekick_gui) == nil, "votekick_gui")

	local client_skills = script.Parent:FindFirstChild("client_skills", true)

	assert(client_skills ~= nil, "client_skills")
	assert(require(client_skills) == nil, "client_skills")

	local nuclear_warhead = script.Parent:FindFirstChild("nuclear_warhead", true)

	assert(nuclear_warhead ~= nil, "nuclear_warhead")
	assert(require(nuclear_warhead) == nil, "nuclear_warhead")

	local nuclear_explosion = script.Parent:FindFirstChild("nuclear_explosion", true)

	assert(nuclear_explosion ~= nil, "nuclear_explosion")
	assert(require(nuclear_explosion) == nil, "nuclear_explosion")

	local spectate_nuke_camera = script.Parent:FindFirstChild("spectate_nuke_camera", true)

	assert(spectate_nuke_camera ~= nil, "spectate_nuke_camera")
	assert(require(spectate_nuke_camera) == nil, "spectate_nuke_camera")

	local nuke_inbound_gui = script.Parent:FindFirstChild("nuke_inbound_gui", true)

	assert(nuke_inbound_gui ~= nil, "nuke_inbound_gui")
	assert(require(nuke_inbound_gui) == nil, "nuke_inbound_gui")
end

do
	local high_level_gui_visibility = script.Parent:FindFirstChild("high_level_gui_visibility", true)

	assert(high_level_gui_visibility ~= nil, "high_level_gui_visibility")
	assert(require(high_level_gui_visibility) == nil, "high_level_gui_visibility")

	local black_frame_gui = script.Parent:FindFirstChild("black_frame_gui", true)

	assert(black_frame_gui ~= nil, "black_frame_gui")
	assert(require(black_frame_gui) == nil, "black_frame_gui")

	local spare_magazines = script.Parent:FindFirstChild("spare_magazines", true)

	assert(spare_magazines ~= nil, "spare_magazines")
	assert(require(spare_magazines) == nil, "spare_magazines")

	local soldier_hitboxes = script.Parent:FindFirstChild("soldier_hitboxes", true)

	assert(soldier_hitboxes ~= nil, "soldier_hitboxes")
	assert(require(soldier_hitboxes) == nil, "soldier_hitboxes")

	local soldier_ragdoll = script.Parent:FindFirstChild("soldier_ragdoll", true)

	assert(soldier_ragdoll ~= nil, "soldier_ragdoll")
	assert(require(soldier_ragdoll) == nil, "soldier_ragdoll")

	local fpv_sol_jump_animation = script.Parent:FindFirstChild("fpv_sol_jump_animation", true)

	assert(fpv_sol_jump_animation ~= nil, "fpv_sol_jump_animation")
	assert(require(fpv_sol_jump_animation) == nil, "fpv_sol_jump_animation")

	local fpv_sol_walk_animation = script.Parent:FindFirstChild("fpv_sol_walk_animation", true)

	assert(fpv_sol_walk_animation ~= nil, "fpv_sol_walk_animation")
	assert(require(fpv_sol_walk_animation) == nil, "fpv_sol_walk_animation")

	local equipment_joint_data = script.Parent:FindFirstChild("equipment_joint_data", true)

	assert(equipment_joint_data ~= nil, "equipment_joint_data")
	assert(require(equipment_joint_data) == nil, "equipment_joint_data")

	local equipment_animation_data = script.Parent:FindFirstChild("equipment_animation_data", true)

	assert(equipment_animation_data ~= nil, "equipment_animation_data")
	assert(require(equipment_animation_data) == nil, "equipment_animation_data")

	local magazine_bullets = script.Parent:FindFirstChild("magazine_bullets", true)

	assert(magazine_bullets ~= nil, "magazine_bullets")
	assert(require(magazine_bullets) == nil, "magazine_bullets")

	local throwable_core = script.Parent:FindFirstChild("throwable_core", true)

	assert(throwable_core ~= nil, "throwable_core")
	assert(require(throwable_core) == nil, "throwable_core")
end

do
	local soldier_culling = script.Parent:FindFirstChild("soldier_culling", true)

	assert(soldier_culling ~= nil, "soldier_culling")
	assert(require(soldier_culling) == nil, "soldier_culling")

	local voicechat_client = script.Parent:FindFirstChild("voicechat_client", true)

	assert(voicechat_client ~= nil, "voicechat_client")
	assert(require(voicechat_client) == nil, "voicechat_client")

	local main_menu_spawn = script.Parent:FindFirstChild("main_menu_spawn", true)

	assert(main_menu_spawn ~= nil, "main_menu_spawn")
	assert(require(main_menu_spawn) == nil, "main_menu_spawn")

	local razer_chroma = script.Parent:FindFirstChild("razer_chroma", true)

	assert(razer_chroma ~= nil, "razer_chroma")
	assert(require(razer_chroma) == nil, "razer_chroma")

	local weapon_optics = script.Parent:FindFirstChild("weapon_optics", true)

	assert(weapon_optics ~= nil, "weapon_optics")
	assert(require(weapon_optics) == nil, "weapon_optics")

	local fpv_lights = script.Parent:FindFirstChild("fpv_lights", true)

	assert(fpv_lights ~= nil, "fpv_lights")
	assert(require(fpv_lights) == nil, "fpv_lights")

	local fpv_lasers = script.Parent:FindFirstChild("fpv_lasers", true)

	assert(fpv_lasers ~= nil, "fpv_lasers")
	assert(require(fpv_lasers) == nil, "fpv_lasers")

	local tpv_lasers_lights = script.Parent:FindFirstChild("tpv_lasers_lights", true)

	assert(tpv_lasers_lights ~= nil, "tpv_lasers_lights")
	assert(require(tpv_lasers_lights) == nil, "tpv_lasers_lights")

	local main_menu_camera = script.Parent:FindFirstChild("main_menu_camera", true)

	assert(main_menu_camera ~= nil, "main_menu_camera")
	assert(require(main_menu_camera) == nil, "main_menu_camera")

	local main_menu_blur = script.Parent:FindFirstChild("main_menu_blur", true)

	assert(main_menu_blur ~= nil, "main_menu_blur")
	assert(require(main_menu_blur) == nil, "main_menu_blur")

	local squads_client = script.Parent:FindFirstChild("squads_client", true)

	assert(squads_client ~= nil, "squads_client")
	assert(require(squads_client) == nil, "squads_client")
end

do
	local kill_confirmed_rings = script.Parent:FindFirstChild("kill_confirmed_rings", true)

	assert(kill_confirmed_rings ~= nil, "kill_confirmed_rings")
	assert(require(kill_confirmed_rings) == nil, "kill_confirmed_rings")

	local domination_rings = script.Parent:FindFirstChild("domination_rings", true)

	assert(domination_rings ~= nil, "domination_rings")
	assert(require(domination_rings) == nil, "domination_rings")

	local credits_popup = script.Parent:FindFirstChild("credits_popup", true)

	assert(credits_popup ~= nil, "credits_popup")
	assert(require(credits_popup) == nil, "credits_popup")

	local match_scorebar_gui = script.Parent:FindFirstChild("match_scorebar_gui", true)

	assert(match_scorebar_gui ~= nil, "match_scorebar_gui")
	assert(require(match_scorebar_gui) == nil, "match_scorebar_gui")

	local header_animations = script.Parent:FindFirstChild("header_animations", true)

	assert(header_animations ~= nil, "header_animations")
	assert(require(header_animations) == nil, "header_animations")

	local mobile_conversion = script.Parent:FindFirstChild("mobile_conversion", true)

	assert(mobile_conversion ~= nil, "mobile_conversion")
	assert(require(mobile_conversion) == nil, "mobile_conversion")

	local customization_level_progression = script.Parent:FindFirstChild("customization_level_progression", true)

	assert(customization_level_progression ~= nil, "customization_level_progression")
	assert(require(customization_level_progression) == nil, "customization_level_progression")

	if game:GetService("GuiService"):IsTenFootInterface() then
		game.Players.LocalPlayer.PlayerGui.frontlines_gui.ChatFrame.Visible = false
	else
		local chat_gui = script.Parent:FindFirstChild("chat_gui", true)

		assert(chat_gui ~= nil, "chat_gui")
		assert(require(chat_gui) == nil, "chat_gui")
	end

	if game.PlaceId ~= 12736476421 and game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").KeyboardEnabled then
		local mobile_only_server_gui = script.Parent:FindFirstChild("mobile_only_server_gui", true)

		assert(mobile_only_server_gui ~= nil, "mobile_only_server_gui")
		assert(require(mobile_only_server_gui) == nil, "mobile_only_server_gui")
	end

	if _G.trailer_team_users[game.Players.LocalPlayer.UserId] then
		do
			do
				local spectate_match_toggle = script.Parent:FindFirstChild("spectate_match_toggle", true)

				assert(spectate_match_toggle ~= nil, "spectate_match_toggle")
				assert(require(spectate_match_toggle) == nil, "spectate_match_toggle")
			end

			local spectate_match_camera = script.Parent:FindFirstChild("spectate_match_camera", true)

			assert(spectate_match_camera ~= nil, "spectate_match_camera")
			assert(require(spectate_match_camera) == nil, "spectate_match_camera")
		end

		local trailer_settings_gui = script.Parent:FindFirstChild("trailer_settings_gui", true)

		assert(trailer_settings_gui ~= nil, "trailer_settings_gui")
		assert(require(trailer_settings_gui) == nil, "trailer_settings_gui")
	end

	local BindableEvent = Instance.new("BindableEvent")

	BindableEvent.Event:Connect(function() -- line: 1427
		_G.utils.net_msg_util.c_prep_net_msg(_G.globals.null_net_msg_state, _G.enums.c_net_msg.SET_CLI_STATE, _G.cli_state_t.COMBAT_POST_DEATH)
	end)

	for _ = 1, 5 do
		if pcall(game:GetService("StarterGui").SetCore, game:GetService("StarterGui"), "ResetButtonCallback", BindableEvent) then
			break
		end

		wait(1)
	end

	local CmdrClient = require(game.ReplicatedStorage:WaitForChild("CmdrClient"))

	CmdrClient:SetActivationKeys({ Enum.KeyCode.F2 })
	CmdrClient:HandleEvent("set_arsenal_data", function(p5, p6) -- line: 1459
		_G.set_arsenal_data_by_path(p5, p6)
	end)
end

local HB = _G.exe_set_t.HB
local ST = _G.exe_set_t.ST
local NET_INGRESS_STEP = _G.exe_set_t.NET_INGRESS_STEP
local NET_EGRESS_STEP = _G.exe_set_t.NET_EGRESS_STEP
local CLI_STATE_RS = _G.exe_set_t.CLI_STATE_RS
local CLI_STATE_ST_FIRST = _G.exe_set_t.CLI_STATE_ST_FIRST
local CLI_STATE_ST_60_HZ = _G.exe_set_t.CLI_STATE_ST_60_HZ
local CLI_STATE_ST = _G.exe_set_t.CLI_STATE_ST
local CLI_STATE_HB_60_HZ = _G.exe_set_t.CLI_STATE_HB_60_HZ
local clock_state = _G.globals.clock_state
local exe_set = _G.exe_set
local RunService = game:GetService("RunService")
local n1 = 0
local connection = RunService.Heartbeat:Connect(function(_) -- line: 1488
	-- upvalues: n1 (ref), exe_set (copy), HB (copy), CLI_STATE_HB_60_HZ (copy), clock_state (copy), NET_EGRESS_STEP (copy)
	if n1 >= 0.016666666666666666 or math.abs(n1 - 0.016666666666666666) < 0.01 then
		exe_set(HB, n1)
		exe_set(CLI_STATE_HB_60_HZ, clock_state.server_tick, n1)
		exe_set(NET_EGRESS_STEP, clock_state.client_tick, clock_state.server_tick, n1)
		n1 = 0
	end
end)
local connection2 = RunService.Stepped:Connect(function(time2, dt) -- line: 1499
	-- upvalues: n1 (ref), exe_set (copy), CLI_STATE_ST_FIRST (copy), NET_INGRESS_STEP (copy), clock_state (copy), CLI_STATE_ST_60_HZ (copy), CLI_STATE_ST (copy), ST (copy)
	n1 += dt
	exe_set(CLI_STATE_ST_FIRST, time2, dt)

	if n1 >= 0.016666666666666666 or math.abs(n1 - 0.016666666666666666) < 0.01 then
		exe_set(NET_INGRESS_STEP, clock_state.client_tick)
		exe_set(CLI_STATE_ST_60_HZ, time2, n1)

		local v373 = clock_state

		v373.client_tick = v373.client_tick + 1
	end

	exe_set(CLI_STATE_ST, time2, dt)
	exe_set(ST, dt)
end)
local connection3 = RunService.RenderStepped:Connect(function(dt) -- line: 1517
	-- upvalues: exe_set (copy), CLI_STATE_RS (copy)
	exe_set(CLI_STATE_RS, dt)
end)

game:GetService("ScriptContext").Error:Connect(function(_, _, p10) -- line: 1521
	-- upvalues: connection (copy), connection2 (copy), connection3 (copy)
	if p10 == script then
		connection:Disconnect()
		connection2:Disconnect()
		connection3:Disconnect()
	end
end)
_G.utils.net_msg_util.c_prep_net_msg(_G.globals.null_net_msg_state, _G.enums.c_net_msg.SET_CLI_STATE, _G.cli_state_t.PERSISTENT_DATA_LOAD)
print("[client_main]: execution completed")

