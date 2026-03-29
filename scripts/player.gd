extends CharacterBody2D
#Queue movement

var speed = 100

var dir_queue: Array[Vector2] = []

const DIR_BY_ACTION := {
	"ui_right": Vector2.RIGHT,
	"ui_left":  Vector2.LEFT,
	"ui_down":  Vector2.DOWN,
	"ui_up":    Vector2.UP,
}

func _unhandled_input(event: InputEvent) -> void:
	for action in DIR_BY_ACTION.keys():
		if event.is_action_pressed(action):
			_enqueue_dir(DIR_BY_ACTION[action])
		elif event.is_action_released(action):
			_remove_dir(DIR_BY_ACTION[action])


func _enqueue_dir(dir: Vector2) -> void:
	var i := dir_queue.find(dir)
	if i != -1:
		dir_queue.remove_at(i)
	dir_queue.append(dir)


func _remove_dir(dir: Vector2) -> void:
	var i := dir_queue.find(dir)
	if i != -1:
		dir_queue.remove_at(i)

func _dir_to_string(dir: Vector2) -> String:
	if dir == Vector2.RIGHT: return "right"
	if dir == Vector2.LEFT:  return "left"
	if dir == Vector2.DOWN:  return "down"
	return "up"

func _physics_process(_delta: float) -> void:
	var dir := Vector2.ZERO

	if dir_queue.size() > 0:
		dir = dir_queue.back() 

	velocity = dir * speed

	if dir != Vector2.ZERO:
		$player_sprite.dir = _dir_to_string(dir)
		$player_sprite.movement = 1
	else:
		$player_sprite.movement = 0

	move_and_slide()
	
func _ready():
	$player_sprite.dir = "down"
	
