extends Area2D

const	SPEED: float = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_pressed("move_left") == true:
	#	position.x -= SPEED * delta
		
	#if Input.is_action_pressed("move_right") == true:
	#	position.x += SPEED * delta
	
	var movement: float = Input.get_axis("move_left","move_right")
	position.x += SPEED * delta * movement
			
	position.x = clampf(
		position.x, 
		get_viewport_rect().position.x, 
		get_viewport_rect().end.x
	)

func _on_area_entered(area: Area2D) -> void:
	print("Paddel class collision")
