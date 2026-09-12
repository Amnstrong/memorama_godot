extends Button

signal card_clicked(card)

var card_id = 0
var is_matched = false
var face_image = null

func _ready():
	icon = null
	pressed.connect(_on_pressed)

func _on_pressed():
	if not is_matched and icon == null:
		card_clicked.emit(self)

func reveal():
	icon = face_image

func hide_card():
	if not is_matched:
		icon = null

func set_matched():
	is_matched = true
	disabled = true
	modulate = Color(0.5, 1.0, 0.5)
