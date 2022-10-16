#include <gtest/gtest.h>
#include "adder.hpp"

TEST(Adder, BasicAssertions) {
  EXPECT_EQ(lib::adder(2, 2), 4);
  EXPECT_EQ(lib::adder(20, 23), 43);
}