param($github_ref, 
	
	[Parameter(Mandatory=$false)]
  	[Switch]
	$current_branch, 
	
	[Parameter(Mandatory=$false)]
  	[Switch]
	$ref_branch
)

if ("${github_ref}" -ne "refs/tags/") {
	if ("${current_branch}" -eq "${ref_branch}" ) {
		echo "::set-output name=is_default::true"
	}
 	else {
		echo "::set-output name=is_default::false"
	}
}
