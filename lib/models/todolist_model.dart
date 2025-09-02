class TodoItem {
	final String title;
	final String description;
	final bool isDone;

	TodoItem({
		required this.title,
		required this.description,
		this.isDone = false,
	});
}
