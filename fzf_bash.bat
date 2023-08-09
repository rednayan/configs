ignored_patterns=("node_modules" "target")

f() {
  local target=$(find . -type d -o -type f \( $(printf -- "-not -path './%s/*' " "${ignored_patterns[@]}") \) 2>/dev/null | fzf)

  if [ -n "$target" ]; then
    if [ -d "$target" ]; then
      cd "$target"
    elif [ -f "$target" ]; then
      hx "$target"
    else
      echo "Invalid selection: $target"
    fi
  else
    echo "No folder or file selected."
  fi
}
