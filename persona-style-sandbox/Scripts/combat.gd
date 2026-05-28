extends Control


enum CombatState {PLAYER_TURN, PLAYER_ATTACK, PLAYER_MATK, ENEMY_TURN, ENEMY_ATTACK, WON, LOST}


var state: CombatState = CombatState.PLAYER_TURN
var enemy_name: String = "Jack Frost"
var enemy_hp: int = 60
var enemy_max_hp: int = 60
var enemy_attack: int = 12
var enemy_def: int = 8


@onready var attack_button: Button = $ActionMenu/AttackButton
@onready var skill_button: Button = $ActionMenu/SkillButton

func _ready() -> void:
	attack_button.pressed.connect(_on_attack_button_pressed)
	skill_button.pressed.connect(_on_skill_button_pressed)
	
	update_ui()
	combat_handler()



func combat_handler() -> void:
	if state == CombatState.PLAYER_TURN:
		set_buttons_enabled(true)
	else:
		set_buttons_enabled(false)

func update_ui() -> void:
	$EnemyArea/EnemyName.text = enemy_name
	$EnemyArea/EnemyHP.text = "Hp: " + str(enemy_hp) + "/" + str(enemy_max_hp)
	$PlayerName.text = "Ren"
	$HPLabel.text = "HP: " + str(PlayerStats.hp) + "/" + str(PlayerStats.max_hp)
	$SPLabel.text = "SP: " + str(PlayerStats.sp) + "/" + str(PlayerStats.max_sp)
	$CombatLog.text = "Current State: " + str(state)

func set_buttons_enabled(enabled: bool) -> void:
	attack_button.disabled = !enabled
	if PlayerStats.sp > 10:
		skill_button.disabled = !enabled
	else:
		skill_button.disabled = true

func _on_attack() -> void:
	state = CombatState.PLAYER_ATTACK
	var damage = PlayerStats.atk - enemy_def
	enemy_hp -= damage
	check_enemy_defeated()
	if state != CombatState.WON:
		_on_enemy_turn()
	update_ui()

func _on_skill() -> void:
	state = CombatState.PLAYER_MATK
	var damage = PlayerStats.matk - enemy_def
	enemy_hp -= damage
	PlayerStats.sp -= 10
	check_enemy_defeated()
	update_ui()

func check_enemy_defeated() -> void:
	if enemy_hp <= 0:
		state = CombatState.WON
		update_ui()

func check_player_defeated() -> void:
	if PlayerStats.hp <= 0:
		state = CombatState.LOST
		update_ui()

func reset() -> void:
	state = CombatState.PLAYER_TURN
	PlayerStats.hp = PlayerStats.max_hp
	PlayerStats.sp = PlayerStats.max_sp
	update_ui()

func _on_attack_button_pressed() -> void:
	_on_attack()

func _on_skill_button_pressed() -> void:
	_on_skill()

func _on_enemy_turn() -> void:
	_on_enemy_attack()

func _on_enemy_attack() -> void:
	state = CombatState.ENEMY_ATTACK
	var damage = enemy_attack - PlayerStats.def
	PlayerStats.hp -= damage
	check_player_defeated()
	if state != CombatState.LOST:
		state = CombatState.PLAYER_TURN
		combat_handler()
	update_ui()

#to add: On_scene_change. On_battle_rewards_scene, return to debug menu button
