extends Sprite2D

var speed = 400
var angular_velocity = PI

func _init():
    print("Hello there, world!")
    print("ZERO", Vector2.ZERO * 10)

func _ready():
    print("ready: viewport rect size: ", get_viewport_rect())
    
func pressed(key: String):
    return Input.is_action_pressed(key)

func rotation_direction():
    if pressed("ui_left"):  return -1
    if pressed("ui_right"): return +1
    return 0

func unit_velocity():
    if not pressed("ui_up"): return Vector2.ZERO
    return Vector2.UP 

func bounce(position, velocity, size):
    var vx = velocity.x
    var vy = velocity.y

    if position.x <= 0 or position.x >= size.x:
        vx = -vx
    if position.y <= 0 or position.y >= size.y:
        vy = -vy

    return Vector2(vx, vy)

func _process(delta):
    var dir = rotation_direction()
    var unit_vel = unit_velocity()

    if dir == 0 and unit_vel == Vector2.ZERO:
        return
    
    var size = get_viewport_rect().size

    if dir != 0:
        rotation += dir * angular_velocity * delta
    elif unit_vel != Vector2.ZERO:
        var velocity = unit_vel.rotated(rotation) * speed
        position += velocity * delta
        velocity = bounce(position, velocity, size)
        rotation = velocity.angle() + PI/2 # needed, but not sure why...
