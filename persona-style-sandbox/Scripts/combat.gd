extends Control


enum CombatState {PLAYER_TURN, PLAYER_ATTACK, PLAYER_MATK, ENEMY_TURN, ENEMY_ATTACK, WON, LOST}


var state: CombatState = CombatState.PLAYER_TURN
var enemy_name: String = "Jack Frost"
var enemy_hp: int = 60
var enemy_max_hp: int = 60
var enemy_attack: int = 12
var enemy_def: int = 8

var exp_reward: int = 30
var yen_reward: int = 200


@onready var enemyname: Label = $EnemyArea/EnemyName
@onready var enemyhp: Label = $EnemyArea/EnemyHP
@onready var player_name: Label = $PartyInfo/PlayerName
@onready var hp_label: Label = $PartyInfo/HPLabel
@onready var sp_plabel: Label = $PartyInfo/SPlabel


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
	enemyname.text = enemy_name
	enemyhp.text = "Hp: " + str(enemy_hp) + "/" + str(enemy_max_hp)
	player_name.text = "Ren"
	hp_label.text = "HP: " + str(PlayerStats.hp) + "/" + str(PlayerStats.max_hp)
	sp_plabel.text = "SP: " + str(PlayerStats.sp) + "/" + str(PlayerStats.max_sp)
	$CombatLog.text = "Current State: " + str(state)

func set_buttons_enabled(enabled: bool) -> void:
	attack_button.disabled = !enabled
	if PlayerStats.sp > 10:
		skill_button.disabled = !enabled
	else:
		skill_button.disabled = true

func _on_attack() -> void:
	state = CombatState.PLAYER_ATTACK
	var damage = max(1, PlayerStats.atk - enemy_def)
	enemy_hp -= damage
	check_enemy_defeated()
	if state == CombatState.WON:
		return  # stop here, go_to_rewards() is handling it
	# These now run on the normal (enemy-survives) path, matching _on_skill().
	_on_enemy_turn()
	update_ui()
	combat_handler()


func _on_skill() -> void:
	state = CombatState.PLAYER_MATK
	var damage = max(1, PlayerStats.matk - enemy_def)
	enemy_hp -= damage
	PlayerStats.sp -= 10
	check_enemy_defeated()
	if state == CombatState.WON:
		return
	_on_enemy_turn()
	update_ui()
	combat_handler()


func check_enemy_defeated() -> void:
	if enemy_hp <= 0:
		state = CombatState.WON
		update_ui()
		await get_tree().create_timer(0.5).timeout
		go_to_rewards()

func check_player_defeated() -> void:
	if PlayerStats.hp <= 0:
		state = CombatState.LOST
		update_ui()
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://Scenes/leblanc.tscn")


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
	var damage = max(1, enemy_attack - PlayerStats.def)
	PlayerStats.hp -= damage
	check_player_defeated()
	if state != CombatState.LOST:
		state = CombatState.PLAYER_TURN
		combat_handler()
	update_ui()

#to add: On_scene_change. On_battle_rewards_scene, return to debug menu button

func go_to_rewards() -> void:
	var rewards_scene = load("res://Scenes/battle_rewards.tscn")
	var rewards = rewards_scene.instantiate()
	# Add to the tree FIRST so the rewards node's @onready labels are wired,
	# then set it as the current scene so its later change_scene_to_file works,
	# THEN hand it the values.
	get_tree().root.add_child(rewards)
	get_tree().current_scene = rewards
	rewards.setup(exp_reward, yen_reward)
	queue_free()
