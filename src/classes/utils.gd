extends Node

## Compares the two different version strings.[br]
##
## Returns[br]
## `-1` if `a < b`,[br]
## ` 0` if `a == b`,[br]
## ` 1` if `a > b`[br]
func compareVersions(a: String, b: String):
	var versionA = a.split(".")
	var versionB = b.split(".")
	for i in range(min(versionA.size(), versionB.size())):
		var diff = int(versionA[i]) - int(versionB[i])
		if diff != 0:
			return diff
	return 0