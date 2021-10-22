param($github_ref, 
	[AllowEmptyString()]
	[string] $strip_tag_prefix
)

if ("${github_ref}" -eq "refs/tags/") {
	$REF = "${github_ref}"
	$TAG = ${$REF/refs\/tags\/$strip_tag_prefix/}

	echo "::set-output name=tag::$TAG"
	echo "::set-output name=is_tag::true"
}
else {
	echo "::set-output name=is_tag::false"
}
