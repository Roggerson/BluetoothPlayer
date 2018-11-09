#!/usr/bin/expect -f
 
set outputFilename "output.txt"
set outFileId [open $outputFilename "w"]
 
puts -nonewline $outFileId "A first line\n"
puts -nonewline $outFileId "A second line\n"
 
#Close file descriptor to ensure data are flush to file
close $outFileId


#read file
#!/usr/bin/expect -f
 
set fd "input.txt"
set fp [open "$fd" r]
set data [read $fp]
 
# Read line by line
 
foreach line $data {
 
puts "$line\r"
 
}
