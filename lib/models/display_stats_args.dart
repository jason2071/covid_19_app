class DisplayStatsArgs {
  int confirmed;
  int recovered;
  int hospitalized;
  int deaths;

  DisplayStatsArgs({
    this.confirmed = 0,
    this.recovered = 0,
    this.hospitalized = 0,
    this.deaths = 0,
  });
}

DisplayStatsArgs displayStatsArgs;
