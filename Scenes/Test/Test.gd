extends Node2D

@onready var icon_2: Sprite2D = $Icon2
@onready var icon: Sprite2D = $Icon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	icon_2.rotation_degrees += 180 * delta
	icon.position.x += 180.0 * delta
