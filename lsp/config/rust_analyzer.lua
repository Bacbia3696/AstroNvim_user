return {
    settings = {
        ['rust-analyzer'] = {
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
