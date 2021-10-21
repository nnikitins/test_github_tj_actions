param($github_ref, 
	[Switch]
	$strip_tag_prefix
)

if ("${github_ref}" -eq "refs/tags/") {
	$REF = "${github_ref}"
	$TAG = ${$REF/refs\/tags\/$strip_tag_prefix/}

	#are disabled for sec reasons
	#Write-Output "::set-env name=tag::$TAG"
	#Write-Output "::set-env name=is_tag::true"

	echo "::set-output name=tag::$TAG"
	echo "::set-output name=is_tag::true"
}
else {
	echo "::set-output name=is_tag::false"
	#Write-Output "::set-env name=is_tag::false"
}