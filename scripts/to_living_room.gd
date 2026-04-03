extends Area2D


var entered = false

func _process(_delta: float) -> void:
	if entered:
		get_tree().change_scene_to_file("res://scenes/livingroom.tscn")


func _on_body_entered(body: Node2D) -> void:
	if not (body is CharacterBody2D):
		return
	entered = true
	if get_tree().current_scene.name == "bedroom":
		Global.nextx = 184
		Global.nexty = 122
	else:
		Global.nextx = 0
		Global.nexty = 0
		
