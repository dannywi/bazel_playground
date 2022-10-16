#pragma once

namespace lib {
  // todo: check T type is integral (unsigned?)
  template <typename T, size_t MAX>
  T get_next(T v) {
    if(v >= MAX) {
      return 0;
    }
    return ++v;
  }
}