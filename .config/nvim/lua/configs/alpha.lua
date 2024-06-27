local colors = require 'colorschemes.paradise'

local ascii = {
    [[               ; ; ;                                 ]],
    [[             ;        ;  ;     ;;    ;               ]],
    [[          ;                 ;         ;  ;           ]],
    [[                         ;               ;;         ]],
    [[         ;            ';,        ;               ;   ]],
    [[         ;             'b      *                   ]],
    [[          ;              '$    ;;                ;;  ]],
    [[         ;    ;           $:   ;:              ;    ]],
    [[                   ;     :@,@):   ,;**:'   ;        ]],
    [[        ;      ;,         :@@*: ;;**'      ;   ;     ]],
    [[                 ';o;    ;:(@';@*"'  ;               ]],
    [[                    ,p$q8,:@)'  ;p*'      ;          ]],
    [[             ;       ' ; '@@Pp@@*'    ;  ;           ]],
    [[              ;  ; ;;      Y7'.'     ;  ;            ]],
    [[                           :@):.                     ]],
    [[                        .::(@:.                      ]],
    [[  _'-.--*_-'-_*'.'-*_---'-----*_'-.*_--'-'-'_*:.'*-  ]],
}


local function button(key, icon, name, command)
    local config = require('alpha.themes.dashboard')
    local b = config.button(key, " " .. icon .. "  " .. name, ":" .. command .. "<CR>")
    b.opts.hl = 'AlphaButtons'
    b.opts.hl_shortcut = 'AlphaButtonShortcut'
    b.opts.position = 'center'
    b.opts.width = 23
    return b
end

local function getGreeting()
    local hour = tonumber(os.date "%H")
    local greetings = {
        ['morning'] = ' おはよう',
        ['afternoon'] = 'こんにちは',
        ['evening'] = 'こんばんは',
        ['night'] = ' おやすみ'
    }

    local current = function()
        if hour >= 6 and hour < 12 then
            return greetings['morning']
        elseif hour >= 12 and hour < 18 then
            return greetings['afternoon']
        elseif hour >= 18 and hour < 23 then
            return greetings['evening']
        else
            return greetings['night']
        end
    end

    return current()
end

require 'alpha'.setup {
    layout = {
        { type = 'padding', val = 2 },
        {
            type = 'text',
            val = ascii,
            opts = { hl = 'AlphaHeader', position = 'center' },
        },
        { type = 'padding', val = 1 },
        {
            type = 'text',
            val = ALPHA_QUOTES(),
            opts = { hl = 'AlphaQuote', position = 'center' }
        },
        { type = 'padding', val = 2 },
        {
            type = 'group',
            val = {
                { type = 'text', val = '~ 迅速なアクセス ~', opts = { hl = 'AlphaQuote', position = 'center' } },
                button("f", "", "Find File", "Telescope find_files"),
                button("o", "", "Recent File", "Telescope oldfiles"),
                button("c", "", "Configuration", "e ~/.config/nvim/"),
                button("s", "", "Packer Sync", "PackerSync"),
                button("q", "", "Quit NeoVim", "qa!"),
            },
            opts = { hl = 'AlphaButtons', spacing = 1 }
        },
        {
            type = 'text',
            val = getGreeting,
            opts = { hl = 'AlphaQuote', position = 'center' }
        },
        { type = 'padding', val = 1 },
        {
            type = 'text',
            val = '♥',
            opts = { hl = 'AlphaHeader', position = 'center' }
        },
        { type = 'padding', val = 3 }
    }
}
