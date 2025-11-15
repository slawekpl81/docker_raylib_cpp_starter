cmake_minimum_required(VERSION 3.25)
project(SlkProject CXX)

# Wymaganie C++23 (upewnij się, że GCC-13 w pełni go wspiera, jeśli nie, użyj C++20)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON) # Przydatne dla CLion

# Włącz FetchContent
include(FetchContent)


FetchContent_Declare(
        raylib
        GIT_REPOSITORY https://github.com/raysan5/raylib.git
        GIT_TAG master # Użyj master dla najnowszych zmian lub 5.0 dla stabilności
)

# Włącz raylib w projekcie
FetchContent_MakeAvailable(raylib)

# Dodaj plik źródłowy
add_executable(app src/main.cpp)

# Nagłówki z include/ (jeśli masz tam swoje pliki nagłówkowe)
target_include_directories(app PRIVATE include)

# Linkuj z raylib
# Używamy PUBLIC/PRIVATE, aby jasno określić zależności
target_link_libraries(app PRIVATE raylib)

# Opcjonalnie: Ustawienie na Windows
if (WIN32)
    set_target_properties(app PROPERTIES
            WIN32_EXECUTABLE TRUE
    )
endif ()