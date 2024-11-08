## File function (path_to_file)
# Reads the content of a file as a string and can be used in conjunction with other 
# functions like jsondecode / yamldecode.

# locals {
#   a_file = file("${path.module}/nginx.sh")
# }

# output "a_file" {
#   value = local.a_file
# }

# locals {
#   timestamp = formatdate("EEEE, DD MMMM YYYY hh:mm ZZZ", timestamp())
# }

# output "timestamp" {
#   value = local.timestamp
# }

#zipmap Function (key_list, value_list)
## Constructs a map from a list of keys and a list of values.

# locals {
#  key    = ["a", "b", "c"]
#  values = [1, 2, 3]
#  zip_map    = zipmap(local.key, local.values)
# }

# output "zip_map" {
#  value = local.zip_map
# }

#Merge function
##### The merge function takes one or more maps and returns a single map that contains all of the elements from the input maps. 
#### The function can also take objects as input, but the output will always be a map.

# locals {
#  b_map = {
#    "key1" : "value1",
#    "key2" : "value2"
#  }
#  c_map = {
#    "key3" : "value3",
#    "key4" : "value4"
#  }

#  final_map = merge(local.b_map, local.c_map)
# }


# output "final_map" {
#  value = local.final_map
# }


## Length function
###Returns the length of a string, list, or map.

# locals {
#  list_length   = length(["t2.micro", "t3.nano", "t4.large"])
#  string_length = length("abcdefghij")
# }

# output "length_list" {
#  value = local.list_length
# }

# output "length_string" {
#  value = local.string_length
# }

####lookup function
# Retrieves a value from a map using its key. If the value is not found, it will return the default value instead.
# locals {
#  a_map = {
#    "key1" : "value1",
#    "key2" : "value2"
#  }
#  lookup_in_a_map = lookup(local.a_map, "key10", "test")
# }


# output "lookup_in_a_map" {
#  value = local.lookup_in_a_map
# }


## concat(lists)
#### Takes two or more lists and combines them in a single one.

# locals {
#  concat_list = concat([1, 2, 3], [4, 5, 6], [7, 8, 9])
# }


# output "concat_list" {
#  value = local.concat_list
# }


### Split Fubction
## split produces a list by dividing a given string at all occurrences of a given separator

# locals {
#  split-task = split(",", "user1, user2, user3, user4")
# }


# output "split-task" {
#  value = local.split-task
# }


