#include <iostream>
#include <cmath>
#include <vector>

int main() {
	std::cout << "Example file for repository" << std::endl;
	std::cout << "Emir try harder!!" << std::endl;
	
	std::vector<int> abc = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	double pi = acos(-1.0);
	for(int b : abc) {
		std::cout << pi * b << std::endl; 
	}

	return 0;
}
