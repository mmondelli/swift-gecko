swift-gecko
===========

Workflow for parallel genome comparison using the Swift parallel scripting system.

Reference: Oscar Torreno and Oswaldo Trelles. Breaking the computational barriers of pairwise genome comparison. BMC Bioinformatics 2015, 16:250  doi:10.1186/s12859-015-0679-9

Requirements
============

This uses the tools:
- GECKO: Binaries available at http://bitlab-es.com/gecko/
- Swift: http://swift-lang.org/main/ (installation guide, documentation, downloads and general information about the Swift parallel scripting language)

Workflow invocation
===================

Run the following command in the directory where the input files are placed:

```
swift -config swift.conf allvsall.swift -l=100 -s=65 -wl=12 -fl=1
```

Note that the binaries/applications needed to execute the workflow are already in the /bin directory of this repository. You can export them to the system PATH for Swift to recognize them:

```
export PATH=<path to /bin>:$PATH
```





