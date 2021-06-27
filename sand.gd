extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var color = "#FFFFFF"
export var size = 10
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	$ColorRect.color = color
	$CollisionShape2D.scale = Vector2(size/2, size/2)
	$ColorRect.rect_size = Vector2(size, size)
	$ColorRect.rect_position = Vector2(-(size/2), -(size/2))




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
