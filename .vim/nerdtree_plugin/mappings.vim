

call NERDTreeAddKeyMap({
               \ 'key': '<leader>q',
               \ 'callback': 'NERDTreeSafeToggle',
               \ 'quickhelpText': 'toggle nerd tree instead of destroying buffer'})

function! NERDTreeSafeToggle()
    exe 'NERDTreeMirrorToggle'
endfunction

