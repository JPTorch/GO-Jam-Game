package main

import rl "vendor:raylib"

main :: proc() {
    game_name: cstring = "Game"

    rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, game_name)
    rl.SetTargetFPS(60)

    for !rl.WindowShouldClose() {
        dt := rl.GetFrameTime()

        rl.BeginDrawing()
        rl.EndDrawing()
    }

    free_all(context.temp_allocator)
}