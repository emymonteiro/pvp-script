local queue = {
    ['group_1'] = {
        players = {{
            id = 1,
            name = "ViperGT"
        }}
    },
    ['group_4'] = {
        players = {{
            id = 2,
            name = "BlazeGamer"
        }, {
            id = 3,
            name = "SpeedRacer"
        }, {
            id = 4,
            name = "ShadowNinja"
        }, {
            id = 5,
            name = "PhoenixFire"
        }}
    },
    ['group_6'] = {
        players = {{
            id = 6,
            name = "ThunderBolt"
        }, {
            id = 7,
            name = "GhostRider"
        }}
    },
    ['group_9'] = {
        players = {{
            id = 8,
            name = "NeonSpectre"
        }, {
            id = 9,
            name = "DriftKing"
        }}
    },
    ['group_10'] = {
        players = {{
            id = 10,
            name = "MidnightWolf"
        }}
    }
}
local teams = {
    blue = {
        players = {}
    },
    red = {
        players = {}
    }
}

function searchQueue()
    function insertPlayers(room)
        if #teams[room].players >= 5 then
            return
        end

        local amountPlayers = {
            index = '',
            players = {}
        }

        for groups, inqueue in pairs(queue) do
            if #inqueue.players > #amountPlayers.players and #inqueue.players + #teams[room].players <= 5 then
                amountPlayers.index = groups
                amountPlayers.players = inqueue.players
            end
        end

        if #amountPlayers.players > 0 then
            for players, info in pairs(amountPlayers.players) do
                info['group'] = amountPlayers.index
                table.insert(teams[room].players, info)
                queue[amountPlayers.index] = nil
            end
        end
        insertPlayers(room)
    end

    insertPlayers('blue')
    insertPlayers('red')

    -- debug
    for a, b in pairs(teams.blue.players) do
        print("{")
        for c, d in pairs(teams.blue.players[a]) do
            print(c, d)
        end
        print("},\n")
    end
    print('blue team players : ' .. #teams.blue.players)
    print('----------------------------------------------')

    for a, b in pairs(teams.red.players) do
        print("{")
        for c, d in pairs(teams.red.players[a]) do
            print(c, d)
        end
        print("},\n")
    end
    print('red team players : ' .. #teams.red.players)
end

searchQueue()
