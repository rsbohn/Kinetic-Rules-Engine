// predicates negation
ruleset 10 {
    rule test0 is active {
        select using "/test/" setting()

	if (not time:nighttime()) then
	   alert("You're coming from Idaho!");

    }
}
