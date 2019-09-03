function TryCloseBuffer()
  if &mod
    let response = confirm("File has been written to! Save?", "y\nN", "y")
    if response == 1
      execute "w"
      execute "bd"
    elseif response == 2
      execute "bd!"
    else
      execute "echom 'Didnt know what to do, did nothing'"
    endif
  else
    execute "bd"
  endif
endfunction
