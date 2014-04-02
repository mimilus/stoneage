function stoneage.strike_fire(user, pointed_thing)
			if pointed_thing.type == "node" then
				local n_pointed_above = minetest.env:get_node(pointed_thing.above)
				local n_pointed_under = minetest.env:get_node(pointed_thing.under)

				for _,tinder in ipairs(tinder) do
					if user:get_inventory():get_stack("main", user:get_wield_index()+1):get_name() == tinder then
						user:get_inventory():remove_item("main", tinder)
						if n_pointed_under.name == "stoneage:torch_unlit" then
							n_pointed_under.name = "default:torch"
							minetest.env:add_node(pointed_thing.under, n_pointed_under)
						elseif n_pointed_under.name == "stoneage:bonfire_unlit" then
							minetest.env:add_node(pointed_thing.under, {name="stoneage:bonfire"})
						elseif n_pointed_above.name == "air" then
							minetest.env:add_node(pointed_thing.above, {name="fire:basic_flame"})
						end
					end
				end				
			else
				return
			end
end
