" perl_synwrite.vim : check syntax of Perl before writing
" author : Ricardo Signes <rjbs-vim@public.manxome.org>
" last revision: 2004-02-03 21:10

""" to make syntax checking happen automatically on write, set
""" did_perl_synwrite; this is quirky, though, and isn't really advised
""" failing that, this script will map :Write to act like :write, but 
""" check syntax before writing;  :W[rite]! will write even if the syntax
""" check fails

"" abort if b:did_perl_synwrite is true: already loaded or user pref
if exists("b:did_perl_synwrite")
	finish
endif
let b:did_perl_synwrite = 1

"" set buffer :au pref: if defined globally, inherit; otherwise, false
if (exists("perl_synwrite_au") && !exists("b:perl_synwrite_au"))
	let b:perl_synwrite_au = perl_synwrite_au
elseif !exists("b:perl_synwrite_au")
	let b:perl_synwrite_au = 0
endif

"" execute the given do_command if the buffer is syntactically correct perl -- or
"" if do_anyway is true
function! s:PerlSynDo(do_anyway,do_command)
	write !perl -c
	if !v:shell_error || a:do_anyway
		exec a:do_command
		set nomod
	endif
endfunction

"" set up the autocommand, if b:perl_synwrite_au is true
if (b:perl_synwrite_au > 0)
	let b:undo_ftplugin = "au! perl_synwrite * " . expand("%")

	augroup perl_synwrite
		exec "au BufWriteCmd,FileWriteCmd " . expand("%") . " call s:PerlSynDo(0,\"write <afile>\")"
	augroup END
endif

"" the :Write command
command -buffer -nargs=* -complete=file -range=% -bang Write call s:PerlSynDo("<bang>"=="!","<line1>,<line2>write<bang> <args>")
