// Copyright (c) 2023 HolyGround, All Rights Reserved.
// Authors: EunSung Yang


#include "example/utils.hpp"

#include <gflags/gflags.h>
#include <glog/logging.h>
#include <spdlog/spdlog.h>

#include <cstdint>

DEFINE_bool  (var_bool, true, "bool variable");
DEFINE_uint32(var_uint32, 32U, "unsinged int32 variable");
DEFINE_uint64(var_uint64,64U, "unsinged int64 variable");
DEFINE_int32(var_int32, 32, "int32 variable");
DEFINE_int64(var_int64, 64, "int64 variable");
DEFINE_double(var_double, 1.11, "double variable");
DEFINE_string(var_string, "string", "string variable");

auto main(int argc, char * argv[]) -> int32_t
{
  google::SetVersionString("1.0.0");
  google::ParseCommandLineFlags(&argc, &argv, true);
  google::InstallFailureSignalHandler();
  FLAGS_alsologtostderr = true;
  FLAGS_colorlogtostderr = true;

  LOG(INFO) << "Info messeages";
  LOG(WARNING) << "Warning messeges";
  LOG(ERROR) << "Error messeages";
  // LOG(FATAL) << "Fatal messeages";

  spdlog::info("var_bool: {}", FLAGS_var_bool);
  spdlog::info("var_uint32: {}", FLAGS_var_uint32);
  spdlog::info("var_uint64: {}", FLAGS_var_uint64);
  spdlog::info("var_int32: {}", FLAGS_var_int32);
  spdlog::info("var_int64: {}", FLAGS_var_int64);
  spdlog::info("var_double: {}", FLAGS_var_double);
  spdlog::info("var_string: {}", FLAGS_var_string);


  holyground::example::Print("Hello World!");
  return 0;
}
