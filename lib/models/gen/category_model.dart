class CategoryModel {
	int? id;
	String? name;
	String? description;
	String? image;
	int? parent;

	CategoryModel({
		this.id, 
		this.name, 
		this.description, 
		this.image, 
		this.parent, 
	});

	factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
				id: json['id'] as int?,
				name: json['name'] as String?,
				description: json['description'] as String?,
				image: json['image'] as String?,
				parent: json['parent'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'description': description,
				'image': image,
				'parent': parent,
			};
}
