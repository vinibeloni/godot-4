extends Node2D

@export var body: CharacterBody2D
@export var looking_position: Vector2

func execute():
  body.move_and_collide(body.velocity)

func accelerate(acceleration: float, max_speed: float, delta: float) -> void:
  body.velocity += looking_position * acceleration * delta
  body.velocity = body.velocity.limit_length(max_speed * delta)

func deaccelerate(fricction: float, delta: float):
  body.velocity = body.velocity.move_toward(Vector2.ZERO, fricction * delta)

func stop() -> void:
  body.velocity = Vector2.ZERO
