import raylib

fn main() {
    screen_width := 800
    screen_height := 450
    raylib.init_window(screen_width, screen_height, "Hello V")
    mut camera := raylib.Camera3D{
        position: raylib.Vector3{10.0, 10.0, 10.0}, // Camera position
        target: raylib.Vector3{0.0, 0.0, 0.0},     // Camera target
        up: raylib.Vector3{0.0, 1.0, 0.0},         // Camera up vector
        fovy: 45.0,                                // Camera field-of-view
        projection: int(raylib.CameraProjection.camera_perspective)
    }
    raylib.set_target_fps(60)
    for !raylib.window_should_close() {
        raylib.update_camera(camera, int(raylib.CameraMode.camera_orbital))
        raylib.begin_drawing()
        raylib.clear_background(raylib.white)
        raylib.begin_mode_3d(camera)
        // Draw a plane (ground)
        raylib.draw_plane(raylib.Vector3{0.0, 0.0, 0.0}, raylib.Vector2{10.0, 10.0}, raylib.lightgray)
        // Draw a box
        raylib.draw_cube(raylib.Vector3{0.0, 1.0, 0.0}, 2.0, 2.0, 2.0, raylib.red)
        raylib.draw_cube_wires(raylib.Vector3{0.0, 1.0, 0.0}, 2.0, 2.0, 2.0, raylib.darkgray)
        // Draw grid
        raylib.draw_grid(10, 1.0)
        // Draw FPS
        raylib.draw_fps(10, 10)
        raylib.end_mode_3d()
        raylib.end_drawing()
    }
    raylib.close_window()
}
