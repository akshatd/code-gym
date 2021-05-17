#include <iostream>
#include <string>
#include <algorithm>

int main(int argc, char* argv[]) {
	std::cout << "Enter the 2 lines pls:\n";
	size_t len = 0;
	std::cin >> len;
	std::cin.ignore();
	std::string input_string;
	std::getline(std::cin, input_string);

	if (len*2-1 != input_string.length()) {
		std::cout << "Invalid input, length doesnt match the input string\n";
		std::cout << "Length: " << len << "\nInput string: " << input_string << "\nInput length: " << input_string.length() << '\n';
		return -1;
	}
	
	int occurrence[10] = {0};
	int current_number = 0;
	for (size_t i = 0; i < len*2-1; i+=2) {
		current_number = input_string[i] - '0';
		// std::cout << "curr number: " << current_number << '\n';
		occurrence[current_number]++;
	}
	std::sort(occurrence, occurrence+10);
	// for (int i=0; i<10; ++i) {
	// 	std::cout << occurrence[i] << '\n';
	// }
	std::cout << "Your answer is " << occurrence[9] << '\n';
	return 0;
}
