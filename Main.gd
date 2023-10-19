extends Node2D

@onready var startButton: Button = $VerticalBox/Start

func _ready() -> void:
    startButton.grab_focus()

func _on_start_pressed():
    get_tree().change_scene_to_file("res://Main.tscn")

func _on_quit_pressed():
    get_tree().quit()
