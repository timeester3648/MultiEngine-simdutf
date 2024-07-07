void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("simdutf");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./LICENSE-MIT");

	// TODO: remove when compilation errors fixed
	properties.cpp_dialect(MultiBuild::LangDialectCpp::e14);

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"./include"
	});

	properties.files({
		"./include/**.h",
		"./src/simdutf.cpp"
	});
	
	{
		MultiBuild::ScopedFilter _(workspace, "project.compiler:VisualCpp");
		properties.disable_warnings("4146");
	}
}