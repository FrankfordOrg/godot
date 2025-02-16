extends RigidBody3D

@export var speed: float = 35.0
@export var gravity: float = -9.8

func _ready() -> void:
    add_to_group("projectiles")
    gravity_scale = 0.5
    mass = 0.26
    can_sleep = true
    # Enable continuous collision detection
    contact_monitor = true
    max_contacts_reported = 4
    continuous_cd = true

func _physics_process(_delta: float) -> void:
    # Optional: Delete projectile if it goes too far below the ground
    if global_position.y < -50:
        queue_free()
        print("Projectile deleted for going too far below the ground.")
    # Optional: Delete projectile if it's nearly stationary
    #if linear_velocity.length() < 0.1:
    #    queue_free()
    #    print("Projectile deleted due to low velocity.")


func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
    var velocity = state.linear_velocity
    velocity.y += gravity * state.step
    state.linear_velocity = velocity
