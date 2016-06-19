function fish_greeting
  if command --search fortune > /dev/null
    clear
    fortune
  end
end
