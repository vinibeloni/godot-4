extends Node2D

func _on_hurtbox_area_entered(area):
  _create_grass_effect()
  queue_free()

func _create_grass_effect():
  var GrassEffect = load("res://world/grass/GrassEffect.tscn")
  var grassEffect = GrassEffect.instantiate()
  grassEffect.global_position = global_position
  
  var scene = get_tree().current_scene
  scene.add_child(grassEffect)
