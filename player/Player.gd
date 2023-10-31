extends CharacterBody2D

@onready var _animations = $Animations
@onready var _movement = $Movement

const MAX_SPEED = 100
const ACCELERATION = 10
const ROLL_ACCELERATION = 500
const FRICCTION = 10

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

  _check_new_state()

func _move() -> void:
  _input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    
  if _input != Vector2.ZERO:
    _movement.looking_position = _input
    _animations.looking_position = _input
    
    _movement.accelerate(ACCELERATION, MAX_SPEED, _delta)
    _animations.execute("walk")
  else:
    _movement.deaccelerate(FRICCTION, _delta)
    _animations.execute("idle", false)
        
  _movement.execute()

func _check_new_state() -> void:
  if Input.is_action_just_pressed("ui_accept"):
    _state = State.ROLL
    
  if Input.is_action_just_pressed("attack"):
    _state = State.ATTACK

# ROLL
func _roll() -> void:
  _movement.accelerate(ROLL_ACCELERATION, MAX_SPEED, _delta)
  _animations.execute("roll")

func roll_animation_finished() -> void:
  _movement.deaccelerate(FRICCTION, _delta)
  _state = State.MOVE

# ATTACK
func _attack():
  _movement.stop()
  _animations.execute("attack")

func attack_animation_finished():
  _state = State.MOVE
