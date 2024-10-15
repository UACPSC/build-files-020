# Build for srccomplexity

.PHONY: all
all : srccomplexity srcMLXPathCountTest

srccomplexity : srcComplexity.o srcMLXPathCount.o
	g++ -std=c++17 srcComplexity.o srcMLXPathCount.o -lxml2 -o srccomplexity

srcComplexity.o : srcComplexity.cpp srcMLXPathCount.hpp
	g++ -std=c++17 -c srcComplexity.cpp

srcMLXPathCount.o : srcMLXPathCount.cpp srcMLXPathCount.hpp
	g++ -std=c++17 -I/usr/include/libxml2 -c srcMLXPathCount.cpp

srcMLXPathCountTest : srcMLXPathCountTest.o srcMLXPathCount.o
	g++ -std=c++17 srcMLXPathCountTest.o srcMLXPathCount.o -lxml2 -o srcMLXPathCountTest

srcMLXPathCountTest.o : srcMLXPathCountTest.cpp srcMLXPathCount.hpp
	g++ -std=c++17 -c srcMLXPathCountTest.cpp

.PHONY: test
test : srcMLXPathCountTest
	./srcMLXPathCountTest

.PHONY: run
run : srccomplexity
	./srccomplexity srcMLXPathCount.cpp.xml

.PHONY: clean
clean :
	rm -f srcMLXPathCount.o srcComplexity.o srccomplexity srcMLXPathCountTest.o srcMLXPathCountTest
