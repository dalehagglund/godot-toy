extends Sprite2D

var speed = 400
var angular_velocity = PI

func _init():
	print("Hello there, world!")

func _process(delta):
	rotation += angular_velocity * delta
