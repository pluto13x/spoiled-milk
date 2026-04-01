extends Area2D

var entered = false


func _on_body_entered(body: CharacterBody2D) -> void:
	entered = true


func _on_body_exited(body: CharacterBody2D) -> void:
	entered = false
	
func _process(delta: float) -> void:
	if entered:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://scenes/kitchen.tscn")
