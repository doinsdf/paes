extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var sand = preload("res://sand.tscn")
var sandinstance
var erase = false
var explosiveness = 0

func _on_Timer_timeout():
	if Input.is_action_pressed("spawn"):
		if get_global_mouse_position().x > 5 and get_global_mouse_position().x < 660:
			if get_global_mouse_position().y > 12 and get_global_mouse_position().y < 560:
				if erase == false:
					sandinstance = sand.instance()
					sandinstance.name = "sand"
					sandinstance.position = get_global_mouse_position()
					sandinstance.color = $ColorPicker.color
					sandinstance.size = $size.value
					sandinstance.explosiveness = explosiveness
					add_child(sandinstance)
					if $randomdir.pressed == true:
						var rng = RandomNumberGenerator.new()
						rng.randomize()
						sandinstance.apply_impulse(Vector2(0,0), Vector2(rng.randi_range(-100, 100), rng.randi_range(-100, 100)))

func _process(delta):
	$Timer.wait_time = $frequency.value
	Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, Vector2(0, $gravity.value))
	
	
	erase = $erase.pressed
	explosiveness = $explosiveness.value
	
	$Area2D/CollisionShape2D.scale = Vector2($size.value/4, $size.value/4)
	if Input.is_action_pressed("spawn"):
		if erase == true:
			$Area2D.position = get_global_mouse_position()
			for body in $Area2D.get_overlapping_bodies():
				if "sand" in body.name:
					body.queue_free()
		
	
	



func _on_Clear_pressed():
	for i in get_children():
		if "sand" in i.name:
			i.queue_free()


func _on_Explode_pressed():
	for i in get_children():
		if "sand" in i.name:
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			i.apply_impulse(Vector2(0,0), Vector2(rng.randi_range(-400, 400), rng.randi_range(-400, 400)))
