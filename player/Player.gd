extends CharacterBody2D

@onready var _animations: Animations = $Animations
@onready var _movement: Movement = $Movement

@export_category("Movement")
@export var MAX_SPEED = 100
@export var ACCELERATION = 500
@export var ROLL_ACCELERATION = 110
@export var FRICCTION = 500

enum State {
  MOVE,
  ROLL,
  ATTACK
}

var _state = State.MOVE
var _input = Vector2.ZERO
var _delta: float;

# Private functions
func _physics_process(delta):
  _delta = delta

  match _state:
    State.MOVE:
      _move()
    State.ROLL:
      _roll()
    State.ATTACK:
      _attack()

func _move() -> void:
  _input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

  if _input != Vector2.ZERO:
    _movement.looking_position = _input
    _animations.looking_position = _input

    _movement.increase_velocity(ACCELERATION, MAX_SPEED, _delta)
    _animations.play("walk")
  else:
    _movement.decrease_velocity(FRICCTION, _delta)
    _animations.play("idle", false)

  _movement.move()
  _check_new_state()

func _check_new_state() -> void:
  if Input.is_action_just_pressed("ui_accept"):
    _state = State.ROLL

  if Input.is_action_just_pressed("attack"):
    _state = State.ATTACK

# ROLL
func _roll() -> void:
  _movement.set_velocity(ROLL_ACCELERATION)
  _animations.play("roll")
  _movement.move()

func roll_animation_finished() -> void:
  _movement.decrease_velocity(FRICCTION, _delta)
  _state = State.MOVE

# ATTACK
func _attack():
  _movement.stop()
  _animations.play("attack")

func attack_animation_finished():
  _state = State.MOVE
