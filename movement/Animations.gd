class_name Animations
extends Node

@export var _animation_tree: AnimationTree
@export var looking_position = Vector2.ZERO

var _looking_position = Vector2.ZERO
var _animation_state: AnimationNodeStateMachinePlayback

func _ready() -> void:
  _animation_tree.active = true
  _animation_state = _animation_tree["parameters/playback"]

func execute(state: String, update_direction = false) -> void:
  _set_animations_position()

  if update_direction:
    _looking_position = looking_position

  _animation_state.travel(state)

# to make it generic just add an array with all parameters(animations)
func _set_animations_position() -> void:
  _set_blend_position("idle")
  _set_blend_position("walk")
  _set_blend_position("roll")
  _set_blend_position("attack")

func _set_blend_position(animationName: String) -> void:
  _animation_tree["parameters/%s/blend_position" % animationName] = _looking_position
