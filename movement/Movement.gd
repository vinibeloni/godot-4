class_name Movement
extends Node2D

@export var body: CharacterBody2D
@export var looking_position: Vector2

func execute():
  body.move_and_slide()

func accelerate_smooth(acceleration: float, max_speed: float, delta: float) -> void:
  body.velocity = body.velocity.move_toward(looking_position * max_speed, acceleration * delta)

func stop_smooth(fricction: float, delta: float):
  body.velocity = body.velocity.move_toward(Vector2.ZERO, fricction * delta)

func accelerate(acceleration: float) -> void:
  body.velocity = looking_position * acceleration

func stop() -> void:
  body.velocity = Vector2.ZERO
