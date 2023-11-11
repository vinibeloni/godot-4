class_name Animations
extends Node

const _animations = ["idle", "walk", "roll", "attack"]

@export var animation_tree: AnimationTree
@export var looking_position = Vector2.ZERO

var _animation_state: AnimationNodeStateMachinePlayback

func _ready() -> void:
  animation_tree.active = true
  _animation_state = animation_tree["parameters/playback"]

func execute(state: String, update_direction = true) -> void:
  _set_animations_position()

  _animation_state.travel(state)

func _set_animations_position() -> void:
  _animations.map(func(anim): _set_blend_position(anim))

func _set_blend_position(animationName: String) -> void:
  animation_tree["parameters/%s/blend_position" % animationName] = looking_position
