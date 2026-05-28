extends Control

enum CombatState {PLAYER_TURN, ENEMY_TURN, WON, LOST}

var state: CombatState = CombatState.PLAYER_TURN
var enemy_name: String = "Jack Frost"
var enemy_hp: int = 60
var enemy_max_hp: int = 60
var enemy_attack: int = 12
var enemy_def: int = 8



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_ui() -> void:
	$EnemyArea/EnemyName.text = enemy_name
	$EnemyArea/EnemyHP.text = "Hp: " + str(enemy_hp) + "/" + str(enemy_max_hp)
	$PlayerName.text = "Ren"
	$HPLabel.text = "HP: " + str(PlayerStats.hp) + "/" + str(PlayerStats.max_hp)
	$SPLabel.text = "SP: " + str(PlayerStats.sp) + "/" + str(PlayerStats.max_sp)


func set_buttons_enabled(enabled: bool) -> void:
	$ActionMenu/AttackButton.disabled = !enabled
	$ActionMenu/SkillButon.disabled =  !enabled


func _on_attack() -> void:
	pass


func _on_skill() -> void:
	pass


func check_enemy_defeated() -> void:
	pass


func enemy_turn() -> void:
	pass
