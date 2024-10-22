# @file CMakeLists.txt
#
# CMake files for the srccomplexity project

# Can be run by any version of CMake >= this
cmake_minimum_required(VERSION 3.29)

# Project info
project(srcComplexity VERSION 1.0.0)

# srccomplexity executable
add_executable(srccomplexity srcComplexity.cpp srcMLXPathCount.cpp)
target_compile_features(srccomplexity PRIVATE cxx_std_17)

# libxml2 requirement
find_package(LibXml2 REQUIRED)
target_link_libraries(srccomplexity PRIVATE LibXml2::LibXml2)

# Turn on warnings
# Note: Should be a preset in CMakePresets.json
if (MSVC)
    # warning level 4
    target_compile_options(srccomplexity PRIVATE /W4)
else()
    # standard warnings
    target_compile_options(srccomplexity PRIVATE -Wall)
endif()

# Demo run command
add_custom_target(run
        COMMENT "Run demo"
        COMMAND $<TARGET_FILE:srccomplexity> ${CMAKE_SOURCE_DIR}/srcMLXPathCount.cpp.xml
        DEPENDS srccomplexity
        USES_TERMINAL
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
)
