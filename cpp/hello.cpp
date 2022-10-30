#include <iostream>

template <unsigned N> struct fibo {
  static constexpr unsigned val = fibo<N - 1>::val + fibo<N - 2>::val;
};

template <> struct fibo<1> { static constexpr unsigned val = 1; };
template <> struct fibo<0> { static constexpr unsigned val = 1; };

int main() {
  constexpr unsigned N = 123;
  std::cout << "fibonacci [" << N << "]: " << fibo<N>::val << std::endl;
}
