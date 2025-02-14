extends RigidBody3D

@export var speed: float = 30.0
@export var gravity: float = -9.8

func _ready() -> void:
	gravity_scale = 0.5

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	var velocity = state.linear_velocity
	velocity.y += gravity * state.step
	state.linear_velocity = velocity
