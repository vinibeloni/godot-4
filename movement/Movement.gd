class_name Movement
extends Node2D

@export var body: CharacterBody2D
@export var looking_position: Vector2

func move():
  body.move_and_slide()

func increase_velocity(acceleration: float, max_speed: float, delta: float) -> void:
  body.velocity = body.velocity.move_toward(looking_position * max_speed, acceleration * delta)

func decrease_velocity(fricction: float, delta: float):
  body.velocity = body.velocity.move_toward(Vector2.ZERO, fricction * delta)

func set_velocity(speed: float) -> void:
  body.velocity = looking_position * speed

func stop() -> void:
  body.velocity = Vector2.ZERO
