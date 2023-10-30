extends Node2D

@export var body: CharacterBody2D
@export var looking_position: Vector2

func execute():
  body.move_and_collide(body.velocity)

func accelerate():
  body.velocity = looking_position 

func stop():
  body.velocity = Vector2.ZERO   
