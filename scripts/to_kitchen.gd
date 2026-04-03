extends Area2D

var entered = false

func _process(_delta: float) -> void:
	if entered:
		get_tree().change_scene_to_file("res://scenes/kitchen.tscn")

func _on_body_entered(body: Node2D) -> void:
	if not (body is CharacterBody2D):
		return
	entered = true
	if get_tree().current_scene.name == "livingroom":
		Global.nextx = 176
		Global.nexty = 190
	else:
		Global.nextx = 185
		Global.nexty = 149
