extends CharacterBody2D

@onready var _animations = $Animations
@onready var _movement = $Movement

var input = Vector2.ZERO

func _physics_process(_delta):
  input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
  
  _animations.looking_position = input
  _movement.looking_position = input
    
  if input != Vector2.ZERO:
    _movement.accelerate()
    _animations.play("walk", true)
  else:
    _movement.stop()
    _animations.play("idle")
        
  _movement.execute()
