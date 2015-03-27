#! /bin/zsh

# use this command to keep the cross word database in the sorted order.
#
# -f is used for case insensitive sort
# LC_ALL=C ensures that we are doing ascii sorting. For example '.' will come
# before 'A' which comes before 'a' which comes before '_'

set -e
fname=$1
LC_ALL=C sort -f $fname -o $fname
