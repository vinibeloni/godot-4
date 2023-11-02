class_name PlayerMovement
extends Node

@export_category("Dependencies")
@export var _movement: Movement

@export_category("Movement")
@export var MAX_SPEED = 100
@export var ACCELERATION = 500
@export var ROLL_ACCELERATION = 110
@export var FRICCTION = 500

func move():
  _movement.execute()

func walk(delta: float):
  _movement.accelerate_smooth(ACCELERATION, MAX_SPEED, delta)
    
func roll():
  _movement.accelerate(ROLL_ACCELERATION)

func brake(delta: float):
  _movement.stop_smooth(FRICCTION, delta)

func stop():
  _movement.stop()
