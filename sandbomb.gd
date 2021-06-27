extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var color = "#FFFFFF"
export var size = 10
var die = false
export var explosiveness = 0

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	$ColorRect.color = color
	$CollisionShape2D.scale = Vector2(size/2, size/2)
	$ColorRect.rect_size = Vector2(size, size)
	$ColorRect.rect_position = Vector2(-(size/2), -(size/2))








func _on_RigidBody2D_body_entered(body):
	if explosiveness != 0:
		for body in $Area2D.get_overlapping_bodies():
			if "sand" in body.name and self.name != body.name:
				var angle = get_angle_to(body.position)
				body.apply_central_impulse(Vector2(cos(angle), sin(angle)) * explosiveness)
				print(body.name)
				die = true
		if die == true:
			queue_free()
				
	else:
		pass
