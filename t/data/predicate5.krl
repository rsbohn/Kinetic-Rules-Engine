// predicates conjunction and disjunction
ruleset 10 {
    rule test0 is active {
        select using "/test/" setting()

	if (weather:tomorrow_windy() || (time:nighttime() && weather:today_windy())) then
	   alert("You're coming from Idaho!");

    }
}
