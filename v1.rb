use_bpm 130

live_loop :met1 do
  sleep 1
end

define :pattern do |pattern|
  return pattern.ring.tick ==  "x"
end

kick = "C:/Users/gleis/Desktop/Sonic Pi/drum/Drake/Fair Trade/kick.wav"
hh = "C:/Users/gleis/Desktop/Sonic Pi/drum/Drake/Fair Trade/fair trade hh.wav"
ohh = "C:/Users/gleis/Desktop/Sonic Pi/drum/Drake/Fair Trade/openhihat 66.wav"
eoe = "C:/Users/gleis/Desktop/Sonic Pi/drum/Drake/Fair Trade/808 (Cactus)_2.wav"
snr = "C:/Users/gleis/Desktop/Sonic Pi/drum/Drake/Fair Trade/Snares (Final Fantasy).wav"
shh = "C:/Users/gleis/Desktop/Sonic Pi/drum/Drake/Fair Trade/fair trade hh shorter.wav"


live_loop :kick, sync: :met1 do
  sample kick if pattern "x-----x---x--x--"
  sleep 0.25
end

live_loop :snr, sync: :met1 do
  sleep 1
  sample snr
  sleep 1
end

live_loop :hh, sync: :met1 do
  sample hh if pattern "x-x-x-x-xxx-x-x-"
  sleep 0.25
end

x = 0

live_loop :shh, sync: :met1 do
  sleep 0.5
  sample ohh
  sleep 0.5
end

live_loop :eoe, sync: :met1, amp: 1 do
  sample eoe if pattern "x-------"
  sleep 10
end