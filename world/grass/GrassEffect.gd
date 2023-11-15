extends Node2D

@onready var _animatedSprite = $AnimatedSprite

func _ready():
  _animatedSprite.frame = 0
  _animatedSprite.play("destroy")


func _on_animated_sprite_animation_finished():
  queue_free()
