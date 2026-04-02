extends Area2D

var entered = false

func _process(_delta: float) -> void:
	if entered:
		get_tree().change_scene_to_file("res://scenes/bedroom.tscn")


func _on_body_entered(body: CharacterBody2D) -> void:
	if not (body is CharacterBody2D):
		return
	entered = true


func _on_body_exited(body: Node2D) -> void:
	if not (body is CharacterBody2D):
		return
	entered = false
