extends AnimatedSprite2D

func _ready():
	play("idle_front")
	
var dir = "down"
var movement = 0

func _process(_delta: float) -> void:
	play_anim()

func play_anim():
	if dir  == "right":
		flip_h = false
		if movement == 1:
			play("walk_side")
		elif movement == 0:
			play("idle_side")
	elif dir  == "left":
		flip_h = true
		if movement == 1:
			play("walk_side")
		elif movement == 0:
			play("idle_side")
	elif dir  == "down":
		flip_h = false
		if movement == 1:
			play("walk_front")
		elif movement == 0:
			play("idle_front")
	elif dir  == "up":
		flip_h = false
		if movement == 1:
			play("walk_back")
		elif movement == 0:
			play("idle_back")
