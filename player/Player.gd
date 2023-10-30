extends CharacterBody2D

@onready var animation_tree = $AnimationTree

var input = Vector2.ZERO

func _ready():
    animation_tree.active = true

func _physics_process(delta):
    input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    
    if input != Vector2.ZERO:
        velocity = input
        _set_walking(true)
        _set_animations_position()
    else:
        velocity = Vector2.ZERO
        _set_walking(false)
        
    move_and_collide(velocity)

func _set_walking(value):
    _set_animation_parameters("is_walking", value)
    _set_animation_parameters("idle", not value)

func _set_animations_position():
  _set_blend_position("idle")
  _set_blend_position("walk")

func _set_blend_position(animationName: String) -> void:
  animation_tree["parameters/{0}/blend_position".format([animationName])] = input

func _set_animation_parameters(name: String, value: bool) -> void:
    animation_tree["parameters/conditions/{0}".format([name])] = value
