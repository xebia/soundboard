# Sonic Pi rhythm examples
# Serge Beaumont
# September 2018

# 1    2     4      8
# 1, 0.5, 0.25, 0.125

# Basic 4 Count beat
live_loop :kick do
  sample :bd_haus
  sleep 0.5
end

# Raggaton
live_loop :kick do
  2.times do
    sample :bd_haus
    sleep 0.375
    sample :drum_snare_hard
    sleep 0.125
    sample :bd_haus
    sleep 0.25
    sample :drum_snare_hard
    sleep 0.25
  end
end