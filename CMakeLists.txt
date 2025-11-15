cmake_minimum_required(VERSION 3.25)
project(SlkProject CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Włącz FetchContent
include(FetchContent)

# Pobierz raylib z GitHuba
FetchContent_Declare(
        raylib
        GIT_REPOSITORY https://github.com/raysan5/raylib.git
        GIT_TAG 5.5  # Stabilna wersja; zmień na master dla najnowszej
)
FetchContent_MakeAvailable(raylib)

# Dodaj plik źródłowy
add_executable(app src/main.cpp)

# Nagłówki z include/
target_include_directories(app PRIVATE include)

# Linkuj z raylib
target_link_libraries(app raylib)

# Opcjonalnie: dla Windows/MSVC, ustaw ikony itp. (raylib to obsługuje)
if (WIN32)
    set_target_properties(app PROPERTIES
            WIN32_EXECUTABLE TRUE
    )
endif ()


