## SSP-test
Analyses for SSP test run
==

Setup
* Install the requirements, modify pathes in globals file
* Copy (or symlink) gzipped fastq files into data. E.g.
```
cd data
ln -s /path/to/Seattle\ Colleges-20959944/*/*.fastq.gz .
cd ..
```

* Execute 0.setup. E.g.
```
./0.setup
```

Requirements
* BBMap ( http://sourceforge.net/projects/bbmap/ )
* USEARCH ( http://www.drive5.com/usearch/ ) **Warning: not open source**
* RDP Classifier ( https://github.com/rdpstaff/classifier )
