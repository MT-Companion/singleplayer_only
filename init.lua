if not minetest.is_singleplayer() then
	minetest.log("error","[singleplayer_only] This game only supports singleplayer.")
	minetest.log("error","[singleplayer_only] The game will be shut down once the first player joins.")
	minetest.log("error","[singleplayer_only] If this is a mistake, remove `singleplayer_only` from the list of loaded mods.")

	-- Display a kick message instead of a error traceback
	minetest.register_on_prejoinplayer(function(name, ip)
		local msg = "This game only supports singleplayer."

		-- In case the player had somehow joined before
		minetest.remove_player(name)
		minetest.remove_player_auth(name)

		-- In case the server is started from command line
		minetest.after(0,minetest.request_shutdown,msg,false,0)

		-- Deny the player from joining
		return msg
	end)
end
