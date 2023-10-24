extends CharacterBody2D

func _physics_process(delta):
    var input = Vector2.ZERO;
    input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left");
    input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up");
    
    if input != Vector2.ZERO:
        velocity = input
    else:
        velocity = Vector2.ZERO
        
    move_and_collide(velocity)
