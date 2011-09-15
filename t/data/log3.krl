// testing logging statements
ruleset 10 {
  rule frequent_archive_visitor is active {
    select using "/archives/(\d+)/\d+/" setting (year)

    noop();

    fired {
      log year;
    } else {
      log "nothing going on";
    }

  }
}
