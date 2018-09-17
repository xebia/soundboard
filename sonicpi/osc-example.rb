# Sonic Pi integrations with OSC examples
# Serge Beaumont
# September 2018

# The OSC mappings are from the TouchOSC iPhone app

# It's good practice to use variables for these strings.
osc_toggle_1 = "/osc/1/toggle1"
osc_fader_1 = "/osc/1/fader1"

# This loop toggles on and off based on an OSC toggle button.
live_loop :toggle_example do
  use_real_time
  if (get[osc_toggle_1][0] == 1.0)
    # When you turn the loop on, good to sync before you start.
    # You should have a loop running that sends cue messages.
    sync :tick
    
    # Some example sounds to show the concept
    # Put your own stuff here.
    use_synth :prophet
    sample :loop_garzul
    play :e1, release:8, cutoff: rrand(70, 130)
    sleep 8
  else
    # When the toggle is turned off, this loop will now wait
    # until there is a new message.
    sync osc_toggle_1
  end
end

# Example of using a fader.
live_loop :foo do
  sample :loop_garzul
  
  # This is what such a line can look like without OSC
  # play :e1, release:8, cutoff: rrand(70, 130)
  
  # You can change any variable. In this example we manipulate the cutoff.
  foo_cutoff = 70 + get[osc_fader_1][0] * 60
  play :e1, release: 8, cutoff: foo_cutoff
  sleep 8
end
