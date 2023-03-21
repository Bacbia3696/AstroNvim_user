return {
	settings = {
		gopls = {
			codelenses = {
				generate = true,
				gc_details = true,
				upgrade_dependency = true,
				tidy = true,
				vendor = false,
			},
			analyses = {
				unusedparams = true,
				-- composites = false,
				nilness = true,
				unusedwrite = true,
				useany = true,
				unusedvariable = true,
				fieldalignment = false,
				shadow = true,
			},
			-- usePlaceholders = true,
		},
	},
}
