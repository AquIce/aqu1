workspace "Aqu1"
	configurations { "DEBUG", "RELEASE" }
	platforms { "run", "static-build", "dynamic-build" }
	startproject "AquEngine"
	
	project "ARE"
	    language "C++"
		location "build/"
		entrypoint "main"
		
		files {
		    "src/are_main.cpp",
		    "src/ARE/*.cpp",
		    "src/include/ARE/*.hpp"
		}
		
		libdirs {
		    "bin"
		}
		
		links {
		    "mingw32",
		    "SDL2"
		}
		
		includedirs {
    		"src/include",
    	}
    
    	filter { "action:gmake" }
            buildoptions { "-Wall", "-Werror", "-Wpedantic", "-g3" }
    
    	filter { "platforms:run" }
    		kind "ConsoleApp"
    
    	filter { "platforms:static-build" }
    		kind "StaticLib"
    		removefiles { "adl_main.cpp" }
    
    	filter { "platforms:dynamic-build" }
    		kind "SharedLib"
    		removefiles { "adl_main.cpp" }
    
    	filter { "configurations:debug" }
    	    defines { "DEBUG" }
    		symbols "On"

    project "AquEngine"
    	language "C++"
    	location "build/"
    	entrypoint "main"
    
    	files {
    		"src/main.cpp",
    		"src/aquengine/**/*.cpp",
    		"src/include/aquengine/*.hpp",
    	}
    
    	includedirs {
    		"src/include",
    	}
    
    	filter { "action:gmake" }
            buildoptions { "-Wall", "-Werror", "-Wpedantic", "-g3" }
    
    	filter { "platforms:run" }
    		kind "ConsoleApp"
    
    	filter { "platforms:static-build" }
    		kind "StaticLib"
    		removefiles { "main.cpp" }
    
    	filter { "platforms:dynamic-build" }
    		kind "SharedLib"
    		removefiles { "main.cpp" }
    
    	filter { "configurations:debug" }
    	    defines { "DEBUG" }
    		symbols "On"
