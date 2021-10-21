param($github_ref, 
	[Switch]
	$current_branch, 
	[Switch]
	$ref_branch
)

if ("${github_ref}" -ne "refs/tags/") {
	if ("${current_branch}" -eq "${ref_branch}" ) {
		echo "::set-output name=is_default::true"
		
		#Write-Output "::set-env name=is_default::true"
	}
 else {
		echo "::set-output name=is_default::false"
		#Write-Output "::set-env name=is_default::false"
	}
}
