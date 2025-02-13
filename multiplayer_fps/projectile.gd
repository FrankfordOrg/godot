extends RigidBody3D

@export var speed: float = 20.0
@export var gravity: float = -9.8

func _ready() -> void:
	apply_impulse(Vector3.ZERO, -transform.basis.z * speed)

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	var velocity = state.linear_velocity
	velocity.y += gravity * state.step
	state.linear_velocity = velocity
