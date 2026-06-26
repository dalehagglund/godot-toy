extends Sprite2D

var speed = 400
var angular_velocity = PI

func _init():
	print("Hello there, world!")
	print("ZERO", Vector2.ZERO * 10)

func pressed(key: String):
	return Input.is_action_pressed(key)

func rotation_direction():
	if pressed("ui_left"):  return -1
	if pressed("ui_right"): return +1
	return 0

func velocity_vector():
	if not pressed("ui_up"): return Vector2.ZERO
	return Vector2.UP 

func _process(delta):
	var dir = rotation_direction()
	var vel = velocity_vector().rotated(rotation) * speed

	rotation += dir * angular_velocity * delta
	position += vel * delta
