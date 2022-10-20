#include <iostream>

extern const char* g_name;

int main() {
  std::cout << "HELLO " << g_name << "!" << std::endl;
}
