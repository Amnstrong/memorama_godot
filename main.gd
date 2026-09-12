extends Control

const CardScene = preload("res://card.tscn")

@onready var grid = $GridContainer
@onready var timer = $Timer

var first_card = null
var second_card = null
var pairs_found = 0
var total_pairs = 8

var images = [
	preload("res://1.jpg"),
	preload("res://2.jpeg"),
	preload("res://3.jpeg"),
	preload("res://4.jpeg"),
	preload("res://5.jpeg"),
	preload("res://6.jpeg"),
	preload("res://7.jpg"),
	preload("res://8.jpg")
]

func _ready():
	timer.wait_time = 1.0
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)
	setup_board()

func setup_board():
	var values = []
	for i in range(total_pairs):
		values.append(i)
		values.append(i)
	
	values.shuffle()
	
	for val in values:
		var card = CardScene.instantiate()
		card.card_id = val
		
		card.face_image = images[val] 
		card.card_clicked.connect(_on_card_clicked)
		grid.add_child(card)

func _on_card_clicked(card):
	if first_card and second_card:
		return 
		
	card.reveal()
	
	if first_card == null:
		first_card = card
	else:
		second_card = card
		check_match()

func check_match():
	if first_card.card_id == second_card.card_id:
		first_card.set_matched()
		second_card.set_matched()
		reset_turn()
		
		pairs_found += 1
		if pairs_found == total_pairs:
			print("¡Ganaste!")
	else:
		timer.start()

func _on_timer_timeout():
	first_card.hide_card()
	second_card.hide_card()
	reset_turn()

func reset_turn():
	first_card = null
	second_card = null
