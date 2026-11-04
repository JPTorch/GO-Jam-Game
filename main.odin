package main

import rl "vendor:raylib"

main :: proc() {
    game_name: cstring = "Game"

    rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, game_name)
    rl.SetTargetFPS(60)

    for !rl.WindowShouldClose() {
        dt := rl.GetFrameTime()

        update_transition(dt)

        if transition.state == .none {
            switch (current_scene) {
                case .menu: update_menu(dt)
                case .game: update_game(dt)
            }
        }

        rl.BeginDrawing()
        
            switch (current_scene) {
                case .menu: draw_menu()
                case .game:
                    draw_game()
                    rl.EndMode2D()
            }
            draw_transition()

        rl.EndDrawing()
    }

    free_all(context.temp_allocator)
}