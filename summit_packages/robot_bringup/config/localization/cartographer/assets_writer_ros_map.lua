-- Copyright 2018 The Cartographer Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

options = {
  tracking_frame = "robot_imu_link",
  pipeline = {
    {
      action = "min_max_range_filter",
      min_range = 1.,
      max_range = 60.,
    },
    {
      action = "vertical_range_filter",
      min_z = 0.1,
      max_z = 2.0 -- This should be the max height of the robot in navigation position
    },
    {
      action = "write_ros_map",
      range_data_inserter = {
        insert_free_space = true,
        hit_probability = 0.55,
        miss_probability = 0.49,
      },
      filestem = "",
      resolution = 0.03,
    }
  }
}

return options

