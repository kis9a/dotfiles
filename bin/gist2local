#!/usr/bin/env bash

# --- Template --- {{{
# color pallet
readonly cf="\\033[0m"
readonly red="\\033[0;31m"
readonly green="\\033[0;32m"
readonly yellow="\\033[0;33m"
readonly purple="\\033[0;35m"

#catch getting closed and interrupted by ctrl+c
trap exit_EXIT EXIT
trap exit_CTRL QUIT SIGINT

# The err() function redirects output to STDERR
err() {
  local _date
  _date=$(showdate)
  echo -e "[$_date][${red}ERROR${cf}]: $1" 1>&2
}

# The err_die() function redirects the message to STDERR,
# starts the cleanup function and then exits.
# You can call err_die() with "1" as argument to show the help before exiting.
err_die() {
  local _date
  _date=$(showdate)
  blank_line
  echo -e "[$_date][${red}ERROR${cf}]: $1 -> use -h parameter for help." 1>&2
  echo -e "[$_date][${red}ERROR${cf}]: Cleaning & Exiting."
  if [[ "$2" == "1" ]]; then
    showhelp
  fi
  exit 1 #or use $2 instead of 1 to work with exit arguments
}

# The following function warn, info, succ and debug are for
# output information, use warn for warnings, succ for success etc.
# You can change the colors at the top.
warn() {
  local _date
  _date=$(showdate)
  echo -e "[$_date][${yellow}WARNING${cf}]: $1"
}

info() {
  local _date
  _date=$(showdate)
  echo -e "[$_date][INFO]: $1 "
}

succ() {
  local _date
  _date=$(showdate)
  echo -e "[$_date][${green}SUCCESS${cf}]: $1"
}

showdate() {
  local _date
  _date=$(date +%d-%H.%M)
  echo "$_date"
}

# The debug() funktion will only show up if boolean 'is_debug' is true
debug () {
  local _date
  _date=$(showdate)
  if [[ "$is_debug" == "true" ]]; then
    echo -e "[$_date][${purple}DEBUG${cf}]: $1"
  fi
}

exit_EXIT() {
  info "Script ended! Cleanup & Exit."
  cleanup
  exit 1
}

exit_CTRL() {
  err "User pressed CTRL+C!"
  exit 1
}

cleanup() {
  info "cleanup.."
  # cleanup tmp files, kill process etc.
}

showhelp() {
  echo ""
  echo " Usage:"
  echo "   bash $0 'auth_user' 'target_user'"
  echo ""
  echo " Flags:"
  echo "  -d: For optional debug messages."
  echo "  -h: Shows this help text."
  echo " "
  echo " Examples:"
  echo "   bash gist2local -h"
  echo "   bash gist2local -d"
  echo "   bash gist2local.bash kis9a kis9a"
  echo ""
  echo " Info:"
  echo "  ./README.md"
  echo "  https://github.com/kis9a/gist2local#gist2local "
  echo ""
}

# Add all the parameter you whish, -h will show help and -d will
# trigger debug messages to show up
while getopts ":hd" o; do
    case "${o}" in
        h)
            showhelp
            exit 1
            ;;
        d)
            is_debug=true
            ;;
        *)
            err "No valid option choosed."
            ;;
    esac
done
#}}}

#|*******************************************|
#|* gist2local.bash                         *|
#|* Author: kis9a <kis9ax@gmail.com>        *|
#|* Github: <https://github.com/gist2local> *|
#|* License: MIT                            *|
#|*******************************************|

blank_line() {
  echo ''
}

is_exists() {
  which "$1" >/dev/null 2>&1
  return $?
}

is_exists_directory() {
  if [[ -d "$1" ]]; then
    return 0
  else
    return 1
  fi
}

is_exists_file() {
  if [[ -e "$1" ]]; then
    return 0
  else
    return 1
  fi
}

is_exists_file_in_directory() {
  if [[ -n "$(ls -A "$1")" ]]; then
    return 0
  else
    return 1
  fi
}

check_argments() {
  if [[ -z "$auth_user" ]]; then
    showhelp
    err "argument 'auth_user' is required"
    exit 1
  elif [[ -z "$target_user" ]]; then
    showhelp
    err "arguments 'target_user' is required"
    exit 1
  fi
}

check_required_commands() {
  local command
  for command in "${required_commands[@]}"; do
    if is_exists "${command}"; then
      info "✓ ${command}"
    else
      err "${command} is installed?"
      exit 1
    fi
  done
}

set_dir() {
  if ! is_exists_directory "$1"; then
    mkdir "$1"
  else
    if is_exists_file_in_directory "$1"; then
      warn "exit files in '$1' directory. Delete ?"
      read -r -n1 -p "ok? (Y/N): " yn
      if [[ $yn = [yY] ]]; then
        rm -rf "$1" && mkdir "$1"
        blank_line && succ "set '$1' directory"
      else
        blank_line && err "Can't set '$1' directory"
        exit 0
      fi
    fi
  fi
}

set_gists_json_file() {
  if ! is_exists_file "$gists_json_file"; then
    warn "exit files '$gists_json_file'. Download new source ?"
    read -r -n1 -p "ok? (Y/N): " yn
    if [[ $yn = [yY] ]]; then
      blank_line
      rm -f "$gists_json_file"
      info "deleted $gists_json_file file"
      curl "-#" -u "$auth_user" https://api.github.com/users/"$target_user"/gists -o "$gists_json_file"
      info "downloaded new $gists_json_file file"
    fi
  fi

  if is_exists_file "$gists_json_file"; then
    succ 'completed set gists json file'
  fi
}

set_gist_file_array() {
  if [[ -e "$gists_json_file" ]]; then
    gists=$(jq "." < "$gists_json_file")
  else
    err "can't source gist json file"
    exit
  fi
  # parse to array of file_objs
  readonly gist_file_array=$(echo "$gists" | jq ".[] .files|to_entries[]|.value" | jq -s)
}

download_gists() {
  local num
  local filename
  local raw_url

  for num in $( seq 1 "$(echo "$gist_file_array" | jq length)"); do
    filename=$(echo "$gist_file_array" | jq -r .["$num]|.filename")
    raw_url=$(echo "$gist_file_array" | jq -r .["$num]|.raw_url")
    curl "-#" "$raw_url" -o "$gists_output_directory"/"$filename"
  done

  if is_exists_file_in_directory "$gists_output_directory"; then
    succ "Success download gists!"
    info "ckeck '$gists_output_directory' directory!"
  fi
}

preset() {
  readonly is_debug=false
  readonly gists_json_file="./$2_gists.json"
  readonly gists_output_directory="./$2_gists"
  readonly required_commands=("curl" "jq")
  readonly auth_user="$1"
  readonly target_user="$2"

  check_argments
  check_required_commands
}

gist_to_local() {
  set_gists_json_file
  set_dir "$gists_output_directory"
  set_gist_file_array
  download_gists
}

main() {
  preset "$1" "$2"
  gist_to_local
}

main "$1" "$2"
