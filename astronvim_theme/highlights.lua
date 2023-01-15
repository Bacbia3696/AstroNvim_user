return function(hl) -- or a function that returns a new table of colors to set
    local C = require "astronvim_theme.colors"
    hl.NeoTreeNormal = {bg = C.bg}
    hl.NeoTreeNormalNC = {bg = C.bg}
    hl.NonText = {fg = C.grey_2, bg = C.none}
    hl.TabLineFill = {bg = C.none}
    hl.TabLineSel = {fg = C.cyan}
    hl.NotifyBackground = {bg = C.bg_1}
    hl.VertSplit = {fg = C.white}
    hl.GitSignsCurrentLineBlame = {fg = C.cyan}
    hl.Visual = {fg = C.none, bg = C.grey_1}
    hl.VisualNOS = {fg = C.grey_1, bg = C.none}
    hl.WinSeparator = {bg = C.none, fg = C.blue}

    hl.DiagnosticUnderlineHint.undercurl = false
    hl.DiagnosticUnderlineHint.italic = true
    hl.DiagnosticUnderlineWarn.undercurl = false
    hl.DiagnosticHint = {fg = C.cyan_1}

    hl.LspReferenceText = {fg = C.none, bg = C.grey_7}
    hl.LspReferenceRead = {fg = C.none, bg = C.grey_7}
    hl.LspReferenceWrite = {fg = C.none, bg = C.grey_7}
    hl.LspSignatureActiveParameter = {bg = C.grey_1}

    hl.TSStrong = {fg = C.fg}
    hl.TSStrong.bold = true
    hl.TSEmphasis = {fg = C.fg}
    hl.TSEmphasis.italic = true
    hl.TSUnderline = {fg = C.blue_2}
    hl.TSUnderline.underline = true
    hl.TSTitle = {fg = C.orange}
    hl.TSTitle.bold = true
    hl.TSPunctDelimiter = {fg = C.gold}
    hl.TSPunctSpecial = {fg = C.purple}
    hl.TSPunctBracket = {fg = C.blue}

    -- indent-line
    hl.IndentBlanklineContextChar = {fg = C.blue, nocombine = true}
    return hl
end
