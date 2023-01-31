return {
    settings = {
        ['rust-analyzer'] = {
            cargo = {allFeatures = true},
            check = {
                command = {
                    "clippy",
                    "--",
                    "-A",
                    "clippy::uninlined_format_args",
                },
            },
        },
    },
}
