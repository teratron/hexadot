extends Spatial

onready var icosahedron = $Icosahedron
onready var label = load("res://src/World/label.tscn")


func _ready():
#	var tree = Tree.new()
#	var root = tree.create_item()
#	tree.set_hide_root(true)
#	var child1 = tree.create_item(root)
#	var child2 = tree.create_item(root)
#	var subchild1 = tree.create_item(child1)
#	subchild1.set_text(0, "Subchild1")
#	
#	var n = add_mesh_instance(self, "Center")
#	add_property_to_mesh_instance(n)
#	var p = add_mesh_instance(self, "Center2")
#	add_property_to_mesh_instance(p)
#	p.translation.x = 2
	#print(label)

	var m: MeshInstance
	for v in icosahedron.vertex_array:
		m = add_mesh_instance(self, "Center")
		add_property_to_mesh_instance(m)
		m.translation.x = v.x
		m.translation.y = v.y
		m.translation.z = v.z
		
		m.add_child(label.instance(), true)
		
	
	#prints(icosahedron.vertex_array[0].x, icosahedron.vertex_array[0].y, icosahedron.vertex_array[0].z)
	#prints(icosahedron.vertex_array[0]._xyz)
	pass


func add_mesh_instance(node, name: String = "MeshInstance") -> MeshInstance:
	var instance = MeshInstance.new()
	instance.name = name
	node.add_child(instance, true)
	return instance


func add_property_to_mesh_instance(instance):
	var sm = SphereMesh.new()
	sm.radius = 0.1
	sm.height = 0.2
	sm.radial_segments = 8
	sm.rings = 4
	
	var material = SpatialMaterial.new()
	material.flags_unshaded = true
	#sm.albedo_texture = preload("editor_gizmo_texture.png")
	material.albedo_color = Color(1, 0, 0, 1)
	sm.material = material
	
	instance.mesh = sm
