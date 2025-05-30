extends OptionButton

func _ready() -> void:
	clear()
	for i in range(Registry.panels.size()):
		var identity = Registry.panels[i]
		add_icon_item(identity.icon,identity.name,i)
	item_selected.connect(_item_selected)


func _item_selected(index: int) -> void:
	var parent = get_parent()
	if parent is ContentPanel:
		parent.current_panel = Registry.panels[index]
	else:
		push_error("Parent is not a ContentPanel")

func set_from_identity(identity: ContentPanelIdentity):
	for i in range(Registry.panels.size()):
		if Registry.panels[i] == identity:
			select(i)

func set_from_name(name: String):
	if Registry.has_panel(name):
		select(Registry.panels.find(Registry.get_panel(name)))