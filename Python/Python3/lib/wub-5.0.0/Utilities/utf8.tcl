# Kevin Kenny wrote this.
# The following table gives the UCS-2 code points that represent
# valid printable characters.  It's read as follows:
#
#  0x0000-0x001f are not printable characters
#  0x0020-0x007e are
#  0x007f-0x009f are not
#  0x00a0-0x00ac are
#    ... and so on, up to 0xfffc-0xfffd are. (0xfffe-0xffff are not!)
#
# This table differs from the conventional one in that \u00c2 (Latin
# capital A with accent grave) and \u00c3 (Latin capital
# A with tilde) are not considered 'valid' characters.  They seldom appear
# in Tcl'ers Wiki text except as part of a misencoded UTF-8 sequence

package provide utf8 1.0

namespace eval ::utf8 {
    variable uniOK {
	0x0000 0x0020 0x007f 0x00a0 0x00ad 0x00ae 
	0x00c2 0x00c4
	0x0242 0x0250 0x0370 0x0374
	0x0376 0x037a 0x037b 0x037e 0x037f 0x0384 0x038b 0x038c 0x038d 0x038e
	0x03a2 0x03a3 0x03cf 0x03d0 0x0487 0x0488 0x04cf 0x04d0 0x04fa 0x0500
	0x0510 0x0531 0x0557 0x0559 0x0560 0x0561 0x0588 0x0589 0x058b 0x0591
	0x05ba 0x05bb 0x05c8 0x05d0 0x05eb 0x05f0 0x0600 0x060b 0x0616 0x061b
	0x061c 0x061e 0x0620 0x0621 0x063b 0x0640 0x065f 0x0660 0x06dd 0x06de
	0x070f 0x0710 0x074b 0x074d 0x076e 0x0780 0x07b2 0x0901 0x093a 0x093c
	0x094e 0x0950 0x0955 0x0958 0x0971 0x097d 0x097e 0x0981 0x0984 0x0985
	0x098d 0x098f 0x0991 0x0993 0x09a9 0x09aa 0x09b1 0x09b2 0x09b3 0x09b6
	0x09ba 0x09bc 0x09c5 0x09c7 0x09c9 0x09cb 0x09cf 0x09d7 0x09d8 0x09dc
	0x09de 0x09df 0x09e4 0x09e6 0x09fb 0x0a01 0x0a04 0x0a05 0x0a0b 0x0a0f
	0x0a11 0x0a13 0x0a29 0x0a2a 0x0a31 0x0a32 0x0a34 0x0a35 0x0a37 0x0a38
	0x0a3a 0x0a3c 0x0a3d 0x0a3e 0x0a43 0x0a47 0x0a49 0x0a4b 0x0a4e 0x0a59
	0x0a5d 0x0a5e 0x0a5f 0x0a66 0x0a75 0x0a81 0x0a84 0x0a85 0x0a8e 0x0a8f
	0x0a92 0x0a93 0x0aa9 0x0aaa 0x0ab1 0x0ab2 0x0ab4 0x0ab5 0x0aba 0x0abc
	0x0ac6 0x0ac7 0x0aca 0x0acb 0x0ace 0x0ad0 0x0ad1 0x0ae0 0x0ae4 0x0ae6
	0x0af0 0x0af1 0x0af2 0x0b01 0x0b04 0x0b05 0x0b0d 0x0b0f 0x0b11 0x0b13
	0x0b29 0x0b2a 0x0b31 0x0b32 0x0b34 0x0b35 0x0b3a 0x0b3c 0x0b44 0x0b47
	0x0b49 0x0b4b 0x0b4e 0x0b56 0x0b58 0x0b5c 0x0b5e 0x0b5f 0x0b62 0x0b66
	0x0b72 0x0b82 0x0b84 0x0b85 0x0b8b 0x0b8e 0x0b91 0x0b92 0x0b96 0x0b99
	0x0b9b 0x0b9c 0x0b9d 0x0b9e 0x0ba0 0x0ba3 0x0ba5 0x0ba8 0x0bab 0x0bae
	0x0bba 0x0bbe 0x0bc3 0x0bc6 0x0bc9 0x0bca 0x0bce 0x0bd7 0x0bd8 0x0be6
	0x0bfb 0x0c01 0x0c04 0x0c05 0x0c0d 0x0c0e 0x0c11 0x0c12 0x0c29 0x0c2a
	0x0c34 0x0c35 0x0c3a 0x0c3e 0x0c45 0x0c46 0x0c49 0x0c4a 0x0c4e 0x0c55
	0x0c57 0x0c60 0x0c62 0x0c66 0x0c70 0x0c82 0x0c84 0x0c85 0x0c8d 0x0c8e
	0x0c91 0x0c92 0x0ca9 0x0caa 0x0cb4 0x0cb5 0x0cba 0x0cbc 0x0cc5 0x0cc6
	0x0cc9 0x0cca 0x0cce 0x0cd5 0x0cd7 0x0cde 0x0cdf 0x0ce0 0x0ce2 0x0ce6
	0x0cf0 0x0d02 0x0d04 0x0d05 0x0d0d 0x0d0e 0x0d11 0x0d12 0x0d29 0x0d2a
	0x0d3a 0x0d3e 0x0d44 0x0d46 0x0d49 0x0d4a 0x0d4e 0x0d57 0x0d58 0x0d60
	0x0d62 0x0d66 0x0d70 0x0d82 0x0d84 0x0d85 0x0d97 0x0d9a 0x0db2 0x0db3
	0x0dbc 0x0dbd 0x0dbe 0x0dc0 0x0dc7 0x0dca 0x0dcb 0x0dcf 0x0dd5 0x0dd6
	0x0dd7 0x0dd8 0x0de0 0x0df2 0x0df5 0x0e01 0x0e3b 0x0e3f 0x0e5c 0x0e81
	0x0e83 0x0e84 0x0e85 0x0e87 0x0e89 0x0e8a 0x0e8b 0x0e8d 0x0e8e 0x0e94
	0x0e98 0x0e99 0x0ea0 0x0ea1 0x0ea4 0x0ea5 0x0ea6 0x0ea7 0x0ea8 0x0eaa
	0x0eac 0x0ead 0x0eba 0x0ebb 0x0ebe 0x0ec0 0x0ec5 0x0ec6 0x0ec7 0x0ec8
	0x0ece 0x0ed0 0x0eda 0x0edc 0x0ede 0x0f00 0x0f48 0x0f49 0x0f6b 0x0f71
	0x0f8c 0x0f90 0x0f98 0x0f99 0x0fbd 0x0fbe 0x0fcd 0x0fcf 0x0fd2 0x1000
	0x1022 0x1023 0x1028 0x1029 0x102b 0x102c 0x1033 0x1036 0x103a 0x1040
	0x105a 0x10a0 0x10c6 0x10d0 0x10fd 0x1100 0x115a 0x115f 0x11a3 0x11a8
	0x11fa 0x1200 0x1249 0x124a 0x124e 0x1250 0x1257 0x1258 0x1259 0x125a
	0x125e 0x1260 0x1289 0x128a 0x128e 0x1290 0x12b1 0x12b2 0x12b6 0x12b8
	0x12bf 0x12c0 0x12c1 0x12c2 0x12c6 0x12c8 0x12d7 0x12d8 0x1311 0x1312
	0x1316 0x1318 0x135b 0x135f 0x137d 0x1380 0x139a 0x13a0 0x13f5 0x1401
	0x1677 0x1680 0x169d 0x16a0 0x16f1 0x1700 0x170d 0x170e 0x1715 0x1720
	0x1737 0x1740 0x1754 0x1760 0x176d 0x176e 0x1771 0x1772 0x1774 0x1780
	0x17b4 0x17b6 0x17de 0x17e0 0x17ea 0x17f0 0x17fa 0x1800 0x180f 0x1810
	0x181a 0x1820 0x1878 0x1880 0x18aa 0x1900 0x191d 0x1920 0x192c 0x1930
	0x193c 0x1940 0x1941 0x1944 0x196e 0x1970 0x1975 0x1980 0x19aa 0x19b0
	0x19ca 0x19d0 0x19da 0x19de 0x1a1c 0x1a1e 0x1a20 0x1d00 0x1dc4 0x1e00
	0x1e9c 0x1ea0 0x1efa 0x1f00 0x1f16 0x1f18 0x1f1e 0x1f20 0x1f46 0x1f48
	0x1f4e 0x1f50 0x1f58 0x1f59 0x1f5a 0x1f5b 0x1f5c 0x1f5d 0x1f5e 0x1f5f
	0x1f7e 0x1f80 0x1fb5 0x1fb6 0x1fc5 0x1fc6 0x1fd4 0x1fd6 0x1fdc 0x1fdd
	0x1ff0 0x1ff2 0x1ff5 0x1ff6 0x1fff 0x2000 0x200b 0x2010 0x202a 0x202f
	0x2060 0x2070 0x2072 0x2074 0x208f 0x2090 0x2095 0x20a0 0x20b6 0x20d0
	0x20ec 0x2100 0x214d 0x2153 0x2184 0x2190 0x23dc 0x2400 0x2427 0x2440
	0x244b 0x2460 0x269d 0x26a0 0x26b2 0x2701 0x2705 0x2706 0x270a 0x270c
	0x2728 0x2729 0x274c 0x274d 0x274e 0x274f 0x2753 0x2756 0x2757 0x2758
	0x275f 0x2761 0x2795 0x2798 0x27b0 0x27b1 0x27bf 0x27c0 0x27c7 0x27d0
	0x27ec 0x27f0 0x2b14 0x2c00 0x2c2f 0x2c30 0x2c5f 0x2c80 0x2ceb 0x2cf9
	0x2d26 0x2d30 0x2d66 0x2d6f 0x2d70 0x2d80 0x2d97 0x2da0 0x2da7 0x2da8
	0x2daf 0x2db0 0x2db7 0x2db8 0x2dbf 0x2dc0 0x2dc7 0x2dc8 0x2dcf 0x2dd0
	0x2dd7 0x2dd8 0x2ddf 0x2e00 0x2e18 0x2e1c 0x2e1e 0x2e80 0x2e9a 0x2e9b
	0x2ef4 0x2f00 0x2fd6 0x2ff0 0x2ffc 0x3000 0x3040 0x3041 0x3097 0x3099
	0x3100 0x3105 0x312d 0x3131 0x318f 0x3190 0x31b8 0x31c0 0x31d0 0x31f0
	0x321f 0x3220 0x3244 0x3250 0x32ff 0x3300 0x4db6 0x4dc0 0x9fbc 0xa000
	0xa48d 0xa490 0xa4c7 0xa700 0xa717 0xa800 0xa82c 0xac00 0xd7a4 0xe000
	0xfa2e 0xfa30 0xfa6b 0xfa70 0xfada 0xfb00 0xfb07 0xfb13 0xfb18 0xfb1d
	0xfb37 0xfb38 0xfb3d 0xfb3e 0xfb3f 0xfb40 0xfb42 0xfb43 0xfb45 0xfb46
	0xfbb2 0xfbd3 0xfd40 0xfd50 0xfd90 0xfd92 0xfdc8 0xfdf0 0xfdfe 0xfe00
	0xfe1a 0xfe20 0xfe24 0xfe30 0xfe53 0xfe54 0xfe67 0xfe68 0xfe6c 0xfe70
	0xfe75 0xfe76 0xfeff 0xff01 0xffbf 0xffc2 0xffc8 0xffca 0xffd0 0xffd2
	0xffd8 0xffda 0xffdd 0xffe0 0xffe7 0xffe8 0xfff9 0xfffc 0xfffe
    }
    
    # The K combinator, used to accelerate list surgery

    proc K {x y} {set x}

    # Make a character range [\xaa-\xbb] for regexps.

    proc makeRange {start end} {
	set range [format {\x%02x} $start]
	if {$end > $start} {
	    append range [format {-\x%02x} $end]
	}
	return $range
    }
    
    # Make a character range in square brackers for regexps. Omit the square
    # brackets if the range contains a single character

    proc makeBracketRange {start end} {
	if {$end > $start} {
	    return [format {[\x%02x-\x%02x]} $start $end]
	} else {
	    return [format {\x%02x} $start]
	}
    }

    # Add a character to a set of character ranges
    #
    # Parameters:
    #	v - Variable in the caller's scope that contains the character ranges
    #	c - Numeric value of the character to add.
    #
    # Results:
    #	Returns 1 if the resulting range is 0x80-0xbf, 0 otherwise.
    #
    # Side effects:
    #	Updates the range list stored in the variable
    
    proc addTo {v c} {
	upvar 1 $v seq
	if {![info exists seq]} {
	    set seq [list [list $c $c]]
	} elseif {$c > [lindex $seq end 1] + 1} {
	    lappend seq [list $c $c]
	} else {
	    set base [lindex $seq end 0]
	    set seq [lreplace [K $seq [set seq {}]] end end [list $base $c]]
	    if {$base == 0x80 && $c == 0xbf} {
		return 1
	    }
	}
	return 0
    }
    
    # Make a regexp that matches all valid UTF-8 sequences
    #
    # Results:
    #	Returns the monster regexp
    

    proc makeUtf8Regexp {} {

	# s1 is the set of bytes that form 1-byte UTF-8 sequences.
	# s1x is the set of leading bytes for which all 1-byte trailers
	#	  form valid 2-byte sequences.
	# s1xx is the set of leading bytes for which all 2-byte trailers
	#	  form valid 3-byte sequences
	# s2(c) is the set of trailer bytes that form valid 2-byte sequences
	#       if c is the leader byte
	# s2x(c) is the set of trailer bytes that can follow the leader byte c
	#        and be followed by another trailer byte yielding a valid
	#        three byte sequence..
	# s3(\xaa-\xbb) is the set of trailer bytes that form a valid three
	#               byte sequence after the two bytes \xaa and \xbb
	
	variable uniOK
	set s1 {{9 10} {13 13}};			# tab and newline
	
	# Walk through all the code ranges, a character at a time.
	
	foreach {start end} [lrange $uniOK 1 end] {
	    for {set i [expr {$start}]} {$i < $end} {incr i} {
		
		if {$i < 0x80} {
		    # Stand-alone character
		    
		    addTo s1 $i
		} elseif {$i < 0x800} {
		    # Character that takes a 2-byte sequence
		    
		    set b1 [expr {($i >> 6) | 0xc0}]
		    set b2 [expr {($i & 0x3f) | 0x80}]
		    if {[addTo s2($b1) $b2]} {
			# All two-byte sequences with this lead character are valid
			unset s2($b1)
			addTo s1x $b1
		    }
		} else {
		    
		    # Character that takes a three-byte sequence
		    set b1 [expr {($i >> 12) | 0xe0}]
		    set b2 [expr {(($i >> 6) & 0x3f) | 0x80}]
		    set b3 [expr {($i & 0x3f) | 0x80}]
		    set key [format {\x%02x\x%02x} $b1 $b2]
		    if {[addTo s3($key) $b3]} {
			# All two byte sequences beginning with b1 and b2 are valid
			unset s3($key)
			if {[addTo s2x($b1) $b2]} {
			    # All three byte sequences having b1 as the first byte
			    # are valid
			    unset s2x($b1)
			    addTo s1xx $b1
			}
		    }
		}
	    }
	}
	
	# Done scanning the table.  Now construct the monster regexp
	
	# Single bytes
	set re \(?:\[
	foreach range $s1 {
	    foreach {start end} $range break
	    append re [makeRange $start $end]
	}
	append re \]
	
	# Two-byte sequences where all trailer bytes are valid
	if {[info exists s1x]} {
	    append re | \[
	    foreach range $s1x {
		foreach {start end} $range break
		append re [makeRange $start $end]
	    }
	    append re \] {[\x80-\xbf]}
	}
	
	
	# Three-byte sequences where all pairs of trailer bytes are valid
	if {[info exists s1xx]} {
	    append re | \[
	    foreach range $s1xx {
		foreach {start end} $range break
		append re [makeRange $start $end]
	    }
	    append re \] {[\x80-\xbf][\x80-\xbf]}
	}
	
	# Other two byte sequences
	foreach byte [lsort -integer [array names s2]] {
	    set ranges $s2($byte)
	    append re | [format {\x%02x} $byte]
	    if {[llength $ranges] == 1} {
		foreach {start end} [lindex $ranges 0] break
		append re [makeBracketRange $start $end]
	    } else {
		append re \[
		foreach range $ranges {
		    foreach {start end} $range break
		    append re [makeRange $start $end]
		}
		append re \]
	    }
	}
	
	# Three byte sequences where all third bytes are valid
	foreach byte [lsort -integer [array names s2x]] {
	    set ranges $s2x($byte)
	    append re | [format {\x%02x} $byte]
	    if {[llength $ranges] == 1} {
		foreach {start end} [lindex $ranges 0] break
		append re [makeBracketRange $start $end]
	    } else {
		append re \[
		foreach range $ranges {
		    foreach {start end} $range break
		    append re [makeRange $start $end]
		}
		append re \]
	    }
	    append re {[\x80-\xbf]}
	}
	
	# Remaining three byte sequences
	foreach seq [lsort [array names s3]] {
	    set ranges $s3($seq)
	    append re | $seq	
	    if {[llength $ranges] == 1} {
		foreach {start end} [lindex $ranges 0] break
		append re [makeBracketRange $start $end]
	    } else {
		append re \[
		foreach range $ranges {
		    foreach {start end} $range break
		    append re [makeRange $start $end]
		}
		append re \]
	    }
	}
	append re \)
	
	# That's it, the regexp will match any valid UTF-8 character, be it
	# 1, 2, or 3 bytes long, and will match nothing else.
	return $re
    }

    variable utf8re
    variable utf8str

    #puts "utf8re is [string length $utf8re] chars"

    proc fixBadUtf8 {data} {
	variable utf8re
	if {![info exists utf8re]} {
	    set utf8re [makeUtf8Regexp]
	}

	variable utf8str
	if {![info exists utf8str]} {
	    set utf8str $utf8re+
	}

	set retval {}
	set i 0
	foreach pair [regexp -all -indices -inline $utf8str $data] {
	    foreach {start end} $pair break
	    append retval [string repeat \ufffd [expr {$start-$i}]] [string range $data $start $end]
	    set i [expr {$end+1}]
	}
	append retval [string repeat \ufffd [expr {[string length $data]-$i}]]
	return $retval
    }

    variable firstbad
    proc findbad {data} {
	variable utf8re
	if {![info exists utf8re]} {
	    set utf8re [makeUtf8Regexp]
	}

	variable firstbad
	if {![info exists firstbad]} {
	    set firstbad "^$utf8re*"
	}

	set inds {}
	regexp -indices $firstbad $data inds
	#puts stderr "inds: $inds"
	return [lindex $inds 1]
    }
    
    # Reports malformed UTF-8 within a file
    #
    # Parameters:
    #	file - Name of the file
    #	data - Binary data read from the file
    #	point - Index of the first invalid byte
    
    proc reportTrouble {file data point} {
	puts "dirty file $file at $point of [string length $data] chars"
	puts "                         v "
	set l1 {}
	set l2 {}
	if {$point > 7} {
	    set i [expr {$point-8}]
	} else {
	    set i 0
	}
	for {} {$i < [string length $data] && $i < $point+16} {incr i} {
	    if {[catch {binary scan $data @${i}c c} r eo]} {
		puts stderr "error: '$r' ($eo) - '$i'"
	    }
	    set c [expr {$c & 0xff}]
	    append l1 [format { %02x} $c]
	    if {$c >= 0x20 && $c <= 0x7e || $c >= 0xa0 && $c <= 0xad} {
		append l2 [format {  %c} $c]
	    } else {
		append l2 {   }
	    }
	}
	puts $l1
	puts $l2
	puts {}
    }

    # Main program - walk through the directory supplied on the command line,
    #                looking for bad UTF-8 within the files
    
    proc main {argv} {
	variable utf8re
	set utf8string $utf8re*
	set firstbad "^$utf8string"
	set dirty 0
	set clean 0
	foreach file [glob -tails -directory [lindex $argv 0] *] {
	    set path [file join [lindex $argv 0] $file]
	    if {![regexp {^[0-9]+(?:,v)?$} $file]} continue
	    set f [open $path r]
	    fconfigure $f -translation binary
	    set data [read $f]
	    close $f
	    regexp -indices $firstbad $data inds
	    set point [lindex $inds 1]
	    if {$point < [string length $data] - 1} {
		reportTrouble $file $data [expr {$point+1}]
		incr dirty
		regexp -lineanchor {^Title:\t([^\n]*)$} $data -> title
		lappend dirt [list $file $title]
	    } else {
		incr clean
	    }
	}
	puts "$dirty dirty pages and $clean clean pages"
	foreach {pair} [lsort -integer -index 0 $dirt] {
	    foreach {n t} $pair break
	    puts "\[http://wiki.tcl.tk/${n}\] $t"
	}
    }

    #main $argv
}