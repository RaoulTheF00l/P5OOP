extends Control

enum CombatState {PLAYER_TURN, ENEMY_TURN, WON, LOST}

var state: CombatState = CombatState.PLAYER_TURN
var enemy_name: String = "Jack Frost"
var enemy_hp: int = 60
var enemy_attack: int = 12
var enemy_def: int = 8



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
