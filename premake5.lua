include "../../premake/common_premake_defines.lua"

project "simdutf"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"

	files {
		"./include/**.h",
		"./src/simdutf.cpp"
	}

	includedirs {
		"%{IncludeDir.simdutf}"
	}

	filter "toolset:msc"
		disablewarnings { "4146" }