#include <gtest/gtest.h>
#include "looper.hpp"

TEST(Looper, BasicAssertions) {
  EXPECT_EQ((lib::get_next<uint16_t, 30>(3)), 4);
  EXPECT_EQ((lib::get_next<uint16_t, 30>(29)), 30);
  EXPECT_EQ((lib::get_next<int, 30>(30)), 0);
}