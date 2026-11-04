package main

import rl "vendor:raylib"

Game_Scene :: enum {
    menu,
    game,
}

current_scene := Game_Scene.menu

Transition_State :: enum {
    none,
    fading_out,
    fading_in,
}

Transition :: struct {
    state: Transition_State,
    progress: f32,
    speed: f32,
    next_scene: Game_Scene,
}

transition := Transition{
    state = .none,
    speed = 1.5,
}

change_scene :: proc(next_scene: Game_Scene) {
    if transition.state != .none do return
    
    transition.state = .fading_out
    transition.progress = 0.0
    transition.next_scene = next_scene
}

draw_transition :: proc() {
    if transition.state == .none do return

    alpha := u8(transition.progress * 255.0)
    fade_colour := rl.Color{0, 0, 0, alpha}

    rl.DrawRectangle(0, 0, rl.GetScreenWidth(), rl.GetScreenHeight(), fade_colour)
}

update_transition :: proc(dt: f32) {
    switch (transition.state) {
        case .none: return 
        case .fading_out:
            transition.progress += transition.speed * dt

            if transition.progress >= 1.0 {
                transition.progress = 1.0
                transition.state = .fading_in
                current_scene = transition.next_scene
            }

        case .fading_in:
            transition.progress -= transition.speed * dt

            if transition.progress <= 0.0 {
                transition.progress = 0.0
                transition.state = .none
            }
    }
}