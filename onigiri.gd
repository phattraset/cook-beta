extends Area2D

var dragging = false
var offset = Vector2.ZERO

func _process(_delta):
	if dragging:
		# ให้ตำแหน่งของอาหารขยับตามเมาส์
		global_position = get_global_mouse_position() - offset

func _input_event(_viewport, event, _shape_idx):
	# เช็กการคลิกเมาส์ซ้าย
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				offset = get_global_mouse_position() - global_position
			else:
				dragging = false
				check_drop_zone()

func check_drop_zone():
	var areas = get_overlapping_areas()
	for area in areas:
		# เช็กว่าโหนดที่ไปทับ มีคำว่า Slot อยู่ในชื่อหรือไม่
		if "Slot" in area.name: 
			# ดูดเข้ากึ่งกลางของ Slot นั้นๆ
			global_position = area.global_position
			return
