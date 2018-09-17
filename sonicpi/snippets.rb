# Sonic Pi Examples
# Serge Beaumont
# September 2018

# Use some convenient timings for full until eighth notes.
# 1    2     4      8
# 1, 0.5, 0.25, 0.125

# This loop holds the basic kick and send a cue signal once every for beats,
# so you can sync on the first count of the bar.
live_loop :kick do
  cue :tick
  4.times do
    sample :bd_haus
    sleep 0.5
  end
end

live_loop :drone do
  # Comment and uncomment this the re-run to start/stop loop.
  # stop
  use_synth :prophet
  sync :tick
  sample :loop_garzul
  play :e1, release:8, cutoff: rrand(70, 130)
  sleep 8
end

live_loop :arpeggio do
  # Comment and uncomment this the re-run to start/stop loop.
  # stop
  
  # Comment or decomment this for a slow or faster feel.
  sync :tick
  
  use_synth :tb303
  s = (ring :e3, :e3, :f3, :g3)
  
  # Cutoff values you can try
  c_regular = rrand(50,80)
  c_schel = rrand(70, 90)
  c_hol = rrand(50, 70)
  
  # Volume ("amp") settings
  a_luider = 0.2
  a_achtergrond = 0.1
  
  # Note that the "tick" here is a built in thing, not a reference to :tick
  play_pattern_timed (scale s.tick, :minor_pentatonic).shuffle, 0.125,
    amp: a_achtergrond, cutoff: c_regular,
    res: 0.95, attack: 0.01, release: 0.05
end
