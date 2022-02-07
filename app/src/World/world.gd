extends Spatial

onready var icosahedron = $Icosahedron

func _ready():
	var m = add_mesh_instance(self, "Center")
	add_property_to_mesh_instance(m)
	
	prints(icosahedron.vertex_array[0].x, icosahedron.vertex_array[0].y, icosahedron.vertex_array[0].z)
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
